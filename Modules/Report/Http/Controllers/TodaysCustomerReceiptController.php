<?php
namespace Modules\Report\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\BaseController;
use Modules\Customer\Entities\Customer;
use Modules\Report\Entities\TodaysCustomerReceipt;

class TodaysCustomerReceiptController extends BaseController{
    public function __construct(TodaysCustomerReceipt $model){
        $this->model = $model;
    }
    public function index(){
        if(permission('todays-customer-receipt-access')){
            $this->setPageData('Today\'s Customer Receipt','Today\'s Customer Receipt','fas fa-file',[['name' => 'Today\'s Customer Receipt']]);
            $data = [
                'customers'   => Customer::with('coa')->get(),
            ];
            return view('report::todays-customer-receipt',$data);
        }else{
            return $this->access_blocked();
        }
    }

    public function get_datatable_data(Request $request){
        if($request->ajax()){
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
                $row[] = $value->shop_name.' - '.$value->customer_name;
                $row[] = $value->district_name;
                $row[] = $value->upazila_name;
                $row[] = $value->area_name;
                $row[] = $value->description;
                $row[] = number_format($value->credit,2);
                $data[] = $row;
            }
            return $this->datatable_draw($request->input('draw'),$this->model->count_all(), $this->model->count_filtered(), $data);
        }else{
            return response()->json($this->unauthorized());
        }
    }
}
