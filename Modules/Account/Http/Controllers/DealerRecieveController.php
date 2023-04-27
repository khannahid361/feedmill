<?php

namespace Modules\Account\Http\Controllers;

use App\Http\Controllers\BaseController;
use Exception;
use Modules\Customer\Entities\Customer;
use Modules\Setting\Entities\Warehouse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Modules\Account\Entities\CustomerReceive;
use Modules\Account\Entities\DealerRecieve;
use Modules\Dealer\Entities\Dealer;

class DealerRecieveController extends BaseController
{
    public function __construct(DealerRecieve $model)
    {
        $this->model = $model;
    }
    public function index()
    {
        if (permission('customer-receive-access')) {
            $setTitle    = 'Accounts';
            $setSubTitle = 'Dealer Receive';
            $this->setPageData($setSubTitle, $setSubTitle, 'far fa-money-bill-alt', [['name' => $setTitle], ['name' => $setSubTitle]]);
            $dealers = Dealer::with('coa')->get();
            return view('account::dealer-receive.index', compact('dealers'));
        } else {
            return $this->access_blocked();
        }
    }
    public function get_datatable_data(Request $request)
    {
        if ($request->ajax()) {
            if (permission('customer-receive-access')) {
                if (!empty($request->start_date)) {
                    $this->model->setStartDate($request->start_date);
                }
                if (!empty($request->end_date)) {
                    $this->model->setEndDate($request->end_date);
                }
                // if (!empty($request->customer_coa_id)) {
                //     $this->model->setDealerCOAID($request->customer_coa_id);
                // }
                $this->set_datatable_default_properties($request);
                $list = $this->model->getDatatableList();
                $data = [];
                $no = $request->input('start');
                foreach ($list as $value) {
                    $no++;
                    $action = '';
                    if (permission('customer-receive-details')) {
                        $action .= ' <a class="dropdown-item" href="' . route('dealer.receive.show', ['id' => $value->id]) . '">' . self::ACTION_BUTTON['View'] . '</a>';
                    }
                    if (permission('customer-receive-delete')) {
                        $action .= ' <a class="dropdown-item delete_data"  data-id="' . $value->voucher_no . '" data-name="' . $value->voucher_no . '">' . self::ACTION_BUTTON['Delete'] . '</a>';
                    }
                    $row    = [];
                    $row[]  = $no;
                    $row[]  = Warehouse::find($value->warehouse_id)->name;
                    $row[]  = $value->customer_name;
                    $row[]  = $value->voucher_no;
                    $row[]  = date('d-M-Y', strtotime($value->voucher_date));
                    $row[]  = $value->credit;
                    $row[]  = $value->description;
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
    public function create()
    {
        if (permission('customer-receive-access')) {
            $this->setPageData('Dealer Receive', 'Dealer Receive', 'far fa-money-bill-alt', [['name' => 'Accounts'], ['name' => 'Dealer Receive']]);
            $voucher_no = 'DR-' . date('ymd') . rand(1, 999);
            $warehouses = DB::table('warehouses')->where('status', 1)->pluck('name', 'id');
            return view('account::dealer-receive.create', compact('voucher_no', 'warehouses'));
        } else {
            return $this->access_blocked();
        }
    }
    public function store(Request $request)
    {
        if ($request->ajax()) {
            if (permission('customer-receive-access')) {
                DB::beginTransaction();
                try {
                    $dealer = Dealer::with('coa')->find($request->dealer_id);
                    $dealerCredit = array(
                        'chart_of_account_id' => $dealer->coa->id,
                        'warehouse_id'        => $request->warehouse_id,
                        'voucher_no'          => $request->voucher_no,
                        'voucher_type'        => 'DR',
                        'voucher_date'        => $request->voucher_date,
                        'description'         => $request->remarks,
                        'debit'               => 0,
                        'credit'              => $request->amount,
                        'posted'              => 1,
                        'approve'             => 1,
                        'created_by'          => auth()->user()->name,
                        'created_at'          => date('Y-m-d H:i:s')
                    );
                    if ($request->payment_type == 1) {
                        $payment = array(
                            'chart_of_account_id' => $request->account_id,
                            'warehouse_id'        => $request->warehouse_id,
                            'voucher_no'          => $request->voucher_no,
                            'voucher_type'        => 'DR',
                            'voucher_date'        => $request->voucher_date,
                            'description'         => 'Cash In Hand For ' . $dealer->name,
                            'debit'               => $request->amount,
                            'credit'              => 0,
                            'posted'              => 1,
                            'approve'             => 1,
                            'created_by'          => auth()->user()->name,
                            'created_at'          => date('Y-m-d H:i:s')
                        );
                    } else {
                        $payment = array(
                            'chart_of_account_id' => $request->account_id,
                            'warehouse_id'        => $request->warehouse_id,
                            'voucher_no'          => $request->voucher_no,
                            'voucher_type'        => 'DR',
                            'voucher_date'        => $request->voucher_date,
                            'description'         => 'Dealer Receive From ' . $dealer->name,
                            'debit'               => $request->amount,
                            'credit'              => 0,
                            'posted'              => 1,
                            'approve'             => 1,
                            'created_by'          => auth()->user()->name,
                            'created_at'          => date('Y-m-d H:i:s')
                        );
                    }
                    $dealerTransaction = $this->model->create($dealerCredit);
                    $payment_transaction  = $this->model->create($payment);
                    if ($dealerTransaction && $payment_transaction) {
                        $output = ['status' => 'success', 'message' => 'Payment Data Saved Successfully'];
                        $output['dealer_transaction'] = $dealerTransaction->id;
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
        } else {
            return response()->json($this->unauthorized());
        }
    }
    public function show(int $id)
    {
        if (permission('customer-receive-details')) {
            $setTitle = 'Dealer Receive Voucher Print';
            $this->setPageData($setTitle, $setTitle, 'far fa-money-bill-alt', [['name' => $setTitle]]);
            $data = $this->model->with('coa')->find($id);
            return view('account::dealer-receive.print', compact('data'));
        } else {
            return $this->access_blocked();
        }
    }
    public function delete(Request $request)
    {
        if ($request->ajax() && permission('customer-receive-delete')) {
            DB::beginTransaction();
            try {
                $this->model->where('voucher_no', $request->id)->delete();
                $output = ['status' => 'success', 'message' => 'Data Deleted Successfully'];
                DB::commit();
            } catch (Exception $e) {
                DB::rollBack();
                $output = ['status' => 'error', 'message' => $e->getMessage()];
            }
            return response()->json($output);
        } else {
            return response()->json($this->unauthorized());
        }
    }
}
