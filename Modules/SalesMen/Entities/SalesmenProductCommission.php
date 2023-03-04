<?php

namespace Modules\SalesMen\Entities;

use App\Models\BaseModel;
use Modules\Product\Entities\Product;

class SalesmenProductCommission extends BaseModel {
    protected $fillable = ['name','product_id','product_price','quantity','commission_percent','commission_amount','created_by'];
    protected $table    = 'salesmen_product_commissions';
    protected $_name;
    protected $_product_id;
    public function product(){
        return $this->belongsTo(Product::class,'product_id','id');
    }
    public function setName($name){
        $this->_name = $name;
    }
    public function setProduct($product_id){
        $this->_product_id = $product_id;
    }
    private function getDataTableQuery(){
        $this->column_order = ['id','name','product_id','quantity','commission_percent','commission_amount','created_by',null];
        $query = self::toBase();
        if(!empty($this->_name)){
            $query->where('name', 'like', '%' . $this->name . '%');
        }
        if (!empty($this->_product_id)) {
            $query->where('product_id', $this->_product_id );
        }
        if (isset($this->orderValue) && isset($this->dirValue)) {
            $query->orderBy($this->column_order[$this->orderValue], $this->dirValue);
        } else if (isset($this->order)) {
            $query->orderBy(key($this->order), $this->order[key($this->order)]);
        }
        return $query;
    }
    public function getDatatableList(){
        $query = $this->getDataTableQuery();
        if ($this->lengthVlaue != -1) {
            $query->offset($this->startVlaue)->limit($this->lengthVlaue);
        }
        return $query->get();
    }
    public function count_filtered(){
        $query = $this->getDataTableQuery();
        return $query->get()->count();
    }
    public function count_all(){
        return self::toBase()->get()->count();
    }
}
