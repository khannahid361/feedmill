<?php

namespace Modules\Purchase\Entities;

use App\Models\BaseModel;
use Modules\Material\Entities\Material;

class MaterialPurchase extends BaseModel
{
    protected $table    = 'material_purchase';
    protected $fillable = ['purchase_id', 'material_id', 'qty', 'received', 'purchase_unit_id', 'net_unit_cost', 'new_unit_cost', 'current_unit_cost','old_unit_cost','old_cost','labor_cost','discount', 'tax_rate', 'tax', 'total'];

    public function material()
    {
        return $this->belongsTo(Material::class,'material_id','id');
    }
}
