<?php

namespace Modules\SalesMen\Http\Controllers;

use Exception;
use App\Http\Controllers\BaseController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Modules\SalesMen\Entities\Salesmen;
use Modules\SalesMen\Entities\SalesmenProductCommission;
use Modules\SalesMen\Entities\SalesmenProductTarget;

class SalesMenProductTargetController extends BaseController {
    public function __construct(SalesmenProductTarget $model){
        $this->model = $model;
    }
    public function index(){
        if(permission('sr-product-target-access')){
            $this->setPageData('Target','Product Target','fas fa-user-secret',[['name' => 'Product Target']]);
            $data = [
              'salesmen'    => Salesmen::orderBy('id','DESC')->get(),
              'commissions' => SalesmenProductCommission::orderBy('id','DESC')->get()
            ];
            return view('salesmen::product-target.index',$data);
        }else{
            return $this->access_blocked();
        }
    }
    public function getDataTableData(Request $request){
        if($request->ajax() && permission('sr-product-target-access')){
            if (!empty($request->salesmen_id)) {
                $this->model->setSalesMen($request->salesmen_id);
            }
            $this->set_datatable_default_properties($request);
            $list = $this->model->getDatatableList();
            $data = [];
            $no = $request->input('start');
            foreach ($list as $value) {
                $no++;
                $action = '';
                if(permission('sr-product-target-edit')){
                    $action .= ' <a class="dropdown-item edit_data"  data-id="' . $value->id . '">'.self::ACTION_BUTTON['Edit'].'</a>';                }
                if(permission('sr-product-target-delete')){
                    $action .= ' <a class="dropdown-item delete_data"  data-id="' . $value->id . '" data-name="' . $value->start_date . '">'.self::ACTION_BUTTON['Delete'].'</a>';
                }
                $row    = [];
                $row[]  = $no;
                $row[]  = Salesmen::find($value->salesmen_id)->name;
                $row[]  = SalesmenProductCommission::find($value->product_commission_id)->name;
                $row[]  = number_format($value->achieved_value);
                $row[]  = $value->start_date;
                $row[]  = $value->end_date;
                $row[]  = $value->created_by;
                $row[]  = action_button($action);
                $data[] = $row;
            }
            return $this->datatable_draw($request->input('draw'),$this->model->count_all(),
                $this->model->count_filtered(), $data);
        }else{
            return response()->json($this->unauthorized());
        }
    }
    public function create(){
        if(permission('sr-product-target-add')){
            $this->setPageData('Target','Product Target Add','fas fa-user-secret',[['name' => 'Product Target Add']]);
            $data = [
              'salesmen'        => Salesmen::orderBy('id','DESC')->get(),
              'commissions'     => SalesmenProductCommission::orderBy('id','DESC')->get()
            ];
            return view('salesmen::product-target.create',$data);
        }else{
            return $this->access_blocked();
        }
    }
    public function store(Request $request){
        if($request->ajax() && permission('sr-product-target-add')){
            DB::beginTransaction();
            try{
                $target = [];
                if($request->has('target')){
                    foreach ($request->target as $key => $value){
                        if(!empty($value['salesmen_id']) && !empty($value['product_commission_id']) && !empty($value['start_date']) && !empty($value['end_date'])){
                            $target[] = [
                              'ptcode'                  => 'SPT-'.date('ymdHis').($key+1),
                              'salesmen_id'             => $value['salesmen_id'],
                              'product_commission_id'   => $value['product_commission_id'],
                              'start_date'              => $value['start_date'],
                              'end_date'                => $value['end_date'],
                              'created_by'              => auth()->user()->name
                            ];
                        }
                    }
                }
                SalesmenProductTarget::insert($target);
                $output = ['status' => 'success','message' => 'Data Saved Successfully'];
                DB::commit();
            }catch(Exception $e){
                DB::rollBack();
                $output = ['status' => 'error','message' => $e->getMessage()];
            }
            return response()->json($output);
        }else{
            return response()->json($this->access_blocked());
        }
    }
    public function edit(Request $request){
        if($request->ajax() && permission('sr-product-target-edit')){
            $details = SalesmenProductTarget::find($request->id);
            return response()->json($details);
        }else{
            return response()->json($this->access_blocked());
        }
    }
    public function update(Request $request){
        if($request->ajax() && permission('sr-product-target-edit')){
            DB::beginTransaction();
            try{
                if(!empty($request->salesmen_id) && !empty($request->product_commission_id) && !empty($request->start_date) && !empty($request->end_date)){
                    $collection = collect($request->all())->except('_token');
                    SalesmenProductTarget::find($request->update_id)->update($collection->all());
                }
                $output = ['status' => 'success','message' => 'Data Updated Successfully'];
                DB::commit();
            }catch(Exception $e){
                DB::rollBack();
                $output = ['status' => 'error','message' => $e->getMessage()];
            }
            return response()->json($output);
        }else{
            return response()->json($this->access_blocked());
        }
    }
    public function delete(Request $request){
        if($request->ajax() && permission('sr-product-target-delete')){
            DB::beginTransaction();
            try{
                $result   = $this->model->find($request->id)->delete();
                $output   = $this->delete_message($result);
                DB::commit();
            }catch(Exception $e){
                DB::rollBack();
                $output = ['status' => 'error','message' => $e->getMessage()];
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }
}
