<?php

namespace Modules\Account\Http\Controllers;

use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Modules\Setting\Entities\Warehouse;
use App\Http\Controllers\BaseController;
use Modules\Account\Entities\Transaction;
use Modules\Account\Entities\ContraVoucher;
use Modules\Account\Entities\ChartOfAccount;
use Modules\Account\Http\Requests\ContraVoucherFormRequest;

class ContraVoucherController extends BaseController
{
    private const VOUCHER_PREFIX = 'CONTRAV';
    public function __construct(ContraVoucher $model){
        $this->model = $model;
    }
    public function index(){
        if(permission('contra-voucher-access')){
            $this->setPageData('Contra Voucher List','Contra Voucher List','far fa-money-bill-alt',[['name'=>'Accounts'],['name'=>'Contra Voucher List']]);
            return view('account::contra-voucher.list');
        }else{
            return $this->access_blocked();
        }
    }
    public function get_datatable_data(Request $request){
        if($request->ajax()){
            if(permission('contra-voucher-access')){
                if (!empty($request->start_date)) {
                    $this->model->setStartDate($request->start_date);
                }
                if (!empty($request->end_date)) {
                    $this->model->setEndDate($request->end_date);
                }
                if (!empty($request->voucher_no)) {
                    $this->model->setVoucherNo($request->voucher_no);
                }
                $this->set_datatable_default_properties($request);
                $list = $this->model->getDatatableList();
                $data = [];
                $no = $request->input('start');
                foreach ($list as $value) {
                    $no++;
                    $action = '';
                    if(permission('contra-voucher-view')){
                        $action .= ' <a class="dropdown-item view_data" data-id="' . $value->voucher_no . '" data-name="' . $value->voucher_no . '">'.self::ACTION_BUTTON['View'].'</a>';
                    }
                    if(permission('contra-voucher-delete') && $value->approve != 1){
                        $action .= ' <a class="dropdown-item delete_data"  data-id="' . $value->voucher_no . '" data-name="' . $value->voucher_no . '">'.self::ACTION_BUTTON['Delete'].'</a>';
                    }
                    $row    = [];
                    $row[]  = $no;
                    $row[]  = $value->voucher_no;
                    $row[]  = $value->voucher_date;
                    $row[]  = $value->description;
                    $row[]  = number_format($value->debit,2);
                    $row[]  = number_format($value->credit,2);
                    $row[]  = VOUCHER_APPROVE_STATUS_LABEL[$value->approve];
                    $row[]  = $value->created_by;
                    $row[]  = action_button($action);
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
        if(permission('contra-voucher-add')){
            $this->setPageData('Contra Voucher','Contra Voucher','far fa-money-bill-alt',[['name'=>'Accounts'],['name'=>'Contra Voucher']]);
            $data = [
                'voucher_no'             => self::VOUCHER_PREFIX.'-'.date('ymd').rand(1,999),
                'transactional_accounts' => ChartOfAccount::whereIn('parent_name' , ['Cash At Mobile Bank','Cash At Bank','Cash & Cash Equivalent'])->where(['transaction' => 1 , 'status' => 1])->orderBy('id','asc')->get(),
            ];
            return view('account::contra-voucher.create',$data);
        }else{
            return $this->access_blocked();
        }
    }
    public function store(ContraVoucherFormRequest $request){
        if($request->ajax() && permission('contra-voucher-add')){
            DB::beginTransaction();
            try {
                $contraVoucherTransaction = [];
                if($request->has('contraAccount')){
                    foreach ($request->contraAccount as $value){
                        if($value['debitId'] != null && $value['debitAmount'] != null && $value['creditId'] != null && $value['creditAmount'] !=null){
                            $chartOfAccountId = $value['debitId'] == 0 ? $value['creditId'] : $value['debitId'] ;
                            $contraVoucherTransaction[] = [
                                'chart_of_account_id'   => $chartOfAccountId,
                                'voucher_no'            => $request->voucher_no,
                                'voucher_type'          => self::VOUCHER_PREFIX,
                                'voucher_date'          => $request->voucher_date,
                                'description'           => $request->remarks,
                                'debit'                 => $value['debitAmount'] ? $value['debitAmount'] : 0,
                                'credit'                => $value['creditAmount'] ? $value['creditAmount'] : 0,
                                'posted'                => 1,
                                'approve'               => 3,
                                'created_by'            => auth()->user()->name,
                                'created_at'            => date('Y-m-d H:i:s')
                            ];
                        }
                    }
                }
                $this->model->insert($contraVoucherTransaction);
                $output = ['status' => 'success' , 'message' => $this->responseMessage('Data Saved')];
                DB::commit();
            }catch (Exception $e){
                DB::rollBack();
                $output = ['status' => 'error','message' => $e->getMessage()];
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }
    public function show(Request $request){
        if($request->ajax()){
            if(permission('contra-voucher-view')){
                $voucher = $this->model->with('coa')->where('voucher_no',$request->id)->get();
                return view('account::contra-voucher.view-modal-data',compact('voucher'))->render();
            }
        }
    }
    public function update(ContraVoucherFormRequest $request){
        if($request->ajax() && permission('contra-voucher-add')){
            DB::beginTransaction();
            try {
                Transaction::where('voucher_no',$request->voucher_no)->delete();
                $contraVoucherTransaction = [];
                if($request->has('contraAccount')){
                    foreach ($request->contraAccount as $value){
                        if($value['debitId'] != null && $value['debitAmount'] != null && $value['creditId'] != null && $value['creditAmount'] !=null){
                            $chartOfAccountId = $value['debitId'] == 0 ? $value['creditId'] : $value['debitId'] ;
                            $contraVoucherTransaction[] = [
                                'chart_of_account_id'   => $chartOfAccountId,
                                'voucher_no'            => $request->voucher_no,
                                'voucher_type'          => self::VOUCHER_PREFIX,
                                'voucher_date'          => $request->voucher_date,
                                'description'           => $request->remarks,
                                'debit'                 => $value['debitAmount'] ? $value['debitAmount'] : 0,
                                'credit'                => $value['creditAmount'] ? $value['creditAmount'] : 0,
                                'posted'                => 1,
                                'approve'               => 3,
                                'created_by'            => auth()->user()->name,
                                'created_at'            => date('Y-m-d H:i:s')
                            ];
                        }
                    }
                }
                $this->model->insert($contraVoucherTransaction);
                $output = ['status' => 'success' , 'message' => $this->responseMessage('Data Update')];
                DB::commit();
            } catch (Exception $e) {
                DB::rollBack();
                $output = ['status' => 'error','message' => $e->getMessage()];
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }
}
