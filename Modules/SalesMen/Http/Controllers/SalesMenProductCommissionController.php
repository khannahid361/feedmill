<?php

namespace Modules\SalesMen\Http\Controllers;


use Exception;
use App\Http\Controllers\BaseController;
use Illuminate\Support\Facades\DB;
use Modules\Product\Entities\Product;
use Modules\SalesMen\Entities\SalesmenProductCommission;
use Illuminate\Http\Request;

class SalesMenProductCommissionController extends BaseController {
    public function __construct(SalesmenProductCommission $model){
        $this->model = $model;
    }
    public function index(){
        if(permission('sr-product-commission-access')){
            $this->setPageData('Commission','Product Commission','fas fa-user-secret',[['name' => 'Product Commission']]);
            $products = Product::orderBy('id','DESC')->get();
            return view('salesmen::product-commission.index',compact('products'));
        }else{
            return $this->access_blocked();
        }
    }
    public function getDataTableData(Request $request){
        if($request->ajax() && permission('sr-product-commission-access')){
            if (!empty($request->product_id)) {
                $this->model->setProduct($request->product_id);
            }
            if (!empty($request->name)) {
                $this->model->setName($request->name);
            }
            $this->set_datatable_default_properties($request);
            $list = $this->model->getDatatableList();
            $data = [];
            $no = $request->input('start');
            foreach ($list as $value) {
                $no++;
                $action = '';
                if(permission('sr-product-commission-edit')){
                    $action .= ' <a class="dropdown-item edit_data" href="'.route("sr.product.commission.edit",$value->id).'">'.self::ACTION_BUTTON['Edit'].'</a>';
                }
                if(permission('sr-product-commission-view')){
                    $action .= ' <a class="dropdown-item" href="'.route("sr.product.commission.view",$value->id).'">'.self::ACTION_BUTTON['View'].'</a>';
                }
                if(permission('sr-product-commission-delete')){
                    $action .= ' <a class="dropdown-item delete_data"  data-id="' . $value->id . '" data-name="' . $value->name . '">'.self::ACTION_BUTTON['Delete'].'</a>';
                }
                $row    = [];
                $row[]  = $no;
                $row[]  = $value->name;
                $row[]  = Product::find($value->product_id)->name;
                $row[]  = $value->quantity . 'pcs';
                $row[]  = $value->commission_percent . '%';
                $row[]  = $value->commission_amount . 'TK';
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
        if(permission('sr-product-commission-add')){
            $this->setPageData('Product Commission','Product Commission Add','fas fa-user-secret',[['name' => 'Product Commission Add']]);
            $products = Product::orderBy('id','DESC')->get();
            return view('salesmen::product-commission.create',compact('products'));
        }else{
            return $this->access_blocked();
        }
    }
    public function store(Request $request){
        if($request->ajax() && permission('sr-product-commission-add')){
            DB::beginTransaction();
            try{
                $collection = collect($request->all())->except('_token')->merge(['created_by' => auth()->user()->name]);
                $this->model->create($collection->all());
                $output = ['status' => 'success' ,'message' => 'Data Saved Successfully'];
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
    public function show($id){
        if(permission('sr-product-commission-view')){
            $this->setPageData('Product Commission','Product Commission View','fas fa-user-secret',[['name' => 'Product Commission View']]);
            $data = [
                'details'  => $this->model->find($id),
            ];
            return view('salesmen::product-commission.show',$data);
        }else{
            return $this->access_blocked();
        }
    }
    public function edit($id){
        if(permission('sr-product-commission-edit')){
            $this->setPageData('Product Commission','Product Commission Edit','fas fa-user-secret',[['name' => 'Product Commission Edit']]);
            $data = [
              'details'  => $this->model->find($id),
              'products' => Product::orderBy('id','DESC')->get()
            ];
            return view('salesmen::product-commission.edit',$data);
        }else{
            return $this->access_blocked();
        }
    }
    public function update(Request $request){
        if($request->ajax() && permission('sr-product-commission-edit')){
            DB::beginTransaction();
            try{
                $collection = collect($request->all())->except('_token')->merge(['created_by' => auth()->user()->name]);
                $this->model->find($request->update_id)->update($collection->all());
                $output = ['status' => 'success','message' => 'Data Updated Successfully'];
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
    public function delete(Request $request){
        if($request->ajax() && permission('sr-product-commission-delete')){
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
