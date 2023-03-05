<?php

namespace Modules\Sale\Entities;

use App\Models\BaseModel;
use Illuminate\Support\Facades\DB;
use Modules\Account\Entities\ChartOfAccount;
use Modules\Location\Entities\Area;
use Modules\Location\Entities\Route;
use Modules\Product\Entities\Product;
use Modules\Location\Entities\Upazila;
use Modules\Customer\Entities\Customer;
use Modules\Location\Entities\District;
use Modules\SalesMen\Entities\Salesmen;
use Modules\Setting\Entities\Warehouse;


class Sale extends BaseModel{
    protected $fillable = ['memo_no','salesmen_id','area_id','customer_id','sale_date','document','item','total_qty','total_free_qty','total_delivery_quantity','total_tax','total_price'
        ,'total_commission','order_tax','order_tax_rate','order_discount','shipping_cost','labor_cost','previous_due','net_total','paid_amount','grand_total','due_amount'
        ,'payment_status','payment_method','reference_no','account_id','note','status','created_by','modified_by'];
    public function warehouse(){
        return $this->belongsTo(Warehouse::class,'warehouse_id','id');
    }
    public function district(){
        return $this->belongsTo(District::class,'district_id','id');
    }
    public function upazila(){
        return $this->belongsTo(Upazila::class,'upazila_id','id');
    }
    public function route(){
        return $this->belongsTo(Route::class,'route_id','id');
    }
    public function account(){
        return $this->belongsTo(ChartOfAccount::class,'account_id','id');
    }
//    public function area(){
//        return $this->belongsTo(Area::class,'area_id','id');
//    }
//    public function salesmen(){
//        return $this->belongsTo(Salesmen::class,'salesmen_id','id');
//    }
    public function customer(){
        return $this->belongsTo(Customer::class,'customer_id','id');
    }
    public function sale_products(){
        return $this->belongsToMany(Product::class,'sale_products','sale_id','product_id','id','id')
            ->withPivot('id', 'qty','free_qty', 'sale_unit_id', 'net_unit_price', 'discount', 'tax_rate', 'tax', 'total')
            ->withTimestamps();
    }
    public function SaleProductList(){
        return $this->hasMany(SaleProduct::class,'sale_id','id');
    }
    protected $order = ['s.id' => 'desc'];
    protected $_memo_no;
    protected $_from_date;
    protected $_to_date;
    protected $_warehouse_id;
    protected $_district_id;
    protected $_upazila_id;
    protected $_route_id;
    protected $_area_id;
    protected $_salesmen_id;
    protected $_customer_id;
    protected $_payment_status;
    public function setInvoiceNo($memo_no){
        $this->_memo_no = $memo_no;
    }
    public function setFromDate($from_date){
        $this->_from_date = $from_date;
    }
    public function setToDate($to_date){
        $this->_to_date = $to_date;
    }
    public function setWarehouseID($warehouse_id){
        $this->_warehouse_id = $warehouse_id;
    }
    public function setDistrictID($district_id){
        $this->_district_id = $district_id;
    }
    public function setUpazilaID($upazila_id){
        $this->_upazila_id = $upazila_id;
    }
    public function setRouteID($route_id){
        $this->_route_id = $route_id;
    }
    public function setAreaID($area_id){
        $this->_area_id = $area_id;
    }
    public function setSalesmenID($salesmen_id){
        $this->_salesmen_id = $salesmen_id;
    }
    public function setCustomerID($customer_id){
        $this->_customer_id = $customer_id;
    }
    public function setPaymentStatus($payment_status){
        $this->_payment_status = $payment_status;
    }
    private function get_datatable_query(){
        $this->column_order = ['s.id','s.memo_no', 's.salesmen_id','s.customer_id', 's.item','s.total_qty','s.total_free_qty','s.total_price','s.order_tax_rate','s.order_tax',
            's.order_discount','s.labor_cost','s.shipping_cost','s.grand_total','s.previous_due','s.net_total', 's.paid_amount', 's.due_amount','s.sr_commission_rate','s.total_commission', 's.sale_date',
            's.payment_status','s.payment_method','s,delivery_status','s.delivery_date', null];
        $query = DB::table('sales as s')
            ->selectRaw('s.*,c.name,c.shop_name')
            ->join('customers as c','s.customer_id','=','c.id');
        if (!empty($this->_memo_no)) {
            $query->where('s.memo_no', $this->_memo_no);
        }
        if (!empty($this->_from_date) && !empty($this->_to_date)) {
            $query->whereDate('s.sale_date', '>=',$this->_from_date)->whereDate('s.sale_date', '<=',$this->_to_date);
        }

        if (!empty($this->_customer_id)) {
            $query->where('s.customer_id', $this->_customer_id);
        }
        if (!empty($this->_payment_status)) {
            $query->where('s.payment_status', $this->_payment_status);
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
        return DB::table('sales')->get()->count();
    }
}
