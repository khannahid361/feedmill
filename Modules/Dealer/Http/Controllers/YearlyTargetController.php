<?php

namespace Modules\Dealer\Http\Controllers;

use App\Http\Controllers\BaseController;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Modules\Dealer\Entities\Dealer;
use Modules\Dealer\Entities\YearlyTarget;
use Modules\Dealer\Http\Requests\CommissionYearlyFormRequest;

class YearlyTargetController extends BaseController
{
    public function __construct(YearlyTarget $model)
    {
        $this->model = $model;
    }
    public function index()
    {
        $this->setPageData('Manage Dealer Yearly Commission', 'Manage Dealer Yearly Commission', 'fas fa-money-check-alt', [['name' => 'Manage Dealer Yearly Commission']]);
        $data = [
            'dealers'  => Dealer::orderBy('id', 'DESC')->get()
        ];
        return view('dealer::yearly_target.index', $data);
    }

    public function create()
    {
        $this->setPageData('Add Dealer Yearly Commission', 'Add Dealer Yearly Commission', 'far fa-edit', [['name' => 'Add Dealer Yearly Commission']]);
        $data = [
            'dealers'  => Dealer::orderBy('id', 'DESC')->get()
        ];
        return view('dealer::yearly_target.create', $data);
    }

    public function store(CommissionYearlyFormRequest $request)
    {
        if ($request->ajax()) {
            DB::beginTransaction();
            try {
                $collection = [];
                if ($request->has('commission')) {

                    foreach ($request->commission as $com) {

                        if (!empty($com['dealer_id']) && !empty($com['qty']) && !empty($com['commission_amount'])) {
                            $existing = YearlyTarget::where(['dealer_id' => $com['dealer_id'], 'year' => $request->year])->first();
                            if(!empty($existing) && $existing->acheived_qty == 0)
                            {
                                $existing->delete();
                            }
                            if (empty($existing) || $existing->acheived_qty == 0) {
                            $collection[] = [
                                'dealer_id'         => $com['dealer_id'],
                                'year'              => $request->year,
                                'qty'               => $com['qty'],
                                'commission_amount' => $com['commission_amount'],
                                'created_at' => date("Y-m-d H:i:s"),
                                'created_by' => auth()->user()->name,
                                'modified_by' => auth()->user()->name,
                            ];
                        }
                    }
                    }
                }
                $data = YearlyTarget::insert($collection);
                $output = ['status' => 'success', 'message' => 'Yearly Target Commission Data Saved Successfully'];
                DB::commit();
            } catch (Exception $e) {
                DB::rollBack();
                $output = ['status' => 'error', 'message' => $e->getMessage()];
            }
            return response()->json($output);
        } else {
            $output = ['status' => 'error', 'message' => 'Failed To Save Commission Data'];
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
                    if (permission('dealer-edit') && $value->acheived_qty == 0) {
                        $action .= ' <a class="dropdown-item" href="' . route("dealer.yearly.commission.edit", $value->id) . '">' . self::ACTION_BUTTON['Edit'] . '</a>';
                    }
                    if (permission('dealer-view')) {
                        $action .= ' <a class="dropdown-item view_data" data-id="' . $value->id . '">' . self::ACTION_BUTTON['View'] . '</a>';
                    }
                    $row    = [];
                    $row[]  = $no;
                    $row[]  = $value->dealer->name ?? '';
                    $row[]  = $value->year;
                    $row[]  = $value->qty;
                    $row[]  = $value->acheived_qty;
                    $row[]  = $value->commission_amount;
                    $row[]  = $value->paid_amount;
                    $row[]  = $value->due_amount;
                    $row[]  = $value->created_by;
                    $row[]  = action_button($action);
                    $data[] = $row;
                }
                return $this->datatable_draw($request->input('draw'), $this->model->count_all(), $this->model->count_filtered(), $data);
            }
        } else {
            return response()->json($this->unauthorized());
        }
    }
    public function edit($id)
    {
        if (permission('dealer-edit')) {
            $this->setPageData('Edit Dealer Yearly Commission', 'Edit Dealer Yearly Commission', 'far fa-edit', [['name' => 'Edit Dealer Yearly Commission']]);
            $dealer = $this->model->with('dealer:id,name')->find($id);
            if ($dealer) {
                $data = [
                    'dealer'    => $dealer
                ];
                return view('dealer::yearly_target.edit', $data);
            } else {
                return redirect()->back()->with('error', 'No Data Found!');
            }
        } else {
            return $this->access_blocked();
        }
    }
    public function show(Request $request)
    {
        if ($request->ajax()) {
            if (permission('dealer-view')) {
                $dealer   = $this->model->with('dealer')->findOrFail($request->id);
                return view('dealer::yearly_target.view-data', compact('dealer'))->render();
            }
        }
    }
    public function update(CommissionYearlyFormRequest $request, $id)
    {
        if ($request->ajax()) {
            DB::beginTransaction();
            try {
                $data = YearlyTarget::where('id', $id)->update([
                    'dealer_id'         => $request->commission[0]['dealer_id'],
                    'year'              => $request->year,
                    'qty'               => $request->commission[0]['qty'],
                    'commission_amount' => $request->commission[0]['commission_amount'],
                    'updated_at' => date("Y-m-d H:i:s"),
                    'modified_by' => auth()->user()->name,
                ]);
                $output = ['status' => 'success', 'message' => 'Yearly Target Commission Data Updated Successfully'];
                DB::commit();
            } catch (Exception $e) {
                DB::rollBack();
                $output = ['status' => 'error', 'message' => $e->getMessage()];
            }
            return response()->json($output);
        } else {
            $output = ['status' => 'error', 'message' => 'Failed To Update Commission Data'];
            return response()->json($this->unauthorized());
        }
    }
}
