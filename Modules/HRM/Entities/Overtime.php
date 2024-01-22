<?php

namespace Modules\HRM\Entities;

use Illuminate\Database\Eloquent\Model;

class Overtime extends Model
{

    protected $table = 'overtimes';
    protected $fillable = ['employee_id', 'date', 'start_time', 'end_time', 'working_hour', 'dept_type', 'approval_status', 'type', 'approve_remarks', 'approved_by'];

}
