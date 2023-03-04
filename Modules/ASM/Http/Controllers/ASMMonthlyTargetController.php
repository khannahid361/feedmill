<?php

namespace Modules\ASM\Http\Controllers;


use Exception;
use App\Http\Controllers\BaseController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Modules\Account\Entities\Transaction;
use Modules\ASM\Entities\ASM;
use Modules\ASM\Entities\ASMMonthlyTarget;
use Modules\ASM\Http\Requests\ASMMonthlyFormRequest;
use Modules\Setting\Entities\Warehouse;

class ASMMonthlyTargetController extends BaseController {
    public function __construct(ASMMonthlyTarget $model){
        $this->model = $model;
    }
    public function index(){
        if(permission('asm-monthly-target-access')){
            $this->setPageData('ASM Monthly Target','ASM Monthly Target','fas fa-user-secret',[['name' => 'ASM Monthly Target']]);
            $data = [
                'warehouses'        => Warehouse::where('status',1)->get(),
                'asm'               => ASM::orderBy('id','DESC')->get(),
            ];
            return view('asm::monthly-target.index',$data);
        }else{
            return $this->access_blocked();
        }
    }
    public function getDataTableData(Request $request){
        if($request->ajax()){
            if (!empty($request->asm_id)) {
                $this->model->setASMID($request->asm_id);
            }
            if (!empty($request->start_date)) {
                $this->model->setStartDate($request->start_date);
            }
            if (!empty($request->end_date)) {
                $this->model->setEndDate($request->end_date);
            }
            $this->set_datatable_default_properties($request);
            $list = $this->model->getDatatableList();
            $data = [];
            $no = $request->input('start');
            foreach ($list as $value) {
                $no++;
                $action = '';
                $asm    = ASM::find($value->asm_id);
                if(permission('asm-monthly-target-edit') && $value->closing_date != 0000-00-00){
                    $action .= ' <a class="dropdown-item edit_data"  data-id="' . $value->id . '">'.self::ACTION_BUTTON['Edit'].'</a>';
                }
                if(permission('asm-monthly-target-delete') && $value->closing_date != 0000-00-00){
                    $action .= ' <a class="dropdown-item delete_data"  data-id="' . $value->id . '" data-name="' . $asm->name . '">'.self::ACTION_BUTTON['Delete'].'</a>';
                }
                $row    = [];
                $row[]  = $no;
                $row[]  = date('F, Y',strtotime($value->start_date));
                $row[]  = $asm->name.'<br><b>Phone No.: </b>'.$asm->phone.'<br><b>MT Code: </b>'.$value->mtcode;
                $row[]  = number_format($value->target_value,2,'.',',');
                $row[]  = number_format($value->achieved_value,2,'.',',');
                $row[]  = $value->start_date ? date('d-m-Y',strtotime($value->start_date)) : '';
                $row[]  = $value->end_date ? date('d-m-Y',strtotime($value->end_date)) : '';
                $row[]  = $value->created_by;
                $row[]  = action_button($action);
                $data[] = $row;
            }
            return $this->datatable_draw($request->input('draw'),$this->model->count_all(), $this->model->count_filtered(), $data);
        }else{
            return response()->json($this->unauthorized());
        }
    }
    public function create(){
        if(permission('asm-monthly-target-add')){
            $this->setPageData('Add ASM Monthly Target','Add ASM Monthly Target','fas fa-user-secret',[['name' => 'Add ASM Monthly Target']]);
            $warehouses      = Warehouse::allWarehouses();
            return view('asm::monthly-target.create',compact('warehouses'));
        }else{
            return $this->access_blocked();
        }
    }
    public function edit(Request $request){
        if($request->ajax() && permission('asm-monthly-target-edit')){
            $monthly_target = ASMMonthlyTarget::find($request->id);
            $data = [
                'id'                => $monthly_target->id,
                'asm_id'            => $monthly_target->asm_id,
                'month'             => date('F',strtotime($monthly_target->start_date)),
                'start_date'        => $monthly_target->start_date,
                'end_date'          => $monthly_target->end_date,
                'target_value'      => $monthly_target->target_value,
            ];
            return response()->json($data);
        }else{
            return response()->json($this->unauthorized());
        }
    }
    public function store(ASMMonthlyFormRequest $request){
        if($request->ajax() && permission('asm-monthly-target-add')){
            DB::beginTransaction();
            try{
                $counter         = 0;
                $start_date      = date('Y-'.$request->month.'-01');
                $end_date        = date('Y-'.$request->month.'-t');
                foreach ($request->asm as $key => $value) {
                    $monthly_targets = [
                        'mtcode'          => 'ASMMT-'.date('ymdHis').($key+1),
                        'asm_id'          => $value['id'],
                        'target_value'    => $value['target_value'],
                        'start_date'      => $start_date,
                        'end_date'        => $end_date,
                        'created_by'      => auth()->user()->name,
                        'created_at'      => date('Y-m-d'),
                    ];
                    $result = ASMMonthlyTarget::updateOrCreate(['asm_id' => $value['id'],'start_date' => $start_date],$monthly_targets);
                    if($result) {
                        $counter++;
                    }
                }
                if($counter > 0) {
                    $output = ['status' => 'success','message' => 'Data Has Been Saved Successfully'];
                }else{
                    $output = ['status' => 'error','message' => 'Failed To Saved Data'];
                }
                DB::commit();
            } catch (Exception $e) {
                DB::rollBack();
                $output = ['status' => 'error','message' => $e->getMessage()];
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }
    public function update(ASMMonthlyFormRequest $request){
        if($request->ajax() && permission('asm-monthly-target-edit')){
            DB::beginTransaction();
            try {
                $result = $this->model->find($request->update_id)->update([
                    'target_value'    => $request->target_value,
                    'modified_by'     => auth()->user()->name,
                    'updated_at'      => date('Y-m-d'),
                ]);
                if($result) {
                    $output = ['status' => 'success','message' => 'Data Has Been Updated Successfully'];
                }else{
                    $output = ['status' => 'error','message' => 'Failed To Update Data'];
                }
                DB::commit();
            } catch (Exception $e) {
                DB::rollBack();
                $output = ['status' => 'error','message' => $e->getMessage()];
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }
    public function delete(Request $request){
        if($request->ajax() && permission('asm-monthly-target-delete')){
            DB::beginTransaction();
            try{
                $monthly_target   = $this->model->find($request->id);
                Transaction::where('voucher_no',$monthly_target->mtcode)->delete();
                $monthly_target->delete();
                $output = ['status' => 'success','message' => 'Data Has Been Deleted Successfully'];
                DB::commit();
            }catch (Exception $e) {
                DB::rollBack();
                $output = ['status' => 'error','message' => $e->getMessage()];
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }
}
