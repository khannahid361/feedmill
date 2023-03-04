<?php

namespace Modules\Sale\Entities;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Modules\Customer\Entities\Customer;
use Modules\SalesMen\Entities\Salesmen;
use Modules\Setting\Entities\Warehouse;

class Delivery extends Model{
    use HasFactory;
    protected $fillable = ['sale_id','salesmen_id','customer_id','warehouse_id','delivery_date','total_delivery_quantity','note'];
    protected $table = 'deliveries';
    public function sale(){
        return $this->belongsTo(Sale::class,'sale_id','id');
    }
    public function deliveryProduct(){
        return $this->hasMany(DeliveryProduct::class,'delivery_id','id');
    }
    public function salesmen(){
        return $this->belongsTo(Salesmen::class,'salesmen_id','id');
    }
    public function customer(){
        return $this->belongsTo(Customer::class,'customer_id','id');
    }
    public function warehouse(){
        return $this->belongsTo(Warehouse::class,'warehouse_id','id');
    }
}
