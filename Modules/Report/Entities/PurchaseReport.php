<?php
namespace Modules\Report\Entities;

use App\Models\BaseModel;
use Illuminate\Support\Facades\DB;
use Modules\Supplier\Entities\Supplier;

class PurchaseReport extends BaseModel{
    protected $table = 'purchases';
    public function supplier(){
        return $this->belongsTo(Supplier::class,'supplier_id','id');
    }
    protected $order = ['p.id' => 'desc'];
    protected $_memo_no;
    protected $_from_date;
    protected $_to_date;
    protected $_supplier_id;
    public function setMemoNo($memo_no){
        $this->_memo_no = $memo_no;
    }
    public function setFromDate($from_date){
        $this->_from_date = $from_date;
    }
    public function setToDate($to_date){
        $this->_to_date = $to_date;
    }
    public function setSupplierID($supplier_id){
        $this->_supplier_id = $supplier_id;
    }
    private function get_datatable_query(){
        $this->column_order = ['p.id','p.memo_no', 'p.supplier_id', 'p.item','p.total_price','p.order_tax_rate','p.order_tax',
            'p.order_discount','p.labor_cost','p.shipping_cost','p.grand_total','p.previous_due','p.net_total', 'p.paid_amount', 'p.due_amount','p.sr_commission_rate','p.total_commission', 'p.purchase_date',
            'p.payment_status','p.payment_method','s,delivery_status','p.delivery_date', null];

        $query = DB::table('purchases as p')
                ->selectRaw('p.*,s.name as supplier_name')
                ->join('suppliers as s','p.supplier_id','=','s.id');
                // ->where('p.supplier_id',2);


        if (!empty($this->_memo_no)) {
            $query->where('p.memo_no', $this->_memo_no);
        }
        if (!empty($this->_from_date) && !empty($this->_to_date)) {
            $query->whereDate('p.sale_date', '>=',$this->_from_date)->whereDate('p.sale_date', '<=',$this->_to_date);
        }
        if (!empty($this->_supplier_id)) {
            // dd($this->_supplier_id);
            $query->where('p.supplier_id', $this->_supplier_id);
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
        return self::toBase()->get()->count();
    }
}
