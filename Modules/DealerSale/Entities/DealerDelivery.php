<?php

namespace Modules\DealerSale\Entities;

use App\Models\BaseModel;
use Modules\Dealer\Entities\Dealer;
use Modules\Setting\Entities\Warehouse;

class DealerDelivery extends BaseModel{
    protected $fillable = ['dealer_sale_id','dealer_id','warehouse_id','total_delivery_quantity','delivery_date','note'];
    protected $table = 'dealer_deliveries';
    public function sale(){
        return $this->belongsTo(DealerSale::class,'dealer_sale_id','id');
    }
    public function deliveryProduct(){
        return $this->hasMany(DealerDeliveryProduct::class,'dealer_delivery_id','id');
    }
    public function dealer(){
        return $this->belongsTo(Dealer::class,'dealer_id','id');
    }
    public function warehouse(){
        return $this->belongsTo(Warehouse::class,'warehouse_id','id');
    }
}
