<?php

namespace Modules\Dealer\Http\Controllers;

use App\Http\Controllers\BaseController;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Modules\Account\Entities\ChartOfAccount;
use Modules\Account\Entities\Transaction;
use Modules\Dealer\Entities\Dealer;
use Modules\Dealer\Entities\MonthlyTarget;
use Modules\Dealer\Http\Requests\CommissionMonthlyFormRequest;

class MonthlyTargetController extends BaseController
{
    public function __construct(MonthlyTarget $model)
    {
        $this->model = $model;
    }
    public function index()
    {
        $this->setPageData('Manage Dealer Monthly Commission', 'Manage Dealer Monthly Commission', 'fas fa-money-check-alt', [['name' => 'Manage Dealer Monthly Commission']]);
        $data = [
            'dealers'  => Dealer::orderBy('id', 'DESC')->get()
        ];
        return view('dealer::monthly_target.index', $data);
    }

    public function create()
    {
        $this->setPageData('Add Dealer Monthly Commission', 'Add Dealer Monthly Commission', 'far fa-edit', [['name' => 'Add Dealer Monthly Commission']]);
        $data = [
            'dealers'  => Dealer::orderBy('id', 'DESC')->get()
        ];
        return view('dealer::monthly_target.create', $data);
    }

    public function store(CommissionMonthlyFormRequest $request)
    {
        if ($request->ajax()) {
            DB::beginTransaction();
            try {
                $collection = [];
                if ($request->has('commission')) {

                    foreach ($request->commission as $com) {

                        if (!empty($com['dealer_id']) && !empty($com['qty']) && !empty($com['commission_amount'])) {
                            $existing = MonthlyTarget::where(['dealer_id' => $com['dealer_id'], 'month' => $request->month, 'year' => $request->year])->first();
                            if (!empty($existing) && $existing->acheived_qty == 0) {
                                $existing->delete();
                            }
                            if (empty($existing) || $existing->acheived_qty == 0) {
                                $collection[] = [
                                    'dealer_id'         => $com['dealer_id'],
                                    'year'              => $request->year,
                                    'month'             => $request->month,
                                    'qty'               => $com['qty'],
                                    'commission_amount' => $com['commission_amount'],
                                    'created_at' => date("Y-m-d H:i:s"),
                                    'created_by' => auth()->user()->name,
                                    'modified_by' => auth()->user()->name,
                                ];
                            }
                        }
                    }
                }
                $data = MonthlyTarget::insert($collection);
                $output = ['status' => 'success', 'message' => 'Monthly Target Commission Data Saved Successfully'];
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
                if (!empty($request->month)) {
                    $this->model->month($request->month);
                }
                if (!empty($request->year)) {
                    $this->model->year($request->year);
                }
                $this->set_datatable_default_properties($request);
                $list = $this->model->getDatatableList();
                $data = [];
                $no = $request->input('start');
                foreach ($list as $value) {
                    $no++;
                    $action = '';
                    if (permission('dealer-edit') && $value->acheived_qty == 0) {
                        $action .= ' <a class="dropdown-item" href="' . route("dealer.monthly.commission.edit", $value->id) . '">' . self::ACTION_BUTTON['Edit'] . '</a>';
                    }
                    if (permission('dealer-view')) {
                        $action .= ' <a class="dropdown-item view_data" data-id="' . $value->id . '">' . self::ACTION_BUTTON['View'] . '</a>';
                    }
                    if ($value->qty <= $value->acheived_qty && $value->is_generated == 0) {
                        $action .= ' <a class="dropdown-item view_data" data-id="' . $value->id . '">' . self::ACTION_BUTTON['Generate'] . '</a>';
                    }
                    if ($value->month == 1) {
                        $mnth = "January";
                    }
                    if ($value->month == 2) {
                        $mnth = "February";
                    }
                    if ($value->month == 3) {
                        $mnth = "March";
                    }
                    if ($value->month == 4) {
                        $mnth = "April";
                    }
                    if ($value->month == 5) {
                        $mnth = "May";
                    }
                    if ($value->month == 6) {
                        $mnth = "June";
                    }
                    if ($value->month == 7) {
                        $mnth = "July";
                    }
                    if ($value->month == 8) {
                        $mnth = "August";
                    }
                    if ($value->month == 9) {
                        $mnth = "September";
                    }
                    if ($value->month == 10) {
                        $mnth = "October";
                    }
                    if ($value->month == 11) {
                        $mnth = "November";
                    }
                    if ($value->month == 12) {
                        $mnth = "December";
                    }
                    $row    = [];
                    $row[]  = $no;
                    $row[]  = $value->dealer->name ?? '';
                    $row[]  = $value->year;
                    $row[]  = $mnth;
                    $row[]  = $value->qty;
                    $row[]  = $value->acheived_qty;
                    $row[]  = $value->commission_amount;
                    $row[]  = $value->paid_amount;
                    $row[]  = $value->due_amount;
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
            $this->setPageData('Edit Dealer Monthly Commission', 'Edit Dealer Monthly Commission', 'far fa-edit', [['name' => 'Edit Dealer Monthly Commission']]);
            $dealer = $this->model->with('dealer:id,name')->find($id);
            if ($dealer) {
                $data = [
                    'dealer'    => $dealer
                ];
                return view('dealer::monthly_target.edit', $data);
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
                return view('dealer::monthly_target.view-data', compact('dealer'))->render();
            }
        }
    }
    public function update(CommissionMonthlyFormRequest $request, $id)
    {
        if ($request->ajax()) {
            DB::beginTransaction();
            try {
                $data = MonthlyTarget::where('id', $id)->update([
                    'dealer_id'         => $request->commission[0]['dealer_id'],
                    'year'              => $request->year,
                    'month'             => $request->month,
                    'qty'               => $request->commission[0]['qty'],
                    'commission_amount' => $request->commission[0]['commission_amount'],
                    'updated_at' => date("Y-m-d H:i:s"),
                    'modified_by' => auth()->user()->name,
                ]);
                $output = ['status' => 'success', 'message' => 'Monthly Target Commission Data Updated Successfully'];
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

    public function generateMonthlyCommission(Request $request)
    {
        //3 ta transaction dhukbe , Liability , current liability ar dealer agains a transaction
        $commissionVoucher = 'COM-' . date('ymd') . rand(1, 999);
        if ($request->month == 1) {
            $mnth = "January";
        }
        if ($request->month == 2) {
            $mnth = "February";
        }
        if ($request->month == 3) {
            $mnth = "March";
        }
        if ($request->month == 4) {
            $mnth = "April";
        }
        if ($request->month == 5) {
            $mnth = "May";
        }
        if ($request->month == 6) {
            $mnth = "June";
        }
        if ($request->month == 7) {
            $mnth = "July";
        }
        if ($request->month == 8) {
            $mnth = "August";
        }
        if ($request->month == 9) {
            $mnth = "September";
        }
        if ($request->month == 10) {
            $mnth = "October";
        }
        if ($request->month == 11) {
            $mnth = "November";
        }
        if ($request->month == 12) {
            $mnth = "December";
        }
        $dealerCoa = ChartOfAccount::where(['parent_name' => 'Commission Monthly Payable', 'level' => '3', 'dealer_id' => $request->id])->first();
        $description = "Dealer- " . $dealerCoa->name . " commission generated for the month of " . $mnth . " and year " . $request->year;
        dd($dealerCoa);
        Transaction::create([
            'chart_of_account_id' => $dealerCoa->id,
            'voucher_no' => 'Monthly Commission',
            'voucher_date' => date('Y-m-d'),
            'description' => $description,
            // 'debit' => $
        ]);
    }

    public function dealerMonthlyCommissionIdex()
    {
        $setTitle = 'Accounts';
        $setSubTitle = 'Dealer Commission Payment List';
        $this->setPageData($setSubTitle, $setSubTitle, 'far fa-money-bill-alt', [['name' => $setTitle], ['name' => $setSubTitle]]);
        $dealers = DB::table('dealers')->join('chart_of_accounts', 'chart_of_accounts.dealer_id', 'dealers.id')->where(['chart_of_accounts.parent_name' => 'Commission Monthly Payable'])->get(['dealers.*', 'chart_of_accounts.id as dealer_coa_id']);
        // dd($dealers);
        return view('account::monthly-commission-payment.index', compact('dealers'));
    }

    public function dealerMonthlyCommissionCreate()
    {
        $this->setPageData('Supplier Payment', 'Supplier Payment', 'far fa-money-bill-alt', [['name' => 'Accounts'], ['name' => 'Supplier Payment']]);
        $voucher_no = 'COM-' . date('ymd') . rand(1, 999);
        $dealers = Dealer::where('status', 1)->get();
        return view('account::monthly-commission-payment.create', compact('voucher_no', 'dealers'));
    }
}
