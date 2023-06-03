<?php

namespace Modules\Dealer\Http\Controllers;

use App\Http\Controllers\BaseController;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Modules\Dealer\Entities\Dealer;
use Modules\Dealer\Entities\MonthlyTarget;
use Modules\Dealer\Http\Requests\CommissionMonthlyFormRequest;

class MonthlyTargetController extends BaseController
{
    public function __construct(MonthlyTarget $model)
    {
        $this->model = $model;
    }
    public function index()
    {
        $this->setPageData('Manage Dealer Commission', 'Manage Dealer Commission', 'fas fa-money-check-alt', [['name' => 'Manage Dealer Commission']]);
        $data = [
            'dealers'  => Dealer::orderBy('id', 'DESC')->get()
        ];
        return view('dealer::monthly_target.index',$data);
    }

    public function create()
    {
        $this->setPageData('Add Dealer Monthly Commission', 'Add Dealer Monthly Commission', 'far fa-edit', [['name' => 'Add Dealer Monthly Commission']]);
        $data = [
            'dealers'  => Dealer::orderBy('id', 'DESC')->get()
        ];
        return view('dealer::monthly_target.create', $data);
    }

    public function store(CommissionMonthlyFormRequest $request)
    {
        if ($request->ajax()) {
            DB::beginTransaction();
            try {
                $collection = [];
                if ($request->has('commission')) {

                    foreach ($request->commission as $com) {

                        if (!empty($com['dealer_id']) && !empty($com['qty']) && !empty($com['commission_amount'])) {

                            $collection[] = [
                                'dealer_id'         => $com['dealer_id'],
                                'year'              => $request->year,
                                'month'             => $request->month,
                                'qty'               => $com['qty'],
                                'commission_amount' => $com['commission_amount'],
                                'created_at' => date("Y-m-d H:i:s"),
                                'created_by' => auth()->user()->name,
                                'modified_by' => auth()->user()->name,
                            ];
                        }
                    }
                }
                $data = MonthlyTarget::insert($collection);
                $output = ['status' => 'success', 'message' => 'Monthly Target Commission Data Saved Successfully'];
                DB::commit();
            } catch (Exception $e) {
                DB::rollBack();
                $output = ['status' => 'error', 'message' => $e->getMessage()];
            }
            return response()->json($output);
        } else {
            $output = ['status' => 'error', 'message' => 'Failed To Save Payment Data'];
            return response()->json($this->unauthorized());
        }
    }
    public function datatableData(Request $request)
    {
        if ($request->ajax()) {
            if (permission('dealer-add')) {
                if (!empty($request->dealer_id)) {
                    $this->model->setDealer($request->dealer_id);
                }
                if (!empty($request->month)) {
                    $this->model->month($request->month);
                }
                if (!empty($request->year)) {
                    $this->model->year($request->year);
                }
                $this->set_datatable_default_properties($request);
                $list = $this->model->getDatatableList();
                $data = [];
                $no = $request->input('start');
                foreach ($list as $value) {
                    $no++;
                    $action = '';
                    // if(permission('customer-receive-details')){
                    //     $action .= ' <a class="dropdown-item" href="'.route('customer.receive.show',['id' => $value->id ]).'">'.self::ACTION_BUTTON['View'].'</a>';
                    // }
                    // if(permission('customer-receive-delete')){
                    //     $action .= ' <a class="dropdown-item delete_data"  data-id="' . $value->voucher_no . '" data-name="' . $value->voucher_no . '">'.self::ACTION_BUTTON['Delete'].'</a>';
                    // }
                    $row    = [];
                    $row[]  = $no;
                    $row[]  = $value->dealer->name ?? '';
                    $row[]  = $value->year;
                    $row[]  = $value->month;
                    $row[]  = $value->qty;
                    $row[]  = $value->acheived_qty;
                    $row[]  = $value->commission_amount;
                    $row[]  = $value->paid_amount;
                    $row[]  = $value->due_amount;
                    $row[]  = $value->created_by;
                    $row[]  = $action;
                    $data[] = $row;
                }
                return $this->datatable_draw($request->input('draw'), $this->model->count_all(), $this->model->count_filtered(), $data);
            }
        } else {
            return response()->json($this->unauthorized());
        }
    }
}
