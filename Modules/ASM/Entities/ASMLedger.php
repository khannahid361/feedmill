<?php

namespace Modules\ASM\Entities;

use App\Models\BaseModel;
use Modules\Account\Entities\ChartOfAccount;

class ASMLedger extends BaseModel {
    protected $fillable = ['chart_of_account_id', 'voucher_no', 'voucher_type', 'voucher_date', 'description', 'debit','credit', 'posted', 'approve', 'created_by', 'modified_by'];
    protected $table = 'transactions';
    protected $order = ['transactions.voucher_date' => 'asc'];
    private const TYPE = 'Account Payable';
    public function coa(){
        return $this->belongsTo(ChartOfAccount::class,'chart_of_account_id','id');
    }
    public function asm(){
        return $this->hasOneThrough(ASM::class,ChartOfAccount::class,'asm_id','chart_of_account_id','id','id');
    }
    protected $asm_id;
    protected $from_date;
    protected $to_date;
    public function setASMID($asm_id){
        $this->asm_id = $asm_id;
    }
    public function setFromDate($from_date){
        $this->from_date = $from_date;
    }
    public function setToDate($to_date){
        $this->to_date = $to_date;
    }
    private function get_datatable_query(){
        $this->column_order = ['transactions.voucher_date','transactions.description', 'transactions.voucher_no','transactions.debit','transactions.credit',null];
        $query = self::select('transactions.*','coa.id as coa_id','coa.code','coa.name','coa.parent_name','asm.id as asm_id','asm.name','asm.phone')
            ->join('chart_of_accounts as coa','transactions.chart_of_account_id','=','coa.id')
            ->join('a_s_ms as asm','coa.asm_id','asm.id')
            ->where(['coa.parent_name'=>self::TYPE,'transactions.approve'=>1]);
        if (!empty($this->asm_id)) {
            $query->where('asm.id', $this->asm_id);
        }
        if (!empty($this->from_date)) {
            $query->where('transactions.voucher_date', '>=',$this->from_date);
        }
        if (!empty($this->to_date)) {
            $query->where('transactions.voucher_date', '<=',$this->to_date);
        }
        if (isset($this->orderValue) && isset($this->dirValue)) {
            $query->orderBy($this->column_order[$this->orderValue], $this->dirValue);
        } else if (isset($this->order)) {
            $query->orderBy(key($this->order), $this->order[key($this->order)]);
        }
        return $query;
    }
    public function getDatatableList(){
        $query = $this->get_datatable_query();
        if ($this->lengthVlaue != -1) {
            $query->offset($this->startVlaue)->limit($this->lengthVlaue);
        }
        return $query->get();
    }
    public function count_filtered(){
        $query = $this->get_datatable_query();
        return $query->get()->count();
    }
    public function count_all(){
        return self::select('transactions.*','coa.id as coa_id','coa.code','coa.name','coa.parent_name','asm.id as salesmen_id','asm.name','asm.phone')
                    ->join('chart_of_accounts as coa','transactions.chart_of_account_id','=','coa.id')
                    ->join('a_s_ms as asm','coa.asm_id','asm.id')
                    ->where(['coa.parent_name'=>self::TYPE,'transactions.approve'=>1])->get()->count();
    }
}
