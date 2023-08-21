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
            $this->setPageData('DEPO Wise Sales Delivery Ledger', 'DEPO Wise Sales Delivery Ledger', 'fas fa-boxes', [['name' => 'DEPO Wise Sales Delivery Ledger']]);
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
            $data = [];
            $no = $request->input('start');
            foreach ($list as $value) {
                $no++;
                if ($value->type == 'Dealer') {
                    $type = '<span class="label label-info label-pill label-inline" style="min-width:70px !important;">Dealer</span>';
                } else {
                    $type = '<span class="label label-warning label-pill label-inline" style="min-width:70px !important;">Customer</span>';
                }
                $row    = [];
                $row[]  = $no;
                $row[]  = $value->warehouse_name;
                $row[]  = $value->product_name;
                $row[]  = date("d-m-Y", strtotime($value->delivery_date != 0 ? $value->delivery_date : $value->return_date));
                $row[]  = $value->category_name;
                $row[]  = $value->invoice_no;
                $row[]  = $value->name;
                $row[]  = $type;
                $row[]  = $value->quantity;
                $row[]  = $value->return_qty;
                $data[] = $row;
            }
            return $this->datatable_draw($request->input('draw'), $this->model->count_all(), $this->model->count_filtered(), $data);
        } else {
            return response()->json($this->unauthorized());
        }
    }
}
