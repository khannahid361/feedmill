<?php

namespace Modules\HRM\Http\Controllers;

use App\Http\Controllers\BaseController;
use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Auth;
use Modules\HRM\Entities\Allowance;
use Modules\HRM\Entities\Deduction;
use Modules\HRM\Entities\Employee;
use Modules\HRM\Entities\Salary;
use Modules\HRM\Entities\Shift;
use Modules\HRM\Http\Requests\SalaryFormRequest;

class SalaryController extends BaseController
{
    public function __construct(Salary $model)
    {
        $this->model = $model;
    }

    public function index()
    {
        if (permission('salary-access')) {
            $setTitle = __('file.Manage Salary');
            $this->setPageData($setTitle, $setTitle, 'far fa-handshake', [['name' => $setTitle]]);
            $deletable = self::DELETABLE;
            $salary_emp = Salary::get();
            $employee = Employee::where('activation_status', 1)->get();
            return view('hrm::salary.index', compact('deletable', 'employee', 'salary_emp'));
        } else {
            return $this->access_blocked();
        }
    }

    public function get_datatable_data(Request $request)
    {
        if ($request->ajax()) {
            if (permission('salary-access')) {
                if (!empty($request->employee_id)) {
                    $this->model->setName($request->employee_id);
                }
                $this->set_datatable_default_properties($request);//set datatable default properties
                $list = $this->model->getDatatableList();//get table data
                $data = [];
                $no = $request->input('start');
                foreach ($list as $value) {

                    $no++;
                    $action = '';
                    if (permission('salary-edit')) {
                        $action .= ' <a class="dropdown-item" href="' . url("salary/edit/" . $value->id) . '">' . $this->actionButton('Edit') . '</a>';
                    }
                    $row = [];
                    $row[] = $no;
                    $row[] = $value->employee ? $value->employee->name : '';
                    $row[] = $value->employee ? $value->employee->employee_id : '';
                    $row[] = $value->employee ? $value->employee->designation->name : '';
                    $row[] = EMPLOYEE_TYPE_LABEL[$value->employee_type];
                    $row[] = $value->house_rent_allowance + $value->medical_allowance + $value->transport_allowance + $value->mobile_allowance + $value->other_allowance;
                    $row[] = $value->tax_deduction + $value->provident_fund_deduction + $value->other_deduction;
                    $row[] = $value->gross_salary;
                    $row[] = $value->net_salary;
                    $row[] = $value->date;
                    $row[] = date('F-Y', strtotime($value->month));
                    $row[] = action_button($action);//custom helper function for action button
                    $data[] = $row;
                }
                return $this->datatable_draw($request->input('draw'), $this->model->count_all(),
                    $this->model->count_filtered(), $data);
            }
        } else {
            return response()->json($this->unauthorized());
        }
    }

    public function go(Request $request)
    {
        request()->validate([
            'employee_id' => 'required',
        ], [
            'employee_id.required' => 'The employee name field is required',
        ]);
        return redirect('/salary/manage-salary/' . $request->employee_id);
    }

    public function create($user_id)
    {
        if (permission('salary-add')) {
            $setTitle = __('file.Add Employee Salary');
            $this->setPageData($setTitle, $setTitle, 'far fa-handshake', [['name' => $setTitle]]);
            $employee_id = $user_id;
            $employee = Employee::where('activation_status', 1)->where('id', $user_id)->first();
            $salary = Salary::where('employee_id', $employee_id)->first();
            $shifts = Shift::where(['status' => 1, 'department' => 1])->get();
            $allowances = Allowance::where(['department' => 1, 'type' => 1, 'status' => 1])->get();
            $deductions = Deduction::where(['department' => 1, 'type' => 2, 'status' => 1])->get();
            if (empty($salary)) {
                return view('hrm::salary.create', compact('employee', 'employee_id', 'salary', 'shifts', 'allowances', 'deductions'));
            } else {
                return view('hrm::salary.edit', compact('employee', 'employee_id', 'salary', 'shifts', 'allowances', 'deductions'));
            }
        } else {
            return $this->access_blocked();
        }
    }

    public function store_or_update_data(SalaryFormRequest $request)
    {
        dd($request->all());
        if ($request->ajax()) {
            if (permission('salary-add')) {
                date_default_timezone_set('Asia/Dhaka');
                $date = date('Y-m-d');
                $month = date('Y-m');
                $collection = collect($request->all())->merge(['date' => $date, 'month' => $month, 'created_by' => Auth::user()->id, 'house_rent_allowance' => $request->house_rent_allowance ?? 0, 'medical_allowance' => $request->medical_allowance ?? 0, 'transport_allowance' => $request->transport_allowance ?? 0, 'mobile_allowance' => $request->mobile_allowance ?? 0, 'other_allowance' => $request->other_allowance ?? 0, 'provident_fund_contribution' => $request->provident_fund_contribution ?? 0, 'total_provident_fund' => $request->total_provident_fund ?? 0, 'tax_deduction' => $request->tax_deduction ?? 0, 'provident_fund_deduction' => $request->provident_fund_deduction ?? 0, 'other_deduction' => $request->other_deduction ?? 0,]);
//                return response()->json($collection);
                $salary = $this->model->create($collection->all());
                $output = $this->store_message($salary);
            } else {
                $output = $this->unauthorized();
            }
            return response()->json($output);
        } else {
            return response()->json($this->unauthorized());
        }
    }

    public function edit($id)
    {
        if (permission('employee-access')) {
            $setTitle = __('file.Employee Edit');
            $this->setPageData($setTitle, $setTitle, 'far fa-handshake', [['name' => $setTitle]]);
            $salary = Salary::find($id);
            return view('hrm::salary.edit', compact('salary'));
        } else {
            return $this->access_blocked();
        }
    }

    public function update_data(SalaryFormRequest $request)
    {
        if ($request->ajax()) {
            if (permission('salary-add')) {
                $collection = collect($request->all());
                $salary = $this->model->find($request->update_id)->update($collection->all());
                $output = $this->store_message($salary);
            } else {
                $output = $this->unauthorized();
            }
            return response()->json($output);
        } else {
            return response()->json($this->unauthorized());
        }
    }

}
