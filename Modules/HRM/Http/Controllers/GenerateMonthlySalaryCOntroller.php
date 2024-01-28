<?php

namespace Modules\HRM\Http\Controllers;

use App\Http\Controllers\BaseController;
use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Modules\HRM\Entities\Employee;
use Modules\HRM\Entities\GenerateMonthlySalary;
use Modules\HRM\Http\Requests\SalaryGenerateFormRequest;

class GenerateMonthlySalaryCOntroller extends BaseController
{
    public function __construct(GenerateMonthlySalary $model)
    {
        $this->model = $model;
    }

    public function index()
    {
        if (permission('generate-salary-access')) {
            $this->setPageData('Manage Employee Payslip', 'Manage Employee Payslip', 'fab fa-opencart', [['name' => 'Manage Employee Payslip']]);
            $employees = Employee::where('activation_status', '1')->get();
            $shifts = Employee::where('status', '1')->get();
            return view('hrm::generate-salary.index', compact('employees', 'shifts'));
        } else {
            return $this->access_blocked();
        }
    }

    public function get_datatable_data(Request $request)
    {
        if ($request->ajax()) {
            if (permission('generate-salary-access')) {
                if (!empty($request->employee_id)) {
                    $this->model->setEmployee($request->employee_id);
                }
                if (!empty($request->month)) {
                    $this->model->setMonth($request->month);
                }
                if (!empty($request->year)) {
                    $this->model->setYear($request->year);
                }
                if (!empty($request->type)) {
                    $this->model->setStatus($request->type);
                }
                $this->set_datatable_default_properties($request);//set datatable default properties
                $list = $this->model->getDatatableList();//get table data
                $data = [];
                $no = $request->input('start');
                foreach ($list as $value) {
                    $no++;
                    $action = '';
                    if (permission('generate-salary-change-status') && $value->status == 1) {
                        $action .= ' <a class="dropdown-item" href="' . route("generate.salary.approve", $value->id) . '">' . self::ACTION_BUTTON['Approve'] . '</a>';

                        $action .= ' <a class="dropdown-item delete-data" data-id="' . $value->id . '" data-name="' . $value->employee->name . '">' . self::ACTION_BUTTON['Delete'] . '</a>';
                    }
                    if (permission('generate-salary-view')) {
                        $action .= ' <a class="dropdown-item view-data" data-id="' . $value->id . '" data-name="' . $value->employee->name . '">' . self::ACTION_BUTTON['View'] . '</a>';
                    }
                    $month = date("F", mktime(0, 0, 0, $value->month, 1));
                    $row = [];
                    $row[] = $no;
                    $row[] = $value->employee->name;
                    $row[] = $month;
                    $row[] = $value->year;
                    $row[] = $value->total_working_days;
                    $row[] = $value->total_paid_leaves + $value->total_unpaid_leaves;
                    $row[] = $value->total_working_hours;
                    $row[] = $value->total_attended_hours;
                    $row[] = $value->net_salary;
                    $row[] = $value->created_by ?? '<span class="label label-danger label-pill label-inline" style="min-width:70px !important;">Not Created Yet</span>';
                    $row[] = $value->approved_by ?? '<span class="label label-danger label-pill label-inline" style="min-width:70px !important;">Not Approved Yet</span>';
                    $row[] = LEAVE_STATUS_LABEL[$value->status];
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

    public function create()
    {
        if (permission('generate-salary-add')) {
            $this->setPageData('Add Employee Payslip', 'Add Employee Payslip', 'fab fa-opencart', [['name' => 'Add Employee Payslip']]);
            $employees = Employee::where('activation_status', '1')->get();
            return view('hrm::generate-salary.create', compact('employees'));
        } else {
            return response()->json($this->unauthorized());
        }
    }

    public function getEmployees(Request $request)
    {
        if ($request->ajax()) {
            if (permission('generate-salary-add')) {
                $idArray = $request->id;
                $month = $request->month;
                $year = $request->year;
                if (in_array("0", $idArray)) {
                    $employees = Employee::with('department', 'salary', 'salary.shift')->where('activation_status', '1')
                        ->get();
                } else {
                    $employees = Employee::with('designation', 'department', 'branch', 'salary', 'salary.shift')->where('activation_status', '1')->whereIn('id', $idArray)->get();
                }
                return view('hrm::generate-salary.entry', compact('employees', 'month', 'year'))->render();
            }
        }
    }

    public function edit(Request $request)
    {
        if ($request->ajax()) {
            if (permission('generate-salary-edit')) {
                $data = $this->model->findOrFail($request->id);
                return $data;
            }
        }
    }

    public function view(Request $request)
    {
        if ($request->ajax()) {
            if (permission('generate-salary-view')) {
                $data = $this->model->with('employee', 'shift')->findOrFail($request->id);
                return view('hrm::generate-salary.modal-data', compact('data'))->render();
            }
        }
    }

    public function storeOrUpdate(SalaryGenerateFormRequest $request)
    {
        if ($request->ajax()) {
            if (permission('generate-salary-add') || permission('generate-salary-edit')) {
                $salary = [];
                foreach ($request->salary as $value) {
                    $salary[] = [
                        'employee_id' => $value['employee_id'],
                        'shift_id' => $value['shift_id'],
                        'month' => $request->month_id,
                        'year' => $request->year_id,
                        'total_working_days' => $value['total_working_days'],
                        'total_holidays' => $value['total_holidays'],
                        'total_attended' => $value['total_attended'],
                        'total_paid_leaves' => $value['total_paid_leaves'],
                        'total_unpaid_leaves' => $value['total_unpaid_leaves'],
                        'total_working_hours' => $value['total_working_hours'],
                        'total_attended_hours' => $value['total_attended_hours'],
                        'increment_salary' => $value['increment_salary'],
                        'current_salary' => $value['current_salary'],
                        'gross_salary' => $value['gross_salary'],
                        'net_salary' => $value['net_salary'],
                        'created_by' => auth()->user()->username,
                        'status' => 1
                    ];
                }
                $this->model->insert($salary);
                $output = ['status' => 'success', 'message' => 'Salary added successfully'];
            } else {
                $output = $this->unauthorized();
            }
            return response()->json($output);
        } else {
            return response()->json($this->unauthorized());
        }
    }

    public function delete(Request $request)
    {
        if ($request->ajax()) {
            if (permission('generate-salary-change-status')) {
                $result = $this->model->find($request->id);
                $result->update([
                    'status' => '3',
                    'deleted_by' => auth()->user()->username,
                ]);
                $output = $this->delete_message($result);
            } else {
                $output = $this->unauthorized();
            }
            return response()->json($output);
        } else {
            return response()->json($this->unauthorized());
        }
    }

    public function approve($id)
    {
        if (permission('generate-salary-change-status')) {
            $result = $this->model->find($id);
            $result->update([
                'status' => '2',
                'approved_by' => auth()->user()->username,
            ]);
            $output = ['status' => 'success', 'message' => 'Payslip Approve Successful'];
        } else {
            $output = $this->unauthorized();
        }
        return redirect()->back()->with($output);
    }
}
