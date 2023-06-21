<?php

namespace Modules\Sale\Http\Controllers;

use Exception;
use App\Models\Tax;
use App\Models\Unit;
use App\Traits\UploadAble;
use Illuminate\Http\Request;
use Modules\Account\Entities\ChartOfAccount;
use Modules\ASM\Entities\ASMMonthlyTarget;
use Modules\Sale\Entities\Delivery;
use Modules\Sale\Entities\DeliveryProduct;
use Modules\Sale\Entities\Sale;
use Illuminate\Support\Facades\DB;
use Modules\Product\Entities\Product;
use Modules\Sale\Entities\SaleProduct;
use Modules\Customer\Entities\Customer;
use Modules\SalesMen\Entities\Salesmen;
use App\Http\Controllers\BaseController;
use Modules\Account\Entities\Transaction;
use Modules\SalesMen\Entities\SalesmenMonthlyTarget;
use Modules\SalesMen\Entities\SalesmenProductCommission;
use Modules\SalesMen\Entities\SalesmenProductTarget;
use Modules\Setting\Entities\CustomerGroup;
use Modules\Product\Entities\WarehouseProduct;
use Modules\Sale\Http\Requests\SaleFormRequest;
use Modules\Sale\Http\Requests\SaleDeliveryFormRequest;
use Modules\Setting\Entities\Warehouse;


