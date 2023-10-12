<?php

namespace Modules\Product\Entities;

use App\Models\BaseModel;

class Recipe extends BaseModel
{
    protected $fillable = ['recipe_name', 'recipe_code', 'product_id', 'recipe_date', 'created_by',
        'modified_by', 'status'];


    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id', 'id');
    }


    //custom search column property
    protected $_recipe_name;
    protected $_recipe_code;
    protected $_status;
    protected $_product_id;

    //methods to set custom search property value
    public function setName($recipe_name)
    {
        $this->_recipe_name = $recipe_name;
    }

    public function setStatus($status)
    {
        $this->_status = $status;
    }

    public function setRecipeCode($recipe_code)
    {
        $this->_recipe_code = $recipe_code;
    }
    public function setProduct($product_id)
    {
        $this->_product_id = $product_id;
    }


    private function get_datatable_query()
    {
        //set column sorting index table column name wise (should match with frontend table header)
        $this->column_order = ['recipe_name', 'recipe_code', 'product_id', 'recipe_date', 'created_by',
            'modified_by', 'status', null];

        $query = self::with('product:name');

        //search query
        if (!empty($this->_recipe_name)) {
            $query->where('recipe_name', 'like', '%' . $this->_recipe_name . '%');
        }
        if (!empty($this->_recipe_code)) {
            $query->where('recipe_code', $this->_recipe_code);
        }
        if (!empty($this->_status)) {
            $query->where('status', $this->_status);
        }
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
    /******************************************
     * * * End :: Custom Datatable Code * * *
     *******************************************/
}
