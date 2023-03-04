<?php
namespace Modules\Report\Entities;

use App\Models\BaseModel;
use Illuminate\Support\Facades\DB;
use Modules\Product\Entities\Product;
use Modules\Customer\Entities\Customer;
use Modules\Location\Entities\Area;
use Modules\Location\Entities\District;
use Modules\Location\Entities\Route;
use Modules\Location\Entities\Upazila;
use Modules\SalesMen\Entities\Salesmen;
use Modules\Setting\Entities\Warehouse;


class CollectionReport extends BaseModel{
    protected $table = 'sales';
    protected $fillable = ['memo_no', 'warehouse_id', 'district_id', 'upazila_id', 'route_id', 'area_id', 'salesmen_id', 'customer_id', 'item', 'total_qty', 'total_discount', 'total_tax', 'total_price', 'order_tax_rate', 'order_tax', 'order_discount', 'shipping_cost', 'labor_cost', 'grand_total', 'previous_due', 'net_total', 'paid_amount', 'due_amount', 'payment_status', 'payment_method', 'account_id', 'reference_no', 'document', 'note', 'sale_date', 'created_by', 'modified_by' ];
    public function warehouse()
    {
        return $this->belongsTo(Warehouse::class,'warehouse_id','id');
    }
    public function district()
    {
        return $this->belongsTo(District::class,'district_id','id');
    }
    public function upazila()
    {
        return $this->belongsTo(Upazila::class,'upazila_id','id');
    }
    public function route()
    {
        return $this->belongsTo(Route::class,'route_id','id');
    }
    public function area()
    {
        return $this->belongsTo(Area::class,'area_id','id');
    }
    public function salesmen()
    {
        return $this->belongsTo(Salesmen::class,'salesmen_id','id');
    }
    public function customer()
    {
        return $this->belongsTo(Customer::class,'customer_id','id');
    }
    public function sale_products()
    {
        return $this->belongsToMany(Product::class,'sale_products','sale_id','product_id','id','id')
        ->withPivot('id', 'batch_no','qty', 'sale_unit_id', 'net_unit_price', 'discount', 'tax_rate', 'tax', 'total')
        ->withTimestamps();
    }
    protected $order = ['s.id' => 'desc'];
    protected $_customer_id;
    protected $_start_date;
    protected $_end_date;
    public function setCustomerID($customer_id){
        $this->_customer_id = $customer_id;
    }
    public function setStartDate($start_date){
        $this->_start_date = $start_date;
    }
    public function setEndDate($end_date){
        $this->_end_date = $end_date;
    }
    private function get_datatable_query(){
        $this->column_order = ['s.id','s.sale_date', 's.salesmen_id','s.memo_no','s.district_id','s.upazila_id','s.route_id','s.area_id','s.custoemr_id', 's.paid_amount'];
        $query = DB::table('sales as s')
        ->selectRaw('s.*,sm.name as salesman_name,sm.phone,c.name,c.shop_name')
        ->join('salesmen as sm','s.salesmen_id','=','sm.id')
        ->join('customers as c','s.customer_id','=','c.id')
        ->where('s.paid_amount','>',0);
        if (!empty($this->_customer_id)) {
            $query->where('s.customer_id', $this->_customer_id);
        }
        if (!empty($this->_start_date)) {
            $query->where('s.sale_date', '>=',$this->_start_date);
        }
        if (!empty($this->_end_date)) {
            $query->where('s.sale_date', '<=',$this->_end_date);
        }
        //order by data fetching code
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
        $query = DB::table('sales')->where('paid_amount','>',0);
        if (!empty($this->_warehouse_id)) {
            $query->where('warehouse_id', $this->_warehouse_id);
        }
        return $query->get()->count();
    }
}
