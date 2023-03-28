<?php
namespace Modules\Report\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\BaseController;
use Modules\Report\Entities\TodaySalesReport;

class TodaySalesReportController extends BaseController{
    public function __construct(TodaySalesReport $model){
        $this->model = $model;
    }
    public function index(){
        if(permission('today-sales-report-access')){
            $this->setPageData('Today\'s Sales Report','Today\' Sales Report','fas fa-file',[['name' => 'Today\' Sales Report']]);
            $data = [
                'districts'   => DB::table('locations')->where([['status', 1],['parent_id',0]])->pluck('name','id'),
                'warehouses'  => DB::table('warehouses')->where('status',1)->pluck('name','id')
            ];
            return view('report::today-sales-report',$data);
        }else{
            return $this->access_blocked();
        }
    }
    public function get_datatable_data(Request $request){
        if($request->ajax()){
            if (!empty($request->memo_no)) {
                $this->model->setMemoNo($request->memo_no);
            }
            $this->set_datatable_default_properties($request);//set datatable default properties
            $list = $this->model->getDatatableList();//get table data
//            return response()->json($list);
            $data = [];
            $no   = $request->input('start');
            foreach ($list as $value) {
                $no++;
                $row = [];
                $row[] = $no;
                $row[] = $value->id;
                $row[] = 1;
                $row[] = 1;
                $row[] = 1;
                $row[] = 1;
                $row[] = 1;
                $data[] = $row;
            }
            return $this->datatable_draw($request->input('draw'),$this->model->count_all(),
                $this->model->count_filtered(), $data);
        }else{
            return response()->json($this->unauthorized());
        }
    }
}
