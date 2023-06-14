<?php

namespace Modules\Dealer\Http\Controllers;

use App\Http\Controllers\BaseController;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Modules\Account\Entities\ChartOfAccount;
use Modules\Account\Entities\Transaction;
use Modules\Dealer\Entities\Dealer;
use Modules\Dealer\Entities\YearlyTarget;
use Modules\Dealer\Http\Requests\CommissionYearlyFormRequest;
use Modules\Dealer\Http\Requests\YearlyCommissionPaymentRequest;

class YearlyTargetController extends BaseController
{
    public function __construct(YearlyTarget $model)
    {
        $this->model = $model;
    }
    public function index()
    {
        $this->setPageData('Manage Dealer Yearly Commission', 'Manage Dealer Yearly Commission', 'fas fa-money-check-alt', [['name' => 'Manage Dealer Yearly Commission']]);
        $data = [
            'dealers'  => Dealer::orderBy('id', 'DESC')->get()
        ];
        return view('dealer::yearly_target.index', $data);
    }

    public function create()
    {
        $this->setPageData('Add Dealer Yearly Commission', 'Add Dealer Yearly Commission', 'far fa-edit', [['name' => 'Add Dealer Yearly Commission']]);
        $data = [
            'dealers'  => Dealer::orderBy('id', 'DESC')->get()
        ];
        return view('dealer::yearly_target.create', $data);
    }

