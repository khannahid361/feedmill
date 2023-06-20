<?php

namespace Modules\Setting\Entities;

use App\Models\BaseModel;
use Modules\ASM\Entities\ASM;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Cache;
use Modules\Product\Entities\Product;
use Modules\Location\Entities\District;
use Modules\Material\Entities\Material;
use Modules\Product\Entities\WarehouseProduct;

class Warehouse extends BaseModel{
    protected $fillable = ['name','store_manager', 'phone', 'email', 'address','district_id', 'status', 'deletable', 'created_by', 'modified_by'];
    public function materials(){
        return $this->hasMany(Material::class,'warehouse_materials',
        'warehouse_id','material_id','id','id')->withTimeStamps()->withPivot('qty');
    }
    public function warehouse_products(){
        return $this->hasMany(WarehouseProduct::class,'warehouse-id','id');
    }
    public function products(){
        return $this->belongsToMany(Product::class,'warehouse_product','warehouse_id','product_id','id','id')
        ->withPivot('id','qty')
        ->withTimestamps();
    }
    public function district(){
        return $this->belongsTo(District::class,'district_id','id');
    }
    protected $order = ['w.id' => 'desc'];
    protected $name;
    public function setName($name){
        $this->name = $name;
    }
    private function get_datatable_query(){
        if (permission('warehouse-bulk-delete')){
            $this->column_order = [null,'w.id','w.name','w.store_manager','w.district_id', 'w.phone','w.email','w.address','w.status',null];
        }else{
            $this->column_order = ['w.id','w.name','w.store_manager','w.district_id', 'w.phone','w.email','w.address','w.status',null];
        }
        $query = DB::table('warehouses as w')
                ->select('w.id','w.name','w.store_manager', 'w.phone', 'w.email', 'w.address','w.district_id', 'w.status', 'w.deletable','d.name as district_name')
                ->leftjoin('locations as d','w.district_id','=','d.id');
        if (!empty($this->name)) {
            $query->where('w.name', 'like', '%' . $this->name . '%');
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
    protected const ALL_WAREHOUSES    = '_warehouses';
    protected const ACTIVE_WAREHOUSES    = '_active_warehouses';
    public static function allWarehouses(){
        // return Cache::rememberForever(self::ALL_WAREHOUSES, function () {
            return self::toBase()->get();
        // });
    }
    public static function activeWarehouses(){
        // return Cache::rememberForever(self::ACTIVE_WAREHOUSES, function () {
            return self::toBase()->where('status',1)->get();
        // });
    }
    public static function flushCache(){
        // Cache::forget(self::ALL_WAREHOUSES);
        // Cache::forget(self::ACTIVE_WAREHOUSES);
    }
    // public static function boot(){
    //     parent::boot();
    //     static::updated(function () {
    //         self::flushCache();
    //     });
    //     static::created(function() {
    //         self::flushCache();
    //     });
    //     static::deleted(function() {
    //         self::flushCache();
    //     });
    // }
}
