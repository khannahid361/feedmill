<?php

namespace Modules\HRM\Http\Controllers;

use App\Http\Controllers\BaseController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Modules\HRM\Entities\Employee;
use Modules\HRM\Entities\EmployeeLeave;
use Modules\HRM\Entities\LeaveCategory;
use Modules\HRM\Http\Requests\EmployeeLeaveFormRequest;

class EmployeeLeaveController extends BaseController
{
    public function __construct(EmployeeLeave $model)
    {
        $this->model = $model;
    }

    public function index()
    {
        if (permission('leave-access')) {
            $this->setPageData('Manage Employee Leave', 'Manage Employee Leave', 'fab fa-opencart', [['name' => 'Manage Employee Leave']]);
            $employees = Employee::where('activation_status', '1')->get();
            $leaveCategories = LeaveCategory::orderBy('id', 'asc')->get();
            return view('hrm::employee_leave.index', compact('employees', 'leaveCategories'));
        } else {
            return $this->access_blocked();
        }
    }

    public function get_datatable_data(Request $request)
    {
        if ($request->ajax()) {
            if (permission('leave-access')) {
                if (!empty($request->employee_id)) {
                    $this->model->setEmployee($request->employee_id);
                }
                if (!empty($request->leave_category_id)) {
                    $this->model->setLeaveCategory($request->leave_category_id);
                }
                if (!empty($request->start_date)) {
                    $this->model->setFromDate($request->start_date);
                }
                if (!empty($request->end_date)) {
                    $this->model->setToDate($request->end_date);
                }
                if (!empty($request->type)) {
                    $this->model->setType($request->type);
                }
                $this->set_datatable_default_properties($request);//set datatable default properties
                $list = $this->model->getDatatableList();//get table data
                $data = [];
                $no = $request->input('start');
                foreach ($list as $value) {
                    $no++;
                    $action = '';
                    if (permission('leave-view')) {
                        $action .= ' <a class="dropdown-item view-data" data-id="' . $value->id . '" data-name="' . $value->employee->name . '">' . self::ACTION_BUTTON['View'] . '</a>';
                    }
                    if (permission('leave-delete')) {
                        $action .= ' <a class="dropdown-item delete_data"  data-id="' . $value->id . '" data-name="' . $value->employee->name . '">' . self::ACTION_BUTTON['Delete'] . '</a>';
                    }
                    $row = [];
                    $row[] = $no;
                    $row[] = $value->employee->name;
                    $row[] = $value->leaveCategory->leave_category;
                    $row[] = 'From ' . date("d-m-Y", strtotime($value->start_date)) . ' To ' . date("d-m-Y", strtotime($value->end_date));
                    $row[] = $value->duration;
                    $row[] = $value->is_paid == 1 ? 'Paid' : 'Un-Paid';
                    $row[] = $value->created_by ?? '<span class="label label-danger label-pill label-inline" style="min-width:70px !important;">Not Modified Yet</span>';
                    $row[] = $value->modified_by ?? '<span class="label label-danger label-pill label-inline" style="min-width:70px !important;">Not Modified Yet</span>';
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

    public function view(Request $request)
    {
        if ($request->ajax()) {
            if (permission('leave-view')) {
                $data = $this->model->findOrFail($request->id);
                return view('hrm::holiday.view-modal-data', compact('data'))->render();
            }
        }
    }

    public function storeOrUpdate(EmployeeLeaveFormRequest $request)
    {
        if ($request->ajax()) {
            if (permission('leave-add') || permission('leave-edit')) {
                $collection   = collect($request->validated())->merge(['created_by' => Auth::user()->username]);
                $collection   = $this->track_data($collection,$request->update_id);
                $result       = $this->model->updateOrCreate(['id'=>$request->update_id],$collection->all());
                $output       = $this->store_message($result, $request->update_id);
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
            if (permission('leave-delete')) {
                $result = $this->model->find($request->id)->delete();
                $output = $this->delete_message($result);
            } else {
                $output = $this->unauthorized();
            }
            return response()->json($output);
        } else {
            return response()->json($this->unauthorized());
        }
    }
}
