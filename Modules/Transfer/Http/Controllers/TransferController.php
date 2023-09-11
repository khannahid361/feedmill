<?php

namespace Modules\Transfer\Http\Controllers;

use Exception;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Modules\Product\Entities\Product;
use Modules\Setting\Entities\Warehouse;
use Modules\Transfer\Entities\Transfer;
use App\Http\Controllers\BaseController;
use Modules\Account\Entities\Transaction;
use Modules\Material\Entities\Material;
use Modules\Product\Entities\WarehouseProduct;
use Modules\Transfer\Http\Requests\TransferFormRequest;
use Modules\Transfer\Http\Requests\TransferReceiveFormRequest;

class TransferController extends BaseController
{
    public function __construct(Transfer $model)
    {
        $this->model = $model;
    }
    public function index()
    {
        if (permission('transfer-inventory-access')) {
            $this->setPageData('Manage Transfer Inventory', 'Manage Transfer Inventory', 'fas fa-exchange-alt', [['name' => 'Manage Transfer Inventory']]);
            $warehouses = Warehouse::get();
            return view('transfer::index', compact('warehouses'));
        } else {
            return $this->access_blocked();
        }
    }
    public function get_datatable_data(Request $request)
    {
        if ($request->ajax() && permission('transfer-inventory-access')) {
            if (!empty($request->challan_no)) {
                $this->model->setChallanNo($request->challan_no);
            }
            if (!empty($request->from_date)) {
                $this->model->setFromDate($request->from_date);
            }
            if (!empty($request->to_date)) {
                $this->model->setToDate($request->to_date);
            }
            if (!empty($request->from_warehouse_id)) {
                $this->model->setFromWarehouseID($request->from_warehouse_id);
            }
            if (!empty($request->to_warehouse_id)) {
                $this->model->setToWarehouseID($request->to_warehouse_id);
            }
            if (!empty($request->transfer_status)) {
                $this->model->setTransferStatus($request->transfer_status);
            }
            if (!empty($request->receive_status)) {
                $this->model->setReceiveStatus($request->receive_status);
            }
            $this->set_datatable_default_properties($request);
            $list = $this->model->getDatatableList();
            $data = [];
            $no   = $request->input('start');
            foreach ($list as $value) {
                $no++;
                $action = '';
                // if(permission('transfer-inventory-edit') && $value->receive_status == 3 && empty(auth()->user()->warehouse_id)){
                //     $action .= ' <a class="dropdown-item" href="'.route("transfer.inventory.edit",$value->id).'">'.self::ACTION_BUTTON['Edit'].'</a>';
                // }
                if (permission('transfer-inventory-view')) {
                    $action .= ' <a class="dropdown-item view_data" href="' . route("transfer.inventory.view", $value->id) . '">' . self::ACTION_BUTTON['View'] . '</a>';
                }

                if (permission('transfer-inventory-edit') && ($value->receive_status == 3) && ($value->transfer_status == 1)) {
                    $action .= ' <a class="dropdown-item receive_data"  data-id="' . $value->id . '" data-name="' . $value->challan_no . '"><i class="fas fa-truck-loading text-info mr-2"></i> Receive</a>';
                }

                if (permission('transfer-inventory-delete') && empty(auth()->user()->warehouse_id) && ($value->receive_status == 3)) {
                    $action .= ' <a class="dropdown-item delete_data"  data-id="' . $value->id . '" data-name="' . $value->challan_no . '">' . self::ACTION_BUTTON['Delete'] . '</a>';
                }
                $row    = [];
                if (permission('transfer-inventory-bulk-delete')) {
                    $row[]  = row_checkbox($value->id);
                }
                $row[]  = $no;
                $row[]  = $value->challan_no;
                $row[]  = date(config('settings.date_format'), strtotime($value->transfer_date));
                if (empty(auth()->user()->warehouse_id)) {
                    $row[]  = $value->fw_name;
                    $row[]  = $value->tw_name;
                }
                $row[]  = $value->total_qty;
                if (empty(auth()->user()->warehouse_id)) {
                    $row[]  = number_format($value->grand_total, 2, '.', ',');
                    $row[]  = $value->transfer_status == 1 ? 'Transferred' : 'Pending';
                    $row[]  = $value->receiver_name . ($value->receive_date ? '<br><b>Date: </b>' . date(config('settings.date_format'), strtotime($value->receive_date)) : '') . '<br><b>Status: </b>' . TRANSFER_RECEIVE_STATUS[$value->receive_status];
                    $row[]  = $value->created_by;
                } else {
                    $row[]  = ($value->receive_date ? '<b>Date: </b>' . date(config('settings.date_format'), strtotime($value->receive_date)) . '<br>' : '') . '<b>Status: </b>' . TRANSFER_RECEIVE_STATUS[$value->receive_status];
                }
                $row[]  = action_button($action);
                $data[] = $row;
            }
            return $this->datatable_draw($request->input('draw'), $this->model->count_all(), $this->model->count_filtered(), $data);
        } else {
            return response()->json($this->unauthorized());
        }
    }
    public function create()
    {
        if (permission('transfer-inventory-add')) {
            $this->setPageData('Transfer Inventory Form', 'Transfer Inventory Form', 'fas fa-exchange-alt', [['name' => 'Transfer Inventory Form']]);
            $data = [
                'warehouses'  =>  Warehouse::get(),
                'products'    => Product::with('unit')->get(),
                'users'       => User::with('role:id,role_name')->whereNotIn('role_id', [1, 2])->get(),
                'challan_no'  => 'CH-' . date('dmhyhi'),
                'materials'   => Material::where('category_id', 9)->pluck('material_name', 'id')->toArray()
            ];
            return view('transfer::form', $data);
        } else {
            return $this->access_blocked();
        }
    }
    public function edit(int $id)
    {
        if (permission('transfer-inventory-edit')) {
            $this->setPageData('Transfer Inventory Edit', 'Transfer Inventory Edit', 'fas fa-edit', [['name' => 'Transfer Inventory Edit']]);
            $data = [
                'warehouses'  =>  Warehouse::get(),
                'users'       => User::whereNotIn('role_id', [1, 2])->get(),
                'transfer'    => $this->model->with('hasManyProducts')->find($id),
                'products'    => Product::with('unit')->get(),
            ];
            return view('transfer::form', $data);
        } else {
            return $this->access_blocked();
        }
    }
    public function store_or_update(TransferFormRequest $request)
    {
        // dd($request->all());
        if (($request->ajax() && permission('transfer-inventory-add')) || ($request->ajax() && permission('transfer-inventory-edit'))) {
            DB::beginTransaction();
            try {
                if ($request->transfer_id) {
                    $transferData = $this->model->with('products')->find($request->transfer_id);
                    if (!$transferData->products->isEmpty()) {
                        if ($transferData->transfer_status == 1) {
                            foreach ($transferData->products as $value) {
                                $from_warehouse = WarehouseProduct::where([['warehouse_id', $transferData->from_warehouse_id], ['product_id', $value->id]])->first();
                                if ($from_warehouse) {
                                    $from_warehouse->bag_qty += $value->pivot->transfer_qty;
                                    $from_warehouse->update();
                                }
                            }
                        }
                    }
                    $transferData->products()->sync($this->model->transfer_product_data($request));
                    $transferData->update($this->model->transfer_data(collect($request->validated())->except('products')));
                } else {
                    $transfer     = $this->model->create($this->model->transfer_data(collect($request->validated())->except('products')));
                    $transferData = $this->model->with('products')->find($transfer->id)->products()->sync($this->model->transfer_product_data($request));
                }
                if (!empty($request->shipping_cost) && $request->shipping_cost > 0) {
                    $transaction  = Transaction::where(['voucher_no' => $request->challan_no, 'voucher_type' => 'Inventory Transfer'])->orderBy('id', 'asc')->first();
                    if ($transaction) {
                        $transaction->update($this->model->shipping_expense_transaction($request));
                    } else {
                        Transaction::create($this->model->shipping_expense_transaction($request));
                    }
                }
                $output                 = $this->store_message($transferData, $request->transfer_id);
                $output['transfer_id']  = $request->transfer_id ? '' : $transfer->id;
                DB::commit();
            } catch (Exception $e) {
                DB::rollback();
                $output = ['status' => 'error', 'message' => $e->getMessage()];
            }
            return response()->json($output);
        } else {
            return response()->json($this->unauthorized());
        }
    }
    public function show(int $id)
    {
        if (permission('transfer-inventory-view')) {
            $this->setPageData('Transfer Inventory Details', 'Transfer Inventory Details', 'fas fa-clipboard-list', [['name' => 'Transfer Inventory Details']]);
            $data = [
                'transfer' =>  $this->model->with('hasManyProducts', 'from_warehouse', 'to_warehouse', 'receiver')->find($id),
            ];
            return view('transfer::details', $data);
        } else {
            return $this->access_blocked();
        }
    }
    public function delete(Request $request)
    {
        if ($request->ajax() && permission('transfer-inventory-delete')) {
            DB::beginTransaction();
            try {
                $transfer = $this->model->with('products')->find($request->id);
                $delete_products = $this->model->reset_product_stock($transfer);
                if ($delete_products == false) {
                    DB::rollBack();
                }
                Transaction::where(['voucher_no' => $transfer->challan_no, 'voucher_type' => 'Inventory Transfer'])->delete();
                $result = $transfer->delete();
                $output = $result ? ['status' => 'success', 'message' => 'Data has been deleted successfully'] : ['status' => 'error', 'message' => 'failed to delete data'];
                DB::commit();
            } catch (Exception $e) {
                DB::rollBack();
                $output = ['status' => 'error', 'message' => $e->getMessage()];
            }
            return response()->json($output);
        } else {
            return response()->json($this->unauthorized());
        }
    }
    public function bulk_delete(Request $request)
    {
        if ($request->ajax() && permission('transfer-inventory-bulk-delete')) {
            DB::beginTransaction();
            try {
                foreach ($request->ids as $id) {
                    $transfer        = $this->model->with('products')->find($id);
                    $delete_products = $this->model->reset_product_stock($transfer);
                    if ($delete_products == false) {
                        DB::rollBack();
                    }
                    Transaction::where(['voucher_no' => $transfer->challan_no, 'voucher_type' => 'Inventory Transfer'])->delete();
                }
                $result = $this->model->destroy($request->ids);
                $output = $result ? ['status' => 'success', 'message' => 'Data has been deleted successfully'] : ['status' => 'error', 'message' => 'failed to delete data'];
                DB::commit();
            } catch (Exception $e) {
                DB::rollBack();
                $output = ['status' => 'error', 'message' => $e->getMessage()];
            }
            return response()->json($output);
        } else {
            return response()->json($this->unauthorized());
        }
    }

