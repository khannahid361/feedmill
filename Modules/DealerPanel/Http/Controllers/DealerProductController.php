<?php

namespace Modules\DealerPanel\Http\Controllers;

use App\Http\Controllers\BaseController;
use Exception;
use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\DB;
use Modules\Account\Entities\Transaction;
use Modules\DealerPanel\Entities\DealerProduct;
use Modules\Product\Entities\WarehouseProduct;
use Modules\Transfer\Http\Requests\TransferReceiveFormRequest;

class DealerProductController extends BaseController
{
    public function __construct(DealerProduct $model){
        $this->model = $model;
    }

    public function productIndex(){
        $this->setPageData('Dealer Product Manage','Dealer Product Manage','fab fa-opencart',[['name' => 'Dealer Sale Manage']]);
        $data = [
            'dealer'      => DB::table('dealers')->where([['status',1]])->select('id','name')->get(),
        ];
        return view('dealerpanel::product.index',$data);
    }

    public function get_datatable_data(Request $request){
        if($request->ajax()){

            $this->set_datatable_default_properties($request);
            $list = $this->model->getDatatableList();
            $data = [];
            $no   = $request->input('start');
            foreach ($list as $value) {
                $no++;
                $action = '';

                if(($value->receive_status == 3) && ($value->transfer_status == 1)){
                    $action .= ' <a class="dropdown-item receive_data"  data-id="' . $value->id . '" data-name="' . $value->challan_no . '"><i class="fas fa-truck-loading text-info mr-2"></i> Receive</a>';
                }
                $row    = [];
                $row[]  = $no;
                $row[]  = $value->challan_no;
                $row[]  = date(config('settings.date_format'),strtotime($value->transfer_date));
                if(empty(auth()->user()->warehouse_id)) {
                    $row[]  = $value->fw_name;
                    $row[]  = $value->tw_name;
                }
                $row[]  = $value->total_qty;
                if(empty(auth()->user()->warehouse_id)) {
                    $row[]  = number_format($value->grand_total,2,'.',',');
                    $row[]  = $value->transfer_status == 1 ? 'Transferred' : 'Pending';
                    $row[]  = $value->receiver_name.($value->receive_date ? '<br><b>Date: </b>'.date(config('settings.date_format'),strtotime($value->receive_date)) : '').'<br><b>Status: </b>'.TRANSFER_RECEIVE_STATUS[$value->receive_status];
                    $row[]  = $value->created_by;
                }else{
                    $row[]  = ($value->receive_date ? '<b>Date: </b>'.date(config('settings.date_format'),strtotime($value->receive_date)).'<br>' : '').'<b>Status: </b>'.TRANSFER_RECEIVE_STATUS[$value->receive_status];
                }
                $row[]  = action_button($action);
                $data[] = $row;
            }
            return $this->datatable_draw($request->input('draw'),$this->model->count_all(), $this->model->count_filtered(), $data);
        }else{
            return response()->json($this->unauthorized());
        }
    }

    public function transfer_product_data(int $id){
        $transfer = $this->model->with('hasManyProducts')->find($id);
        return view('dealerpanel::product.transfer-data',compact('transfer'))->render();

    }
    public function receive_transfered_products(Request $request){
        if($request->ajax()){
//            return response()->json($request->all());
            DB::beginTransaction();
            try {
                $transferData = $this->model->with('products')->find($request->transfer_id);
                $transferData->products()->sync($this->model->receive_transfer_product_data($request));
                $transferData->update([
                    "received_cost"  => $request->received_cost,
                    "receive_qty"    => $request->receive_qty,
                    "damage_qty"     => $request->damage_qty,
                    "receiver_id"    => auth()->guard('dealer')->user()->id,
                    "receive_date"   => date('Y-m-d'),
                    "receive_status" => ($request->damage_qty > 0) ? 2 : 1,
                ]);
                if(!empty($request->total_damage_cost) && $request->total_damage_cost > 0) {
                    Transaction::create($this->model->inventory_damage_transaction($request));
                }
                if($request->has('products')){
                    foreach ($request->products as $value){
                        if(!empty($value['receive_qty'])){
                            $warehouseProductTransfer = WarehouseProduct::where(['warehouse_id' => $transferData->from_warehouse_id,'product_id' => $value['id']])->first();
                            $warehouseProductReceived = WarehouseProduct::where(['warehouse_id' => $transferData->to_warehouse_id ,'product_id' => $value['id']])->first();
                            if(!empty($warehouseProductTransfer)){
                                $warehouseProductTransfer->update(['qty' => $warehouseProductTransfer->qty - $value['receive_qty']]);
                            }
                            if(!empty($warehouseProductReceived)){
                                $warehouseProductReceived->update(['qty' => $warehouseProductReceived->qty + $value['receive_qty'] - $value['receive_qty']]);
                            }else{
                                WarehouseProduct::create([
                                    'warehouse_id' => $transferData->to_warehouse_id,
                                    'product_id'   => $value['id'],
                                    'qty'          => $value['receive_qty'] - $value['receive_qty']
                                ]);
                            }
                        }
                    }
                }
                $output  = $this->store_message($transferData, $request->transfer_id);
                DB::commit();
            } catch (Exception $e) {
                DB::rollback();
                $output = ['status' => 'error','message' => $e->getMessage()];
            }
            return response()->json($output);
        }else{
            return response()->json($this->unauthorized());
        }
    }
}
