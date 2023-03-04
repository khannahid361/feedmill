<?php

namespace Modules\DealerSale\Entities;

use App\Models\BaseModel;
use App\Models\Unit;
use Modules\Product\Entities\Product;

class DealerSaleProduct extends BaseModel{
    protected $fillable = ['dealer_sale_id','product_id','qty','free_qty','delivered_qty','sale_unit_id','net_unit_price', 'discount','tax_rate','tax','total'];
    protected $table = 'dealer_sale_products';
    public function product(){
        return $this->belongsTo(Product::class);
    }
    public function sale_unit(){
        return $this->belongsTo(Unit::class,'sale_unit_id','id');
    }
}
