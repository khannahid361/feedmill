<?php

namespace Modules\Production\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Modules\Product\Entities\Product;
use Modules\Material\Entities\Material;
use Modules\Setting\Entities\Warehouse;
use App\Http\Controllers\BaseController;
use Modules\Production\Entities\Production;
use Modules\Product\Entities\WarehouseProduct;
use Modules\Material\Entities\WarehouseMaterial;
use Modules\Production\Entities\ProductionProduct;
use Modules\Production\Http\Requests\OperationRequest;
use Modules\Production\Entities\ProductionProductMaterial;
use Modules\Production\Entities\ProductionWastage;

class ProductionOperationController extends BaseController{
    public function __construct(Production $model){
        $this->model = $model;
    }
    public function index(int $id){
        if(permission('production-operation')){
            $production = $this->model->with(['warehouse:id,name','products'])->find($id);
            if($production) {
                $this->setPageData('Production','Production','fas fa-industry',[['name' => 'Production']]);
                return view('production::production.operation',compact('production'));
            }else{
                return redirect()->back();
            }
        }else{
            return $this->access_blocked();
        }
    }
    public function generateCouponQrcode(Request $request){
        if($request->ajax()) {
            $coupons = DB::table('production_coupons as pc')
            ->select('pc.id','pc.coupon_code','pp.coupon_price','pp.total_coupon')
            ->join('production_products as pp','pc.production_product_id','=','pp.id')
            ->where([['pc.production_product_id',$request->production_product_id],['pc.batch_no',$request->batch_no],['pc.status',2]])
            ->get();
            $data = [
                'coupons'     => $coupons,
                'row_qty'     => $request->row_qty,
            ];
            return view('production::production.print-qrcode',$data)->render();
        }
    }
    public function store(OperationRequest $request){
        // dd($request->production);
        if ($request->ajax()) {
            if (permission('production-operation')) {
                DB::beginTransaction();
                try {
                    if($request->has('production')){
                        foreach($request->production as $product) {
                            $production_product = ProductionProduct::find($product['production_product_id']);
                            if($production_product) {
                                $production_product->update([
                                    'labor_cost'    => $product['labor_cost'],
                                    'other_cost'    => $product['other_cost'],
                                    'expected_unit_qty' => $product['expected_unit_qty'],
                                    'base_unit_qty' => $product['fg_qty'],
                                    'per_unit_cost' => $product['materials_per_unit_cost'],
                                    'recyclable_wastage_qty' => $product['recyclable_wastage_qty'],
                                    'permanent_wastage_qty' => $product['permanent_wastage_qty']
                                ]);
                                if (!empty($product['materials']) && count($product['materials']) > 0) {
                                    foreach ($product['materials'] as $material) {
                                        $production_material = ProductionProductMaterial::find($material['production_material_id']);
                                        if($production_material) {
                                            $production_material->update([
                                                "used_qty"    => $material['used_qty'],
//                                                "damaged_qty" => $material['damaged_qty'] ? $material['damaged_qty'] : 0,
//                                                "odd_qty"     => $material['odd_qty'] ? $material['odd_qty'] : 0
                                            ]);
                                        }
                                    }
                                }
                            }
                        }
                        $output = ['status' => 'success','message' => 'Data Updated Successfully'];
                    }else{
                        $output = ['status' => 'error','message' => 'Failed to Update Data'];
                    }
                    DB::commit();
                } catch (\Throwable $th) {
                    DB::rollback();
                    $output = ['status' => 'error', 'message' => $th->getMessage()];
                }
                return response()->json($output);
            } else {
                return response()->json($this->unauthorized());
            }
        }
    }
    public function change_production_status(Request $request){
        // dd($request->all());
        if ($request->ajax()) {
            if (permission('production-operation')) {
                if ($request->production_status) {
                    DB::beginTransaction();
                    try {
                        $productionData = $this->model->find($request->production_id);
                        $productionProductdata = ProductionProduct::where('production_id',$request->production_id)->first();
                        $warehouse_id = $productionData->warehouse_id;
                        $approve_status = $productionData->status;
                        $productionData->production_status = $request->production_status;
                        if($request->production_status == 3) {
                            $productionData->end_date = $productionProductdata->exp_date;
                        }
                        $productionData->modified_by = auth()->user()->name;
                        $productionData->updated_at = date('Y-m-d');
                        if ($productionData->update()) {
                            if ($approve_status == 1 && $request->production_status == 3) {
                                $production_materials = DB::table('production_product_materials as ppm')
                                                        ->join('production_products as pp','ppm.production_product_id','=','pp.id')
                                                        ->join('productions as p','pp.production_id','=','p.id')
                                                        ->where([['p.id',$request->production_id],['p.status',1],['ppm.odd_qty','>',0]])
                                                        ->select('ppm.material_id','ppm.odd_qty')
                                                        ->get();
                                if($production_materials){
                                    foreach ($production_materials as $material) {
                                        $warehouse_material = WarehouseMaterial::where([['warehouse_id', 1], ['material_id', $material->material_id]])->first();
                                        if ($warehouse_material) {
                                            $warehouse_material->qty += $material->odd_qty;
                                            $warehouse_material->update();
                                        }
                                        $material_data = Material::find($material->material_id);
                                        if ($material_data) {
                                            $material_data->qty += $material->odd_qty;
                                            $material_data->update();
                                        }
                                    }
                                }
                                $production_products = DB::table('production_products')->where('production_id',$request->production_id)->get();
                                // dd($production_products);
                                if(!$production_products->isEmpty()) {
                                    foreach ($production_products as  $value) {
                                        $product                  = Product::find($value->product_id);
                                        $warehouseProductQuantity = WarehouseProduct::where(['product_id' => $value->product_id])->sum('qty');
                                        $warehouse_product        = WarehouseProduct::where([['warehouse_id', $warehouse_id], ['product_id', $value->product_id]])->first();
                                        $productionWastage = ProductionWastage::where('product_id',$value->product_id)->first();
//                                        $productNewPrice          = (($warehouseProductQuantity * $product->base_unit_price) + ($value->base_unit_qty * $value->per_unit_cost)) / ($warehouseProductQuantity + $value->base_unit_qty);
//                                        $product->update([
//                                            'base_unit_price'     => $productNewPrice
//                                        ]);
                                        $product->update([
                                           'cost'           => $value->per_unit_cost
                                        ]);
                                        if ($warehouse_product) {
                                            $warehouse_product->qty += $value->base_unit_qty;
                                            $warehouse_product->update();
                                        }else{
                                            WarehouseProduct::create([
                                                'warehouse_id'=> $warehouse_id,
                                                'product_id'=> $value->product_id,
                                                'qty'=> $value->base_unit_qty,
                                            ]);
                                        }
                                        if($productionWastage)
                                        {
                                            $productionWastage->recyclable_wastage += $value->recyclable_wastage_qty - $value->used_wastage_qty;
                                            $productionWastage->permanent_wastage += $value->permanent_wastage_qty;
                                            $productionWastage->update();
                                        }
                                        else{
                                            ProductionWastage::create([
                                                'product_id'=> $value->product_id,
                                                'recyclable_wastage'=> $value->recyclable_wastage_qty,
                                                'permanent_wastage'=> $value->permanent_wastage_qty
                                            ]);
                                        }
                                    }
                                }
                            }
                            $output = ['status' => 'success', 'message' => 'Production Status Changed Successfully'];
                        } else {
                            $output = ['status' => 'error', 'message' => 'Failed To Change Production Status'];
                        }
                        DB::commit();
                    } catch (\Throwable $th) {
                        DB::rollback();
                        $output = ['status' => 'error', 'message' => $th->getMessage()];
                    }
                } else {
                    $output = ['status' => 'error', 'message' => 'Please select status'];
                }
                return response()->json($output);
            }
        }
    }
}
