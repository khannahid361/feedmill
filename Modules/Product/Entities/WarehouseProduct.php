<?php

namespace Modules\Product\Entities;

use App\Models\BaseModel;
use Illuminate\Support\Facades\DB;
use Modules\Product\Entities\Product;
use Modules\Setting\Entities\Warehouse;

class WarehouseProduct extends BaseModel{
    protected $fillable = ['warehouse_id', 'product_id', 'qty', 'bag_qty', 'unit' , 'damaged_bag_qty'];
    protected $table    = 'warehouse_product';
    protected $order    = ['p.id' => 'asc'];
    protected $_name;
    protected $_category;
    protected $_warehouse;
    public function warehouse(){
        return $this->belongsTo(Warehouse::class);
    }
    public function product(){
        return $this->belongsTo(Product::class);
    }
    public function setName($name){
        $this->_name = $name;
    }
    public function setCategory($category){
        $this->_category = $category;
    }
    public function setWarehouse($warehouse){
        $this->_warehouse = $warehouse;
    }
    private function get_datatable_query(){
        $this->column_order = ['p.id','w.name','p.name','p.code','c.category_name','u.unit_name','p.base_unit_price','wp.qty',null];

        $query              = DB::table('warehouse_product as wp')
                            ->selectRaw('w.name as warehouse_name,p.name as product_name,p.code as product_code,c.name as category_name,u.unit_name as unit_name,p.base_unit_price,p.cost,wp.qty,wp.unit as wpunit,wp.bag_qty')
                            ->join('warehouses as w','wp.warehouse_id','=','w.id')
                            ->join('products as p','wp.product_id','=','p.id')
                            ->join('categories as c','p.category_id','=','c.id')
                            ->join('units as u','p.base_unit_id','=','u.id');
        if (!empty($this->_name)) {
            $query->where('p.name', 'like', '%' . $this->_name . '%');
        }
        if (!empty($this->_category)) {
            $query->where('c.id',$this->_category);
        }
        if (!empty($this->_warehouse)) {
            $query->where('w.id',  $this->_warehouse);
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
        return DB::table('warehouse_product as wp')
            ->selectRaw('w.name as warehouse_name,p.name as product_name,p.code as product_code,c.name as category_name,u.unit_name as unit_name,p.base_unit_price,wp.qty')
            ->join('warehouses as w','wp.warehouse_id','=','w.id')
            ->join('products as p','wp.product_id','=','p.id')
            ->join('categories as c','p.category_id','=','c.id')
            ->join('units as u','p.base_unit_id','=','u.id')
            ->get()->count();
    }
}
