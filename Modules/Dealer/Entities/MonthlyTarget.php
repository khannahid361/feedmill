<?php

namespace Modules\Dealer\Entities;

use App\Models\BaseModel;

class MonthlyTarget extends BaseModel
{
    protected $table ='monthly_target';
    protected $fillable = ['dealer_id', 'product_id', 'qty', 'commission_amount', 'year', 'month', 'status', 'created_by','modified_by'];

}
