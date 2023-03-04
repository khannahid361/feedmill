<?php

namespace Modules\ASM\Http\Controllers;

use Exception;
use App\Traits\UploadAble;
use App\Http\Controllers\BaseController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Modules\Account\Entities\ChartOfAccount;
use Modules\Account\Entities\Transaction;
use Modules\ASM\Entities\ASM;
use Modules\ASM\Http\Requests\ASMFormRequest;
use Modules\Setting\Entities\Warehouse;

class ASMController extends BaseController {
    use UploadAble;
    public function __construct(ASM $model){
        $this->model = $model;
    }
    public function index(){
        if(permission('asm-access')){
            $this->setPageData('ASM','ASM','fas fa-user-shield',[['name' => 'ASM']]);
            $data = [
              'warehouses'   => Warehouse::with('district')->where('status',1)->get(),
              'locations'    => DB::table('locations')->select('id','name','type')->where([['type','<>',4],['status',1]])->get()
            ];
            return view('asm::index',$data);
        }else{
            return $this->access_blocked();
        }
    }
    public function getDataTableData(Request $request){
        if($request->ajax() && permission('asm-access')){
            if (!empty($request->name)) {
                $this->model->setName($request->name);
            }
            if (!empty($request->phone)) {
                $this->model->setPhone($request->phone);
            }
            if (!empty($request->warehouse_id)) {
                $this->model->setWarehouseID($request->warehouse_id);
            }
            if (!empty($request->district_id)) {
                $this->model->setDistrictID($request->district_id);
            }
            if (!empty($request->upazila_id)) {
                $this->model->setUpazilaID($request->upazila_id);
            }
            $this->set_datatable_default_properties($request);
            $list               = $this->model->getDatatableList();
            $data               = [];
            $no                 = $request->input('start');
            $currency_symbol    = config('settings.currency_symbol');
            $currency_position  = config('settings.currency_position');
            foreach ($list as $value) {
                $no++;
                $action         = '';
                if(permission('asm-edit')){
                    $action .= ' <a class="dropdown-item"  href="' . url('asm/edit',$value->id) . '">'.self::ACTION_BUTTON['Edit'].'</a>';
                }
                if(permission('asm-view')){
                    $action .= ' <a class="dropdown-item view_data" data-id="' . $value->id . '">'.self::ACTION_BUTTON['View'].'</a>';
                }
                if(permission('asm-delete')){
                    $action .= ' <a class="dropdown-item delete_data"  data-id="' . $value->id . '" data-name="' . $value->name . '">'.self::ACTION_BUTTON['Delete'].'</a>';
                }
                $row     = [];
                $row[]   = $no;
                $row[]   = $this->table_image(SALESMEN_AVATAR_PATH,$value->avatar,$value->name,1);
                $row[]   = $value->name.'<br><b>Phone No.: </b>'.$value->phone.($value->email ? '<br><b>Email: </b>'.$value->email : '');
                $row[]   = $value->username;
                $row[]   = $value->warehouse->name;
                $row[]   = $value->district->name;
                $row[]   = $value->upazila->name;
                $row[]   = permission('sr-edit') ? change_status($value->id,$value->status, $value->name) : STATUS_LABEL[$value->status];
                $row[]   = number_format($value->salary,2);
                $row[]   = action_button($action);
                $data[]  = $row;
            }
            return $this->datatable_draw($request->input('draw'),$this->model->count_all(), $this->model->count_filtered(), $data);
        }else{
            return response()->json($this->access_blocked());
        }
    }
    public function create(){
        if(permission('asm-add')){
            $this->setPageData('Add ASM','Add ASM','fas fa-user-secret',[['name' => 'Add ASM']]);
            $warehouses      = Warehouse::with('district')->where('status',1)->get();
            return view('asm::create',compact('warehouses'));
        }else{
            return $this->access_blocked();
        }
    }
    public function storeOrUpdate(ASMFormRequest $request){
        if($request->ajax() && (permission('asm-add') || permission('asm-edit'))){
            DB::beginTransaction();
            try {
                $collection   = collect($request->validated())->except('password','password_confirmation','district_name');
                $collection   = $this->track_data($collection,$request->update_id);
                $avatar       = $request->old_avatar;
                if($request->hasFile('avatar')){
                    $avatar  = $this->upload_file($request->file('avatar'),SALESMEN_AVATAR_PATH);
                    if(!empty($request->old_avatar)){
                        $this->delete_file($request->old_avatar, SALESMEN_AVATAR_PATH);
                    }
                    $collection  = $collection->merge(compact('avatar'));
                }
                $areas = [];
                if($request->has('areas')) {
                    foreach ($request->areas as $key => $value) {
                        $areas[] = $value['id'];
                    }
                }
                if(!empty($request->password)){
                    $collection   = $collection->merge(['password'=>$request->password]);
                }
                $result       = $this->model->updateOrCreate(['id'=>$request->update_id],$collection->all());
                $asm          = $this->model->with('areas')->find($result->id);
                $asm->areas()->sync($areas);
                if(empty($request->update_id)) {
                    $coa_max_code      = ChartOfAccount::where('level',3)->where('code','like','50201%')->max('code');
                    $code              = $coa_max_code ? ($coa_max_code + 1) : $this->coa_head_code('default_supplier');
                    $head_name         = $asm->name;
                    $asm_coa_data      = $this->asmCOA($code,$head_name,$asm->id);
                    $asm_coa           = ChartOfAccount::create($asm_coa_data);
                    if(!empty($request->previous_balance)) {
                        if($asm_coa){
                            $this->previous_balance_add($request->previous_balance,$asm_coa->id,$asm->name,$request->warehouse_id);
                        }
                    }
                }else{
                    $new_head_name = $request->name;
                    $asm_coa       = ChartOfAccount::where(['asm_id'=>$request->update_id])->first();
                    if($asm_coa) {
                        $asm_coa->update(['name'=>$new_head_name]);
                    }
                }
                $output       = $this->store_message($result, $request->update_id);
                DB::commit();
            } catch (Exception $e) {
                DB::rollBack();
                $output       = ['status' => 'error','message' => $e->getMessage()];
            }
            return response()->json($output);
        }else{
            return $this->unauthorized();
        }
    }
    public function edit(int $id){
        if(permission('asm-edit')){
            $this->setPageData('Edit ASM','Edit ASM','fas fa-edit',[['name' => 'Edit ASM']]);
            $warehouses      = Warehouse::with('district')->where('status',1)->get();
            $asm             = $this->model->with('district','areas')->findOrFail($id);
            return view('asm::create',compact('warehouses','asm'));
        }else{
            return $this->access_blocked();
        }
    }
    public function show(Request $request){
        if($request->ajax() && permission('asm-show')){
            $asm   = $this->model->with('warehouse','district','upazila','areas')->findOrFail($request->id);
            return view('asm::view-data',compact('asm'))->render();
        }else{
            return $this->access_blocked();
        }
    }
    public function delete(Request $request){
        if($request->ajax() && permission('asm-delete')){
            DB::beginTransaction();
            try{
                $asm = $this->model->find($request->id);
                $asm->areasList()->delete();
                $asm->delete();
                $output  = ['status' => 'success','message' => 'Data Delete Successfully'];
                DB::commit();
            } catch (Exception $e) {
                DB::rollBack();
                $output       = ['status' => 'error','message' => $e->getMessage()];
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }
    private function asmCOA(string $code,string $head_name,int $asm_id){
        return [
            'code'              => $code,
            'name'              => $head_name,
            'parent_name'       => 'Account Payable',
            'level'             => 3,
            'type'              => 'L',
            'transaction'       => 1,
            'general_ledger'    => 2,
            'asm_id'            => $asm_id,
            'budget'            => 2,
            'depreciation'      => 2,
            'depreciation_rate' => '0',
            'status'            => 1,
            'created_by'        => auth()->user()->name
        ];
    }
    private function previous_balance_add($balance, int $asm_coa_id, string $asm_name, $warehouse_id) {
        if(!empty($balance) && !empty($asm_coa_id) && !empty($asm_name)){
            $transaction_id = generator(10);
            $cosdr = array(
                'warehouse_id'        => $warehouse_id,
                'chart_of_account_id' => $asm_coa_id,
                'voucher_no'          => $transaction_id,
                'voucher_type'        => 'PR Balance',
                'voucher_date'        => date("Y-m-d"),
                'description'         => 'ASM '.$asm_name.' previous due '.$balance,
                'debit'               => 0,
                'credit'              => $balance,
                'posted'              => 1,
                'approve'             => 1,
                'created_by'          => auth()->user()->name,
                'created_at'          => date('Y-m-d H:i:s')
            );
            Transaction::insert([ $cosdr ]);
        }
    }
    public function warehouseWiseASMList(int $warehouse_id){
        $asm = $this->model->where('warehouse_id',$warehouse_id)->pluck('name','id');
        return response()->json($asm);
//        return json_encode($asm);
    }
}
