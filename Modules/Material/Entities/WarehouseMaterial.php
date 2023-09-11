<?php

namespace Modules\Material\Entities;

use App\Models\BaseModel;
use Illuminate\Support\Facades\DB;
use Modules\Material\Entities\Material;
use Modules\Setting\Entities\Warehouse;

class WarehouseMaterial extends BaseModel{
    protected $fillable = ['warehouse_id','material_id','qty'];
    protected $table = "warehouse_material";
    protected $order = ['m.id' => 'asc'];
    protected $_name;
    protected $_category;
    protected $_warehouse;
    public function warehouse(){
        return $this->belongsTo(Warehouse::class);
    }
    public function material(){
        return $this->belongsTo(Material::class);
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
        $this->column_order = ['m.id','w.name','m.material_name','m.material_code','m.unit_id','m.cost','wm.qty',null];
        $query = DB::table('warehouse_material as wm')
            ->selectRaw('wm.qty,w.name as warehouse_name,m.id,m.material_name,m.material_code,m.cost,m.opening_cost,c.name as category_name,u.unit_name')
            ->join('warehouses as w','wm.warehouse_id','=','w.id')
            ->join('materials as m','wm.material_id','=','m.id')
            ->join('categories as c','m.category_id','=','c.id')
            ->join('units as u','m.unit_id','=','u.id');
        if (!empty($this->_name)) {
            $query->where('m.material_name', 'like', '%' . $this->_name . '%');
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
        return DB::table('warehouse_material as wm')
            ->selectRaw('wm.qty,w.name as warehouse_name,m.id,m.material_name,m.material_code,m.cost,c.name as category_name,u.unit_name')
            ->join('warehouses as w','wm.warehouse_id','=','w.id')
            ->join('materials as m','wm.material_id','=','m.id')
            ->join('categories as c','m.category_id','=','c.id')
            ->join('units as u','m.unit_id','=','u.id')->get()->count();
    }
}
