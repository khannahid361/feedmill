<?php

namespace Modules\DealerSale\Entities;

use App\Models\BaseModel;
use Modules\Product\Entities\Product;

class DealerDeliveryProduct extends BaseModel{
    protected $fillable = ['dealer_delivery_id','product_id','stock_qty','delivered_qty','delivery_qty'];
    protected $table = 'dealer_delivery_products';
    public function product(){
        return $this->belongsTo(Product::class,'product_id','id');
    }
}
