<?php

namespace Modules\DealerSale\Entities;

use App\Models\BaseModel;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Support\Facades\DB;
use Modules\Dealer\Entities\Dealer;
use Modules\Product\Entities\Product;
use Modules\Setting\Entities\Warehouse;

class DealerSale extends BaseModel {
    protected $fillable = ['memo_no','dealer_id','sale_date','document','item','total_qty','total_free_qty','total_tax','total_price','total_commission',
                           'order_tax','order_tax_rate','order_discount','shipping_cost','labor_cost', 'previous_due','net_total','paid_amount','grand_total',
                           'due_amount','payment_status','payment_method','reference_no', 'account_id','note','status','order_type','created_by','modified_by'];
    protected $table = 'dealer_sales';
    public function warehouse(){
        return $this->belongsTo(Warehouse::class,'warehouse_id','id');
    }
    public function dealer(){
        return $this->belongsTo(Dealer::class,'dealer_id','id');
    }
    public function sale_products(){
        return $this->belongsToMany(Product::class,'dealer_sale_products','dealer_sale_id','product_id','id','id')
            ->withPivot('id', 'qty','free_qty', 'sale_unit_id', 'net_unit_price', 'discount', 'tax_rate', 'tax', 'total')
            ->withTimestamps();
    }
    public function SaleProductList(){
        return $this->hasMany(DealerSaleProduct::class,'dealer_sale_id','id');
    }
    protected $order = ['s.id' => 'desc'];
    protected $_memo_no;
    protected $_from_date;
    protected $_to_date;
    protected $_dealer_id;
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
    public function setDealerID($dealer_id){
        $this->_dealer_id = $dealer_id;
    }
    public function setPaymentStatus($payment_status){
        $this->_payment_status = $payment_status;
    }
    private function get_datatable_query(){
        $this->column_order = ['s.id','s.memo_no','s.dealer_id','s.item','s.total_price','s.order_tax_rate','s.order_tax',
            's.order_discount','s.labor_cost','s.shipping_cost','s.grand_total','s.previous_due','s.net_total', 's.paid_amount', 's.due_amount','s.total_commission', 's.sale_date',
            's.payment_status','s.payment_method','s,delivery_status','s.delivery_date', null];
        $query = DB::table('dealer_sales as s')
            ->selectRaw('s.*,d.name as dealer_name')
            ->join('dealers as d','s.dealer_id','=','d.id');
        if (!empty($this->_memo_no)) {
            $query->where('s.memo_no', $this->_memo_no);
        }
        if (!empty($this->_from_date) && !empty($this->_to_date)) {
            $query->whereDate('s.sale_date', '>=',$this->_from_date)->whereDate('s.sale_date', '<=',$this->_to_date);
        }
        if (!empty($this->_dealer_id)) {
            $query->where('s.dealer_id', $this->_dealer_id);
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
        return DB::table('dealer_sales')->get()->count();
    }
}
