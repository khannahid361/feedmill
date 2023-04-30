<?php

namespace Modules\DealerSale\Http\Controllers;

use App\Models\Unit;
use Exception;
use App\Models\Tax;
use App\Traits\UploadAble;
use App\Http\Controllers\BaseController;
use http\Env\Response;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Modules\Account\Entities\ChartOfAccount;
use Modules\Account\Entities\Transaction;
use Modules\Dealer\Entities\Dealer;
use Modules\DealerSale\Entities\DealerDelivery;
use Modules\DealerSale\Entities\DealerDeliveryProduct;
use Modules\DealerSale\Entities\DealerSale;
use Modules\DealerSale\Entities\DealerSaleProduct;
use Modules\DealerSale\Http\Requests\DealerSaleFormRequest;
use Modules\Product\Entities\WarehouseProduct;
use Modules\Setting\Entities\Warehouse;

class DealerSaleController extends BaseController{
    use UploadAble;
    public function __construct(DealerSale $model){
        $this->model = $model;
    }
    public function index(){
        if(permission('dealer-sale-access')){
            $this->setPageData('Dealer Sale Manage','Dealer Sale Manage','fab fa-opencart',[['name' => 'Dealer Sale Manage']]);
            $data = [
                'dealer'      => DB::table('dealers')->where([['status',1]])->select('id','name')->get(),
            ];
            return view('dealersale::index',$data);
        }else{
            return $this->access_blocked();
        }
    }
    public function get_datatable_data(Request $request){
        if($request->ajax() && permission('dealer-sale-access')){
            if (!empty($request->memo_no)) {
                $this->model->setInvoiceNo($request->memo_no);
            }
            if (!empty($request->start_date)) {
                $this->model->setFromDate($request->start_date);
            }
            if (!empty($request->end_date)) {
                $this->model->setToDate($request->end_date);
            }
            if (!empty($request->dealer_id)) {
                $this->model->setDealerID($request->dealer_id);
            }
            if (!empty($request->payment_status)) {
                $this->model->setPaymentStatus($request->payment_status);
            }
            $this->set_datatable_default_properties($request);
            $list = $this->model->getDatatableList();
//            return response()->json($list);
            $data = [];
            $no = $request->input('start');
            foreach ($list as $value) {
                $no++;
                $action = '';
                $deliveries = DealerDelivery::where(['dealer_sale_id' => $value->id])->get();
                if (permission('dealer-sale-edit') && $value->status == 1) {
                    $action .= ' <a class="dropdown-item" href="'.route("dealer.sale.edit",$value->id).'">'.self::ACTION_BUTTON['Edit'].'</a>';
                }
                if (permission('dealer-sale-view')) {
                    $action .= ' <a class="dropdown-item view_data" href="'.route("dealer.sale.show",$value->id).'">'.self::ACTION_BUTTON['View'].'</a>';
                }
                if (permission('dealer-sale-status-change') && $value->status == 1) {
                    $action .= ' <a class="dropdown-item change_status" data-id="' . $value->id .'">'.self::ACTION_BUTTON['Change Status'].'</a>';
                }
                if($value->document) {
                    $action .= '<a class="dropdown-item" href="'.asset('storage/'.SALE_DOCUMENT_PATH.$value->document).'" download><i class="fas fa-download mr-2"></i> Document</a>';
                }
                if (permission('dealer-sale-delete') && $value->status == 1) {
                    $action .= ' <a class="dropdown-item delete_data"  data-id="' . $value->id . '" data-name="' . $value->memo_no . '">'.self::ACTION_BUTTON['Delete'].'</a>';
                }
                if(permission('dealer-sale-product-delivery') && $value->status == 2 && ($value->total_delivery_quantity != ($value->total_qty + $value->total_free_qty))){
                    $action .= ' <a class="dropdown-item" href="'.route("dealer.sale.product.delivery",$value->id).'"  data-id="' . $value->id . '"><i class="fas fa-truck text-info mr-2"></i> Delivery</a>';
                }
                foreach ($deliveries as $delivery){
                    $action .= ' <a class="dropdown-item" href="'.route("dealer.sale.product.delivery.invoice",$delivery->id).'"  data-id="' . $value->id . '"><i class="fas fa-receipt text-success mr-2"></i> Invoice('.$delivery->delivery_date.')</a>';
                }
                $row    = [];
                $row[]  = $value->memo_no;
                $row[]  = $value->dealer_name;
//                $row[]  = $value->item.'('.$value->total_qty + $value->total_free_qty.')';
                $row[]  = $value->item;
                $row[]  = $value->total_delivery_quantity;
                $row[]  = number_format($value->total_price,2,'.','');
                $row[]  = number_format($value->grand_total,2,'.','');
                $row[]  = number_format($value->paid_amount,2,'.','');
                $row[]  = date('d-M-Y',strtotime($value->sale_date));
                $row[]  = PAYMENT_STATUS_LABEL[$value->payment_status];
                $row[]  = $value->payment_method ? SALE_PAYMENT_METHOD[$value->payment_method] : '<span class="label label-danger label-pill label-inline" style="min-width:70px !important;">N/A</span>';
                $row[]  = ORDER_TYPE[$value->order_type];
                $row[]  = $value->total_qty + $value->total_free_qty == $value->total_delivery_quantity ? '<span class="label label-success label-pill label-inline" style="min-width:70px !important;">Complete</span>' : '<span class="label label-danger label-pill label-inline" style="min-width:70px !important;">Incomplete</span>';
                $row[]  = SALE_STATUS[$value->status];
                $row[]  = action_button($action);
                $data[] = $row;
            }
            return $this->datatable_draw($request->input('draw'),$this->model->count_all(), $this->model->count_filtered(), $data);
        }else{
            return response()->json($this->unauthorized());
        }
    }
    public function create(){
        if(permission('dealer-sale-add')){
            $this->setPageData('Add Dealer Sale','Add Dealer Sale','fas fa-shopping-cart',[['name' => 'Add Dealer Sale']]);
            $products = DB::table('warehouse_product as wp')
                ->join('products as p','wp.product_id','=','p.id')
                ->selectRaw('wp.*,p.name')
                ->groupBy('product_id')
                ->orderBy('p.name','asc')
                ->get();
            $data = [
                'products'       => $products,
                'taxes'          => Tax::activeTaxes(),
                'dealer'         => DB::table('dealers')->where([['status',1]])->select('id','name')->get(),
                'memo_no'        => 'DINV-'.date('ymd').rand(1,999),
            ];
            return view('dealersale::create',$data);
        }else{
            return $this->access_blocked();
        }
    }
    public function store(DealerSaleFormRequest $request){
        if($request->ajax() && permission('dealer-sale-add')){
            DB::beginTransaction();
            try{
                $products   = [];
                $collection = collect($request->all())->except('_token','products')->merge(['total_delivery_quantity' => 0,'order_type' => 1 ,'status' => 1,'created_by' => auth()->user()->name]);
                if($request->hasFile('document')){
                    $collection['document'] = $this->upload_file($request->file('document'),SALE_DOCUMENT_PATH);
                }
                $sale = DealerSale::create($collection->all());
                if($request->has('products')){
                    foreach ($request->products as $value){
                        if(!empty($value['id']) && !empty($value['qty'])){
                            $unit = Unit::where('unit_name',$value['unit'])->first();
                            $products[] = [
                                'dealer_sale_id'   => $sale->id,
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
                DealerSaleProduct::insert($products);
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
        if(permission('dealer-sale-view')){
            $this->setPageData('Dealer Sale Details','Dealer Sale Details','fas fa-file',[['name'=>'Dealer Sale','link' => route('dealer.sale')],['name' => 'Dealer Sale Details']]);
            $sale = $this->model->with('sale_products','dealer')->find($id);
            return view('dealersale::details',compact('sale'));
        }else{
            return $this->access_blocked();
        }
    }
    public function edit(int $id){
        if(permission('dealer-sale-edit')){
            $this->setPageData('Edit Dealer Sale','Edit Dealer Sale','fas fa-edit',[['name'=>'Dealer Sale','link' => route('dealer.sale')],['name' => 'Edit Dealer Sale']]);
            $products = DB::table('warehouse_product as wp')
                ->join('products as p','wp.product_id','=','p.id')
                ->selectRaw('wp.*,p.name')
                ->groupBy('product_id')
                ->orderBy('p.name','asc')
                ->get();
            $data = [
                'products'     => $products,
                'sale'         => $this->model->with('sale_products','dealer')->find($id),
                'dealer'       => DB::table('dealers')->where([['status',1]])->select('id','name')->get(),
                'taxes'        => Tax::activeTaxes(),
            ];
            return view('dealersale::edit',$data);
        }else{
            return $this->access_blocked();
        }
    }
    public function update(Request $request){
        if($request->ajax() && permission('dealer-sale-edit')){
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
                                'dealer_sale_id'   => $saleUpdate->id,
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
                DealerSaleProduct::where(['dealer_sale_id' => $request->sale_id])->delete();
                $saleUpdate->update($collection->all());
                DealerSaleProduct::insert($products);
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
                    $dealer = Dealer::find($sale->dealer_id);
                    $dealerAccountId = ChartOfAccount::where(['dealer_id' => $sale->dealer_id])->first();
                    $paymentData = [
                        'payment_method' => $sale->payment_method ? $sale->payment_method : null,
                        'account_id' => $sale->account_id ? $sale->account_id : null,
                        'paid_amount' => $sale->paid_amount ? $sale->paid_amount : 0,
                    ];
                $this->dealerAccounts($dealerAccountId->id, $sale->memo_no, $sale->sale_date, $dealer->name, $sale->grand_total, $sale->total_tax, $paymentData);
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
        if(permission('dealer-sale-product-delivery')){
            $this->setPageData('Dealer Product Delivery','Dealer Product Delivery','fab fa-opencart',[['name' => 'Dealer Product Delivery']]);
            $details     = $this->model->with('dealer')->find($id);
            $warehouses  = Warehouse::activeWarehouses();
            return view('dealersale::delivery',compact('details','warehouses'));
        }else{
            return $this->access_blocked();
        }
    }
    public function deliveryStore(Request $request){
        if($request->ajax() && permission('dealer-sale-product-delivery')){
            DB::beginTransaction();
            try{
                $deliveryProduct = [];
                $cost = 0;
                $collection = collect($request->all())->except('_token','deliveries');
                $delivery = DealerDelivery::create($collection->all());
                $sale = $this->model->find($request->dealer_sale_id);
                if($request->has('deliveries')){
                    foreach ($request->deliveries as $key => $value){
                        if(!empty($value['product_id']) && !empty($value['stock_qty']) && !empty($value['delivery_qty']) && !empty($value['price'])){
                            $deliveryProduct[$key] = [
                                'dealer_delivery_id'     => $delivery->id,
                                'product_id'             => $value['product_id'],
                                'stock_qty'              => $value['stock_qty'],
                                'delivered_qty'          => $value['delivered_qty'],
                                'delivery_qty'           => $value['delivery_qty']
                            ];
                            $cost = $cost + ($value['delivery_qty'] * $value['price']);
                            $saleProduct = DealerSaleProduct::where(['dealer_sale_id' => $request->dealer_sale_id,'product_id' => $value['product_id']])->first();
                            $saleProduct->update(['delivered_qty' => $saleProduct->delivered_qty + $value['delivery_qty'] ]);
                            $warehouseProduct = WarehouseProduct::where(['warehouse_id' => $request->warehouse_id,'product_id' => $value['product_id']])->first();
                            $warehouseProduct->update(['qty' => $warehouseProduct->qty - $value['delivery_qty']]);
                        }
                    }
                }
                DealerDeliveryProduct::insert($deliveryProduct);
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
    public function productDeliveryInvoice($id){
        $this->setPageData('Delivery Invoice','Delivery Invoice','fas fa-edit',[['name'=>'Sale','link' => route('sale')],['name' => 'Delivery Invoice']]);
        $details = DealerDelivery::with('sale','deliveryProduct')->find($id);
        return view('dealersale::invoice',compact('details'));
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
                    'stock_qty'    => $warehouseProduct->qty,
                    'order_qty'    => $value['qty'] + $value['free_qty'],
                    'delivered_qty'=> $value['delivered_qty'],
                    'price'        => $value['net_unit_price']
                ];
            }
        }
        return response()->json($data);
    }
    public function delete(Request $request){
        if($request->ajax() && permission('dealer-sale-delete')){
            DB::beginTransaction();
            try{
                DealerSaleProduct::where(['dealer_sale_id' => $request->id])->delete();
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
    private function dealerAccounts($dealerAccountId,$invoiceNo,$saleDate,$dealerName,$grandTotal,$totalTax,$paymentData){
        $productSaleChartOfAccountId               = DB::table('chart_of_accounts')->where('code', $this->coa_head_code('product_sale'))->value('id');
        $taxChartOfAccountId                       = DB::table('chart_of_accounts')->where('code', $this->coa_head_code('tax'))->value('id');
        $saleChartOfAccountTransaction             = collect(['chart_of_account_id' => $dealerAccountId,'voucher_no' => $invoiceNo,'voucher_type' => 'INVOICE','voucher_date' => $saleDate,
            'description' => 'Dealer debit For Invoice No -  ' . $invoiceNo . ' Dealer ' .$dealerName,'debit' => $grandTotal,
            'credit' => 0,'posted' => 1,'approve' => 1,'created_by' => auth()->user()->name,'created_at' => date('Y-m-d H:i:s')]);
        $productSaleChartOfAccountTransaction      = collect(['chart_of_account_id' => $productSaleChartOfAccountId,'voucher_no' => $invoiceNo,'voucher_type' => 'INVOICE','voucher_date' => $saleDate,
            'description' => 'Sale Income For Invoice NO - ' . $invoiceNo . ' Dealer ' .$dealerName,'debit' => 0,'credit' => $grandTotal,
            'posted' => 1,'approve' => 1,'created_by' => auth()->user()->name, 'created_at' => date('Y-m-d H:i:s')]);
        Transaction::insert([$saleChartOfAccountTransaction->all(),$productSaleChartOfAccountTransaction->all()]);
        if($totalTax > 0){
            $taxChartOfAccountTransaction              = collect(['chart_of_account_id' => $taxChartOfAccountId,'voucher_no' => $invoiceNo, 'voucher_type' => 'INVOICE', 'voucher_date' => $saleDate,
                'description' => 'Sale Total Tax For Invoice NO - ' . $invoiceNo . ' Dealer ' .$dealerName,'debit' => $totalTax,'credit' => 0,'posted' => 1,
                'approve' => 1,'created_by' => auth()->user()->name,'created_at' => date('Y-m-d H:i:s')]);
        Transaction::insert($taxChartOfAccountTransaction->all());
        }
        if(!empty($paymentData['paid_amount'])){
            $customerCredit                            = collect(['chart_of_account_id' => $dealerAccountId,'voucher_no' => $invoiceNo,'voucher_type' => 'INVOICE','voucher_date' => $saleDate,
                'description' => 'Dealer credit for Paid Amount For Dealer Invoice NO- ' . $invoiceNo . ' Dealer- ' . $dealerName,'debit' => 0,
                'credit' => $paymentData['paid_amount'],'posted' => 1,'approve' => 1,'Created_by' => auth()->user()->name,'created_at' => date('Y-m-d H:i:s') ]);
            if($paymentData['payment_method'] == 1){
                $payment                               = collect(['chart_of_account_id' => $paymentData['account_id'],'voucher_no' => $invoiceNo,'voucher_type' => 'INVOICE','voucher_date' => $saleDate,
                    'description' => 'Cash in Hand in Sale for Invoice No - ' . $invoiceNo . ' Dealer- ' .$dealerName,'debit' => $paymentData['paid_amount'],
                    'credit' => 0,'posted' => 1,'approve' => 1,'created_by' => auth()->user()->name,'created_at' => date('Y-m-d H:i:s')]);
            }else{
                $payment                               = collect(['chart_of_account_id' => $paymentData['account_id'],'voucher_no' => $invoiceNo,'voucher_type' => 'INVOICE','voucher_date' => $saleDate,
                    'description' => 'Paid amount for Dealer  Invoice No  - ' . $invoiceNo . ' Dealer- ' .$dealerName,'debit' => $paymentData['paid_amount'],
                    'credit' => 0,'posted' => 1,'approve' => 1,'created_by' => auth()->user()->name,'created_at' => date('Y-m-d H:i:s')]);
            }
            Transaction::create($payment->all());
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
}
