<?php

namespace Modules\Dealer\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\BaseController;
use Modules\Dealer\Entities\DealerLedger;

class DealerLedgerController extends BaseController
{
    public function __construct(DealerLedger $model)
    {
        $this->model = $model;
    }

    public function index()
    {
        if (permission('dealer-ledger-access')) {
            $this->setPageData('Dealer Ledger', 'Dealer Ledger', 'fas fa-file-invoice-dollar', [['name' => 'Dealer', 'link' => route('dealer')], ['name' => 'Dealer Ledger']]);
            $dealers = DB::table('dealers')->where('status', 1)->get();
            return view('dealer::ledger.index', compact('dealers'));
        } else {
            return $this->access_blocked();
        }
    }

    public function get_datatable_data(Request $request)
    {
        if ($request->ajax()) {
            if (!empty($request->dealer_id)) {
                $this->model->setDealerID($request->dealer_id);
            }
            if (!empty($request->start_date)) {
                $this->model->setStartDate($request->start_date);
            }
            if (!empty($request->end_date)) {
                $this->model->setEndDate($request->end_date);
            }

            $this->set_datatable_default_properties($request); //set datatable default properties
            $list = $this->model->getDatatableList(); //get table data
            // dd($list);
            $data = [];
            $debit = $credit = $balance = 0;
            foreach ($list as $value) {
                $debit += $value->debit;
                $credit += $value->credit;
                $balance = $debit - $credit;
                $row = [];
                $row[] = $value->voucher_date;
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
        $query = DB::table('dealers as d')
            ->join('chart_of_accounts as coa', 'd.id', '=', 'coa.dealer_id')
            ->join('transactions as t', 'coa.id', '=', 't.chart_of_account_id')
            ->select(DB::raw('SUM(t.debit) AS total_debit'), DB::raw('SUM(t.credit) AS total_credit'))
            ->whereNotIn('coa.parent_name', ['Commission Yearly Payable', 'Commission Monthly Payable'])
            ->where(['t.approve' => 1]);

        if (!empty($request->dealer_id)) {
            $query->where('d.id', $request->dealer_id);
        }
        if (!empty($request->start_date)) {
            $query->where('t.voucher_date', '<', $request->start_date);
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
        $p_pageData = DB::table('dealers as d')
            ->join('chart_of_accounts as coa', 'd.id', '=', 'coa.dealer_id')
            ->join('transactions as t', 'coa.id', '=', 't.chart_of_account_id')
            ->whereNotIn('coa.parent_name', ['Commission Yearly Payable', 'Commission Monthly Payable'])
            ->where(['t.approve' => 1]);

        if (!empty($request->dealer_id)) {
            $p_pageData->where('d.id', $request->dealer_id);
        }
        if (!empty($request->start_date)) {
            $p_pageData->where('t.voucher_date', '>=', $request->start_date);
        }
        if (!empty($request->end_date)) {
            $p_pageData->where('t.voucher_date', '<=',$request->end_date);
        }
        $prev_PageResult = $p_pageData->take($count)->get(['t.debit', 't.credit']);
        $newBalance = 0;
        foreach ($prev_PageResult as $result1) {
            $newBalance += $result1->debit - $result1->credit;
        }
        $newBalance += $balance;
        $data = ['prev_balance' => $balance, 'new_balance' => $newBalance];
        return response()->json($data);
    }
}
