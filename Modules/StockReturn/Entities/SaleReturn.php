<?php

namespace Modules\StockReturn\Entities;

use App\Models\BaseModel;
use Modules\Sale\Entities\Sale;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;
use Modules\Customer\Entities\Customer;
use Modules\Setting\Entities\Warehouse;
use Modules\StockReturn\Entities\SaleReturnProduct;

class SaleReturn extends BaseModel{
     protected $fillable = ['return_no', 'memo_no', 'warehouse_id', 'customer_id', 'total_price', 'total_deduction', 'tax_rate', 'total_tax', 'grand_total','deducted_sr_commission', 'reason', 'date', 'return_date', 'created_by', 'modified_by'];
     public function sale(){
         return $this->belongsTo(Sale::class,'memo_no','memo_no');
     }
     public function warehouse(){
        return $this->belongsTo(Warehouse::class,'warehouse_id','id');
     }
     public function customer(){
         return $this->belongsTo(Customer::class,'customer_id','id')->withDefault(['name'=>'','company_name'=>'','mobile'=>'']);
     }
     public function return_products(){
        return $this->hasMany(SaleReturnProduct::class,'sale_return_id','id');
     }
    protected $order = ['sr.id' => 'desc'];
     protected $_return_no;
     protected $_memo_no;
     protected $_start_date;
     protected $_end_date;
     protected $_salesmen_id;
     protected $_customer_id;
     public function setReturnNo($return_no){ $this->_return_no = $return_no; }
     public function setMemoNo($memo_no){ $this->_memo_no = $memo_no;}
     public function setStartDate($from_date){ $this->_from_date = $from_date; }
     public function setEndDate($end_date){ $this->_end_date = $end_date; }
     public function setSalesmenID($salesmen_id){ $this->_salesmen_id = $salesmen_id; }
     public function setCustomerID($customer_id){ $this->_customer_id = $customer_id; }
     private function get_datatable_query(){
        $this->column_order = ['sr.id','sr.return_no','sr.memo_no', 'sr.customer_id', 's.salemen_id','sr.return_date', 'sr.total_deduction','sr.grand_total', null];
        $query = DB::table('sale_returns as sr')
        ->leftjoin('sales as s','sr.memo_no','=','s.memo_no')
        ->leftJoin('customers as c','sr.customer_id','=','c.id')
        ->leftJoin('salesmen as sm','s.salesmen_id','=','sm.id')
        ->select('sr.*','c.name as customer_name','c.shop_name','sm.name as salesman_name',
        DB::raw('(SELECT SUM(srp.return_qty) FROM sale_return_products as srp
        WHERE srp.sale_return_id = sr.id GROUP BY srp.sale_return_id) as total_return_qty'),
        DB::raw('(SELECT COUNT(srp.id) FROM sale_return_products as srp
        WHERE srp.sale_return_id = sr.id GROUP BY srp.sale_return_id) as total_return_items'));
         if (!empty($this->_return_no)) {
             $query->where('sr.return_no', 'like', '%' . $this->_return_no . '%');
         }
         if (!empty($this->_memo_no)) {
             $query->where('sr.memo_no', 'like', '%' . $this->_memo_no . '%');
         }
         if (!empty($this->_start_date)) {
             $query->where('sr.return_date', '>=',$this->_start_date);
         }
         if (!empty($this->_end_date)) {
             $query->where('sr.return_date', '<=',$this->_end_date);
         }
         if (!empty($this->_salesmen_id)) {
            $query->where('s.salesmen_id', $this->_salesmen_id);
         }
         if (!empty($this->_customer_id)) {
            $query->where('sr.customer_id', $this->_customer_id);
         }
         if (isset($this->orderValue) && isset($this->dirValue)) { //orderValue is the index number of table header and dirValue is asc or desc
             $query->orderBy($this->column_order[$this->orderValue], $this->dirValue); //fetch data order by matching column
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
         return DB::table('sale_returns')->get()->count();
     }
}
