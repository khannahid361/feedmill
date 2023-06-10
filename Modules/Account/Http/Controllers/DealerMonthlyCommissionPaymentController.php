<?php

namespace Modules\Account\Http\Controllers;

use App\Http\Controllers\BaseController;
use Illuminate\Http\Request;
use Modules\Account\Entities\DealerMonthlyCommissionPayment;
use Modules\Account\Entities\Transaction;

class DealerMonthlyCommissionPaymentController extends BaseController
{
    public function __construct(DealerMonthlyCommissionPayment $model)
    {
        $this->model = $model;
    }
    public function commissionPaymentDatatable(Request $request)
    {
        if ($request->ajax()) {
            if (permission('supplier-payment-access')) {
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
                $no = $request->input('start');
                foreach ($list as $value) {
                    if ($value->debit > 0) {
                        $no++;
                        $action = '';
                        if (permission('supplier-payment-details')) {
                            $action .= ' <a class="dropdown-item" href="' . route('dealer.monthly.commission.payment.show', ['id' => $value->id]) . '">' . self::ACTION_BUTTON['View'] . '</a>';
                        }
                        if (permission('supplier-payment-delete')) {
                            $action .= ' <a class="dropdown-item delete_data"  data-id="' . $value->voucher_no . '" data-name="' . $value->voucher_no . '">' . self::ACTION_BUTTON['Delete'] . '</a>';
                        }
                        $account_head = Transaction::with('coa')->where('voucher_no', $value->voucher_no)->orderBy('id', 'desc')->first();
                        $row    = [];
                        $row[]  = $no;
                        $row[]  = date('d-M-Y', strtotime($value->voucher_date));
                        $row[]  = $value->voucher_no;
                        $row[]  = $value->dealer_name;
                        $row[]  = $account_head ? $account_head->coa->name : '';
                        $row[]  = $value->description;
                        $row[]  = number_format($value->debit, 2);
                        $row[]  = $value->created_by;
                        $row[]  = action_button($action); //custom helper function for action button
                        $data[] = $row;
                    }
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

    public function show(int $id)
    {
        // if(permission('supplier-payment-details')){
        $setTitle = 'Dealer Commission Payment Voucher Print';
        $this->setPageData($setTitle, $setTitle, 'far fa-money-bill-alt', [['name' => $setTitle]]);
        $data = $this->model->with('coa')->find($id);
        return view('account::monthly-commission-payment.print', compact('data'));
        // }else{
        //     return $this->access_blocked();
        // }
    }
    public function delete(Request $request)
    {
        if ($request->ajax()) {
            // if(permission('supplier-payment-delete')){
            try {
                $result  = $this->model->where('voucher_no', $request->id)->delete();
                $output   = $this->delete_message($result);
            } catch (\Throwable $th) {
                $output = ['status' => 'error', 'message' => $th->getMessage()];
            }
            return response()->json($output);
        } else {
            return response()->json($this->unauthorized());
        }
        // }else{
        //     return response()->json($this->unauthorized());
        // }
    }
}
