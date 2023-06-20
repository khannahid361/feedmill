<?php

namespace Modules\Stock\Http\Controllers;

use App\Http\Controllers\BaseController;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Modules\Material\Entities\WarehouseMaterial;

class WarehouseMaterialLedgerController extends BaseController
{
    public function __construct(WarehouseMaterial $model)
    {
        $this->model = $model;
    }
    public function materialLedger()
    {
        if (permission('material-stock-report-access')) {
            $this->setPageData('Warehouse Material Stock Ledger', 'Warehouse Material Stock Ledger', 'fas fa-boxes', [['name' => 'Warehouse Material Stock Ledger']]);
            $data = [
                'categories' => Category::with('warehouse_materials')->whereHas('warehouse_materials')->where([['type', 1], ['status', 1]])->get(),
                'warehouses' => DB::table('warehouses')->where('status', 1)->pluck('name', 'id')
            ];
            return view('stock::material.ledger', $data);
        } else {
            return $this->access_blocked();
        }
    }
    public function materialDatatableData(Request $request)
    {
        if ($request->ajax() && permission('material-stock-report-access')) {
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
                $row[]  = number_format($value->cost, 2);
                $row[]  = number_format($value->qty, 2);
                $row[]  = number_format(($value->cost * $value->qty), 2);
                $data[] = $row;
            }
            return $this->datatable_draw($request->input('draw'), $this->model->count_all(), $this->model->count_filtered(), $data);
        } else {
            return response()->json($this->unauthorized());
        }
    }
}
