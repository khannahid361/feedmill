<?php

namespace Modules\HRM\Http\Controllers;

use App\Http\Controllers\BaseController;
use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Modules\HRM\Entities\Employee;
use Modules\HRM\Entities\EmployeeSalaryPayment;
use Modules\HRM\Http\Requests\EmployeeSalaryPaymentFormRequest;

class EmployeeSalaryPaymnetController extends BaseController
{
    public function __construct(EmployeeSalaryPayment $model)
    {
        $this->model = $model;
    }

    public function index()
    {
        if (permission('employee-salary-payment-access')) {
            $this->setPageData('Manage Employee Payment', 'Manage Employee Payment', 'fab fa-opencart', [['name' => 'Manage Employee Payment']]);
            $employees = Employee::where('activation_status', '1')->get();
            return view('hrm::salary-payment.index', compact('employees', 'shifts'));
        } else {
            return $this->access_blocked();
        }
    }

    public function get_datatable_data(Request $request)
    {
        if ($request->ajax()) {
            if (permission('employee-salary-payment-access')) {
                if (!empty($request->employee_id)) {
                    $this->model->setEmployee($request->employee_id);
                }
                if (!empty($request->status)) {
                    $this->model->setStatus($request->status);
                }
                $this->set_datatable_default_properties($request); //set datatable default properties
                $list = $this->model->getDatatableList(); //get table data
                $data = [];
                $no = $request->input('start');
                foreach ($list as $value) {
                    $no++;
                    $action = '';
                    if (permission('employee-salary-payment-change-status') && $value->status == 1) {
                        $action .= ' <a class="dropdown-item" href="' . route("employee.salary.payment.approve", $value->id) . '">' . self::ACTION_BUTTON['Approve'] . '</a>';
                    }
                    if (permission('employee-salary-payment-delete') && $value->status == 1) {
                        $action .= ' <a class="dropdown-item delete-data" data-id="' . $value->id . '" data-name="' . $value->employee->name . '">' . self::ACTION_BUTTON['Delete'] . '</a>';
                    }
                    if (permission('employee-salary-payment-view')) {
                        $action .= ' <a class="dropdown-item view-data" data-id="' . $value->id . '" data-name="' . $value->employee->name . '">' . self::ACTION_BUTTON['View'] . '</a>';
                    }
                    if (permission('employee-salary-payment-edit')) {
                        $action .= ' <a class="dropdown-item" href="' . route("employee.salary.payment.edit", $value->id) . '">' . self::ACTION_BUTTON['Edit'] . '</a>';
                    }
                    $row = [];
                    $row[] = $no;
                    $row[] = $value->employee->name;
                    $row[] = $value->paid_amount;
                    $row[] = $value->coa->name;
                    $row[] = $value->created_by ?? '<span class="label label-danger label-pill label-inline" style="min-width:70px !important;">Not Created Yet</span>';
                    $row[] = $value->modified_by ?? '<span class="label label-danger label-pill label-inline" style="min-width:70px !important;">Not Modified Yet</span>';
                    $row[] = LEAVE_STATUS_LABEL[$value->status];
                    $row[] = action_button($action); //custom helper function for action button
                    $data[] = $row;
                }
                return $this->datatable_draw(
                    $request->input('draw'),
                    $this->model->count_all(),
                    $this->model->count_filtered(),
                    $data
                );
            }
        } else {
            return response()->json($this->unauthorized());
        }
    }

    public function create()
    {
        if (permission('employee-salary-payment-add')) {
            $this->setPageData('Add Employee Payslip', 'Add Employee Payslip', 'fab fa-opencart', [['name' => 'Add Employee Payslip']]);
            $employees = Employee::where('activation_status', '1')->get();
            return view('hrm::salary-payment.create', compact('employees'));
        } else {
            return response()->json($this->unauthorized());
        }
    }

