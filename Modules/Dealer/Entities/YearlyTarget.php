<?php

namespace Modules\Dealer\Entities;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class YearlyTarget extends Model
{
    use HasFactory;

    protected $fillable = [];
    
    protected static function newFactory()
    {
        return \Modules\Dealer\Database\factories\YearlyTargetFactory::new();
    }
}
