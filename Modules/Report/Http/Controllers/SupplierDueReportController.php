<?php

namespace Modules\Report\Http\Controllers;

use App\Http\Controllers\BaseController;
use Illuminate\Http\Request;
use Modules\Report\Entities\SupplierDueReport;

class SupplierDueReportController extends BaseController
{
    public function __construct(SupplierDueReport $model)
    {
        $this->model = $model;
    }


    public function index()
    {
        if (permission('supplier-due-report-access')) {
            $this->setPageData('Supplier Due Report', 'Supplier Due Report', 'fas fa-th-list', [['name' => 'Supplier Due Report']]);
            return view('report::supplier-due');
        } else {
            return $this->access_blocked();
        }
    }

    public function get_datatable_data(Request $request)
    {
        if ($request->ajax()) {
            if (permission('supplier-due-report-access')) {

                if (!empty($request->name)) {
                    $this->model->setName($request->name);
                }
                if (!empty($request->mobile)) {
                    $this->model->setMobile($request->mobile);
                }
                if (!empty($request->email)) {
                    $this->model->setEmail($request->email);
                }

                if (!empty($request->status)) {
                    $this->model->setStatus($request->status);
                }

                $this->set_datatable_default_properties($request); //set datatable default properties
                $list              = $this->model->getDatatableList();              //get table data
                $data              = [];
                $no                = $request->input('start');
                $currency_symbol   = config('settings.currency_symbol');
                $currency_position = config('settings.currency_position');
                foreach ($list as $value) {
                    $no++;
                    $row = [];
                    $balance = $this->model->supplier_balance($value->id);
                    $balance = ($currency_position == 1) ? $currency_symbol . ' ' . $balance : $balance . ' ' . $currency_symbol;
                    $row[] = $no;
                    $row[] = $value->company_name ? $value->name . ' (' . $value->company_name . ')' : $value->name;
                    $row[] = $value->address;
                    $row[] = $value->mobile;
                    $row[] = $value->email;
                    $row[] = $value->city;
                    $row[] = $value->zipcode;
                    $row[] = STATUS_LABEL[$value->status];
                    $row[] = $balance;
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
