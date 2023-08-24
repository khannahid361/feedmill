<?php

namespace Modules\StockReturn\Http\Controllers;

use App\Http\Controllers\BaseController;
use App\Models\Unit;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Modules\Account\Entities\Transaction;
use Modules\Dealer\Entities\Dealer;
use Modules\Material\Entities\Material;
use Modules\Material\Entities\WarehouseMaterial;
use Modules\Product\Entities\WarehouseProduct;
use Modules\StockReturn\Entities\DealerSaleReturn;
use Modules\StockReturn\Entities\DealerSaleReturnProduct;

class DealerSaleReturnController extends BaseController
{
    public function __construct(DealerSaleReturn $model)
    {
        $this->model = $model;
    }

    public function index()
    {
        if (permission('sale-return-access')) {
            $this->setPageData('Dealer Sale Return', 'Dealer Sale Return', 'fas fa-file', [['name' => 'Dealer Sale Return']]);
            $data = [
                'dealers' => Dealer::all()
            ];
            return view('stockreturn::dealer-sale.index', $data);
        } else {
            return $this->access_blocked();
        }
    }

    public function get_datatable_data(Request $request)
    {
        if ($request->ajax()) {
            if (permission('sale-return-access')) {

                if (!empty($request->return_no)) {
                    $this->model->setReturnNo($request->return_no);
                }
                if (!empty($request->memo_no)) {
                    $this->model->setMemoNo($request->memo_no);
                }
                if (!empty($request->start_date)) {
                    $this->model->setStartDate($request->start_date);
                }
                if (!empty($request->end_date)) {
                    $this->model->setEndDate($request->end_date);
                }
                if (!empty($request->dealer_id)) {
                    $this->model->setDealerID($request->dealer_id);
                }
                $this->set_datatable_default_properties($request); //set datatable default properties
                $list = $this->model->getDatatableList(); //get table data
                $data = [];
                $no = $request->input('start');
                foreach ($list as $value) {
                    $no++;
                    $action = '';
                    $action .= ' <a class="dropdown-item view_data" href="' . route("dealer.sale.return.show", $value->id) . '">' . self::ACTION_BUTTON['View'] . '</a>';
                    $action .= ' <a class="dropdown-item delete_data"  data-id="' . $value->id . '" data-name="' . $value->return_no . '">' . self::ACTION_BUTTON['Delete'] . '</a>';
                    $row = [];
                    $row[] = $no;
                    $row[] = $value->return_no;
                    $row[] = $value->memo_no;
                    $row[] = $value->shop_name . ' - ' . $value->dealer_name;
                    $row[] = $value->total_return_items . '(' . $value->total_return_qty . ')';
                    $row[] = date('d-M-Y', strtotime($value->return_date));
                    $row[] = number_format($value->total_deduction, 2, '.', '');
                    $row[] = number_format($value->grand_total, 2, '.', '');
                    $row[] = action_button($action); //custom helper function for action button
                    $data[] = $row;
                }
                return $this->datatable_draw($request->input('draw'), $this->model->count_all(), $this->model->count_filtered(), $data);
            }
        } else {
            return response()->json($this->unauthorized());
        }
    }

