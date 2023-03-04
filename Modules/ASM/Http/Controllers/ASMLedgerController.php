<?php

namespace Modules\ASM\Http\Controllers;

use App\Http\Controllers\BaseController;
use Illuminate\Http\Request;
use Modules\ASM\Entities\ASM;
use Modules\ASM\Entities\ASMLedger;

class ASMLedgerController extends BaseController {
    public function __construct(ASMLedger $model){
        $this->model = $model;
    }
    public function index(){
        if(permission('asm-ledger')){
            $this->setPageData('ASM Ledger','ASM Ledger','fas fa-file-invoice-dollar',[['name'=>'ASM','link'=>route('asm')],['name'=>'ASM Ledger']]);
            $asms = ASM::with('coa')->where(['status'=>1])->orderBy('name','asc')->get();
            return view('asm::ledger.index',compact('asms'));
        }else{
            return response()->json($this->access_blocked());
        }
    }
    public function getDataTableData(Request $request){
        if($request->ajax() && permission('asm-ledger')){
            if (!empty($request->asm_id)) {
                $this->model->setASMID($request->asm_id);
            }
            if (!empty($request->from_date)) {
                $this->model->setFromDate($request->from_date);
            }
            if (!empty($request->to_date)) {
                $this->model->setToDate($request->to_date);
            }
            $this->set_datatable_default_properties($request);
            $list  = $this->model->getDatatableList();
            $data  = [];
            $debit = $credit = $balance = 0;
            foreach ($list as $value) {
                $debit    += $value->debit;
                $credit   += $value->credit;
                $balance   = $debit - $credit;
                $row       = [];
                $row[]     = $value->voucher_date;
                $row[]     = $value->description;
                $row[]     = $value->voucher_no;
                $row[]     = $value->debit ? number_format($value->debit,2, '.', ',') :  number_format(0,2, '.', ',');
                $row[]     = $value->credit ? number_format($value->credit,2, '.', ',') :  number_format(0,2, '.', ',');
                $row[]     = number_format(($balance),2, '.', ',');
                $data[]    = $row;
            }
            return $this->datatable_draw($request->input('draw'),$this->model->count_all(), $this->model->count_filtered(), $data);
        }else{
            return response()->json($this->access_blocked());
        }
    }
}