    public function transfer_product_data(int $id)
    {
        $transfer = $this->model->with('hasManyProducts')->find($id);
        return view('transfer::transfer-data', compact('transfer'))->render();
    }
    public function receive_transfered_products(TransferReceiveFormRequest $request)
    {
        if (($request->ajax() && permission('transfer-inventory-add')) || ($request->ajax() && permission('transfer-inventory-edit'))) {
            DB::beginTransaction();
            try {
                $transferData = $this->model->with('products')->find($request->transfer_id);
                $transferData->products()->sync($this->model->receive_transfer_product_data($request));
                $transferData->update([
                    "received_cost"  => $request->received_cost,
                    "receive_qty"    => $request->receive_qty,
                    "damage_qty"     => $request->damage_qty,
                    "receiver_id"    => auth()->user()->id,
                    "receive_date"   => date('Y-m-d'),
                    "receive_status" => ($request->damage_qty > 0) ? 2 : 1,
                ]);
                if (!empty($request->total_damage_cost) && $request->total_damage_cost > 0) {
                    Transaction::create($this->model->inventory_damage_transaction($request));
                }
                if ($request->has('products')) {
                    foreach ($request->products as $value) {
                        if (!empty($value['receive_qty'])) {
                            $warehouseProductTransfer = WarehouseProduct::where(['warehouse_id' => $transferData->from_warehouse_id, 'product_id' => $value['id']])->first();
                            $warehouseProductReceived = WarehouseProduct::where(['warehouse_id' => $transferData->to_warehouse_id, 'product_id' => $value['id']])->first();
                            if (!isset($value['material_id'])) {
                                if (!empty($warehouseProductTransfer)) {
                                    $warehouseProductTransfer->update(['bag_qty' => $warehouseProductTransfer->bag_qty - $value['receive_qty']]);
                                }
                                if (!empty($warehouseProductReceived)) {
                                    $warehouseProductReceived->update(['bag_qty' => $warehouseProductReceived->bag_qty + $value['receive_qty'] - $value['receive_qty']]);
                                } else {
                                    WarehouseProduct::create([
                                        'warehouse_id' => $transferData->to_warehouse_id,
                                        'product_id'   => $value['id'],
                                        'bag_qty'       => $value['receive_qty'] - $value['receive_qty']
                                    ]);
                                }
                            } else {
                                if (!empty($warehouseProductTransfer)) {
                                    $warehouseProductTransfer->update(['damaged_bag_qty' => $warehouseProductTransfer->damaged_bag_qty - $value['receive_qty']]);
                                }
                                if (!empty($warehouseProductReceived)) {
                                    $warehouseProductReceived->update(['damaged_bag_qty' => $warehouseProductReceived->damaged_bag_qty + $value['receive_qty'] - $value['receive_qty']]);
                                } else {
                                    WarehouseProduct::create([
                                        'warehouse_id' => $transferData->to_warehouse_id,
                                        'product_id'   => $value['id'],
                                        'damaged_bag_qty'       => $value['receive_qty'] - $value['receive_qty']
                                    ]);
                                }
                            }
                        }
                    }
                }
                // $output  = $this->store_message($transferData, $request->transfer_id);
                $output = ['status' => 'success', 'message' => 'Transfer Successfull'];
                DB::commit();
            } catch (Exception $e) {
                DB::rollback();
                $output = ['status' => 'error', 'message' => $e->getMessage()];
            }
            return response()->json($output);
        } else {
            return response()->json($this->unauthorized());
        }
    }
}
