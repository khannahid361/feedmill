<?php

namespace Modules\Product\Entities;

use Illuminate\Database\Eloquent\Model;
use Modules\Material\Entities\Material;

class ProductMaterial extends Model
{
    protected $fillable = ['product_id', 'material_id','qty', 'recipe_id'];

    protected $table = 'product_material';

    public function material()
    {
        return $this->belongsTo(Material::class,'material_id','id');
    }
    public function recipe()
    {
        return $this->belongsTo(Recipe::class,'recipe_id', 'id');
    }
}
