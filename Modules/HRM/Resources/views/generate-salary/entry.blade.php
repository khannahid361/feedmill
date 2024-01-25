<input type="hidden" name="month_id" id="month_id" value="{{ $month }}">
<input type="hidden" name="year_id" id="year_id" value="{{ $year }}">
<table id="dataTable" class="table table-bordered table-hover">
    <thead class="bg-primary">
    <tr>
        <th>{{__('file.Employee ID')}}</th>
        //
        <th>{{__('file.Employee Name')}}</th>
        //
        <th>{{__('file.Department')}}</th>
        //
        <th>{{__('file.Shift')}}</th>
        //
        <th>{{__('file.Total Working Days')}}</th>
        //
        <th>{{__('file.Total Holidays')}}</th>
        //
        <th>{{__('file.Total Attended Days')}}</th>
        //
        <th>{{__('file.Total Paid Leaves')}}</th>
        //
        <th>{{__('file.Total Un-Paid Leaves')}}</th>
        //
        <th>{{__('file.Total Working Hours')}}</th>
        <th>{{__('file.Total Attended Hours')}}</th>
        //
        <th>{{__('file.Current Salary')}}</th>
        //
        <th>{{__('file.Increment')}} not created yet</th>

        <th>{{__('file.Gross Salary')}}</th>
        <th>{{__('file.Net Salary')}}</th>
    </tr>
    </thead>
    <tbody>
    @php
        $daysArray = [
            '1' => 'Monday',
            '2' => 'Tuesday',
            '3' => 'Wednesday',
            '4' => 'Thursday',
            '5' => 'Friday',
            '6' => 'Saturday',
            '7' => 'Sunday'
    ];

        $currentYear = $year;
        $currentMonth = $month;

        $daysInMonth = cal_days_in_month(CAL_GREGORIAN, $currentMonth, $currentYear);
    @endphp
    @foreach($employees as $key => $emp)

        @php
            $thisEmolyeeHolidays = json_decode($emp->salary->weekly_holidays);
            $filteredDaysArray = array_diff($daysArray, $thisEmolyeeHolidays);

            $filteredDaysArray = array_keys($filteredDaysArray);

            $validDaysCount = 0;

            for ($day = 1; $day <= $daysInMonth; $day++) {
                $dayOfWeek = date('N', strtotime("$currentYear-$currentMonth-$day"));

               if (in_array($dayOfWeek, $filteredDaysArray)) {
                $validDaysCount++;
                }
            }

            $totalHolidays = $daysInMonth - $validDaysCount;

            $month = str_pad($month, 2, '0', STR_PAD_LEFT);
            $searchingTimeline = $year . '-' . $month . '-%';

            $thisEmployeePaidLeaves = \Modules\HRM\Entities\EmployeeLeave::where([
                'employee_id' => $emp->id,
                'status' => 2,
                'is_paid' => 1
            ])
            ->where('start_date', 'like', $searchingTimeline)
            ->sum('duration');

            $thisEmployeeUnPaidLeaves = \Modules\HRM\Entities\EmployeeLeave::where([
                'employee_id' => $emp->id,
                'status' => 2,
                'is_paid' => 2
            ])
            ->where('start_date', 'like', $searchingTimeline)
            ->sum('duration');

//            $month = str_pad($month, 2, '0', STR_PAD_LEFT);
//            $fromdate = $year . '-' . $month . '-01';
//            $carbonDate = \Carbon\Carbon::createFromFormat('Y-m-d', $fromdate);
//
//            $toDate = $carbonDate->addMonth()->firstOfMonth()->toDateString();

           $thisEmployeeAttendance = \Modules\HRM\Entities\DailyAttendance::where([
                'employee_id' => $emp->id,
                'dept_type' => 1,
                'approval_status' => 2,
                'type' => 1
            ])
            ->where('check_in_date', 'like', $searchingTimeline)
            ->select(\Illuminate\Support\Facades\DB::raw('count(id) as attended, sum(working_hour) as attended_hours'))
            ->groupBy('employee_id')
            ->first();

           dd($thisEmployeeAttendance);
        @endphp
        <tr>
            <td>{{ $emp->employee_id }}</td>
            <td>{{ $emp->name }}</td>
            <td>{{ $emp->department->name }}</td>
            <td>{{ $emp->salary->shift->name }}
                <input type="hidden" name="salary[{{$key}}][shift_id]" id="salary_{{$key}}_shift_id"
                       value="{{ $emp->shift_id }}">
            </td>
            <td><input type="text" name="salary[{{$key}}][total_working_days]" id="salary_{{$key}}_total_working_days"
                       class="form-control"
                       readonly value="{{ $validDaysCount }}"></td>
            <td><input type="time" name="salary[{{$key}}][total_holidays]" id="salary_{{$key}}_total_holidays"
                       class="form-control"
                       value="{{ $totalHolidays }}" readonly></td>
            <td><input type="date" name="salary[{{$key}}][total_attended]" id="salary_{{$key}}_total_attended"
                       class="form-control"
                       value="{{  }}"></td>
            <td><input type="time" name="salary[{{$key}}][total_paid_leaves]" id="salary_{{$key}}_total_paid_leaves"
                       class="form-control"
                       value="{{ isset($existingData) ? $existingData->check_out_time : '' }}"
                       onkeyup="setHours({{$key}})" onchange="setHours({{$key}})"></td>
            <td><input type="text" name="salary[{{$key}}][working_hour]" id="salary_{{$key}}_working_hour"
                       class="form-control"
                       value="{{ isset($existingData) ? $existingData->working_hour : '0' }}" readonly></td>
            <td><input type="text" name="salary[{{$key}}][approve_remarks]" id="salary_{{$key}}_approve_remarks"
                       class="form-control"
                       value="{{ isset($existingData) ? $existingData->approve_remarks : '' }}">
                <input type="hidden" name="salary[{{$key}}][employee_id]" id="salary_{{$key}}_employee_id"
                       class="form-control"
                       value="{{ $emp->id }}">
                <input type="hidden" name="salary[{{$key}}][shift_id]" id="salary_{{$key}}_shift_id"
                       class="form-control"
                       value="{{ $emp->salary->shift_id }}">
            </td>
        </tr>
    @endforeach
    </tbody>
</table>
<div class="form-group col-md-12 text-center pt-5">
    <button type="button" class="btn btn-primary btn-sm mr-3" id="save-btn"
            onclick="store_data()"><i class="fas fa-save"></i> Save
    </button>
</div>
