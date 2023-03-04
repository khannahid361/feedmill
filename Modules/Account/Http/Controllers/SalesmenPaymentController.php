<?php

namespace Modules\Account\Http\Controllers;

use Exception;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\DB;
use Modules\Account\Entities\SalesMenPayment;
use Modules\ASM\Entities\ASM;
use Modules\SalesMen\Entities\Salesmen;
use App\Http\Controllers\BaseController;
use Modules\Account\Entities\Transaction;
use Modules\Account\Http\Requests\SalesmenPaymentFormRequest;

class SalesmenPaymentController extends BaseController{
    public function __construct(SalesMenPayment $model){
        $this->model = $model;
    }
    public function index(){
        if(permission('salesmen-payment-access')){
            $setTitle = 'Accounts';
            $setSubTitle = 'Sale\'s Men Payment List';
            $this->setPageData($setSubTitle,$setSubTitle,'far fa-money-bill-alt',[['name'=>$setTitle ],['name'=>$setSubTitle]]);
            $sr   = Salesmen::with('coa')->get();
            $asm  = ASM::with('coa')->get();
            $salesmens = $sr->concat($asm);
            return view('account::salesmen-payment.index',compact('salesmens'));
        }else{
            return $this->access_blocked();
        }
    }
    public function get_datatable_data(Request $request){
        if($request->ajax()){
            if(permission('salesmen-payment-access')){
                if (!empty($request->start_date)) {
                    $this->model->setStartDate($request->start_date);
                }
                if (!empty($request->end_date)) {
                    $this->model->setEndDate($request->end_date);
                }
                if (!empty($request->salesmen_coa_id)) {
                    $this->model->setSalesMenCOAID($request->salesmen_coa_id);
                }
                $this->set_datatable_default_properties($request);//set datatable default properties
                $list = $this->model->getDatatableList();//get table data
                $data = [];
                $no = $request->input('start');
                foreach ($list as $value) {
                    $no++;
                    $action = '';
                    if(permission('salesmen-payment-details')){
                        $action .= ' <a class="dropdown-item" href="'.route('salesmen.payment.show',['id' => $value->id]).'">'.self::ACTION_BUTTON['View'].'</a>';
                    }
                    if(permission('salesmen-payment-delete')){
                        $action .= ' <a class="dropdown-item delete_data"  data-id="' . $value->voucher_no . '" data-name="' . $value->voucher_no . '">'.self::ACTION_BUTTON['Delete'].'</a>';
                    }
                    $account_head = Transaction::with('coa')->where('voucher_no',$value->voucher_no)->orderBy('id','desc')->first();
                    $row    = [];
                    $row[]  = $no;
                    $row[]  = date('d-M-Y',strtotime($value->voucher_date));
                    $row[]  = $value->voucher_no;
                    $row[]  = $value->salesmen_name;
                    $row[]  = $account_head ? $account_head->coa->name : '';
                    $row[]  = $value->description;
                    $row[]  = number_format($value->debit,2);
                    $row[]  = $value->created_by;
                    $row[]  = action_button($action);//custom helper function for action button
                    $data[] = $row;
                }
                return $this->datatable_draw($request->input('draw'),$this->model->count_all(),
                    $this->model->count_filtered(), $data);
            }
        }else{
            return response()->json($this->unauthorized());
        }
    }
    public function create(){
        if(permission('salesmen-payment-add')){
            $this->setPageData('Salesman Payment','Salesman Payment','far fa-money-bill-alt',[['name'=>'Accounts'],['name'=>'Salesman Payment']]);
            $voucher_no = 'SPM-'.date('ymd').rand(1,999);
            $salesmen = DB::table('salesmen')->where([['status',1]])->select('name','id','phone')->get() ;
            return view('account::salesmen-payment.create',compact('voucher_no','salesmen'));
        }else{
            return $this->access_blocked();
        }
    }
    public function store(SalesmenPaymentFormRequest $request){
        if($request->ajax()){
            if(permission('salesmen-payment-access')){
                DB::beginTransaction();
                try {
                    $salesmen = Salesmen::with('coa')->find($request->salesmen_id);
                    $vtype = 'SPM';
                    $salesmendebit = array(
                        'chart_of_account_id' => $salesmen->coa->id,
                        'warehouse_id'        => 1,
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
                    if($request->payment_type == 1){
                        //Cah In Hand For Salesmen
                        $payment = array(
                            'chart_of_account_id' => $request->account_id,
                            'warehouse_id'        => 1,
                            'voucher_no'          => $request->voucher_no,
                            'voucher_type'        => $vtype,
                            'voucher_date'        => $request->voucher_date,
                            'description'         => 'Paid to ' . $salesmen->name,
                            'debit'               => 0,
                            'credit'              => $request->amount,
                            'posted'              => 1,
                            'approve'             => 1,
                            'created_by'          => auth()->user()->name,
                            'created_at'          => date('Y-m-d H:i:s')

                        );
                    }else{
                        // Bank Ledger
                        $payment = array(
                            'chart_of_account_id' => $request->account_id,
                            'warehouse_id'        => 1,
                            'voucher_no'          => $request->voucher_no,
                            'voucher_type'        => $vtype,
                            'voucher_date'        => $request->voucher_date,
                            'description'         => 'Salesmen Payment To ' . $salesmen->name,
                            'debit'               => 0,
                            'credit'              => $request->amount,
                            'posted'              => 1,
                            'approve'             => 1,
                            'created_by'          => auth()->user()->name,
                            'created_at'          => date('Y-m-d H:i:s')
                        );
                    }

                    $salesmen_transaction = $this->model->create($salesmendebit);
                    $payment_transaction = $this->model->create($payment);
                    if($salesmen_transaction && $payment_transaction){
                        $output = ['status'=>'success','message' => 'Payment Data Saved Successfully'];
                        $output['salesmen_transaction'] = $salesmen_transaction->id;
                    }else{
                        $output = ['status'=>'error','message' => 'Failed To Save Payment Data'];
                    }
                    DB::commit();
                } catch (Exception $e) {
                    DB::rollBack();
                    $output = ['status' => 'error','message' => $e->getMessage()];
                }
            }else{
                $output = $this->unauthorized();
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }
    public function delete(Request $request){
        if($request->ajax()){
            if(permission('salesmen-payment-delete')){
                try {
                    $result  = $this->model->where('voucher_no',$request->id)->delete();
                    $output   = $this->delete_message($result);
                } catch (\Throwable $th) {
                    $output = ['status' => 'error','message' => $th->getMessage()];
                }
                return response()->json($output);
            }else{
                return response()->json($this->unauthorized());
            }
        }else{
            return response()->json($this->unauthorized());
        }
    }
    public function show(int $id){
        if(permission('salesmen-payment-details')){
            $this->setPageData('Salesmen Payment Voucher Print','Salesmen Payment Voucher Print','far fa-money-bill-alt',[['name'=>'Salesmen Payment Voucher Print']]);
            $data = $this->model->with('coa')->find($id);
            return view('account::salesmen-payment.print',compact('data'));
        }else{
            return $this->access_blocked();
        }
    }
}
