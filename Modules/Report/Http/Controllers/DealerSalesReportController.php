<?php

namespace Modules\Report\Http\Controllers;

use App\Http\Controllers\BaseController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Modules\Report\Entities\DealerSalesReport;

class DealerSalesReportController extends BaseController
{
    public function __construct(DealerSalesReport $model)
    {
        $this->model = $model;
    }
    public function index()
    {
        if (permission('dealer-sale-access')) {
            $this->setPageData('Dealer Sale Report', 'Dealer Sale Report', 'fas fa-file', [['name' => 'Dealer Sale Report']]);
            $data = [
                'dealer'      => DB::table('dealers')->where([['status', 1]])->select('id', 'name')->get(),
            ];
            return view('report::dealer-sales-report', $data);
        } else {
            return $this->access_blocked();
        }
    }

    public function get_datatable_data(Request $request)
    {
        if ($request->ajax() && permission('dealer-sale-access')) {
            if (!empty($request->memo_no)) {
                $this->model->setInvoiceNo($request->memo_no);
            }
            if (!empty($request->start_date)) {
                $this->model->setFromDate($request->start_date);
            }
            if (!empty($request->end_date)) {
                $this->model->setToDate($request->end_date);
            }
            if (!empty($request->dealer_id)) {
                $this->model->setDealerID($request->dealer_id);
            }
            if (!empty($request->payment_status)) {
                $this->model->setPaymentStatus($request->payment_status);
            }
            $this->set_datatable_default_properties($request);
            $list = $this->model->getDatatableList();
            //            return response()->json($list);
            $data = [];
            $no = $request->input('start');
            foreach ($list as $value) {
                $no++;
                $row    = [];
                $row[]  = $value->memo_no;
                $row[]  = $value->dealer_name;
                $row[]  = date('d-M-Y', strtotime($value->sale_date));
                $row[]  = $value->item;
                $row[]  = $value->total_delivery_quantity;
                $row[]  = number_format($value->total_price, 2, '.', '');
                $row[]  = number_format($value->grand_total, 2, '.', '');
                $row[]  =$value->created_by;
                $data[] = $row;
            }
            return $this->datatable_draw($request->input('draw'), $this->model->count_all(), $this->model->count_filtered(), $data);
        } else {
            return response()->json($this->unauthorized());
        }
    }
}
