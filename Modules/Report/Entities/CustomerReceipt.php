<?php
namespace Modules\Report\Entities;

use App\Models\BaseModel;

class CustomerReceipt extends BaseModel{
    protected $table    = 'transactions';
    protected $order    = ['transactions.id' => 'desc'];
    protected $fillable = ['chart_of_account_id', 'warehouse_id','voucher_no', 'voucher_type', 'voucher_date', 'description', 'debit', 'credit', 'posted', 'approve', 'created_by', 'modified_by'];
    protected $_from_date;
    protected $_to_date;
    protected $_warehouse_id;
    protected $_district_id;
    protected $_upazila_id;
    protected $_route_id;
    protected $_area_id;
    protected $_customer_id;
    public function setFromDate($from_date){
        $this->_from_date = $from_date;
    }
    public function setToDate($to_date){
        $this->_to_date = $to_date;
    }
//
//    public function setWarehouseID($warehouse_id)
//    {
//        $this->_warehouse_id = $warehouse_id;
//    }
//
//    public function setDistrictID($district_id)
//    {
//        $this->_district_id = $district_id;
//    }
//
//    public function setUpazilaID($upazila_id)
//    {
//        $this->_upazila_id = $upazila_id;
//    }
//    public function setRouteID($route_id)
//    {
//        $this->_route_id = $route_id;
//    }
//    public function setAreaID($area_id)
//    {
//        $this->_area_id = $area_id;
//    }

    public function setCustomerID($customer_id){
        $this->_customer_id = $customer_id;
    }
    private function get_datatable_query(){
        $this->column_order = ['transaction.id','transactions.voucher_date','c.customer_id','c.district_id','c.upazila_id','c.area_id','transactions.description', 'transactions.credit',null];
        $query = self::selectRaw('transactions.*,coa.id as coa_id,coa.code,coa.name,coa.parent_name,c.id as customer_id,c.shop_name,c.name as customer_name,w.name as warehouse_name')
                ->join('chart_of_accounts as coa','transactions.chart_of_account_id','=','coa.id')
                ->join('customers as c','coa.customer_id','c.id')
                ->join('warehouses as w','transactions.warehouse_id','=','w.id')
//        ->join('locations as d', 'c.district_id', '=', 'd.id')
//        ->join('locations as u', 'c.upazila_id', '=', 'u.id')
//        ->join('locations as r', 'c.route_id', '=', 'r.id')
//        ->join('locations as a', 'c.area_id', '=', 'a.id')
        ->where([['transactions.credit','>',0], ['transactions.approve',1],
        ]);
        if (!empty($this->_from_date) && !empty($this->_to_date)) {
            $query->whereDate('transactions.voucher_date', '>=',$this->_from_date)->whereDate('transactions.voucher_date', '<=',$this->_to_date);
        }
//
//        if (!empty($this->_warehouse_id)) {
//            $query->where('transactions.warehouse_id', $this->_warehouse_id);
//        }

        if (!empty($this->_customer_id)) {
            $query->where('transactions.chart_of_account_id', $this->_customer_id);
        }
//
//        if (!empty($this->_district_id)) {
//            $query->where('c.district_id', $this->_district_id);
//        }
//        if (!empty($this->_upazila_id)) {
//            $query->where('c.upazila_id', $this->_upazila_id);
//        }
//        if (!empty($this->_route_id)) {
//            $query->where('c.route_id', $this->_route_id);
//        }
//        if (!empty($this->_area_id)) {
//            $query->where('c.area_id', $this->_area_id);
//        }

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
        $query = self::select('transactions.*','coa.id as coa_id','coa.code','coa.name','coa.parent_name','c.id as customer_id','c.shop_name','c.name')
                ->join('chart_of_accounts as coa','transactions.chart_of_account_id','=','coa.id')
                ->join('customers as c','coa.customer_id','c.id')
                ->where([['transactions.credit','>',0], ['transactions.approve',1],
                ]);
//        if (!empty($this->_warehouse_id)) {
//            $query->where('transactions.warehouse_id', $this->_warehouse_id);
//        }
        return $query->get()->count();
    }
}
