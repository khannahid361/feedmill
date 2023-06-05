<?php

namespace Modules\Production\Entities;

use App\Models\BaseModel;
use Modules\Product\Entities\Product;

class ProductionWastage extends BaseModel
{
    protected $table = 'production_wastages';
    protected $fillable = ['product_id','recyclable_wastage','permanent_wastage'];

    //Relations
    public function product(){
        return $this->belongsTo(Product::class,'product_id','id');
    }

}
