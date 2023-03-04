<?php

namespace Modules\SalesMen\Http\Controllers;

use Exception;
use App\Traits\UploadAble;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Modules\ASM\Entities\ASM;
use Modules\Location\Entities\Area;
use Modules\Salary\Entities\SrSalary;
use Modules\SalesMen\Entities\Salesmen;
use Modules\SalesMen\Entities\SalesmenArea;
use Modules\Setting\Entities\Warehouse;
use App\Http\Controllers\BaseController;
use App\Models\User;
use Modules\Account\Entities\Transaction;
use Modules\Account\Entities\ChartOfAccount;
use Modules\SalesMen\Http\Requests\SalesMenFormRequest;

class SalesMenController extends BaseController{
    use UploadAble;
    public function __construct(Salesmen $model){
        $this->model = $model;
    }
    public function index(){
        if(permission('sr-access')){
            $this->setPageData('Sales Representative','Sales Representative','fas fa-user-secret',[['name' => 'Sales Representative']]);
            $warehouses      = Warehouse::with('district')->where('status',1)->get();
            $asms            = ASM::orderBy('id','DESC')->get();
            $locations       = DB::table('locations')->select('id','name','type')->where([['type','<>',4],['status',1]])->get();
            return view('salesmen::index',compact('warehouses','locations','asms'));
        }else{
            return $this->access_blocked();
        }
    }
    public function get_datatable_data(Request $request){
        if($request->ajax()){
            if (!empty($request->name)) {
                $this->model->setName($request->name);
            }
            if (!empty($request->phone)) {
                $this->model->setPhone($request->phone);
            }
            if (!empty($request->warehouse_id)) {
                $this->model->setWarehouseID($request->warehouse_id);
            }
            if (!empty($request->asm_id)) {
                $this->model->setASMID($request->asm_id);
            }
            if (!empty($request->district_id)) {
                $this->model->setDistrictID($request->district_id);
            }
            if (!empty($request->upazila_id)) {
                $this->model->setUpazilaID($request->upazila_id);
            }
            if (!empty($request->status)) {
                $this->model->setStatus($request->status);
            }
            $this->set_datatable_default_properties($request);
            $list = $this->model->getDatatableList();
            $data = [];
            $no = $request->input('start');
            $currency_symbol   = config('settings.currency_symbol');
            $currency_position = config('settings.currency_position');
            foreach ($list as $value) {
                $no++;
                $action = '';
                if(permission('sr-edit')){
                $action .= ' <a class="dropdown-item"  href="' . url('sales-representative/edit',$value->id) . '">'.self::ACTION_BUTTON['Edit'].'</a>';
                }
                if(permission('sr-view')){
                $action .= ' <a class="dropdown-item view_data" data-id="' . $value->id . '">'.self::ACTION_BUTTON['View'].'</a>';
                }
                if(permission('sr-delete')){
                $action .= ' <a class="dropdown-item delete_data"  data-id="' . $value->id . '" data-name="' . $value->name . '">'.self::ACTION_BUTTON['Delete'].'</a>';
                }
                $row     = [];
                $row[]   = $no;
                $row[]   = $this->table_image(SALESMEN_AVATAR_PATH,$value->avatar,$value->name,1);
                $row[]   = $value->name.'<br><b>Phone No.: </b>'.$value->phone.($value->email ? '<br><b>Email: </b>'.$value->email : '');
                $row[]   = $value->username;
                $row[]   = $value->warehouse->name;
                $row[]   = $value->asm->name;
                $row[]   = $value->district->name;
                $row[]   = $value->upazila->name;
                $row[]   = permission('sr-edit') ? change_status($value->id,$value->status, $value->name) : STATUS_LABEL[$value->status];
                $row[]   = number_format($value->salary,2);
                $row[]   = action_button($action);
                $data[]  = $row;
            }
            return $this->datatable_draw($request->input('draw'),$this->model->count_all(), $this->model->count_filtered(), $data);
        }else{
            return response()->json($this->unauthorized());
        }
    }
    public function create(){
        if(permission('sr-add')){
            $this->setPageData('Add Sales Representative','Add Sales Representative','fas fa-user-secret',[['name' => 'Add Sales Representative']]);
            $warehouses      = Warehouse::with('district')->where('status',1)->get();
            $asms            = ASM::with('warehouse')->get();
            return view('salesmen::create',compact('warehouses','asms'));
        }else{
            return $this->access_blocked();
        }
    }
    public function store_or_update_data(SalesMenFormRequest $request){
        if($request->ajax()){
            if(permission('sr-add') || permission('sr-edit')){
                DB::beginTransaction();
                try {
                    $collection   = collect($request->validated())->except('password','password_confirmation','district_name');
                    $collection   = $this->track_data($collection,$request->update_id);
                    $avatar = $request->old_avatar;
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
                    $salesmen     = $this->model->with('areas')->find($result->id);
                    $salesmen->areas()->sync($areas);
                    if(empty($request->update_id)) {
                        $coa_max_code      = ChartOfAccount::where('level',3)->where('code','like','50201%')->max('code');
                        $code              = $coa_max_code ? ($coa_max_code + 1) : $this->coa_head_code('default_supplier');
                        $head_name         = $salesmen->name;
                        $salesmen_coa_data = $this->salesmen_coa($code,$head_name,$salesmen->id);
                        $salesmen_coa      = ChartOfAccount::create($salesmen_coa_data);
                        if(!empty($request->previous_balance)) {
                            if($salesmen_coa){
                                $this->previous_balance_add($request->previous_balance,$salesmen_coa->id,$salesmen->name,$request->warehouse_id);
                            }
                        }
                    }else{
                        $new_head_name = $request->name;
                        $salesmen_coa = ChartOfAccount::where(['salesmen_id'=>$request->update_id])->first();
                        if($salesmen_coa) {
                            $salesmen_coa->update(['name'=>$new_head_name]);
                        }
                    }
                    $output   = $this->store_message($result, $request->update_id);
                    DB::commit();
                } catch (Exception $e) {
                    DB::rollBack();
                    $output   = ['status' => 'error','message' => $e->getMessage()];
                }
            }else{
                $output       = $this->unauthorized();
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }
    private function salesmen_coa(string $code,string $head_name,int $salesmen_id){
        return [
            'code'              => $code,
            'name'              => $head_name,
            'parent_name'       => 'Account Payable',
            'level'             => 3,
            'type'              => 'L',
            'transaction'       => 1,
            'general_ledger'    => 2,
            'salesmen_id'       => $salesmen_id,
            'budget'            => 2,
            'depreciation'      => 2,
            'depreciation_rate' => '0',
            'status'            => 1,
            'created_by'        => auth()->user()->name
        ];
    }
    private function previous_balance_add($balance, int $salesman_coa_id, string $salesman_name, $warehouse_id) {
        if(!empty($balance) && !empty($salesman_coa_id) && !empty($salesman_name)){
            $transaction_id = generator(10);
            $cosdr = array(
                'warehouse_id'        => $warehouse_id,
                'chart_of_account_id' => $salesman_coa_id,
                'voucher_no'          => $transaction_id,
                'voucher_type'        => 'PR Balance',
                'voucher_date'        => date("Y-m-d"),
                'description'         => 'Salesman '.$salesman_name.' previous due '.$balance,
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
    public function edit(int $id){
        if(permission('sr-edit')){
            $this->setPageData('Edit Sales Representative','Edit Sales Representative','fas fa-edit',[['name' => 'Edit Sales Representative']]);
            $warehouses      = Warehouse::with('district')->where('status',1)->get();
            $asms            = ASM::orderBy('id','DESC')->get();
            $salesman = $this->model->with('district','areas')->findOrFail($id);
            return view('salesmen::create',compact('warehouses','asms','salesman'));
        }else{
            return $this->access_blocked();
        }
    }
    public function show(Request $request){
        if($request->ajax()){
            if(permission('sr-view')){
                $salesmen   = $this->model->with('warehouse','asm','district','upazila','areas')->findOrFail($request->id);
                return view('salesmen::view-data',compact('salesmen'))->render();
            }
        }
    }
    public function delete(Request $request){
        if($request->ajax() && permission('sr-delete')){
            DB::beginTransaction();
            try{
                $salesman = $this->model->find($request->id);
                $salesman->areasList()->delete();
                $salesman->delete();
                $output  = ['status' => 'success','message' => 'Data Delete Successfully'];
                DB::commit();
            }catch (Exception $e) {
                DB::rollBack();
                $output       = ['status' => 'error','message' => $e->getMessage()];
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }
    public function bulk_delete(Request $request){
        if($request->ajax() && permission('sr-bulk-delete')){
            DB::beginTransaction();
            foreach ($request->ids as $id) {
                try{
                    $salesman = $this->model->find($id);
                    $salesman->areasList()->delete();
                    $salesman->delete();
                    $output  = ['status' => 'success','message' => 'Data Delete Successfully'];
                    DB::commit();
                }catch (Exception $e) {
                    DB::rollBack();
                    $output  = ['status' => 'error','message' => $e->getMessage()];
                }
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }
    public function change_status(Request $request){
        if($request->ajax()){
            if(permission('sr-edit')){
                $result   = $this->model->find($request->id)->update(['status' => $request->status]);
                $output   = $result ? ['status' => 'success','message' => 'Status Has Been Changed Successfully'] : ['status' => 'error','message' => 'Failed To Change Status'];
            }else{
                $output   = $this->unauthorized();
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }
    public function warehouse_wise_salesmen_list(int $warehouse_id){
        $salesmen = $this->model->where('warehouse_id',$warehouse_id)->pluck('name','id');
        return json_encode($salesmen);
    }
    public function due_amount(int $id){
        $due_amount = $this->model->salesmen_balance($id);
        if($due_amount < 0) {
            $due_amount = explode('-',$due_amount)[1];
        }
        return response()->json($due_amount);
    }
    public function upazilaList(Request $request){
        if($request->ajax()){
            $salesmen = Salesmen::where(['upazila_id' => $request->id])->first();
            return response()->json($salesmen);
        }
    }
    public function salesMenAreaList($id){
        $area = [];
        $salesmen = SalesmenArea::where(['salesmen_id' => $id])->get();
        foreach ($salesmen as $key => $value){
            $area[$key] = [
              'area_id'    => $value['area_id'],
              'area_name'  => Area::find($value['area_id'])->name,
            ];
        }
        return $area;
    }
}
