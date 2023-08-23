<?php

namespace Modules\StockReturn\Entities;

use Illuminate\Database\Eloquent\Model;
use Modules\Product\Entities\Product;

class DealerSaleReturnProduct extends Model
{
    protected $table ='dealer_sale_return_products';
    protected $fillable = ['dealer_sale_return_id', 'memo_no', 'product_id', 'return_qty', 'unit_id', 'product_rate',
    'deduction_rate', 'deduction_amount', 'total' , 'material_id', 'product_condition'];

     public function product()
    {
        return $this->belongsTo(Product::class);
    }
}