    public function store(CommissionYearlyFormRequest $request)
    {
        if ($request->ajax()) {
            DB::beginTransaction();
            try {
                $collection = [];
                if ($request->has('commission')) {

                    foreach ($request->commission as $com) {

                        if (!empty($com['dealer_id']) && !empty($com['qty']) && !empty($com['commission_amount'])) {
                            //'from_date' => $request->from_date , 'to_date' => $request->to_date
                            $existing = YearlyTarget::where('dealer_id' , $com['dealer_id'])->where('from_date')->first();
                            if (!empty($existing) && $existing->acheived_qty == 0) {
                                $existing->delete();
                            }
                            if (empty($existing) || $existing->acheived_qty == 0) {
                                $collection[] = [
                                    'dealer_id'         => $com['dealer_id'],
                                    'from_date'         => $request->from_date,
                                    'to_date'           => $request->to_date,
                                    'qty'               => $com['qty'],
                                    'commission_amount' => $com['commission_amount'],
                                    'created_at' => date("Y-m-d H:i:s"),
                                    'created_by' => auth()->user()->name,
                                    'modified_by' => auth()->user()->name,
                                    'is_generated' => 0
                                ];
                            }
                        }
                    }
                }
                $data = YearlyTarget::insert($collection);
                $output = ['status' => 'success', 'message' => 'Yearly Target Commission Data Saved Successfully'];
                DB::commit();
            } catch (Exception $e) {
                DB::rollBack();
                $output = ['status' => 'error', 'message' => $e->getMessage()];
            }
            return response()->json($output);
        } else {
            $output = ['status' => 'error', 'message' => 'Failed To Save Commission Data'];
            return response()->json($this->unauthorized());
        }
    }
    public function datatableData(Request $request)
    {
        if ($request->ajax()) {
            if (permission('dealer-add')) {
                if (!empty($request->dealer_id)) {
                    $this->model->setDealer($request->dealer_id);
                }
                $this->set_datatable_default_properties($request);
                $list = $this->model->getDatatableList();
                $data = [];
                $no = $request->input('start');
                foreach ($list as $value) {
                    $no++;
                    $action = '';
                    if (permission('dealer-edit') && $value->acheived_qty == 0) {
                        $action .= ' <a class="dropdown-item" href="' . route("dealer.yearly.commission.edit", $value->id) . '">' . self::ACTION_BUTTON['Edit'] . '</a>';
                    }
                    if (permission('dealer-view')) {
                        $action .= ' <a class="dropdown-item view_data" data-id="' . $value->id . '">' . self::ACTION_BUTTON['View'] . '</a>';
                    }
                    if ($value->qty <= $value->acheived_qty && $value->is_generated == 0) {
                        $action .= ' <a class="dropdown-item generate-data" data-id="' . $value->id . '" data-dealerId="' . $value->dealer_id . '">' . self::ACTION_BUTTON['Generate'] . '</a>';
                    }
                    $row    = [];
                    $row[]  = $no;
                    $row[]  = $value->dealer->name ?? '';
                    $row[]  = $value->from_date;
                    $row[]  = $value->to_date;
                    $row[]  = $value->qty;
                    $row[]  = $value->acheived_qty;
                    $row[]  = $value->commission_amount;
                    // $row[]  = $value->paid_amount;
                    // $row[]  = $value->due_amount;
                    $row[]  = $value->created_by;
                    $row[]  = action_button($action);
                    $data[] = $row;
                }
                return $this->datatable_draw($request->input('draw'), $this->model->count_all(), $this->model->count_filtered(), $data);
            }
        } else {
            return response()->json($this->unauthorized());
        }
    }
    public function edit($id)
    {
        if (permission('dealer-edit')) {
            $this->setPageData('Edit Dealer Yearly Commission', 'Edit Dealer Yearly Commission', 'far fa-edit', [['name' => 'Edit Dealer Yearly Commission']]);
            $dealer = $this->model->with('dealer:id,name')->find($id);
            if ($dealer) {
                $data = [
                    'dealer'    => $dealer
                ];
                return view('dealer::yearly_target.edit', $data);
            } else {
                return redirect()->back()->with('error', 'No Data Found!');
            }
        } else {
            return $this->access_blocked();
        }
    }
    public function show(Request $request)
    {
        if ($request->ajax()) {
            if (permission('dealer-view')) {
                $dealer   = $this->model->with('dealer')->findOrFail($request->id);
                return view('dealer::yearly_target.view-data', compact('dealer'))->render();
            }
        }
    }
    public function update(CommissionYearlyFormRequest $request, $id)
    {
        if ($request->ajax()) {
            DB::beginTransaction();
            try {
                $data = YearlyTarget::where('id', $id)->update([
                    'dealer_id'         => $request->commission[0]['dealer_id'],
                    'from_date'         => $request->from_date,
                    'to_date'           => $request->to_date,
                    'qty'               => $request->commission[0]['qty'],
                    'commission_amount' => $request->commission[0]['commission_amount'],
                    'updated_at' => date("Y-m-d H:i:s"),
                    'modified_by' => auth()->user()->name,
                ]);
                $output = ['status' => 'success', 'message' => 'Yearly Target Commission Data Updated Successfully'];
                DB::commit();
            } catch (Exception $e) {
                DB::rollBack();
                $output = ['status' => 'error', 'message' => $e->getMessage()];
            }
            return response()->json($output);
        } else {
            $output = ['status' => 'error', 'message' => 'Failed To Update Commission Data'];
            return response()->json($this->unauthorized());
        }
    }
    public function generateCommission(Request $request)
    {
        if ($request->ajax()) {
            DB::beginTransaction();
            try {
                $commissionVoucher = 'COMYEAR-' . date('ymd') . rand(1, 999);
                $dealerCoa = ChartOfAccount::where(['parent_name' => 'Commission Yearly Payable', 'level' => '3', 'dealer_id' => $request->id])->first();
                $dealerYearlyTarget = YearlyTarget::where(['dealer_id' => $request->id, 'id' => $request->targetId])->first();
                $description = "Dealer- " . $dealerCoa->name . " commission generated for year " . $request->year;
                //commissions
                Transaction::create([
                    'chart_of_account_id' => $dealerCoa->id,
                    'voucher_type'        => 'YearlyCommission',
                    'voucher_no'          => $commissionVoucher,
                    'voucher_date'        => date('Y-m-d'),
                    'description'         => $description,
                    'credit'              => $dealerYearlyTarget->commission_amount * $dealerYearlyTarget->acheived_qty,
                    'debit'               => 0,
                    'is_openings'         => 2,
                    'posted'              => 1,
                    'approve'             => 1,
                    'created_by'          => auth()->user()->name,
                    'created_at'          => date('Y-m-d H:i:s')
                ]);

                //current Liability
                Transaction::create([
                    'chart_of_account_id' => 453,
                    'voucher_type'        => 'YearlyCommission',
                    'voucher_no'          => $commissionVoucher,
                    'voucher_date'        => date('Y-m-d'),
                    'description'         => 'Yearly commission Debit for -' . $dealerCoa->name,
                    'credit'              => 0,
                    'debit'               => $dealerYearlyTarget->commission_amount * $dealerYearlyTarget->acheived_qty,
                    'is_openings'         => 2,
                    'posted'              => 1,
                    'approve'             => 1,
                    'created_by'          => auth()->user()->name,
                    'created_at'          => date('Y-m-d H:i:s')
                ]);
                $dealerYearlyTarget->update([
                    'is_generated' => 1
                ]);
                $output = ['status' => 'success', 'message' => 'Dealer Commission Generated Successfully'];
                DB::commit();
            } catch (Exception $e) {
                DB::rollback();
                $output = ['status' => 'error', 'message' => $e->getMessage()];
            }
            return response()->json($output);
        }
    }

