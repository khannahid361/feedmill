<?php

namespace Modules\DealerPanel\Http\Controllers;

use Exception;
use App\Http\Controllers\BaseController;
use App\Models\Tax;
use App\Models\Unit;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Modules\DealerPanel\Entities\DealerPanelSale;
use Modules\DealerPanel\Http\Requests\DealerPanelSaleFormRequest;
use Modules\DealerSale\Entities\DealerDelivery;
use Modules\DealerSale\Entities\DealerSale;
use Modules\DealerSale\Entities\DealerSaleProduct;
use Modules\Product\Entities\WarehouseProduct;

class DealerPanelController extends BaseController {
    public function __construct(DealerPanelSale $model){
        $this->model = $model;
    }
    public function dashboard(){
        $data = [
            'order'    => DealerSale::where(['dealer_id' => Auth::guard('dealer')->user()->id])->sum('total_qty'),
            'free'     => DealerSale::where(['dealer_id' => Auth::guard('dealer')->user()->id])->sum('total_free_qty'),
            'deliver'  => DealerSale::where(['dealer_id' => Auth::guard('dealer')->user()->id])->sum('total_delivery_quantity')
        ];
        return view('dealerpanel::index',$data);
    }
    public function saleIndex(){
        $this->setPageData('Dealer Sale Manage','Dealer Sale Manage','fab fa-opencart',[['name' => 'Dealer Sale Manage']]);
        $data = [
            'dealer'      => DB::table('dealers')->where([['status',1]])->select('id','name')->get(),
        ];
        return view('dealerpanel::sale.index',$data);
    }

    public function product_search_with_id(Request $request){
        if($request->ajax()) {
            $product = DB::table('warehouse_product as wp')
                ->join('products as p','wp.product_id','=','p.id')
                ->leftjoin('taxes as t','p.tax_id','=','t.id')
                ->where(['wp.product_id' => $request->data])
                ->selectRaw('wp.*,p.name,p.code,p.base_unit_id,p.base_unit_price as price,p.tax_method,t.name as tax_name,t.rate as tax_rate')
                ->first();
            $qty = WarehouseProduct::where(['product_id' => $request->data])->sum('qty');
            if($product) {
                $output['id']         = $product->product_id;
                $output['name']       = $product->name;
                $output['code']       = $product->code;
                $output['price']      = $product->price;
                $output['qty']        = $qty;
                $output['tax_name']   = $product->tax_name ?? 'No Tax';
                $output['tax_rate']   = $product->tax_rate ?? 0;
                $output['tax_method'] = $product->tax_method;
                $units = Unit::where('base_unit',$product->base_unit_id)->orWhere('id',$product->base_unit_id)->get();
                $unit_name            = [];
                $unit_operator        = [];
                $unit_operation_value = [];
                if($units) {
                    foreach ($units as $unit) {
                        if($product->base_unit_id == $unit->id)
                        {
                            array_unshift($unit_name,$unit->unit_name);
                            array_unshift($unit_operator,$unit->operator);
                            array_unshift($unit_operation_value,$unit->operation_value);
                        }else{
                            $unit_name           [] = $unit->unit_name;
                            $unit_operator       [] = $unit->operator;
                            $unit_operation_value[] = $unit->operation_value;
                        }
                    }
                }
                $output['unit_name'] = implode(',',$unit_name).',';
                $output['unit_operator'] = implode(',',$unit_operator).',';
                $output['unit_operation_value'] = implode(',',$unit_operation_value).',';
                return $output;
            }
        }
    }