    public function store(Request $request)
    {
        // dd($request->all());
        if ($request->ajax()) {
            if (permission('sale-return-access')) {
                DB::beginTransaction();
                try {
                    $sr_commission_rate = $request->sr_commission_rate ? $request->sr_commission_rate : 0;
                    if ($sr_commission_rate > 0) {
                        $deducted_commission = $request->grand_total_price * ($sr_commission_rate / 100);
                    } else {
                        $deducted_commission = 0;
                    }
                    $warehouse_id = $request->warehouse_id;
                    $sale_return_date = [
                        'return_no'              => 'DSRINV-' . date('ymd') . rand(1, 999),
                        'memo_no'                => $request->memo_no,
                        'dealer_id'              => $request->dealer_id,
                        'warehouse_id'           => $request->warehouse_id,
                        'total_price'            => $request->total_price,
                        'total_deduction'        => $request->total_deduction ? $request->total_deduction : null,
                        'tax_rate'               => $request->tax_rate ? $request->tax_rate : null,
                        'total_tax'              => $request->total_tax ? $request->total_tax : null,
                        'grand_total'            => $request->grand_total_price,
                        'deducted_sr_commission' => $deducted_commission,
                        'reason'                 => $request->reason,
                        'date'                   => $request->sale_date,
                        'return_date'            => $request->return_date,
                        'created_by'             => Auth::user()->name
                    ];
                    $sale_return  = $this->model->create($sale_return_date);
                    $products = [];
                    if ($request->has('products')) {
                        foreach ($request->products as $key => $value) {
                            if ($value['return'] == 1) {
                                $unit = Unit::where('unit_name', $value['unit'])->first();
                                if ($unit->operator == '*') {
                                    $qty = $value['return_qty'] * $unit->operation_value;
                                } else {
                                    $qty = $value['return_qty'] / $unit->operation_value;
                                }
                                $products[] = [
                                    'dealer_sale_return_id'     => $sale_return->id,
                                    'memo_no'            => $request->memo_no,
                                    'product_id'         => $value['id'],
                                    'return_qty'         => $value['return_qty'],
                                    'product_condition'  => $value['product_condition'],
                                    'unit_id'            => $unit ? $unit->id : null,
                                    'product_rate'       => $value['net_unit_price'],
                                    'deduction_rate'     => $value['deduction_rate'] ? $value['deduction_rate'] : null,
                                    'deduction_amount'   => $value['deduction_amount'] ? $value['deduction_amount'] : null,
                                    'total'              => $value['total']
                                ];
                                if ($value['product_condition'] == 1) {
                                    $warehouseProduct = WarehouseProduct::where([['warehouse_id', $warehouse_id], ['product_id', $value['id']]])->first();
                                    if (!empty($warehouseProduct)) {
                                        $warehouseProduct->update(['bag_qty' => $warehouseProduct->bag_qty + $value['return_qty']]);
                                    } else {
                                        WarehouseProduct::create([
                                            'warehouse_id' => $warehouse_id,
                                            'product_id'   => $value['id'],
                                            'bag_qty'      => $value['return_qty']
                                        ]);
                                    }
                                } else {
                                    $warehouseProduct = WarehouseProduct::where([['warehouse_id', $warehouse_id], ['product_id', $value['id']]])->first();
                                    if (!empty($warehouseProduct)) {
                                        $warehouseProduct->update(['damaged_bag_qty' => $warehouseProduct->damaged_bag_qty + $value['return_qty']]);
                                    } else {
                                        WarehouseProduct::create([
                                            'warehouse_id' => $warehouse_id,
                                            'product_id'   => $value['id'],
                                            'damaged_bag_qty'      => $value['return_qty']
                                        ]);
                                    }
                                }
                            }
                        }
                        if (count($products) > 0) {
                            $dealerReturnProduct = DealerSaleReturnProduct::insert($products);
                        }
                    }
                    $dealer = Dealer::with('coa')->find($request->dealer_id);
                    $customer_credit = array(
                        'chart_of_account_id' => $dealer->coa->id,
                        'voucher_no'          => $request->memo_no,
                        'voucher_type'        => 'Return',
                        'voucher_date'        => $request->return_date,
                        'description'         => 'Dealer ' . $dealer->name . ' credit for Product Return Invoice NO- ' . $request->invoice_no,
                        'debit'               => 0,
                        'credit'              => $request->grand_total_price,
                        'posted'              => 1,
                        'approve'             => 1,
                        'created_by'          => auth()->user()->name,
                        'created_at'          => date('Y-m-d H:i:s')
                    );
                    Transaction::create($customer_credit);
                    $output  = $this->store_message($sale_return, null);
                    DB::commit();
                } catch (\Exception $e) {
                    DB::rollback();
                    $output = ['status' => 'error', 'message' => $e->getMessage()];
                }
                return response()->json($output);
            } else {
                return response()->json($this->unauthorized());
            }
        } else {
            return response()->json($this->unauthorized());
        }
    }
    public function show(int $id)
    {
        if (permission('sale-return-access')) {
            $this->setPageData('Dealer Sale Return Details', 'Dealer Sale Return Details', 'fas fa-file', [['name' => 'Dealer Sale Return Details']]);
            $sale = $this->model->with('return_products', 'dealer', 'sale', 'warehouse')->find($id);
            if ($sale) {
                return view('stockreturn::dealer-sale.details', compact('sale'));
            } else {
                return redirect('sale.return')->with('error', 'No Data Available');
            }
        } else {
            return $this->access_blocked();
        }
    }
    public function delete(Request $request)
    {
        if ($request->ajax()) {
            if (permission('sale-return-access')) {
                DB::beginTransaction();
                try {
                    $saleData = $this->model->with('sale', 'return_products')->find($request->id);
                    if (!$saleData->return_products->isEmpty()) {
                        foreach ($saleData->return_products as  $return_product) {
                            $return_qty = $return_product->return_qty;
                            $sale_unit = Unit::find($return_product->unit_id);
                            if ($sale_unit->operator == '*') {
                                $return_qty = $return_qty * $sale_unit->operation_value;
                            } else {
                                $return_qty = $return_qty / $sale_unit->operation_value;
                            }
                            $warehouse_product = WarehouseProduct::where([
                                'warehouse_id' => $saleData->sale->warehouse_id,
                                'product_id' => $return_product->product_id,
                            ])->first();
                            if ($warehouse_product) {
                                $warehouse_product->bag_qty -= $return_qty;
                                $warehouse_product->update();
                            }
                        }
                        $saleData->return_products()->delete();
                    }
                    Transaction::where(['voucher_no' => $saleData->memo_no, 'voucher_type' => 'Return'])->delete();
                    $result = $saleData->delete();
                    if ($result) {
                        $output = ['status' => 'success', 'message' => 'Data has been deleted successfully'];
                    } else {
                        $output = ['status' => 'error', 'message' => 'Failed to delete data'];
                    }
                    DB::commit();
                } catch (\Exception $e) {
                    DB::rollback();
                    $output = ['status' => 'error', 'message' => $e->getMessage()];
                }
                return response()->json($output);
            } else {
                return response()->json($this->unauthorized());
            }
        } else {
            return response()->json($this->unauthorized());
        }
    }
}
