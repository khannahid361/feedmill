<?php

namespace Modules\DealerPanel\Entities;

use App\Models\BaseModel;
use App\Models\User;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Support\Facades\DB;
use Modules\Product\Entities\Product;
use Modules\Product\Entities\WarehouseProduct;
use Modules\Setting\Entities\Warehouse;
use Modules\Transfer\Entities\TransferProduct;

class DealerProduct extends BaseModel
{
    protected $table = 'transfers';
    protected $fillable = [
        'challan_no','from_warehouse_id','to_warehouse_id','item','total_qty',
        'receive_qty','damage_qty','shipping_cost','received_cost','grand_total',
        'transfer_date','transfer_status','receiver_id','receive_date','receive_status',
        'note', 'created_by','modified_by','driver_name','dmobile_no'
    ];

    public function from_warehouse()
    {
        return $this->belongsTo(Warehouse::class,'from_warehouse_id','id');
    }
    public function to_warehouse()
    {
        return $this->belongsTo(Warehouse::class,'to_warehouse_id','id');
    }
    public function receiver()
    {
        return $this->belongsTo(User::class,'receiver_id','id');
    }

    public function products()
    {
        return $this->belongsToMany(Product::class,'transfer_products','transfer_id','product_id','id','id')
            ->withPivot('id','transfer_qty','receive_qty','damage_qty','unit_id','net_unit_cost','total')
            ->withTimestamps();
    }

    public function hasManyProducts()
    {
        return $this->hasMany(TransferProduct::class,'transfer_id','id');
    }

    /******************************************
     * * * Begin :: Custom Datatable Code * * *
     *******************************************/
    protected $order = ['t.id' => 'desc'];
    //custom search column property
    protected $_challan_no;
    protected $_from_date;
    protected $_to_date;
    protected $_from_warehouse_id;
    protected $_to_warehouse_id;
    protected $_transfer_status;
    protected $_receive_status;

    //methods to set custom search property value
    public function setChallanNo($challan_no)
    {
        $this->challan_no = $challan_no;
    }

    public function setFromDate($from_date)
    {
        $this->_from_date = $from_date;
    }
    public function setToDate($to_date)
    {
        $this->_to_date = $to_date;
    }
    public function setFromWarehouseID($from_warehouse_id)
    {
        $this->_from_warehouse_id = $from_warehouse_id;
    }
    public function setToWarehouseID($to_warehouse_id)
    {
        $this->_to_warehouse_id = $to_warehouse_id;
    }
    public function setTransferStatus($transfer_status)
    {
        $this->_transfer_status = $transfer_status;
    }
    public function setReceiveStatus($receive_status)
    {
        $this->_receive_status = $receive_status;
    }

    private function get_datatable_query()
    {
      $user =  auth()->guard('dealer')->user()->warehouse_id;
        $this->column_order = [null,'challan_no','from_warehouse_id','to_warehouse_id','item','total_qty',
            'receive_qty','damage_qty','shipping_cost','received_cost','grand_total',
            'transfer_date','transfer_status','receiver_id','receive_date','receive_status',
            'note', 'created_by','modified_by','driver_name','dmobile_no', null];
        //set column sorting index table column name wise (should match with frontend table header)
        $query = DB::table('transfers as t')
            ->leftJoin('warehouses as fw', 't.from_warehouse_id', '=', 'fw.id')
            ->leftJoin('warehouses as tw', 't.to_warehouse_id', '=', 'tw.id')
            ->leftJoin('users as u', 't.receiver_id', '=', 'u.id')
            ->select('t.*', 'fw.name as fw_name', 'tw.name as tw_name', 'u.name as receiver_name')->where('to_warehouse_id',$user);

        //search query


        //order by data fetching code
        if (isset($this->orderValue) && isset($this->dirValue)) {
            $query->orderBy($this->column_order[$this->orderValue], $this->dirValue);
        } else if (isset($this->order)) {
            $query->orderBy(key($this->order), $this->order[key($this->order)]);
        }
        return $query;
    }

    public function getDatatableList()
    {
        $query = $this->get_datatable_query();
        if ($this->lengthVlaue != -1) {
            $query->offset($this->startVlaue)->limit($this->lengthVlaue);
        }
        return $query->get();
    }

    public function count_filtered()
    {
        $query = $this->get_datatable_query();
        return $query->get()->count();
    }

    public function count_all()
    {
        return DB::table('transfers')->get()->count();
    }
    /******************************************
     * * * End :: Custom Datatable Code * * *
     *******************************************/

