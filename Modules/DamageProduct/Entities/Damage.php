<?php

namespace Modules\DamageProduct\Entities;

use App\Models\BaseModel;
use Modules\Sale\Entities\Sale;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;
use Modules\Customer\Entities\Customer;
use Modules\Setting\Entities\Warehouse;
use Modules\DamageProduct\Entities\DamageProduct;

class Damage extends BaseModel{
     protected $fillable = ['damage_no', 'memo_no', 'warehouse_id', 'customer_id', 'total_price', 'total_deduction', 'tax_rate', 'total_tax', 'grand_total','deducted_sr_commission', 'reason', 'date', 'damage_date', 'created_by', 'modified_by'];
     public function sale(){
         return $this->belongsTo(Sale::class,'memo_no','memo_no');
     }
     public function warehouse(){
        return $this->belongsTo(Warehouse::class,'warehouse_id','id');
     }
     public function customer(){
         return $this->belongsTo(Customer::class,'customer_id','id')->withDefault(['name'=>'','company_name'=>'','mobile'=>'']);
     }
     public function damage_products(){
        return $this->hasMany(DamageProduct::class,'damage_id','id');
     }
     protected $order = ['dm.id' => 'desc'];
     protected $_damage_no;
     protected $_memo_no;
     protected $_start_date;
     protected $_end_date;
     protected $_salesmen_id;
     protected $_customer_id;
     public function setDamageNo($damage_no){ $this->_damage_no = $damage_no; }
     public function setMemoNo($memo_no){ $this->_memo_no = $memo_no;}
     public function setStartDate($from_date){ $this->_from_date = $from_date; }
     public function setEndDate($end_date){ $this->_end_date = $end_date; }
     public function setSalesmenID($salesmen_id){ $this->_salesmen_id = $salesmen_id; }
     public function setCustomerID($customer_id){ $this->_customer_id = $customer_id; }
     private function get_datatable_query(){
        $this->column_order = ['dm.id','dm.damage_no','dm.memo_no', 'dm.customer_id'/*, 's.salemen_id'*/,'dm.damage_date', 'dm.total_deduction','dm.grand_total', null];
        $query = DB::table('damages as dm')
        ->leftjoin('sales as s','dm.memo_no','=','s.memo_no')
        ->leftJoin('customers as c','dm.customer_id','=','c.id')
        ->select('dm.*','c.name as customer_name','c.shop_name',
        DB::raw('(SELECT SUM(srp.damage_qty) FROM damage_products as srp WHERE srp.damage_id = dm.id GROUP BY srp.damage_id) as total_damage_qty'),
        DB::raw('(SELECT COUNT(srp.id) FROM damage_products as srp WHERE srp.damage_id = dm.id GROUP BY srp.damage_id) as total_damage_items'));
         if (!empty($this->_damage_no)) {
             $query->where('dm.damage_no', 'like', '%' . $this->_damage_no . '%');
         }
         if (!empty($this->_memo_no)) {
             $query->where('dm.memo_no', 'like', '%' . $this->_memo_no . '%');
         }
         if (!empty($this->_start_date)) {
             $query->where('dm.damage_date', '>=',$this->_start_date);
         }
         if (!empty($this->_end_date)) {
             $query->where('dm.damage_date', '<=',$this->_end_date);
         }
         if (!empty($this->_salesmen_id)) {
            $query->where('s.salesmen_id', $this->_salesmen_id);
         }
         if (!empty($this->_customer_id)) {
            $query->where('dm.customer_id', $this->_customer_id);
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
         return DB::table('damages')->get()->count();
     }
}
