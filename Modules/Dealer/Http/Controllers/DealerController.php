<?php

namespace Modules\Dealer\Http\Controllers;

use Exception;
use App\Traits\UploadAble;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Modules\Dealer\Entities\Dealer;
use Modules\Product\Entities\Product;
use Modules\Location\Entities\Upazila;
use Modules\Location\Entities\District;
use Modules\Setting\Entities\Warehouse;
use App\Http\Controllers\BaseController;
use Modules\Account\Entities\Transaction;
use Modules\Account\Entities\ChartOfAccount;
use Modules\Dealer\Http\Requests\DealerFormRequest;

class DealerController extends BaseController
{
    use UploadAble;
    public function __construct(Dealer $model){
        $this->model = $model;
    }
    public function index(){
        if(permission('dealer-access')){
            $this->setPageData('Manage Dealer','Manage Dealer','far fa-user',[['name' => 'Manage Dealer']]);
            $data = ['districts' => District::where('parent_id',0)->pluck('name','id'),
            'upazilas' => Upazila::where('parent_id','<>',0)->pluck('name','id'),
            'warehouses'=> Warehouse::pluck('name','id')];
            return view('dealer::index',$data);
        }else{
            return $this->access_blocked();
        }
    }
    public function get_datatable_data(Request $request)
    {
        if($request->ajax()){
            if(permission('dealer-access')){

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

                if (!empty($request->warehouse_id)) {
                    $this->model->setWarehouseID($request->warehouse_id);
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


                $this->set_datatable_default_properties($request);//set datatable default properties
                $list = $this->model->getDatatableList();//get table data
                $data = [];
                $no = $request->input('start');
                foreach ($list as $value) {
                    $no++;
                    $action = '';
                    if(permission('dealer-edit')){
                        $action .= ' <a class="dropdown-item" href="'.route("dealer.edit",$value->id).'">'.self::ACTION_BUTTON['Edit'].'</a>';
                    }
                    if(permission('dealer-view')){
                        $action .= ' <a class="dropdown-item view_data" data-id="' . $value->id . '">'.self::ACTION_BUTTON['View'].'</a>';
                    }

                    if(permission('dealer-delete')){
                        $action .= ' <a class="dropdown-item delete_data"  data-id="' . $value->id . '" data-name="' . $value->name . '">'.self::ACTION_BUTTON['Delete'].'</a>';
                    }

                    if(!empty($value->avatar))
                    {
                        $avatar =  "<img src='".asset("storage/".DEALER_AVATAR_PATH.$value->avatar)."' alt='".$value->name."' style='width:50px;'/>";
                    }else{
                        $avatar =  "<img src='".asset("images/male.svg")."' alt='Default Image' style='width:50px;'/>";
                    }
                    $row = [];
                    if(permission('dealer-bulk-delete')){
                        $row[] = row_checkbox($value->id);//custom helper function to show the table each row checkbox
                    }
                    $row[] = $no;
                    $row[] = $avatar;
                    $row[] = $value->name.'<br><b>Mobile No.: </b>'.$value->mobile.($value->email ? '<br><b>Email: </b>'.$value->email : '');
                    $row[] = $value->shop_name;
                    $row[] = $value->username;
                    if(empty(auth()->user()->warehouse_id))
                    {
                        $row[] = $value->warehouse->name;
                    }
                    $row[] = $value->district->name;
                    $row[] = $value->upazila->name;
                    $row[] = permission('dealer-edit') ? change_status($value->id,$value->status, $value->name) : STATUS_LABEL[$value->status];
                    $row[] = $this->model->balance($value->id);
                    $row[] = action_button($action);//custom helper function for action button
                    $data[] = $row;
                }
                return $this->datatable_draw($request->input('draw'),$this->model->count_all(),
                $this->model->count_filtered(), $data);
            }
        }else{
            return response()->json($this->unauthorized());
        }
    }

    public function create()
    {
        if(permission('dealer-add')){
            $this->setPageData('Add Dealer','Add Dealer','fas fa-user',[['name' => 'Add Dealer']]);
            $data = [
                'products'  => Product::orderBy('id','DESC')->get(),
                'districts' => District::where('parent_id',0)->pluck('name','id'),
                'warehouses'=> Warehouse::pluck('name','id')
            ];
            return view('dealer::form',$data);
        }else{
            return $this->access_blocked();
        }
    }

    public function store_or_update_data(DealerFormRequest $request)
    {
        if($request->ajax()){
            if(permission('dealer-add')){
                // dd($request->all());
                DB::beginTransaction();
                try {
                    $collection = collect($request->validated())->except(['password','password_confirmation','avatar','products']);
                    $collection   = $this->track_data($collection,$request->update_id);
                    if(!empty($request->password)){
                        $collection   = $collection->merge(['password'=>bcrypt($request->password)]);
                    }
                    $avatar = $request->old_avatar;
                    if($request->hasFile('avatar')){
                        $avatar  = $this->upload_file($request->file('avatar'),DEALER_AVATAR_PATH);
                        if(!empty($request->old_avatar)){
                            $this->delete_file($request->old_avatar, DEALER_AVATAR_PATH);
                        }
                    }
                    $collection   = $collection->merge(compact('avatar'));

                    if($request->dealer_id)
                    {
                        $dealer = $this->model->with('products')->find($request->dealer_id);
                        $name = $dealer->name;
                        $dealer->products()->sync($this->model->dealer_products_data($request));
                        $dealer       = $dealer->update($collection->all());
                        if($request->name != $name){
                            $customer_coa = ChartOfAccount::where(['dealer_id'=>$request->dealer_id])->first();
                            if($customer_coa)
                            {
                                $customer_coa->update(['name'=>$request->name]);
                            }
                        }
                        ChartOfAccount::where('dealer_id', $request->dealer_id)->update([
                            'name'=>$request->name
                        ]);
                    }else{
                        $dealer       = $this->model->create($collection->all());
                        $coa_max_code = ChartOfAccount::where('level',4)->where('code','like','1020203%')->max('code');
                        $code         = $coa_max_code ? ($coa_max_code + 1) : 10202030001;
                        $dealer_coa   = ChartOfAccount::create($this->model->dealer_coa($code,$dealer->name,$dealer->id));

                        //Dealer Commissions
                        //monthly
                        $commission_monthly_maxcode = ChartOfAccount::where('level',3)->where('code','like','50205%')->max('code');
                        $monthlyCommissionCode = $commission_monthly_maxcode ? ($commission_monthly_maxcode + 1) : 502050001;
                        $dealer_monthly_commission = ChartOfAccount::create($this->model->dealer_monthly_commission_coa($monthlyCommissionCode,$dealer->name,$dealer->id));
                        //monthly
                        //yearly 
                        $commission_yearly_maxcode = ChartOfAccount::where('level',3)->where('code','like','50206%')->max('code');
                        $yearlyCommissionCode = $commission_yearly_maxcode ? ($commission_yearly_maxcode + 1) : 502060001;
                        $dealer_yearly_commission = ChartOfAccount::create($this->model->dealer_yearly_commission_coa($yearlyCommissionCode,$dealer->name,$dealer->id));
                        //yearly
                        //End Dealer Commissions
                        if(!empty($request->previous_balance))
                        {
                            if($dealer_coa){
                                $this->model->previous_balance_add($request->previous_balance,$dealer_coa->id,$dealer->name,$dealer->warehouse_id);
                            }
                        }
                        $dealer->products()->sync($this->model->dealer_products_data($request));
                        if(!$dealer)
                        {
                            if($request->hasFile('avatar')){
                                $this->delete_file($avatar, DEALER_AVATAR_PATH);
                            }
                        }
                    }

                    $output       = $this->store_message($dealer, $request->dealer_id);
                    DB::commit();
                } catch (Exception $e) {
                    DB::rollback();
                    $output = ['status' => 'error','message' => $e->getMessage()];
                }
            }else{
                $output       = $this->unauthorized();
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }

    public function edit(int $id)
    {
        if(permission('dealer-edit')){
            $this->setPageData('Edit Dealer','Edit Dealer','fas fa-user',[['name' => 'Edit Dealer']]);
            $warehouse_id = auth()->user()->warehouse_id;
            $dealer = $this->model->with('hasManyProducts')->where('id',$id)->when($warehouse_id,function($q) use ($warehouse_id){
                $q->where('warehouse_id',$warehouse_id);
            })->first();
            if($dealer){
                $data = [
                    'products'  => Product::with('unit')->get(),
                    'districts' => District::where('parent_id',0)->pluck('name','id'),
                    'warehouses'=> Warehouse::pluck('name','id'),
                    'dealer'    => $dealer
                ];
                return view('dealer::form',$data);
            }else{
                return redirect()->back()->with('error','No Data Found!');
            }
        }else{
            return $this->access_blocked();
        }
    }

    public function show(Request $request)
    {
        if($request->ajax()){
            if(permission('dealer-view')){
                $dealer   = $this->model->with(['hasManyProducts','district','upazila','warehouse'])->findOrFail($request->id);
                return view('dealer::view-data',compact('dealer'))->render();
            }
        }
    }

    public function delete(Request $request)
    {
        if($request->ajax()){
            if(permission('dealer-delete')){
                DB::beginTransaction();
                try {
                    $total_sale_data = DB::table('sales')->where('dealer_id',$request->id)->get()->count();
                    if ($total_sale_data > 0) {
                        $output = ['status'=>'error','message'=>'This data cannot delete because it is related with others data.'];
                    } else {
                        $dealer_coa_id = ChartOfAccount::where('dealer_id',$request->id)->first();
                        Transaction::where('chart_of_account_id',$dealer_coa_id->id)->delete();
                        $dealer_coa_id->delete();
                        $result   = $this->model->find($request->id)->delete();
                        $output   = $this->delete_message($result);
                    }
                    DB::commit();
                } catch (Exception $e) {
                   DB::rollBack();
                   $output = ['status' => 'error','message' => $e->getMessage()];
                }
            }else{
                $output   = $this->unauthorized();
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }

    public function change_status(Request $request)
    {
        if($request->ajax()){
            if(permission('dealer-edit')){
                $result   = $this->model->find($request->id)->update(['status' => $request->status]);
                $output   = $result ? ['status' => 'success','message' => 'Status Has Been Changed Successfully']
                : ['status' => 'error','message' => 'Failed To Change Status'];
            }else{
                $output   = $this->unauthorized();
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }

    public function previous_balance(int $id)
    {
        $data = DB::table('transactions as t')
                ->leftjoin('chart_of_accounts as coa','t.chart_of_account_id','=','coa.id')
                ->select(DB::raw("SUM(t.debit) - SUM(t.credit) as balance"),'coa.id','coa.code')
                ->groupBy('t.chart_of_account_id')
                ->where('coa.dealer_id',$id)
                ->where('t.approve',1)
                ->first();
        $balance = $data ? $data->balance : 0;
        return  response()->json($balance);
    }

    public function upazila_wise_dealer_list(Request $request)
    {
        if($request->ajax()){
            $dealers  = $this->model->with('coa')->where([['status',1],['upazila_id',$request->upazila_id]])->orderBy('id','asc')->get();
            $output = '';
            if (!$dealers->isEmpty()){
                $output .= '<option value="">Select Please</option>';
                foreach ($dealers as $dealer){
                    $output .=  '<option value="'.$dealer->id.'" data-coaid="'.$dealer->coa->id.'" data-name="'.$dealer->name.'">'. $dealer->name.' - '.$dealer->mobile.'</option>';
                }
            }
            return $output;
        }
    }
    public function warehouseWiseDealerList(Request $request){
        if($request->ajax()){
            $warehouseId = $request->warehouse_id;
            $data = DB::table('dealers')
                ->select('id','name','shop_name','mobile')
                ->when($warehouseId, function($q) use ($warehouseId){
                    $q->where('warehouse_id',$warehouseId);
                })
                ->get();
            return response()->json($data);
        }
    }
}
