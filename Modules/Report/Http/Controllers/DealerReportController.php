<?php

namespace Modules\Report\Http\Controllers;

use App\Http\Controllers\BaseController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Modules\Report\Entities\DealerReport;

class DealerReportController extends BaseController{
    public function __construct(DealerReport $model){
        $this->model = $model;
    }
    public function index(){
        if(permission('dealer-report-access')){
            $this->setPageData('Dealer Report','Dealer Report','fas fa-file',[['name' => 'Dealer Report']]);
            $data = [
                'dealers'    => DB::table('dealers')->where([['status',1]])->select('name','id')->get()
            ];
            return view('report::dealer-report',$data);
        }else{
            return $this->access_blocked();
        }
    }
    public function get_datatable_data(Request $request)
    {
        if($request->ajax()){
            if (!empty($request->dealer_id)) {
                $this->model->setDealerID($request->dealer_id);
            }
            if (!empty($request->start_date)) {
                $this->model->setStartDate($request->start_date);
            }
            if (!empty($request->end_date)) {
                $this->model->setEndDate($request->end_date);
            }

            $this->set_datatable_default_properties($request);//set datatable default properties
            $list = $this->model->getDatatableList();//get table data

            $data = [];
            $debit = $credit = $balance = 0;
            foreach ($list as $key => $value) {
                $debit = $value->delaerDebit;
                $credit = $value->delaerCredit;
                $balance = $debit - $credit;
                $row = [];
                $row[] = $key+1;
                $row[] = $value->name;
                $row[] = $value->delaerDebit ? number_format($value->delaerDebit,2, '.', ',') :  number_format(0,2, '.', ',');
                $row[] = $value->delaerCredit ? number_format($value->delaerCredit,2, '.', ',') :  number_format(0,2, '.', ',');
                $row[] = number_format(($balance),2, '.', ',');
                $data[] = $row;
            }
            return $this->datatable_draw($request->input('draw'),$this->model->count_all(),
            $this->model->count_filtered(), $data);

        }else{
            return response()->json($this->unauthorized());
        }
    }

}
