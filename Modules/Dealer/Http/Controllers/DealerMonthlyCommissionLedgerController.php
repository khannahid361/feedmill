<?php

namespace Modules\Dealer\Http\Controllers;

use App\Http\Controllers\BaseController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Modules\Account\Entities\Transaction;
use Modules\Dealer\Entities\Dealer;
use Modules\Dealer\Entities\DealerMonthlyCommissionLedger;

class DealerMonthlyCommissionLedgerController extends BaseController
{
    public function __construct(DealerMonthlyCommissionLedger $model)
    {
        $this->model = $model;
    }
    public function index()
    {
        $this->setPageData('Manage Dealer Monthly Commission Ledger', 'Manage Dealer Monthly Commission Ledger', 'fas fa-money-check-alt', [['name' => 'Manage Dealer Monthly Commission Ledger']]);
        $data = [
            'dealers'  => DB::table('dealers as d')->join('chart_of_accounts as c', 'c.dealer_id','d.id')->where('c.parent_name','Commission Monthly Payable')->get(['d.*','c.id as dealer_coa_id']),
        ];
        return view('dealer::monthly_target.ledger', $data);
    }
    public function datatableData(Request $request)
    {
        if ($request->ajax()) {
            if (permission('dealer-add')) {
                if (!empty($request->start_date)) {
                    $this->model->setStartDate($request->start_date);
                }
                if (!empty($request->end_date)) {
                    $this->model->setEndDate($request->end_date);
                }
                if (!empty($request->dealer_coa_id)) {
                    $this->model->setDealerCOAID($request->dealer_coa_id);
                }
                $this->set_datatable_default_properties($request); //set datatable default properties
                $list = $this->model->getDatatableList(); //get table data
                $data = [];
                $balance = 0;
                $no = $request->input('start');
                foreach ($list as $value) {
                    $no++;
                    $account_head = Transaction::with('coa')->where('voucher_no', $value->voucher_no)->orderBy('id', 'desc')->first();
                    $row    = [];
                    $row[]  = $no;
                    $row[]  = date('d-M-Y', strtotime($value->voucher_date));
                    $row[]  = $value->voucher_no;
                    $row[]  = $value->dealer_name;
                    $row[]  = $account_head ? $account_head->coa->name : '';
                    $row[]  = $value->description;
                    $row[]  = number_format($value->debit, 2);
                    $row[]  = number_format($value->credit, 2);
                    $row[]  = number_format($value->debit, 2) - number_format($value->credit, 2) + $balance;
                    $row[]  = $value->created_by;
                    $data[] = $row;
                    $balance += $value->debit - $value->credit;
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
