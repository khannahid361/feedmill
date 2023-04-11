<?php

namespace Modules\Report\Http\Controllers;

use App\Http\Controllers\BaseController;
use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Modules\Report\Entities\CustomerDueReport;
use Modules\Setting\Entities\CustomerGroup;
use Modules\Setting\Entities\Warehouse;

class CustomerDueReportController extends BaseController
{
    public function __construct(CustomerDueReport $model){
        $this->model = $model;
    }
    public function index(){
        if(permission('customer-due-report-access')){
            $this->setPageData('Customer Due Report','Customer Due Report','far fa-handshake',[['name'=>'Customer Due Report']]);
            $data = [
                'warehouses'      => Warehouse::where('status',1)->pluck('name','id'),
                'customer_groups' => CustomerGroup::where('status',1)->get(),
                'locations'       => DB::table('locations')->where('status', 1)->get(),
            ];
            return view('report::customer-due-report',$data);
        }else{
            return $this->access_blocked();
        }
    }

    public function get_datatable_data(Request $request){
        if($request->ajax()){
            if(permission('customer-due-report-access')){

                if (!empty($request->name)) {
                    $this->model->setName($request->name);
                }
                if (!empty($request->shop_name)) {
                    $this->model->setShopName($request->shop_name);
                }
                if (!empty($request->mobile)) {
                    $this->model->setMobile($request->mobile);
                }
                if (!empty($request->email)) {
                    $this->model->setEmail($request->email);
                }
                if (!empty($request->customer_group_id)) {
                    $this->model->setCustomerGroupID($request->customer_group_id);
                }
                if (!empty($request->warehouse_id)) {
                    $this->model->setWarehouseID($request->district_id);
                }
                if (!empty($request->district_id)) {
                    $this->model->setDistrictID($request->district_id);
                }
                if (!empty($request->area_id)) {
                    $this->model->setAreaID($request->area_id);
                }
                if (!empty($request->upazila_id)) {
                    $this->model->setUpazilaID($request->upazila_id);
                }
                if (!empty($request->status)) {
                    $this->model->setStatus($request->status);
                }

                $this->set_datatable_default_properties($request);//set datatable default properties
                $list = $this->model->getDatatableList();//get table data
                $data = [];
                $no = $request->input('start');
                foreach ($list as $value) {
                    $no++;
                    $row = [];
                    $row[] = $no;
                    $row[] = $value->name.'<br><b>Shop Name: </b>'.$value->shop_name.'<br><b>Mobile No.: </b>'.$value->mobile;
                    $row[] = $value->customer_group->group_name;
                    $row[] = $value->warehouse->name;
                    $row[] = $value->district->name;
                    $row[] = $value->area->name;
                    $row[] = $this->model->customer_balance($value->id);
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
