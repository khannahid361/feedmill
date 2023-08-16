<?php

namespace Modules\Stock\Http\Controllers;

use App\Http\Controllers\BaseController;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Modules\Stock\Entities\WarehouseProductDeliveryLedger;

class WarehouseProductDeliveryController extends BaseController
{
    public function __construct(WarehouseProductDeliveryLedger $model)
    {
        $this->model = $model;
    }

    public function delivery()
    {
        if (permission('product-stock-report-access')) {
            $this->setPageData('DEPO Product Ledger', 'DEPO Product Ledger', 'fas fa-boxes', [['name' => 'DEPO Product Ledger']]);
            $data = [
                'categories' => Category::with('warehouse_products')->whereHas('warehouse_products')->where([['type', 2], ['status', 1]])->get(),
                'warehouses' => DB::table('warehouses')->where('status', 1)->pluck('name', 'id')
            ];
            return view('stock::delivery.index', $data);
        } else {
            return $this->access_blocked();
        }
    }

    public function deliveredProductLedgerData(Request $request)
    {

        if ($request->ajax() && permission('product-stock-report-access')) {
            if (!empty($request->category)) {
                $this->model->setCategory($request->category);
            }
            if (!empty($request->warehouse)) {
                $this->model->setWarehouse($request->warehouse);
            }
            if (!empty($request->party)) {
                $this->model->setParty($request->party);
            }
            if (!empty($request->from_date)) {
                $this->model->setFromDate($request->from_date);
            }
            if (!empty($request->to_date)) {
                $this->model->setToDate($request->to_date);
            }

            $this->set_datatable_default_properties($request);
            $list = $this->model->getDatatableList();
            // dd($list);
            $data = [];
            $no = $request->input('start');
            foreach ($list as $value) {
                $no++;
                $row    = [];
                $row[]  = $no;
                $row[]  = $value->warehouse_name;
                $row[]  = $value->product_name;
                $row[]  = $value->category_name;
                $row[]  = $value->invoice_no;
                $row[]  = $value->name;
                $row[]  = $value->type;
                $row[]  = $value->quantity;
                // $row[]  = number_format($value->cost, 2);
                // $row[]  = $value->bag_qty;
                // $row[]  = number_format(($value->cost * $value->bag_qty * 50), 2);
                // $row[]  = $value->qty;
                // $row[]  = number_format(($value->cost * $value->qty), 2);
                // $row[]  = number_format(($value->cost * $value->qty) + ($value->cost * $value->bag_qty * 50), 2);
                $data[] = $row;
            }
            return $this->datatable_draw($request->input('draw'), $this->model->count_all(), $this->model->count_filtered(), $data);
        } else {
            return response()->json($this->unauthorized());
        }
    }
}
