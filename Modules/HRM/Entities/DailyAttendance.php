<?php

namespace Modules\HRM\Entities;

use Illuminate\Database\Eloquent\Model;

class DailyAttendance extends Model
{

    protected $table = 'daily_attendances';
    protected $fillable = ['employee_id', 'shift_id', 'check_in_date', 'check_in_time', 'check_out_date', 'check_out_time', 'working_hour', 'dept_type', 'approval_status', 'type', 'approve_remarks', 'approved_by'];
}
