<?php

namespace Modules\HRM\Http\Controllers;

use App\Http\Controllers\BaseController;
use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Carbon;
use Modules\HRM\Entities\Employee;
use Modules\HRM\Entities\EmployeeAttendance;

class EmployeeAttendanceController extends BaseController
{
    public function __construct(EmployeeAttendance $model)
    {
        $this->model = $model;
    }
    public function index(){
        if(permission('employee-attendance-access')){
            $setTitle = __('file.Manage Employee Attendance');
            $this->setPageData($setTitle, $setTitle, 'far fa-handshake', [['name' => $setTitle]]);
            $deletable  = self::DELETABLE;
            $employee   = Employee::all();
            return view('hrm::attendance.employee.index',compact('deletable','employee'));
        }else{
            return $this->access_blocked();
        }
    }

    public function get_datatable_data(Request $request) {
        if($request->ajax()){
            if(permission('employee-attendance-access')){

                if (!empty($request->allowances_name)) {
                    $this->model->setName($request->allowances_name);
                }
                $this->set_datatable_default_properties($request);//set datatable default properties
                $list = $this->model->getDatatableList();//get table data

                $data = [];
                $no = $request->input('start');
                foreach ($list as $value) {
                    $in = Carbon::createFromFormat('H:i:s',$value->start_time);
                    $out =  Carbon::createFromFormat('H:i:s',$value->end_time);
                   $r = $in->diffAsCarbonInterval($out)->hours;
//                    return response()->json($r);

                    $no++;
                    $action = '';
                    if(permission('employee-attendance-edit')){
                        $action .= ' <a class="dropdown-item edit_data" data-id="' . $value->id . '">'.$this->actionButton('Edit').'</a>';
                    }
                    $row    = [];
                    $row[]  = $no;
                    $row[]  = $value->employee->name;
                    $row[]  = $value->attend_date;
                    $row[]  = $value->start_time;
                    $row[]  = $value->end_time;
                    $row[]  = $r - ($r -8);
                    $row[]  = $r -8 ;
                    $row[]  = $r;
                    $row[]  = action_button($action);//custom helper function for action button
                    $data[] = $row;
                }
                return $this->datatable_draw($request->input('draw'),$this->model->count_all(),
                    $this->model->count_filtered(), $data);
            }
        }else{
            return response()->json($this->unauthorized());
        }
    }

}
