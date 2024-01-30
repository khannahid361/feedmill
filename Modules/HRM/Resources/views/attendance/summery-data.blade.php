
<table id="dataTable" class="table table-bordered table-hover">
    <thead class="bg-primary">
    <tr>
        <th>{{__('file.Employee Name')}}</th>
        <th>{{__('file.Designation')}}</th>
        <th>{{__('file.Department')}}</th>
        <th>{{__('file.Branch')}}</th>
        <th>{{__('file.Total Attended')}}</th>
        <th>{{__('file.Total Paid Leave')}}</th>
        <th>{{__('file.Total Un-Paid Leave')}}</th>
        <th>{{__('file.Working Hour')}}</th>
        <th>{{__('file.Over Time(Hours)')}}</th>
    </tr>
    </thead>
    <tbody>
    @forelse($data as $key => $value)
        <tr>
            <td>{{ $value->employee_name }}</td>
            <td>{{ $value->designation_name }}</td>
            <td>{{ $value->department_name }}</td>
            <td>{{ $value->branch_name }}</td>
            <td>{{ $value->total_attended }}</td>
            <td>{{ $value->total_paid_leaves }}</td>
            <td>{{ $value->total_unpaid_leaves }}</td>
            <td>{{ $value->total_attended_hour }}</td>
            <td>{{ $value->total_overtime_hour }}</td>
        </tr>
    @empty
        <tr>
            <td colspan="9" class="text-danger">No data Found</td>
        </tr>
    @endforelse
    </tbody>
</table>