class SaleController extends BaseController{
    use UploadAble;
    public function __construct(Sale $model){
        $this->model = $model;
    }
    public function index(){
        if(permission('sale-access')){
            $this->setPageData('Sale Manage','Sale Manage','fab fa-opencart',[['name' => 'Sale Manage']]);
            $data = [
                'customer'    => DB::table('customers')->where([['status',1]])->select('name','id')->get(),
                'salesmen'    => DB::table('salesmen')->where([['status',1]])->select('name','id','phone')->get(),
                'locations'   => DB::table('locations')->where('status', 1)->get(),

            ];
            return view('sale::index',$data);
        }else{
            return $this->access_blocked();
        }
    }
    public function get_datatable_data(Request $request){
        if($request->ajax()){
            if(permission('sale-access')){
                if (!empty($request->memo_no)) {
                    $this->model->setInvoiceNo($request->memo_no);
                }
                if (!empty($request->start_date)) {
                    $this->model->setFromDate($request->start_date);
                }
                if (!empty($request->end_date)) {
                    $this->model->setToDate($request->end_date);
                }
                if (!empty($request->salesmen_id)) {
                    $this->model->setSalesmenID($request->salesmen_id);
                }
                if (!empty($request->customer_id)) {
                    $this->model->setCustomerID($request->customer_id);
                }
                if (!empty($request->payment_status)) {
                    $this->model->setPaymentStatus($request->payment_status);
                }
                $this->set_datatable_default_properties($request);
                $list = $this->model->getDatatableList();

//                return response()->json($list);
                $data = [];
                $no = $request->input('start');
                foreach ($list as $value) {
                    $v = $value->total_qty + $value->total_free_qty;
                    $no++;
                    $action = '';
                    $productList = [];
                    $deliveries = Delivery::where(['sale_id' => $value->id])->get();
                    $products   = SaleProduct::where(['sale_id' => $value->id])->get();
                    if (permission('sale-edit') && $value->status == 1) {
                        $action .= ' <a class="dropdown-item" href="'.route("sale.edit",$value->id).'">'.self::ACTION_BUTTON['Edit'].'</a>';
                    }
                    if (permission('sale-view')) {
                        $action .= ' <a class="dropdown-item view_data" href="'.route("sale.show",$value->id).'">'.self::ACTION_BUTTON['View'].'</a>';
                    }
                    if (permission('sale-status-change') && $value->status == 1) {
                        $action .= ' <a class="dropdown-item change_status" data-id="' . $value->id .'">'.self::ACTION_BUTTON['Change Status'].'</a>';
                    }
                    if($value->document) {
                        $action .= '<a class="dropdown-item" href="'.asset('storage/'.SALE_DOCUMENT_PATH.$value->document).'" download><i class="fas fa-download mr-2"></i> Document</a>';
                    }
                    if (permission('sale-delete') && $value->status == 1) {
                        $action .= ' <a class="dropdown-item delete_data"  data-id="' . $value->id . '" data-name="' . $value->memo_no . '">'.self::ACTION_BUTTON['Delete'].'</a>';
                    }
                    if(permission('sale-product-delivery') && $value->status == 2 && ($value->total_delivery_quantity != ($value->total_qty + $value->total_free_qty))){
                        $action .= ' <a class="dropdown-item" href="'.route("sale.product.delivery",$value->id).'"  data-id="' . $value->id . '"><i class="fas fa-truck text-info mr-2"></i> Delivery</a>';
                    }
                    foreach ($deliveries as $delivery){
                        $action .= ' <a class="dropdown-item" href="'.route("sale.product.delivery.invoice",$delivery->id).'"  data-id="' . $value->id . '"><i class="fas fa-receipt text-success mr-2"></i> Invoice('.$delivery->delivery_date.')</a>';
                    }
                    foreach ($products as $item){
                        $i = $item->qty + $item->free_qty;
                        $productList[] = $item->product->name.' ( '. $i .' pcs)';
                    }
                    $productImplode =implode('<br/>',$productList);
                    $row    = [];
                    $row[]  = $value->memo_no;
                    $row[]  = $value->shop_name.' ( '.$value->name.')';
                    $row[]  = $value->item.' ( '.$v.')';
                    $row[]  = $productImplode;
                    $row[]  =  $value->total_delivery_quantity;
                    $row[]  = number_format($value->total_price,2,'.','');
                    $row[]  = number_format($value->grand_total,2,'.','');
                    // $row[]  = number_format($value->paid_amount,2,'.','');
                    $row[]  = date('d-M-Y',strtotime($value->sale_date));
                    $row[]  = PAYMENT_STATUS_LABEL[$value->payment_status];
                    $row[]  = $value->total_qty + $value->total_free_qty == $value->total_delivery_quantity ? '<span class="label label-success label-pill label-inline" style="min-width:70px !important;">Complete</span>' : '<span class="label label-danger label-pill label-inline" style="min-width:70px !important;">Incomplete</span>';
                    $row[]  = SALE_STATUS[$value->status];
                    $row[]  = action_button($action);
                    $data[] = $row;
                }
                return $this->datatable_draw($request->input('draw'),$this->model->count_all(), $this->model->count_filtered(), $data);
            }
        }else{
            return response()->json($this->unauthorized());
        }
    }
    public function create(){

        if(permission('sale-add')){
            $this->setPageData('Add Sale','Add Sale','fas fa-shopping-cart',[['name' => 'Add Sale']]);
            $products = DB::table('warehouse_product as wp')
                ->join('products as p','wp.product_id','=','p.id')
                ->selectRaw('wp.*,p.name')
                ->groupBy('product_id')
                ->orderBy('p.name','asc')
                ->get();
            $data = [
                'products'       => $products,
                'customer'       => Customer::all(),
                'taxes'          => Tax::activeTaxes(),
                'salesmen'       => DB::table('salesmen')->where([['status',1]])->select('name','id','phone')->get(),
                'locations'      => DB::table('locations')->where('status', 1)->get(),
                'memo_no'        => 'SINV-'.date('ymd').rand(1,999),
                'warehouses'     => DB::table('warehouses')->where('status', 1)->pluck('name','id'),
            ];
            return view('sale::create',$data);
        }else{
            return $this->access_blocked();
        }
    }
    public function store(SaleFormRequest $request){
        if($request->ajax() && permission('sale-add')){
            DB::beginTransaction();
            try{
                $products   = [];
                $collection = collect($request->all())->except('_token','products')->merge(['total_delivery_quantity' => 0 ,'status' => 1,'created_by' => auth()->user()->name]);
                if($request->hasFile('document')){
                    $collection['document'] = $this->upload_file($request->file('document'),SALE_DOCUMENT_PATH);
                }
                $sale = Sale::create($collection->all());
                if($request->has('products')){
                    foreach ($request->products as $value){
                        if(!empty($value['id']) && !empty($value['qty'])){
                            $unit = Unit::where('unit_name',$value['unit'])->first();
                            $products[] = [
                                'sale_id'          => $sale->id,
                                'product_id'       => $value['id'],
                                'qty'              => $value['qty'],
                                'free_qty'         => $value['free_qty'],
                                'delivered_qty'    => 0,
                                'sale_unit_id'     => $unit ? $unit->id : null,
                                'net_unit_price'   => $value['net_unit_price'],
                                'discount'         => 0,
                                'tax_rate'         => $value['tax_rate'],
                                'tax'              => $value['tax'],
                                'total'            => $value['subtotal']
                            ];
                        }
                    }
                }
                SaleProduct::insert($products);
                $output = ['status' => 'success','message' => 'Data Saved Successfully'];
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
    public function show(int $id){
        if(permission('sale-view')){
            $this->setPageData('Sale Details','Sale Details','fas fa-file',[['name'=>'Sale','link' => route('sale')],['name' => 'Sale Details']]);
            $sale = $this->model->with('sale_products','customer')->find($id);
            return view('sale::details',compact('sale'));
        }else{
            return $this->access_blocked();
        }
    }
    public function edit(int $id){
        if(permission('sale-edit')){
            $this->setPageData('Edit Sale','Edit Sale','fas fa-edit',[['name'=>'Sale','link' => route('sale')],['name' => 'Edit Sale']]);
            $products = DB::table('warehouse_product as wp')
                ->join('products as p','wp.product_id','=','p.id')
                ->selectRaw('wp.*,p.name')
                ->groupBy('product_id')
                ->orderBy('p.name','asc')
                ->get();
                $sale =$this->model->with('sale_products','customer')->find($id);
                // return response()->json($sale);
            $data = [
                'products'     => $products,
                'sale'         => $this->model->with('sale_products','customer')->find($id),
                'taxes'        => Tax::activeTaxes(),
                'account' => ChartOfAccount::where('id',$sale->account_id)->first()
            ];

        //    return response()->json($data);
            return view('sale::edit',$data);
        }else{
            return $this->access_blocked();
        }
    }
    public function update(Request $request){
        if($request->ajax() && permission('sale-edit')){
            DB::beginTransaction();
            try{
                $saleUpdate =  $this->model->find($request->sale_id);
                $collection = collect($request->all())->except('_token','products')->merge(['modified_by' => auth()->user()->name]);
                if($request->hasFile('document')){
                    $collection['document'] = $this->upload_file($request->file('document'),SALE_DOCUMENT_PATH);
                }
                if($request->has('products')){
                    foreach ($request->products as $value){
                        if(!empty($value['id']) && !empty($value['qty'])){
                            $unit = Unit::where('unit_name',$value['unit'])->first();
                            $products[] = [
                                'sale_id'          => $saleUpdate->id,
                                'product_id'       => $value['id'],
                                'qty'              => $value['qty'],
                                'free_qty'         => $value['free_qty'],
                                'delivered_qty'    => 0,
                                'sale_unit_id'     => $unit ? $unit->id : null,
                                'net_unit_price'   => $value['net_unit_price'],
                                'discount'         => 0,
                                'tax_rate'         => $value['tax_rate'],
                                'tax'              => $value['tax'],
                                'total'            => $value['subtotal']
                            ];
                        }
                    }
                }
                SaleProduct::where(['sale_id' => $request->sale_id])->delete();
                $saleUpdate->update($collection->all());
                SaleProduct::insert($products);
                $output = ['status' => 'success','message' => 'Data Updated Successfully' ];
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
    public function changeStatus(Request $request){

        if($request->ajax() && permission('sale-status-change')){
            DB::beginTransaction();
            try{
                $sale = $this->model->with('SaleProductList')->find($request->id);

                if($request->sale_status == 2) {
                    $customer              = Customer::find($sale->customer_id);

                    $customerAccountId     = ChartOfAccount::where(['customer_id' => $sale->customer_id])->first();

                    $paymentData = [
                        'payment_method' => $sale->payment_method ? $sale->payment_method : null,
                        'account_id'     => $sale->account_id ? $sale->account_id : null,
                        'paid_amount'    => $sale->paid_amount ? $sale->paid_amount : 0,
                    ];

                    $this->customerAccounts($customerAccountId, $sale->memo_no, $sale->sale_date, $customer->name, $sale->grand_total, $sale->total_tax, $paymentData);
                }

                $sale->update(['status' => $request->sale_status]);
                $output = ['status' => 'success','message' => 'Status Changed Successfully'];
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
    public function delivery($id){
        if(permission('sale-product-delivery')){
            $this->setPageData('Product Delivery','Product Delivery','fab fa-opencart',[['name' => 'Product Delivery']]);
            $details     = $this->model->with('customer')->find($id);
            $warehouses  =  Warehouse::where('status',1)->get();
            return view('sale::delivery',compact('details','warehouses'));
        }else{
            return $this->access_blocked();
        }
    }
    public function deliveryStore(Request $request){
        if($request->ajax() && permission('sale-product-delivery')){
            DB::beginTransaction();
            try{
                $deliveryProduct = [];
                $cost = 0;
                $collection = collect($request->all())->except('_token','deliveries');
                $delivery = Delivery::create($collection->all());
                $sale = $this->model->find($request->sale_id);
                if($request->has('deliveries')){
                    foreach ($request->deliveries as $key => $value){
                        if(!empty($value['product_id']) && !empty($value['stock_qty']) && !empty($value['delivery_qty']) && !empty($value['price'])){
                            $deliveryProduct[$key] = [
                                'delivery_id'     => $delivery->id,
                                'product_id'      => $value['product_id'],
                                'stock_qty'       => $value['stock_qty'],
                                'delivered_qty'   => $value['delivered_qty'],
                                'delivery_qty'    => $value['delivery_qty']
                            ];
                            $cost = $cost + ($value['delivery_qty'] * $value['price']);
                            $saleProduct = SaleProduct::where(['sale_id' => $request->sale_id,'product_id' => $value['product_id']])->first();
                            $saleProduct->update(['delivered_qty' => $saleProduct->delivered_qty + $value['delivery_qty'] ]);
                            $warehouseProduct = WarehouseProduct::where(['warehouse_id' => $request->warehouse_id,'product_id' => $value['product_id']])->first();
                            $warehouseProduct->update(['bag_qty' => $warehouseProduct->bag_qty - $value['delivery_qty']]);
                        }
                    }
                }
                DeliveryProduct::insert($deliveryProduct);
                $this->warehouseAccounts($request->warehouse_id,$sale->memo_no,$sale->sale_date,$cost);
                $sale->update(['total_delivery_quantity' => $sale->total_delivery_quantity + $request->total_delivery_quantity]);
                $output = ['status' => 'success','message' => 'Delivery Data Store Successfully'];
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
    public function productDeliveryAvailableList(Request $request){
        $data = [];
        $details = $this->model->with('SaleProductList')->find($request->sale_id);
        foreach ($details->saleProductList as $key => $value){
            $warehouseProduct = WarehouseProduct::where(['warehouse_id' => $request->warehouse_id , 'product_id' => $value['product_id']])->first();
            if(!empty($warehouseProduct)){
                $data[$key] = [
                    'product_name' => $warehouseProduct->product->name,
                    'product_id'   => $warehouseProduct->product_id,
                    'stock_qty'    => $warehouseProduct->bag_qty,
                    'order_qty'    => $value['qty'] + $value['free_qty'],
                    'delivered_qty'=> $value['delivered_qty'],
                    'price'        => $value['net_unit_price']
                ];
            }
        }
        return response()->json($data);
    }
    public function productDeliveryInvoice($id){
        $this->setPageData('Delivery Invoice','Delivery Invoice','fas fa-edit',[['name'=>'Sale','link' => route('sale')],['name' => 'Delivery Invoice']]);
        $details = Delivery::with('sale','deliveryProduct')->find($id);
        return view('sale::invoice',compact('details'));
    }
    public function delete(Request $request){
        if($request->ajax() && permission('sale-delete')){
            DB::beginTransaction();
            try{
                SaleProduct::where(['sale_id' => $request->id])->delete();
                $this->model->find($request->id)->delete();
                $output = ['status' => 'success','message' => 'Data Deleted Successfully'];
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

    private function customerAccounts($customerAccountId,$invoiceNo,$saleDate,$customerName,$grandTotal,$totalTax,$paymentData){
        $productSaleChartOfAccountId               = DB::table('chart_of_accounts')->where('code', $this->coa_head_code('product_sale'))->value('id');
        $taxChartOfAccountId                       = DB::table('chart_of_accounts')->where('code', $this->coa_head_code('tax'))->value('id');
        $saleChartOfAccountTransaction             = collect(['chart_of_account_id' => $customerAccountId->id,'voucher_no' => $invoiceNo,'voucher_type' => 'INVOICE','voucher_date' => $saleDate,
            'description' => 'Customer debit For Invoice No -  ' . $invoiceNo . ' Customer ' .$customerName,'debit' => $grandTotal,
            'credit' => 0,'posted' => 1,'approve' => 1,'created_by' => auth()->user()->name,'created_at' => date('Y-m-d H:i:s')]);

        $productSaleChartOfAccountTransaction      = collect(['chart_of_account_id' => $productSaleChartOfAccountId,'voucher_no' => $invoiceNo,'voucher_type' => 'INVOICE','voucher_date' => $saleDate,
            'description' => 'Sale Income For Invoice NO - ' . $invoiceNo . ' Customer ' .$customerName,'debit' => 0,'credit' => $grandTotal,
            'posted' => 1,'approve' => 1,'created_by' => auth()->user()->name, 'created_at' => date('Y-m-d H:i:s')]);
//        return response()->json($saleChartOfAccountTransaction);
        Transaction::insert([$saleChartOfAccountTransaction->all(),$productSaleChartOfAccountTransaction->all()]);

        if($totalTax > 0){
            $taxChartOfAccountTransaction              = collect(['chart_of_account_id' => $taxChartOfAccountId,'voucher_no' => $invoiceNo, 'voucher_type' => 'INVOICE', 'voucher_date' => $saleDate,
                'description' => 'Sale Total Tax For Invoice NO - ' . $invoiceNo . ' Customer ' .$customerName,'debit' => $totalTax,'credit' => 0,'posted' => 1,
                'approve' => 1,'created_by' => auth()->user()->name,'created_at' => date('Y-m-d H:i:s')]);
            Transaction::insert($taxChartOfAccountTransaction->all());
        }
        if(!empty($paymentData['paid_amount'])){
            $customerCredit                            = collect(['chart_of_account_id' => $customerAccountId->id,'voucher_no' => $invoiceNo,'voucher_type' => 'INVOICE','voucher_date' => $saleDate,
                'description' => 'Customer credit for Paid Amount For Customer Invoice NO- ' . $invoiceNo . ' Customer- ' . $customerName,'debit' => 0,
                'credit' => $paymentData['paid_amount'],'posted' => 1,'approve' => 1,'Created_by' => auth()->user()->name,'created_at' => date('Y-m-d H:i:s') ]);
            if($paymentData['payment_method'] == 1){
                $payment = collect(['chart_of_account_id' => $paymentData['account_id'],'voucher_no' => $invoiceNo,'voucher_type' => 'INVOICE','voucher_date' => $saleDate,
                    'description' => 'Cash in Hand in Sale for Invoice No - ' . $invoiceNo . ' customer- ' .$customerName,'debit' => $paymentData['paid_amount'],
                    'credit' => 0,'posted' => 1,'approve' => 1,'created_by' => auth()->user()->name,'created_at' => date('Y-m-d H:i:s')]);
                Transaction::create($payment->all());
                }else{
                $payment  = collect(['chart_of_account_id' => $paymentData['account_id'],'voucher_no' => $invoiceNo,'voucher_type' => 'INVOICE','voucher_date' => $saleDate,
                    'description' => 'Paid amount for customer  Invoice No  - ' . $invoiceNo . ' customer- ' .$customerName,'debit' => $paymentData['paid_amount'],
                    'credit' => 0,'posted' => 1,'approve' => 1,'created_by' => auth()->user()->name,'created_at' => date('Y-m-d H:i:s')]);
                Transaction::create($payment->all());
            }
            Transaction::insert($customerCredit->all());
        }
    }
    private function warehouseAccounts($warehouseId,$invoiceNo,$saleDate,$cost){
        $inventoryId = DB::table('chart_of_accounts')->where('code', $this->coa_head_code('inventory'))->value('id');
        $inventory = collect(['chart_of_account_id' => $inventoryId,'warehouse_id' => $warehouseId ,'voucher_no' => $invoiceNo ,'voucher_type' => 'INVOICE','voucher_date' => $saleDate,
            'description' => 'Inventory Credit For Invoice No '.$invoiceNo,'debit' => 0,'credit' => $cost, 'posted'  => 1,
            'approve' => 1,'created_by' => auth()->user()->name,'created_at' => date('Y-m-d H:i:s')]);
        Transaction::insert($inventory->all());
    }

    public function paymentAccountList($id){
        if($id == 1) {
            $accounts = ChartOfAccount::where(['code' =>  $this->coa_head_code('cash_in_hand'),'status'=>1])->get();
        }elseif ($id == 2) {
            $accounts = ChartOfAccount::where('code', 'like', $this->coa_head_code('cash_at_bank').'%')->where(['status' => 1 , 'level' => 4])->get();
        }else{
            $accounts = ChartOfAccount::where('code', 'like', $this->coa_head_code('cash_at_mobile_bank').'%')->where(['status' => 1 , 'level' => 4])->get();
        }
        return response()->json($accounts);
    }
}
