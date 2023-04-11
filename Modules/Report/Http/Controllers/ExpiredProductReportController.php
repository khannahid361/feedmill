<?php

namespace Modules\Report\Http\Controllers;

use App\Http\Controllers\BaseController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Modules\Report\Entities\ExpiredProductReport;

class ExpiredProductReportController extends BaseController
{
    public function __construct(ExpiredProductReport $model)
    {
        $this->model = $model;
    }

    public function index()
    {
        if (permission('production-access')) {
            $this->setPageData('Expired Product', 'Expired Product', 'fas fa-industry', [['name' => 'Expired Product']]);
            $warehouses = DB::table('warehouses')->where('status', 1)->pluck('name', 'id');
            return view('report::expired-product', compact('warehouses'));
        } else {
            return $this->access_blocked();
        }
    }

    public function get_datatable_data(Request $request)
    {
        if ($request->ajax()) {
            if (permission('production-access')) {

                if (!empty($request->batch_no)) {
                    $this->model->setBatchNo($request->batch_no);
                }
                if (!empty($request->start_date)) {
                    $this->model->setStartDate($request->start_date);
                }
                if (!empty($request->end_date)) {
                    $this->model->setEndDate($request->end_date);
                }
                if (!empty($request->warehouse_id)) {
                    $this->model->setWarehouseID($request->warehouse_id);
                }
                if (!empty($request->status)) {
                    $this->model->setStatus($request->status);
                }
                if (!empty($request->production_status)) {
                    $this->model->setProductionStatus($request->production_status);
                }
                if (!empty($request->transfer_status)) {
                    $this->model->setTransferStatus($request->transfer_status);
                }

                $this->set_datatable_default_properties($request); //set datatable default properties
                $list = $this->model->getDatatableList(); //get table data
                $data = [];
                $no = $request->input('start');
                foreach ($list as $value) {
                    $no++;
                    $row = [];
                    $row[] = $no;
                    $row[] = $value->batch_no;
                    foreach ($value->products as $key => $item) {
                        $itemName = $item->product->name;
                    }
                    $row[] = $itemName;
                    $row[] = $value->warehouse->name;
                    $row[] = date('d-M-Y', strtotime($value->start_date));
                    $row[] = $value->end_date ? date('j-F-Y', strtotime($value->end_date)) : '-';
                    $diff = strtotime($value->end_date) - strtotime(date('Y-m-d'));
                    if ($diff > 0) {
                        $years = floor($diff / (365 * 60 * 60 * 24));
                        $months = floor(($diff - $years * 365 * 60 * 60 * 24) / (30 * 60 * 60 * 24));
                        $days = floor(($diff - $years * 365 * 60 * 60 * 24 - $months * 30 * 60 * 60 * 24) / (60 * 60 * 24));
                        $expireIn = '';
                        if ($years > 0) {
                            $expireIn .= $years . ' Year ';
                        }
                        if ($months > 0) {
                            $expireIn .= $months . ' month ';
                        }
                        if ($days > 0) {
                            $expireIn .= $days . ' days';
                        }
                        $row[] = $expireIn;
                    } else {
                        if ($value->production_status == 3) {
                            $row[] = 'Already Expired';
                        } elseif ($value->production_status == 2 || $value->production_status == 1) {
                            $row[] = 'Complete Production First';
                        }
                    }
                    $data[] = $row;
                }
                return $this->datatable_draw(
                    $request->input('draw'),
                    $this->model->count_all(),
                    $this->model->count_filtered(),
                    $data
                );
            }
        } else {
            return response()->json($this->unauthorized());
        }
    }
}