    public function dealerCommissionIdex()
    {
        $setTitle = 'Accounts';
        $setSubTitle = 'Dealer Yearly Commission Payment List';
        $this->setPageData($setSubTitle, $setSubTitle, 'far fa-money-bill-alt', [['name' => $setTitle], ['name' => $setSubTitle]]);
        $dealers = DB::table('dealers')->join('chart_of_accounts', 'chart_of_accounts.dealer_id', 'dealers.id')->where(['chart_of_accounts.parent_name' => 'Commission Yearly Payable'])->get(['dealers.*', 'chart_of_accounts.id as dealer_coa_id']);
        return view('account::yearly-commission-payment.index', compact('dealers'));
    }

    public function dealerCommissionCreate()
    {
        $this->setPageData('Dealer Yearly Commission', 'Dealer Yearly Commission', 'far fa-money-bill-alt', [['name' => 'Accounts'], ['name' => 'Dealer Yearly Commission']]);
        $voucher_no = 'COMYEAR-' . date('ymd') . rand(1, 999);
        $dealers = Dealer::where('status', 1)->get();
        return view('account::yearly-commission-payment.create', compact('voucher_no', 'dealers'));
    }

    public function getDealerCommissionDueAmount($dealer_id)
    {
        $dealerCoa = ChartOfAccount::where(['parent_name' => 'Commission Yearly Payable', 'level' => '3', 'dealer_id' => $dealer_id])->first();
        $data = DB::table('dealers as s')
            ->selectRaw('s.id,b.id as coaid,b.code,((select ifnull(sum(credit),0) from transactions where chart_of_account_id= b.id AND approve = 1)-(select ifnull(sum(debit),0) from transactions where chart_of_account_id= b.id AND approve = 1)) as balance')
            ->leftjoin('chart_of_accounts as b', 's.id', '=', 'b.dealer_id')
            ->where('s.id', $dealer_id)
            ->where('b.parent_name', 'Commission Yearly Payable')->where('b.level', '3')->first();
        $balance = 0;
        if ($data) {
            $balance = $data->balance ? $data->balance : 0;
        }
        return $balance;
    }

    public function dealerCommissionPayment(YearlyCommissionPaymentRequest $request)
    {
        if ($request->ajax()) {
            // if(permission('supplier-payment-access')){
            DB::beginTransaction();
            try {
                $dealer = ChartOfAccount::where(['parent_name' => 'Commission Yearly Payable', 'level' => '3', 'dealer_id' => $request->dealer_id])->first();
                $vtype = 'YearlyCommission';
                /****************/
                $dealerDebit = array(
                    'chart_of_account_id' => $dealer->id,
                    'voucher_no'          => $request->voucher_no,
                    'voucher_type'        => $vtype,
                    'voucher_date'        => $request->voucher_date,
                    'description'         => $request->remarks,
                    'debit'               => $request->amount,
                    'credit'              => 0,
                    'posted'              => 1,
                    'approve'             => 1,
                    'created_by'          => auth()->user()->name,
                    'created_at'          => date('Y-m-d H:i:s')
                );
                if ($request->payment_type == 1) {
                    //Cah In Hand For Supplier
                    $payment = array(
                        'chart_of_account_id' => $request->account_id,
                        'voucher_no'          => $request->voucher_no,
                        'voucher_type'        => $vtype,
                        'voucher_date'        => $request->voucher_date,
                        'description'         => 'Paid to ' . $dealer->name,
                        'debit'               => 0,
                        'credit'              => $request->amount,
                        'posted'              => 1,
                        'approve'             => 1,
                        'created_by'          => auth()->user()->name,
                        'created_at'          => date('Y-m-d H:i:s')

                    );
                } else {
                    // Bank Ledger
                    $payment = array(
                        'chart_of_account_id' => $request->account_id,
                        'voucher_no'          => $request->voucher_no,
                        'voucher_type'        => $vtype,
                        'voucher_date'        => $request->voucher_date,
                        'description'         => 'Dealer Commission Payment To ' . $dealer->name,
                        'debit'               => 0,
                        'credit'              => $request->amount,
                        'posted'              => 1,
                        'approve'             => 1,
                        'created_by'          => auth()->user()->name,
                        'created_at'          => date('Y-m-d H:i:s')
                    );
                }

                $dealerTransaction = Transaction::create($dealerDebit);
                $payment_transaction = Transaction::create($payment);
                if ($dealerTransaction && $payment_transaction) {
                    $output = ['status' => 'success', 'message' => 'Payment Data Saved Successfully'];
                } else {
                    $output = ['status' => 'error', 'message' => 'Failed To Save Payment Data'];
                }
                DB::commit();
            } catch (Exception $e) {
                DB::rollBack();
                $output = ['status' => 'error', 'message' => $e->getMessage()];
            }
        } else {
            $output = $this->unauthorized();
        }
        return response()->json($output);
        // }else{
        //     return response()->json($this->unauthorized());
        // }
    }
}
