<?php

namespace Modules\Purchase\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Exception;
use App\Models\Tax;
use App\Models\Unit;
use App\Traits\UploadAble;
use Illuminate\Http\Request;
use Modules\Material\Entities\Material;
use Modules\Purchase\Entities\MaterialPurchase;
use Modules\Purchase\Entities\Purchase;
use Modules\Setting\Entities\Warehouse;
use Modules\Supplier\Entities\Supplier;
use App\Http\Controllers\BaseController;
use Modules\Account\Entities\Transaction;
use Modules\Purchase\Entities\PurchasePayment;
use Modules\Material\Entities\WarehouseMaterial;
use Modules\Purchase\Http\Requests\PurchaseFormRequest;


class PurchaseController extends BaseController{
    use UploadAble;
    private const MEMO_NO = 1001;
    public function __construct(Purchase $model){
        $this->model = $model;
    }
    public function index(){
        if(permission('purchase-access')){
            $this->setPageData('Purchase Manage','Purchase Manage','fas fa-shopping-cart',[['name' => 'Purchase Manage']]);
            $suppliers = Supplier::all();

            return view('purchase::index',compact('suppliers'));
        }else{
            return $this->access_blocked();
        }
    }
    public function get_datatable_data(Request $request){
        if($request->ajax() && permission('purchase-access')){
            if (!empty($request->memo_no)) {
                $this->model->setMemoNo($request->memo_no);
            }
            if (!empty($request->from_date)) {
                $this->model->setFromDate($request->from_date);
            }
            if (!empty($request->to_date)) {
                $this->model->setToDate($request->to_date);
            }
            if (!empty($request->supplier_id)) {
                $this->model->setSupplierID($request->supplier_id);
            }
            if (!empty($request->purchase_status)) {
                $this->model->setPurchaseStatus($request->purchase_status);
            }
            if (!empty($request->payment_status)) {
                $this->model->setPaymentStatus($request->payment_status);
            }
            $this->set_datatable_default_properties($request);//set datatable default properties
            $list = $this->model->getDatatableList();//get table data
            $data = [];
            $no = $request->input('start');
            foreach ($list as $value) {
                $no++;
                $action = '';
                $productList = [];
                $products   = MaterialPurchase::where(['purchase_id' => $value->id])->get();
                if(permission('purchase-edit') && $value->purchase_status != 1 && $value->purchase_status != 2){
                    $action .= ' <a class="dropdown-item" href="'.route("purchase.edit",$value->id).'">'.self::ACTION_BUTTON['Edit'].'</a>';
                }
                if(permission('purchase-view')){
                    $action .= ' <a class="dropdown-item view_data" href="'.route("purchase.view",$value->id).'">'.self::ACTION_BUTTON['View'].'</a>';
                }
                if($value->document) {
                    $action .= '<a class="dropdown-item" href="'.asset('storage/'.PURCHASE_DOCUMENT_PATH.$value->document).'" download><i class="fas fa-download mr-2"></i> Document</a>';
                }
                // if(permission('purchase-payment-add') && $value->purchase_status == 1 && ($value->grand_total - $value->paid_amount) != 0){
                //     $action .= ' <a class="dropdown-item add_payment" data-id="'.$value->id.'" data-due="'.($value->grand_total - $value->paid_amount).'"><i class="fas fa-plus-square text-info mr-2"></i> Add Payment</a>';
                // }
                // if(permission('purchase-payment-view') && $value->purchase_status == 1){
                //     $action .= ' <a class="dropdown-item view_payment_list"  data-id="'.$value->id.'"><i class="fas fa-file-invoice-dollar text-dark mr-2"></i> Payment List</a>';
                // }
                if(permission('purchase-change-status') && $value->purchase_status != 1 && $value->purchase_status != 2){
                    $action .= ' <a class="dropdown-item change_status"  data-id="' . $value->id . '" data-name="' . $value->memo_no . '" data-status="'.$value->purchase_status.'"><i class="fas fa-check-circle text-success mr-2"></i> Change Status</a>';
                }
                if(permission('purchase-delete') && $value->purchase_status != 1 && $value->purchase_status != 2){
                    $action .= ' <a class="dropdown-item delete_data"  data-id="' . $value->id . '" data-name="' . $value->chalan_no . '">'.self::ACTION_BUTTON['Delete'].'</a>';
                }
                foreach ($products as $item){
                    $i = $item->qty + $item->free_qty;
                    $productList[] = $item->material->material_name.' ( '. $i .')';
                }
                $productImplode =implode('<br/>',$productList);
                $row   = [];
                $row[] = $value->memo_no;
                $row[] = $value->supplier->name.''.($value->supplier->mobile ? ' - '.$value->supplier->mobile : '');
                $row[] = $value->item.'('.$value->total_qty.')';
                $row[] = $productImplode;
                $row[] = number_format($value->total_cost,2);
                $row[] = number_format($value->grand_total,2);
                // $row[] = number_format($value->paid_amount,2);
                // $row[] = number_format(($value->grand_total - $value->paid_amount),2);
                $row[] = date(config('settings.date_format'),strtotime($value->purchase_date));
                $row[] = PURCHASE_STATUS_LABEL[$value->purchase_status];
                // $row[] = PAYMENT_STATUS_LABEL[$value->payment_status];
                $row[] = action_button($action);
                $data[]= $row;
            }
            return $this->datatable_draw($request->input('draw'),$this->model->count_all(), $this->model->count_filtered(), $data);
        }else{
            return response()->json($this->unauthorized());
        }
    }
    public function create(){
        if(permission('purchase-add')){
            $this->setPageData('Add Purchase','Add Purchase','fas fa-shopping-cart',[['name' => 'Add Purchase']]);
            $purchase = $this->model->select('memo_no')->orderBy('memo_no','desc')->first();
            $material = Material::get();
            $data = [
                'warehouses' => Warehouse::all(),
                'suppliers'  => Supplier::all(),
                'taxes'      => Tax::activeTaxes(),
                'materials'  => $material,
                'memo_no'    => 'PINV-'.($purchase ? explode('PINV-',$purchase->memo_no)[1] + 1 : self::MEMO_NO)
            ];
            return view('purchase::create',$data);
        }else{
            return $this->access_blocked();
        }
    }
    public function store(PurchaseFormRequest $request){
        if($request->ajax() && permission('purchase-add')){
            DB::beginTransaction();
            try{
                $materials = [];
                $collection = collect($request->all())->except('_token','materials','document','payment_method','account_id','cheque_number')->merge(['payment_method' => !empty($request->payment_method) ? $request->payment_method : 1 ,'account_id' => !empty($request->account_id) ? $request->account_id : 23 , 'cheque_number' => !empty($request->cheque_number) ? $request->cheque_number : 0 , 'created_by' => auth()->user()->name]);
                if($request->hasFile('document')){
                    $document     = $this->upload_file($request->file('document'),PURCHASE_DOCUMENT_PATH);
                    $collection   = $collection->merge(compact('document'));
                }
                if($request->has('materials')) {
                    foreach ($request->materials as $key => $value) {
                        if(!empty($value['qty'])){
                            $unit = Unit::where('unit_name',$value['unit'])->first();
                            $material = Material::find($value['id']);
                            $materials[$value['id']] = [
                                'qty'              => $value['qty'],
                                'received'         => $value['received'],
                                'purchase_unit_id' => $unit ? $unit->id : null,
                                'net_unit_cost'    => $value['net_unit_cost'],
                                'new_unit_cost'    => $value['net_unit_cost'],
                                'old_cost'         => $material->cost,
                                'discount'         => $value['discount'],
                                'tax_rate'         => $value['tax_rate'],
                                'tax'              => $value['tax'],
                                'total'            => $value['subtotal']
                            ];
                        }
                    }
                }
                $result   = $this->model->create($collection->all());
                $purchase = $this->model->with('purchase_materials')->find($result->id);
                $purchase->purchase_materials()->sync($materials);
                if($request->purchase_status == 1){
                    $this->changeStatus($result->id,$request->purchase_status);
                }
                $output = ['status' => 'success','message' => 'Data Saved Successfully'];
                DB::commit();
            }catch (Exception $e){
                DB::rollBack();
                $output = ['status' => 'error','message' => $e->getMessage()];
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }
    public function show(int $id){
        if(permission('purchase-view')){
            $this->setPageData('Purchase Details','Purchase Details','fas fa-file',[['name'=>'Purchase','link' => route('purchase')],['name' => 'Purchase Details']]);
            $purchase = $this->model->with('purchase_materials','supplier')->find($id);
            return view('purchase::details',compact('purchase'));
        }else{
            return $this->access_blocked();
        }
    }
    public function edit(int $id){
        if(permission('purchase-edit')){
            $this->setPageData('Edit Purchase','Edit Purchase','fas fa-edit',[['name'=>'Purchase','link' => route('purchase')],['name' => 'Edit Purchase']]);
            $data = [
                'warehouses' => Warehouse::all(),
                'purchase'   => $this->model->with('purchase_materials','supplier')->find($id),
                'taxes'      => Tax::activeTaxes(),
                'materials'  => Material::get()
            ];
            return view('purchase::edit',$data);
        }else{
            return $this->access_blocked();
        }
    }
    public function update(PurchaseFormRequest $request){
        if($request->ajax() && permission('purchase-edit')){
            DB::beginTransaction();
            try{
                $materials = [];
                $purchaseData = $this->model->with('purchase_materials')->find($request->purchase_id);
                $collection = collect($request->all())->except('_token','materials','document')->merge(['modified_by' => auth()->user()->name]);
                if($request->hasFile('document')){
                    $document     = $this->upload_file($request->file('document'),PURCHASE_DOCUMENT_PATH);
                    $collection   = $collection->merge(compact('document'));
                }
                if($request->has('materials')) {
                    foreach ($request->materials as $key => $value) {
                        if(!empty($value['qty'])){
                            $unit = Unit::where('unit_name',$value['unit'])->first();
                            $material = Material::find($value['id']);
                            $materials[$value['id']] = [
                                'qty'              => $value['qty'],
                                'received'         => $value['received'],
                                'purchase_unit_id' => $unit ? $unit->id : null,
                                'net_unit_cost'    => $value['net_unit_cost'],
                                'new_unit_cost'    => $value['net_unit_cost'],
                                'old_cost'         => $material->cost,
                                'discount'         => $value['discount'],
                                'tax_rate'         => $value['tax_rate'],
                                'tax'              => $value['tax'],
                                'total'            => $value['subtotal']
                            ];
                        }
                    }
                }
                $purchaseData->update($collection->all());
                $purchaseData->purchase_materials()->sync($materials);
                if($request->purchase_status == 1){
                    $this->changeStatus($purchaseData->id,$request->purchase_status);
                }
                $output = ['status' => 'success','message' => 'Data Update Successfully'];
                DB::commit();
            }catch (Exception $e){
                DB::rollBack();
                $output = ['status' => 'error','message' => $e->getMessage()];
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }
    public function changeStatus($id,$status){
        if(permission('purchase-change-status')){
            DB::beginTransaction();
            try{
                $purchase = $this->model->with('purchaseMaterialList')->find($id);
                // return response()->json($purchase);
                if($status == 1){
                    foreach ($purchase->purchaseMaterialList as $key => $value){
                        $supplier                  = Supplier::with('coa')->find($purchase->supplier_id);
                        $material                  = Material::find($value['material_id']);
                        $warehouseMaterialQuantity = WarehouseMaterial::where(['material_id' => $value['material_id']])->sum('qty');
                        $warehouse_material        = WarehouseMaterial::where(['warehouse_id' => $purchase->warehouse_id,'material_id'=>$value['material_id']])->first();
                        // $materialNewPrice          = (($warehouseMaterialQuantity * $material->cost) + ($value['qty'] * $value['net_unit_cost'])) / ( $warehouseMaterialQuantity + $value['qty']);

                        //warehouseMaterial Cost
                        $warehouseCost = $warehouseMaterialQuantity * $material->cost;

                        //purchaseMaterial cost
                        $currentMaterialQty = $value['qty'];
                        $currentMaterialRate = $value['net_unit_cost'];
                        $currentMaterialTotalCost = $value['total'];
                        $newMaterialTotalCost = ($purchase->grand_total * $currentMaterialTotalCost)/$purchase->total_cost;
                        $newWarehouseCost = $warehouseCost + $newMaterialTotalCost;

                        $materialNewPrice          = $newWarehouseCost / ( $warehouseMaterialQuantity + $value['qty']);

                        MaterialPurchase::where(['purchase_id' => $id,'material_id' => $value['material_id']])->first()->update([
                            'new_unit_cost' => $materialNewPrice
                        ]);
                        if(!empty($material)){
                            $material->update([
                               'qty'      => $material->qty + $value['qty'],
                               'cost'     => $materialNewPrice,
                               'old_cost' => $material->cost
                            ]);
                        }
                        if(!empty($warehouse_material)){
                            $warehouse_material->update([
                                'qty'  => $warehouse_material->qty + $value['qty']
                            ]);
                        }else{
                            WarehouseMaterial::create([
                                'warehouse_id' => $purchase->warehouse_id,
                                'material_id'  => $value['material_id'],
                                'qty'          => $value['qty']
                            ]);
                        }
                    }
                    $this->transaction($supplier->coa->id,$purchase->memo_no,$supplier->name,$purchase->purchase_date,$purchase->grand_total,$purchase->paid_amount,$purchase->account_id,$purchase->payment_method,$purchase->cheque_number,$purchase->id);
                }
                $purchase->update([ 'purchase_status' => $status ]);
                $output = ['status' => 'success','message' => 'Status Change Successfully'];
                DB::commit();
            }catch (Exception $e){
                DB::rollBack();
                $output = ['status' => 'error','message' => $e->getMessage()];
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }
    private function transaction($supplierCOAId,$memoNo,$supplierName,$purchaseDate,$purchaseGrandTotal,$paidAmount,$accountId,$paymentMethod,$chequeNumber,$purchaseId){
        $purchaseCOATransaction    = collect(['chart_of_account_id' => $supplierCOAId,'warehouse_id' => 1,'voucher_no' => $memoNo,'voucher_type' => 'Purchase','voucher_date' => $purchaseDate,'description' => 'Supplier'.$supplierName,'debit' => 0,'credit' => $purchaseGrandTotal,'posted' => 1,'approve' => 1,'created_by' => auth()->user()->name,'created_at' => date('Y-m-d H:i:s')]);
        $inventoryDebit            = collect(['chart_of_account_id' => DB::table('chart_of_accounts')->where('code', $this->coa_head_code('inventory'))->value('id'),'warehouse_id' => 1,'voucher_no' => $memoNo,'voucher_type' => 'Purchase','voucher_date' => $purchaseDate,'description' =>'Inventory Debit For Supplier '.$supplierName,'debit' => $purchaseGrandTotal,'credit' => 0,'posted' => 1,'approve' => 1,'created_by' => auth()->user()->name,'created_at' => date('Y-m-d H:i:s')]);
        $companyExpense            = collect([DB::table('chart_of_accounts')->where('code', $this->coa_head_code('material_purchase'))->value('id'),'warehouse_id' => 1,'voucher_no' => $memoNo,'voucher_type' => 'Purchase','voucher_date' => $purchaseDate,'description' =>'Company Credit For Supplier '.$supplierName,'debit' => $purchaseGrandTotal,'credit' => 0,'posted' => 1,'approve' => 1,'created_by' => auth()->user()->name,'created_at' => date('Y-m-d H:i:s')]);
        Transaction::insert([$purchaseCOATransaction->all(),$inventoryDebit->all(),$companyExpense->all()]);
        if($paidAmount > 0){
        $supplierDebit             = collect(['chart_of_account_id' => $supplierCOAId,'warehouse_id' => 1,'voucher_no' => $memoNo,'voucher_type' => 'Purchase','voucher_date' => $purchaseDate,'description' => 'Supplier'.$supplierName,'debit' => $paidAmount,'credit' => 0,'posted' => 1,'approve' => 1,'created_by' => auth()->user()->name,'created_at' => date('Y-m-d H:i:s')]);
        $payment                   = collect(['chart_of_account_id' => $accountId,'warehouse_id' => 1,'voucher_no' => $memoNo,'voucher_type' => 'Purchase','voucher_date' => $purchaseDate,'description' => 'Paid amount for Supplier'.$supplierName,'debit' => $paidAmount,'credit' => 0,'posted' => 1,'approve' => 1,'created_by' => auth()->user()->name,'created_at' => date('Y-m-d H:i:s')]);
        $supplierDebitTransaction  = Transaction::create($supplierDebit->all());
        $paymentTransaction        = Transaction::create($payment->all());
        if($supplierDebitTransaction && $paymentTransaction){
        $purchasePayment           = collect(['purchase_id' => $purchaseId,'account_id' => $accountId,'transaction' => $paymentTransaction->id,'supplier_debit_transaction_id' => $supplierDebitTransaction->id,'amount' => $paidAmount,'payment_method' => $paymentMethod,'cheque_no' => $chequeNumber,'created_by' => auth()->user()->name]);
        PurchasePayment::create($purchasePayment->all());
        }
        }
    }
    public function delete(Request $request){
        if($request->ajax() && permission('purchase-delete')){
            DB::beginTransaction();
            try {
                $purchaseData = Purchase::with('purchase_materials')->find($request->id);
                if(!$purchaseData->purchase_materials->isEmpty()) { $purchaseData->purchase_materials()->detach(); }
                $result = $purchaseData->delete();
                $output = $result ? ['status' => 'success','message' => 'Data has been deleted successfully'] : ['status' => 'error','message' => 'failed to delete data'];
                DB::commit();
            } catch (Exception $e) {
                DB::rollBack();
                $output = ['status'=>'error','message'=>$e->getMessage()];
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }
}