    public function get_datatable_data(Request $request){
        if($request->ajax()){
            if (!empty($request->memo_no)) {
                $this->model->setMemoNo($request->memo_no);
            }
            if (!empty($request->start_date)) {
                $this->model->setFromDate($request->start_date);
            }
            if (!empty($request->end_date)) {
                $this->model->setToDate($request->end_date);
            }
            $this->set_datatable_default_properties($request);
            $list = $this->model->getDatatableList();
            $data = [];
            $no = $request->input('start');
            foreach ($list as $value) {
                $no++;
                $action = '';
                $action .= ' <a class="dropdown-item view_data" href="'.route("dealer.panel.sale.show",$value->id).'">'.self::ACTION_BUTTON['View'].'</a>';
                if ($value->status == 1) {
                    $action .= ' <a class="dropdown-item" href="'.route("dealer.panel.sale.edit",$value->id).'">'.self::ACTION_BUTTON['Edit'].'</a>';
                }
                if($value->document) {
                    $action .= '<a class="dropdown-item" href="'.asset('storage/'.SALE_DOCUMENT_PATH.$value->document).'" download><i class="fas fa-download mr-2"></i> Document</a>';
                }
                if($value->status == 1) {
                    $action .= ' <a class="dropdown-item delete_data"  data-id="' . $value->id . '" data-name="' . $value->memo_no . '">'.self::ACTION_BUTTON['Delete'].'</a>';
                }
                $row    = [];
                $row[]  = $value->memo_no;
                $row[]  = $value->item.'('.$value->total_qty + $value->total_free_qty.')';
                $row[]  = $value->total_delivery_quantity;
                $row[]  = number_format($value->total_price,2,'.','');
                $row[]  = date('d-M-Y',strtotime($value->sale_date));
                $row[]  = $value->total_qty + $value->total_free_qty == $value->total_delivery_quantity ? '<span class="label label-success label-pill label-inline" style="min-width:70px !important;">Complete</span>' : '<span class="label label-danger label-pill label-inline" style="min-width:70px !important;">Incomplete</span>';
                $row[]  = SALE_STATUS[$value->status];
                $row[]  = action_button($action);
                $data[] = $row;
            }
            return $this->datatable_draw($request->input('draw'),$this->model->count_all(), $this->model->count_filtered(), $data);
        }else{
            return response()->json($this->unauthorized());
        }
    }
    public function saleCreate(){
        $this->setPageData('Add Dealer Sale','Add Dealer Sale','fas fa-shopping-cart',[['name' => 'Add Dealer Sale']]);
        $products = DB::table('warehouse_product as wp')
            ->join('products as p','wp.product_id','=','p.id')
            ->selectRaw('wp.*,p.name')
            ->groupBy('product_id')
            ->orderBy('p.name','asc')
            ->get();
        $data = [
            'products'       => $products,
            'taxes'          => Tax::activeTaxes(),
            'dealer'         => DB::table('dealers')->where([['status',1]])->select('id','name')->get(),
            'memo_no'        => 'DINV-'.date('ymd').rand(1,999),
        ];
        return view('dealerpanel::sale.create',$data);
    }
    public function saleStore(Request $request){
        if($request->ajax()){
            DB::beginTransaction();
            try{
                $products   = [];
                $collection = collect($request->all())->except('_token','products')->merge(['order_tax_rate' => 0,'payment_status' => 3,'order_tax' => 0,'grand_total' => $request->total_price,'previous_due' => 0,'net_total' => $request->total_price,'paid_amount' => 0,'due_amount' => $request->total_price ,'total_delivery_quantity' => 0,'order_type' => 2 ,'status' => 1,'created_by' => auth()->guard('dealer')->user()->id]);
//                return response()->json($collection);

                if($request->hasFile('document')){
                    $collection['document'] = $this->upload_file($request->file('document'),SALE_DOCUMENT_PATH);
                }
                $sale = DealerSale::create($collection->all());
                if($request->has('products')){
                    foreach ($request->products as $value){
                        if(!empty($value['id']) && !empty($value['qty'])){
                            $unit = Unit::where('unit_name',$value['unit'])->first();
                            $products[] = [
                                'dealer_sale_id'   => $sale->id,
                                'product_id'       => $value['id'],
                                'qty'              => $value['qty'],
                                'free_qty'         => $value['free_qty'],
                                'delivered_qty'    => 0,
                                'sale_unit_id'     => $unit ? $unit->id : null,
                                'net_unit_price'   => $value['net_unit_price'],
                                'discount'         => 0,
                                'tax_rate'         => $value['tax_rate'],
                                'tax'              => $value['tax'],
                                'total'            => $value['subtotal']
                            ];
                        }
                    }
                }
                DealerSaleProduct::insert($products);
                $output = ['status' => 'success','message' => 'Data Saved Successfully'];
                DB::commit();
            }catch(Exception $e){
                DB::rollBack();
                $output = ['status' => 'error','message' => $e->getMessage()];
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }
    public function saleShow(int $id){
        $this->setPageData('Dealer Sale Details','Dealer Sale Details','fas fa-file',[['name'=>'Dealer Sale','link' => route('dealer.sale')],['name' => 'Dealer Sale Details']]);
        $sale = $this->model->with('sale_products')->find($id);
        return view('dealerpanel::sale.details',compact('sale'));
    }
    public function saleEdit(int $id){
        $this->setPageData('Edit Dealer Sale','Edit Dealer Sale','fas fa-edit',[['name'=>'Dealer Sale','link' => route('dealer.sale')],['name' => 'Edit Dealer Sale']]);
        $products = DB::table('warehouse_product as wp')
                    ->join('products as p','wp.product_id','=','p.id')
                    ->selectRaw('wp.*,p.name')
                    ->groupBy('product_id')
                    ->orderBy('p.name','asc')
                    ->get();
        $data = [
            'products'     => $products,
            'sale'         => $this->model->with('sale_products')->find($id),
            'dealer'       => DB::table('dealers')->where([['status',1]])->select('id','name')->get(),
            'taxes'        => Tax::activeTaxes(),
        ];
        return view('dealerpanel::sale.edit',$data);
    }
    public function saleUpdate(Request $request){
        if($request->ajax()){
            DB::beginTransaction();
            try{
                $saleUpdate =  $this->model->find($request->sale_id);
                $collection = collect($request->all())->except('_token','products')->merge(['modified_by' => auth()->user()->name]);
                if($request->hasFile('document')){
                    $collection['document'] = $this->upload_file($request->file('document'),SALE_DOCUMENT_PATH);
                }
                if($request->has('products')){
                    foreach ($request->products as $value){
                        if(!empty($value['id']) && !empty($value['qty'])){
                            $unit = Unit::where('unit_name',$value['unit'])->first();
                            $products[] = [
                                'dealer_sale_id'   => $saleUpdate->id,
                                'product_id'       => $value['id'],
                                'qty'              => $value['qty'],
                                'free_qty'         => $value['free_qty'],
                                'delivered_qty'    => 0,
                                'sale_unit_id'     => $unit ? $unit->id : null,
                                'net_unit_price'   => $value['net_unit_price'],
                                'discount'         => 0,
                                'tax_rate'         => $value['tax_rate'],
                                'tax'              => $value['tax'],
                                'total'            => $value['subtotal']
                            ];
                        }
                    }
                }
                DealerSaleProduct::where(['dealer_sale_id' => $request->sale_id])->delete();
                $saleUpdate->update($collection->all());
                DealerSaleProduct::insert($products);
                $output = ['status' => 'success','message' => 'Data Updated Successfully' ];
                DB::commit();
            }catch(Exception $e){
                DB::rollBack();
                $output = ['status' => 'error','message' => $e->getMessage()];
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }
    public function saleDelete(Request $request){
        if($request->ajax()){
            DB::beginTransaction();
            try{
                DealerSaleProduct::where(['dealer_sale_id' => $request->id])->delete();
                $this->model->find($request->id)->delete();
                $output = ['status' => 'success','message' => 'Data Deleted Successfully'];
                DB::commit();
            }catch(Exception $e){
                DB::rollBack();
                $output = ['status' => 'error','message' => $e->getMessage()];
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }
}
