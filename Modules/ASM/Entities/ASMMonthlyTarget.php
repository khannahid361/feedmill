<?php

namespace Modules\ASM\Entities;

use App\Models\BaseModel;
use Illuminate\Support\Facades\DB;

class ASMMonthlyTarget extends BaseModel {
    protected $fillable = ['mtcode','asm_id','target_value','achieved_value','start_date','end_date','closing_date','created_by','modified_by'];
    protected $table    = 'a_s_m_monthly_targets';
    protected $order = ['id' => 'desc'];
    protected $_asm_id;
    protected $_start_date;
    protected $_end_date;
    public function asm(){
        $this->belongsTo(ASM::class,'asm_id','id');
    }
    public function setASMID($asm_id){
        $this->_asm_id = $asm_id;
    }
    public function setStartDate($start_date){
        $this->_start_date = $start_date;
    }
    public function setEndDate($end_date){
        $this->_end_date = $end_date;
    }
    private function getDataTableQuery(){
        $this->column_order = ['id','id','asm_id','target_value','achieved_value','start_date','end_date','created_by',null];
        $query  = self::toBase()->where('start_date','>=',$this->_start_date)->where('end_date','<=',$this->_end_date);;
        if (!empty($this->_salesmen_id)) {
            $query->where('asm_id',  $this->_asm_id);
        }
        if (isset($this->orderValue) && isset($this->dirValue)) {
            $query->orderBy($this->column_order[$this->orderValue], $this->dirValue);
        } else if (isset($this->order)) {
            $query->orderBy(key($this->order), $this->order[key($this->order)]);
        }
        return $query;
    }
    public function getDatatableList(){
        $query = $this->getDataTableQuery();
        if ($this->lengthVlaue != -1) {
            $query->offset($this->startVlaue)->limit($this->lengthVlaue);
        }
        return $query->get();
    }
    public function count_filtered(){
        $query = $this->getDataTableQuery();
        return $query->get()->count();
    }
    public function count_all(){
        return self::toBase()->get()->count();
    }
}
