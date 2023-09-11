<?php

namespace Modules\Stock\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Modules\Material\Entities\Material;
use Modules\Setting\Entities\Warehouse;
use App\Http\Controllers\BaseController;
use Modules\Material\Entities\WarehouseMaterial;

class MaterialStockController extends BaseController{
    public function __construct(WarehouseMaterial $model){
        $this->model = $model;
    }
    public function index(){
        if(permission('material-stock-report-access')){
            $this->setPageData('Material Stock','Material Stock','fas fa-boxes',[['name' => 'Material Stock']]);
            $data = [
                'categories' => Category::with('warehouse_materials')->whereHas('warehouse_materials')->where([['type',1],['status',1]])->get(),
                'warehouses' => DB::table('warehouses')->where('status',1)->pluck('name','id')
            ];
            return view('stock::material.index',$data);
        }else{
            return $this->access_blocked();
        }
    }
    public function getMaterialStockData(Request $request){
        if($request->ajax() && permission('material-stock-report-access')){
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
                $row[]  = $value->material_name;
                $row[]  = $value->material_code;
                $row[]  = $value->category_name;
                $row[]  = $value->unit_name;
                // $row[]  = number_format($value->cost,2);
                $row[] = $value->cost ? number_format($value->cost,2,'.',',') : ($value->opening_cost ? number_format($value->opening_cost,2,'.',','): 0);
                $row[]  = number_format($value->qty,2);
                // $row[]  = number_format(($value->cost * $value->qty),2);
                $row[] = $value->cost ? number_format($value->qty * $value->cost,2,'.',',') : ($value->opening_cost ? number_format($value->qty * $value->opening_cost,2,'.',','): 0);
                $data[] = $row;
            }
            return $this->datatable_draw($request->input('draw'),$this->model->count_all(), $this->model->count_filtered(), $data);
        }else{
            return response()->json($this->unauthorized());
        }
    }
}
