<?php

namespace Modules\Customer\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Modules\Setting\Entities\Warehouse;
use App\Http\Controllers\BaseController;
use Modules\Customer\Entities\CustomerLedger;

class CustomerLedgerController extends BaseController
{
    public function __construct(CustomerLedger $model)
    {
        $this->model = $model;
    }

    public function index()
    {
        if (permission('customer-ledger-access')) {
            $this->setPageData('Customer Ledger', 'Customer Ledger', 'fas fa-file-invoice-dollar', [['name' => 'Customer', 'link' => route('customer')], ['name' => 'Customer Ledger']]);
            $locations = DB::table('locations')->where('status', 1)->get();
            $warehouses = Warehouse::where('status', 1)->pluck('name', 'id');
            return view('customer::ledger.index', compact('locations', 'warehouses'));
        } else {
            return $this->access_blocked();
        }
    }

    public function get_datatable_data(Request $request)
    {
        if ($request->ajax()) {
            if (!empty($request->district_id)) {
                $this->model->setDistrictID($request->district_id);
            }
            if (!empty($request->upazila_id)) {
                $this->model->setUpazilaID($request->upazila_id);
            }
            if (!empty($request->route_id)) {
                $this->model->setRouteID($request->route_id);
            }
            if (!empty($request->area_id)) {
                $this->model->setAreaID($request->area_id);
            }
            if (!empty($request->customer_id)) {
                $this->model->setCustomerID($request->customer_id);
            }
            if (!empty($request->warehouse_id)) {
                $this->model->setWarehouseID($request->district_id);
            }
            if (!empty($request->start_date)) {
                $this->model->setStartDate($request->start_date);
            }
            if (!empty($request->end_date)) {
                $this->model->setEndDate($request->end_date);
            }

            $this->set_datatable_default_properties($request); //set datatable default properties
            $list = $this->model->getDatatableList(); //get table data
            $data = [];
            $debit = $credit = $balance = 0;
            foreach ($list as $value) {
                $debit += $value->debit;
                $credit += $value->credit;
                $balance = $debit - $credit;
                $row = [];
                $row[] = $value->voucher_date;
                $row[] = $value->warehouse_name;
                $row[] = $value->voucher_type;
                $row[] = $value->description;
                $row[] = $value->voucher_no;
                $row[] = $value->debit ? number_format($value->debit, 2, '.', ',') :  number_format(0, 2, '.', ',');
                $row[] = $value->credit ? number_format($value->credit, 2, '.', ',') :  number_format(0, 2, '.', ',');
                $row[] = number_format(($balance), 2, '.', ',');
                $data[] = $row;
            }
            return $this->datatable_draw(
                $request->input('draw'),
                $this->model->count_all(),
                $this->model->count_filtered(),
                $data
            );
        } else {
            return response()->json($this->unauthorized());
        }
    }

    public function getLedgerPreviousData(Request $request)
    {
        // previous total data
        $query = DB::table('transactions')
            ->select(DB::raw('SUM(transactions.debit) AS total_debit'), DB::raw('SUM(transactions.credit) AS total_credit'))
            ->join('chart_of_accounts as coa', 'transactions.chart_of_account_id', '=', 'coa.id')
            ->join('customers as c', 'coa.customer_id', 'c.id')
            ->where(['transactions.approve' => 1]);


        if (!empty($request->customer_id)) {
            $query->where('c.id', $request->customer_id);
        }
        if (!empty($request->district_id)) {
            $query->where('c.district_id', $request->district_id);
        }
        if (!empty($request->upazila_id)) {
            $query->where('c.upazila_id', $request->upazila_id);
        }
        if (!empty($request->area_id)) {
            $query->where('c.area_id', $request->area_id);
        }
        if (!empty($request->start_date)) {
            $query->where('transactions.voucher_date', '<', $request->start_date);
        }

        $result = $query->first();

        $totalDebit = $result->total_debit;
        $totalCredit = $result->total_credit;
        $balance =  $totalDebit - $totalCredit;
        if (empty($request->start_date)) {
            $balance = 0;
        }

        //previous page data
        $count = $request->page * $request->length;
        $p_pageData = DB::table('transactions')
            ->join('chart_of_accounts as coa', 'transactions.chart_of_account_id', '=', 'coa.id')
            ->join('customers as c', 'coa.customer_id', 'c.id')
            ->where(['transactions.approve' => 1]);

        if (!empty($request->customer_id)) {
            $p_pageData->where('c.id', $request->customer_id);
        }
        if (!empty($request->district_id)) {
            $p_pageData->where('c.district_id', $request->district_id);
        }
        if (!empty($request->upazila_id)) {
            $p_pageData->where('c.upazila_id', $request->upazila_id);
        }
        if (!empty($request->area_id)) {
            $p_pageData->where('c.area_id', $request->area_id);
        }
        if (!empty($request->start_date)) {
            $p_pageData->where('transactions.voucher_date', '>=', $request->start_date);
        }
        if (!empty($request->end_date)) {
            $p_pageData->where('transactions.voucher_date', '<=', $request->end_date);
        }

        $prev_PageResult = $p_pageData->take($count)->get(['transactions.debit', 'transactions.credit']);
        $newBalance = 0;
        foreach ($prev_PageResult as $result1) {
            $newBalance += $result1->debit - $result1->credit;
        }
        $newBalance += $balance;
        $data = ['prev_balance' => $balance, 'new_balance' => $newBalance];
        return response()->json($data);
    }
}
