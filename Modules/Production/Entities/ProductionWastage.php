<?php

namespace Modules\Production\Entities;

use App\Models\BaseModel;
use Modules\Product\Entities\Product;

class ProductionWastage extends BaseModel
{
    protected $table = 'production_wastages';
    protected $fillable = ['product_id', 'recyclable_wastage', 'permanent_wastage'];

    //Relations
    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id', 'id');
    }

    protected $_product_id;

    public function setProduct($product_id)
    {
        $this->_product_id = $product_id;
    }

    private function get_datatable_query()
    {

        $this->column_order = ['id', 'product_id', 'recyclable_wastage', 'permanent_wastage', null];


        $query = self::with('product:id,name');

        //search query
        if (!empty($this->_product_id)) {
            $query->where('product_id', $this->_product_id);
        }

        //order by data fetching code
        if (isset($this->orderValue) && isset($this->dirValue)) { //orderValue is the index number of table header and dirValue is asc or desc
            $query->orderBy($this->column_order[$this->orderValue], $this->dirValue); //fetch data order by matching column
        } else if (isset($this->order)) {
            $query->orderBy(key($this->order), $this->order[key($this->order)]);
        }
        return $query;
    }

    public function getDatatableList()
    {
        $query = $this->get_datatable_query();
        if ($this->lengthVlaue != -1) {
            $query->offset($this->startVlaue)->limit($this->lengthVlaue);
        }
        return $query->get();
    }

    public function count_filtered()
    {
        $query = $this->get_datatable_query();
        return $query->get()->count();
    }

    public function count_all()
    {
        return self::toBase()->get()->count();
    }
}
