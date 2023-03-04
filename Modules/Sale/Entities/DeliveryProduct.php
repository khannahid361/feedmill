<?php

namespace Modules\Sale\Entities;

use App\Models\BaseModel;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Modules\Product\Entities\Product;

class DeliveryProduct extends BaseModel {
    use HasFactory;
    protected $fillable = ['delivery_id','product_id','stock_qty','delivered_qty','delivery_qty'];
    protected $table = 'delivery_products';
    public function product(){
        return $this->belongsTo(Product::class,'product_id','id');
    }
}
