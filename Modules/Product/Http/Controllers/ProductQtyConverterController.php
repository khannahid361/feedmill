<?php

namespace Modules\Product\Http\Controllers;

use App\Http\Controllers\BaseController;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Modules\Product\Entities\Product;
use Modules\Material\Entities\Material;
use Modules\Material\Entities\WarehouseMaterial;
use Modules\Product\Entities\WarehouseProduct;

class ProductQtyConverterController extends BaseController
{

    public function create()
    {
        $this->setPageData('Product Bag Convertion', 'Product Bag Convertion', 'fas fa-box', [['name' => 'Product Bag Convertion']]);
        $products = DB::table('products as p')
            ->join('warehouse_product as wp', 'p.id', 'wp.product_id')
            ->where('wp.warehouse_id', 1)
            ->get(['p.id as id', 'p.name as name', 'wp.qty as qty']);
        // dd($products);
        $materials = Material::where('status', 1)->where('category_id', 14)->get();

        return view('product::qty_to_bag.create', compact('products', 'materials'));
    }

    public function store(Request $request)
    {
        DB::beginTransaction();
        try {
            $warehouseProduct = WarehouseProduct::where(['product_id' => $request->product_id])->first();
            $warehouseProduct->qty = $request->qty;
            $warehouseProduct->bag_qty = $warehouseProduct->bag_qty + $request->bag_qty;
            $warehouseProduct->unit = $request->unit;
            $warehouseMaterial = DB::table('warehouse_material')
                ->where('warehouse_id', 1)
                ->where('material_id', $request->material_id)
                ->first();

            if ($warehouseMaterial) {
                $update = DB::table('warehouse_material')
                    ->where('id', $warehouseMaterial->id)
                    ->update(['qty' => $warehouseMaterial->qty - $request->material_qty]);
            }

            $materialSum = WarehouseMaterial::where('material_id', $request->material_id)->sum('qty');

            Material::where('id', $request->material_id)->update([
                'qty' => $materialSum
            ]);

            $message = $warehouseProduct->update();
            DB::commit();
        } catch (Exception $e) {
            DB::rollback();
        }
        return redirect()->back();
    }
}
