<?php

namespace Modules\Account\Http\Controllers\Report;

use Illuminate\Http\Request;
use App\Http\Controllers\BaseController;
use Modules\Account\Entities\Transaction;
use Modules\Account\Entities\ChartOfAccount;
use Modules\Setting\Entities\Warehouse;

class ProfitLossController extends BaseController{
    public function __construct(Transaction $model){
        $this->model = $model;
    }
    public function index(){
        if(permission('profit-loss-access')){
            $this->setPageData('Profit Loss','Profit Loss','far fa-money-bill-alt',[['name'=>'Accounts','link'=>'javascript::void(0);'],['name'=>'Report','link'=>'javascript::void(0);'],['name'=>'Profit Loss']]);
            $warehouses = Warehouse::all();
            return view('account::report.profit-loss.index',compact('warehouses'));
        }else{
            return $this->access_blocked();
        }
    }
    public function report(Request $request){
        if ($request->ajax()) {
            $data = [
                'start_date'         => $request->start_date ? $request->start_date : date('Y-m-d'),
                'end_date'           => $request->end_date ? $request->end_date : date('Y-m-d'),
                'asset_accounts'     => ChartOfAccount::where(['type'=>'I'])->orderBy('code','asc')->get(),
                'liability_accounts' => ChartOfAccount::where(['type'=>['E']])->orderBy('code','asc')->get(),
                'warehouse_id'       => $request->warehouseId,
            ];
            return view('account::report.profit-loss.report',$data)->render();
        }
    }
}
