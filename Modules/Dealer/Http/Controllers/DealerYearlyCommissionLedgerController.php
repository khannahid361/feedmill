<?php

namespace Modules\Dealer\Http\Controllers;

use App\Http\Controllers\BaseController;
use Illuminate\Http\Request;
use Modules\Account\Entities\Transaction;
use Modules\Dealer\Entities\Dealer;
use Modules\Dealer\Entities\DealerYearlyCommissionLedger;

class DealerYearlyCommissionLedgerController extends BaseController
{
    public function __construct(DealerYearlyCommissionLedger $model)
    {
        $this->model = $model;
    }
    public function index()
    {
        $this->setPageData('Manage Dealer Monthly Commission Ledger', 'Manage Dealer Monthly Commission Ledger', 'fas fa-money-check-alt', [['name' => 'Manage Dealer Monthly Commission Ledger']]);
        $data = [
            'dealers'  => Dealer::orderBy('id', 'DESC')->get()
        ];
        return view('dealer::yearly_target.ledger', $data);
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
                if (!empty($request->supplier_coa_id)) {
                    $this->model->setDealerCOAID($request->supplier_coa_id);
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
