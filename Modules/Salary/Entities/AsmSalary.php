<?php

namespace Modules\Salary\Entities;

use App\Models\BaseModel;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Support\Facades\DB;
use Modules\Setting\Entities\Warehouse;

class AsmSalary extends BaseModel {
    protected $fillable = [ 'warehouse_id','district_id','upazila_id','avatar','name','username','email','phone','password','salary','status','created_by','modified_by'];
    protected $table    = 'a_s_ms';
    protected $order    = ['s.id' => 'DESC'];
    protected $_salarytable_id;
    public function asmSalary(){
        return $this->morphMany(Salary::class,'salarytable');
    }
    public function warehouse(){
        return $this->belongsTo(Warehouse::class,'warehouse_id','id');
    }
    public function setAsmID($salarytable_id){
        $this->_salarytable_id = $salarytable_id;
    }
    private function get_datatable_query(){
        $this->column_order = ['name', 'username', 'phone','additional_phone','email', 'avatar', 'password','salary', 'warehouse_id','asm_id', 'district_id', 'upazila_id','status', 'created_by', 'modified_by',null];
        $query              = DB::table('salaries as s')
                              ->join('a_s_ms as asm','s.salarytable_id','=','asm.id')
                              ->join('warehouses as w','asm.warehouse_id','=','w.id')
                              ->where('s.type','=','asm');
        if($this->_salarytable_id != 0){
            $query->where('s.salarytable_id',$this->_salarytable_id);
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
        return DB::table('salaries as s')
               ->join('a_s_ms as asm','s.salarytable_id','=','asm.id')
               ->join('warehouses as w','asm.warehouse_id','=','w.id')
               ->where('s.type','=','asm')
               ->get()->count();
    }
}