    public function transfer_data($collection)
    {
        $collection = $collection->merge($collection->all()['transfer_id'] ? ['modified_by'=>auth()->user()->name] : ['created_by'=>auth()->user()->name]);
        return $collection->all();
    }

    public function transfer_product_data($request)
    {
        $products = [];
        if($request->has('products'))
        {
            foreach ($request->products as $key => $value) {
                $products[$value['id']] = [
                    'transfer_qty' => $value['transfer_qty'],
                    'unit_id'      => $value['unit_id'],
                    'net_unit_cost'=> $value['net_unit_cost'],
                    'total'        => $value['subtotal'],
                ];
                if($request->transfer_status == 1)
                {
                    $from_warehouse = WarehouseProduct::where([
                        ['warehouse_id',$request->from_warehouse_id],
                        ['product_id',$value['id']],
                        ['qty','>=',$value['transfer_qty']]
                    ])->first();
                    if($from_warehouse)
                    {
                        $from_warehouse->qty -= $value['transfer_qty'];
                        $from_warehouse->update();
                    }
                }
            }
        }
        return $products;
    }

    public function receive_transfer_product_data($request)
    {
        $products = [];
        if($request->has('products'))
        {
            foreach ($request->products as $key => $value) {
                $products[$value['id']] = [
                    "receive_qty" => $value['receive_qty'],
                    "damage_qty" => $value['damage_qty']
                ];

                $to_warehouse = WarehouseProduct::where([
                    ['warehouse_id',$request->to_warehouse_id],
                    ['product_id',$value['id']]
                ])->first();
                if($to_warehouse)
                {
                    $to_warehouse->qty += $value['receive_qty'];
                    $to_warehouse->update();
                }else{
                    WarehouseProduct::create([
                        'warehouse_id'=> $request->to_warehouse_id,
                        'product_id'=>$value['id'],
                        'qty'=> $value['receive_qty']
                    ]);
                }

            }
        }
        return $products;
    }

    public function shipping_expense_transaction($request)
    {
        return [
            'chart_of_account_id' => DB::table('chart_of_accounts')->where('code', '401')->value('id'),
            'warehouse_id'        => $request->from_warehouse_id,
            'voucher_no'          => $request->challan_no,
            'voucher_type'        => 'Inventory Transfer',
            'voucher_date'        => $request->transfer_date,
            'description'         => 'Inventory transfer shipping cost '.$request->shipping_cost,
            'debit'               => $request->shipping_cost,
            'credit'              => 0,
            'posted'              => 1,
            'approve'             => 1,
            'created_by'          => auth()->user()->name,
            'created_at'          => date('Y-m-d H:i:s')
        ];
    }

    public function inventory_damage_transaction($request)
    {
        return [
            'chart_of_account_id' => DB::table('chart_of_accounts')->where('code', '10101')->value('id'),
            'warehouse_id'        => $request->from_warehouse_id,
            'voucher_no'          => $request->challan_no,
            'voucher_type'        => 'Inventory Transfer',
            'voucher_date'        => $request->transfer_date,
            'description'         => 'Inventory transfer product damage cost '.$request->total_damage_cost,
            'debit'               => 0,
            'credit'              => $request->total_damage_cost,
            'posted'              => 1,
            'approve'             => 1,
            'created_by'          => auth()->user()->name,
            'created_at'          => date('Y-m-d H:i:s')
        ];
    }

    public function reset_product_stock($transfer)
    {
        if(!$transfer->products->isEmpty())
        {
            if($transfer->transfer_status == 1){
                foreach ($transfer->products as $value) {
                    $from_warehouse = WarehouseProduct::where([
                        ['warehouse_id',$transfer->from_warehouse_id],
                        ['product_id',$value->id]
                    ])->first();
                    if($from_warehouse)
                    {
                        $from_warehouse->qty += $value->pivot->transfer_qty;
                        $from_warehouse->update();
                    }
                    if($transfer->receive_status != 3)
                    {
                        $to_warehouse = WarehouseProduct::where([
                            ['warehouse_id',$transfer->to_warehouse_id],
                            ['product_id',$value->id]
                        ])->first();
                        if($to_warehouse)
                        {
                            $to_warehouse->qty -= $value->pivot->received_qty;
                            $to_warehouse->update();
                        }
                    }
                }
            }

            $delete = $transfer->products()->detach();
            return $delete ? true : false;
        }
    }

}