    public function getEmployees(Request $request)
    {
        if ($request->ajax()) {
            if (permission('employee-salary-payment-add')) {
                $idArray = $request->id;
                $month = $request->month;
                $year = $request->year;
                if (in_array("0", $idArray)) {
                    $employees = Employee::with('department', 'salary', 'salary.shift')->where('activation_status', '1')
                        ->get();
                } else {
                    $employees = Employee::with('designation', 'department', 'branch', 'salary', 'salary.shift')->where('activation_status', '1')->whereIn('id', $idArray)->get();
                }
                return view('hrm::salary-payment.data', compact('employees', 'month', 'year'))->render();
            }
        }
    }

    public function edit(Request $request)
    {
        if ($request->ajax()) {
            if (permission('employee-salary-payment-edit')) {
                $data = $this->model->findOrFail($request->id);
                return $data;
            }
        }
    }

    public function view(Request $request)
    {
        if ($request->ajax()) {
            if (permission('employee-salary-payment-view')) {
                $data = $this->model->with('employee', 'shift')->findOrFail($request->id);
                return view('hrm::salary-payment.modal-data', compact('data'))->render();
            }
        }
    }

    public function storeOrUpdate(EmployeeSalaryPaymentFormRequest $request)
    {
        if ($request->ajax()) {
            if (permission('employee-salary-payment-add') || permission('employee-salary-payment-edit')) {
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
            if (permission('employee-salary-payment-change-status')) {
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
        if (permission('employee-salary-payment-change-status')) {
            DB::beginTransaction();
            try {
                $result = $this->model->find($id);
                $data = $result;
                $result->update([
                    'status' => '2',
                    'approved_by' => auth()->user()->username,
                ]);
                $employeeCoa = ChartOfAccount::where('employee_id', $data->employee_id)->first();
                // dd($employeeCoa);
                $this->generateSalary($employeeCoa->id, $data->year, $data->month, $data->employee->name, $data->net_salary);
                $output = ['status' => 'success', 'message' => 'Payslip Approve Successful'];
                DB::commit();
            } catch (\Exception $e) {
                DB::rollBack();
                $output = ['status' => 'error', 'message' => $e->getMessage()];
            }
        } else {
            $output = $this->unauthorized();
        }
        return redirect()->back()->with($output);
    }

    public function generateSalary($employe_coa, $year, $month, $employee_name, $net_salary)
    {
        $voucher_no = 'EMSALARY-' . date('ymd') . rand(1, 999);
        $voucher_date = date('Y-m-d');
        $monthName = date("F", mktime(0, 0, 0, $month, 1));
        $description = 'Monthly Salary Generated For the month of ' . $monthName . '-' . $year . ' For ' . $employee_name . '';
        $liability = [
            'chart_of_account_id' => 5,
            'warehouse_id' => 1,
            'voucher_no' => $voucher_no,
            'voucher_type' => 'Monthly_Salary',
            'voucher_date' => $voucher_date,
            'description' => $description,
            'debit' => $net_salary,
            'credit' => 0,
            'is_opening' => 2,
            'posted' => 1,
            'approve' => 1,
            'created_by' => auth()->user()->username
        ];
        $emp_ledger = [
            'chart_of_account_id' => 21,
            'warehouse_id' => 1,
            'voucher_no' => $voucher_no,
            'voucher_type' => 'Monthly_Salary',
            'voucher_date' => $voucher_date,
            'description' => $description,
            'debit' => $net_salary,
            'credit' => 0,
            'is_opening' => 2,
            'posted' => 1,
            'approve' => 1,
            'created_by' => auth()->user()->username
        ];
        $employee = [
            'chart_of_account_id' => $employe_coa,
            'warehouse_id' => 1,
            'voucher_no' => $voucher_no,
            'voucher_type' => 'Monthly_Salary',
            'voucher_date' => $voucher_date,
            'description' => $description,
            'debit' => 0,
            'credit' => $net_salary,
            'is_opening' => 2,
            'posted' => 1,
            'approve' => 1,
            'created_by' => auth()->user()->username
        ];
        Transaction::create($liability);
        Transaction::create($emp_ledger);
        Transaction::create($employee);
    }
}
