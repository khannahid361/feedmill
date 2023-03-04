<?php
namespace Modules\Report\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\BaseController;
use Modules\Customer\Entities\Customer;
use Modules\Report\Entities\CollectionReport;

class CollectionReportController extends BaseController
{

    public function __construct(CollectionReport $model)
    {
        $this->model = $model;
    }

    public function index()
    {
        if(permission('collection-report-access')){
            $this->setPageData('Collection Report','Collection Report','fas fa-file',[['name' => 'Collection Report']]);
            $data = [
                'customers'  => Customer::get(),
            ];
            return view('report::collection-report',$data);
        }else{
            return $this->access_blocked();
        }
    }

    public function get_datatable_data(Request $request)
    {
        if($request->ajax()){
            if (!empty($request->start_date)) {
                $this->model->setStartDate($request->start_date);
            }
            if (!empty($request->end_date)) {
                $this->model->setEndDate($request->end_date);
            }
            if (!empty($request->customer_id)) {
                $this->model->setCustomerID($request->customer_id);
            }
            $this->set_datatable_default_properties($request);//set datatable default properties
            $list = $this->model->getDatatableList();//get table data
            $data = [];
            $no = $request->input('start');
            foreach ($list as $value) {
                $no++;
                $row = [];
                $row[] = $no;
                $row[] = date('d-M-Y',strtotime($value->sale_date));
                $row[] = $value->salesman_name;
                $row[] = $value->memo_no;
                $row[] = $value->shop_name.' - '.$value->name;
                $row[] = number_format($value->paid_amount,2,'.','');
                $data[] = $row;
            }
            return $this->datatable_draw($request->input('draw'),$this->model->count_all(),
            $this->model->count_filtered(), $data);

        }else{
            return response()->json($this->unauthorized());
        }
    }
}
