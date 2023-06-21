<?php

namespace Modules\Stock\Http\Controllers;

use App\Http\Controllers\BaseController;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Modules\Material\Entities\WarehouseMaterial;
use Modules\Product\Entities\WarehouseProduct;

class WarehouseLedgerController extends BaseController
{
    public function __construct(WarehouseProduct $model)
    {
        $this->model = $model;
    }
    public function productLedger()
    {
        if (permission('product-stock-report-access')) {
            $this->setPageData('Warehouse Product Ledger', 'Warehouse Product Ledger', 'fas fa-boxes', [['name' => 'Warehouse Product Ledger']]);
            $data = [
                'categories' => Category::with('warehouse_products')->whereHas('warehouse_products')->where([['type', 2], ['status', 1]])->get(),
                'warehouses' => DB::table('warehouses')->where('status', 1)->pluck('name', 'id')
            ];
            return view('stock::product.ledger', $data);
        } else {
            return $this->access_blocked();
        }
    }
    public function getProductLedgerData(Request $request)
    {
        if ($request->ajax() && permission('product-stock-report-access')) {
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
                $row[]  = number_format($value->cost, 2);
                $row[]  = $value->bag_qty;
                $row[]  = number_format(($value->cost * $value->bag_qty * 50), 2);
                $row[]  = $value->qty;
                $row[]  = number_format(($value->cost * $value->qty), 2);
                $row[]  = number_format(($value->cost * $value->qty) + ($value->cost * $value->bag_qty * 50), 2);
                $data[] = $row;
            }
            return $this->datatable_draw($request->input('draw'), $this->model->count_all(), $this->model->count_filtered(), $data);
        } else {
            return response()->json($this->unauthorized());
        }
    }

    public function productStock()
    {
        if (permission('product-stock-report-access')) {
            $this->setPageData('Warehouse Product', 'Warehouse Product', 'fas fa-boxes', [['name' => 'Warehouse Product']]);
            $data = [
                'categories' => Category::with('warehouse_products')->whereHas('warehouse_products')->where([['type', 2], ['status', 1]])->get(),
                'warehouses' => DB::table('warehouses')->where('status', 1)->pluck('name', 'id')
            ];
            return view('stock::product.stock', $data);
        } else {
            return $this->access_blocked();
        }
    }

    public function getProductStockData(Request $request)
    {
        if ($request->ajax() && permission('product-stock-report-access')) {
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
                $row[]  = $value->bag_qty;
                $row[]  = $value->qty;
                $data[] = $row;
            }
            return $this->datatable_draw($request->input('draw'), $this->model->count_all(), $this->model->count_filtered(), $data);
        } else {
            return response()->json($this->unauthorized());
        }
    }
}
