<?php

namespace Modules\Stock\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Modules\Product\Entities\Product;
use Modules\Setting\Entities\Warehouse;
use App\Http\Controllers\BaseController;
use Modules\Product\Entities\WarehouseProduct;

class ProductStockController extends BaseController{
    public function __construct(WarehouseProduct $model){
        $this->model = $model;
    }
    public function index(){
        if(permission('product-stock-report-access')){
            $this->setPageData('Product Stock','Product Stock','fas fa-boxes',[['name' => 'Product Stock']]);
            $data = [
                'categories' => Category::with('warehouse_products')->whereHas('warehouse_products')->where([['type',2],['status',1]])->get(),
                'warehouses' => DB::table('warehouses')->where('status',1)->pluck('name','id')
            ];
            return view('stock::product.index',$data);
        }else{
            return $this->access_blocked();
        }
    }
    public function getProductStockData(Request $request){
        if($request->ajax() && permission('product-stock-report-access')){
            if (!empty($request->name)) {
                $this->model->setName($request->name);
            }
            if (!empty($request->category)) {
                $this->model->setCategory($request->category);
            }
            if (!empty($request->warehouse)) {
                $this->model->setWarehouse($request->warehouse);
            }
            $this->set_datatable_default_properties($request);
            $list = $this->model->getDatatableList();
            $data = [];
            $no = $request->input('start');
            foreach ($list as $value) {
                $no++;
                $row    = [];
                $row[]  = $no;
                $row[]  = $value->warehouse_name;
                $row[]  = $value->product_name;
                $row[]  = $value->product_code;
                $row[]  = $value->category_name;
                $row[]  = $value->unit_name;
                $row[]  = number_format($value->cost,2);
                $row[]  = $value->qty;
                $row[]  = number_format(($value->cost * $value->qty),2);
                $row[]  = $value->bag_qty;
                $row[]  = $value->wpunit;
                $data[] = $row;
            }
            return $this->datatable_draw($request->input('draw'),$this->model->count_all(), $this->model->count_filtered(), $data);
        }else{
            return response()->json($this->unauthorized());
        }
    }
}
