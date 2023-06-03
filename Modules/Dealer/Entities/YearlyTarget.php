<?php

namespace Modules\Dealer\Entities;

use App\Models\BaseModel;

class YearlyTarget extends BaseModel
{
    protected $table = 'yearly_target';
    protected $fillable = ['dealer_id', 'qty', 'commission_amount', 'year', 'month', 'status', 'created_by', 'modified_by', 'paid_amount', 'due_amount', 'is_paid', 'acheived_qty'];
}
