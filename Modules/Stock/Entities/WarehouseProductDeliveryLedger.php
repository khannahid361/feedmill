<?php

namespace Modules\Stock\Entities;

use App\Models\BaseModel;
use Illuminate\Support\Facades\DB;

class WarehouseProductDeliveryLedger extends BaseModel
{
    // protected $order    = ['warehouse_id' => 'asc'];
    protected $_party;
    protected $_from_date;
    protected $_to_date;
    protected $_category;
    protected $_warehouse;
    public function warehouse()
    {
        return $this->belongsTo(Warehouse::class);
    }
    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    //set up variables

    public function setFromDate($from_date)
    {
        $this->_from_date = $from_date;
    }
    public function setToDate($to_date)
    {
        $this->_to_date = $to_date;
    }
    public function setParty($party)
    {
        $this->_party = $party;
    }
    public function setCategory($category)
    {
        $this->_category = $category;
    }
    public function setWarehouse($warehouse)
    {
        $this->_warehouse = $warehouse;
    }
    private function get_datatable_query()
    {
        $this->column_order = ['name', 'product_name', 'quantity', 'type', 'warehouse_name', 'category_name', 'invoice_no', 'delivery_date', 'warehouse_id', null];

        $deliveries = DB::table('deliveries')
            ->join('sales', 'deliveries.sale_id', 'sales.id')
            ->join('warehouses', 'deliveries.warehouse_id', 'warehouses.id')
            ->join('delivery_products', 'deliveries.id', '=', 'delivery_products.delivery_id')
            ->join('customers', 'deliveries.customer_id', '=', 'customers.id')
            ->join('products', 'delivery_products.product_id', 'products.id')
            ->join('categories', 'products.category_id', 'categories.id')
            ->select('customers.name as name', 'products.name as product_name', 'delivery_products.delivery_qty as quantity', DB::raw("'Customer' as type"), 'warehouses.name as warehouse_name', 'categories.name as category_name', 'sales.memo_no as invoice_no', 'deliveries.delivery_date as delivery_date', 'warehouses.id as warehouse_id', 'categories.id as category_id');

        if (!empty($this->_warehouse)) {
            $deliveries->where('deliveries.warehouse_id',  $this->_warehouse);
        }
        if (!empty($this->_from_date)) {
            $deliveries->where('deliveries.delivery_date', '>=', $this->_from_date);
        }
        if (!empty($this->_to_date)) {
            $deliveries->where('deliveries.delivery_date', '<=', $this->_to_date);
        }
        if (!empty($this->_category)) {
            $deliveries->where('products.category_id', $this->_category);
        }
        if (!empty($this->_warehouse)) {
            $deliveries->where('deliveries.warehouse_id',  $this->_warehouse);
        }

        $dealerDeliveries = DB::table('dealer_deliveries')
            ->join('dealer_sales', 'dealer_deliveries.dealer_sale_id', 'dealer_sales.id')
            ->join('warehouses', 'dealer_deliveries.warehouse_id', 'warehouses.id')
            ->join('dealer_delivery_products', 'dealer_deliveries.id', '=', 'dealer_delivery_products.dealer_delivery_id')
            ->join('dealers', 'dealer_deliveries.dealer_id', '=', 'dealers.id')
            ->join('products', 'dealer_delivery_products.product_id', 'products.id')
            ->join('categories', 'products.category_id', 'categories.id')
            ->select('dealers.name as name', 'products.name as product_name', 'dealer_delivery_products.delivery_qty as quantity', DB::raw("'Dealer' as type"), 'warehouses.name as warehouse_name', 'categories.name as category_name', 'dealer_sales.memo_no as invoice_no', 'dealer_deliveries.delivery_date as delivery_date', 'warehouses.id as warehouse_id', 'categories.id as category_id');

        if (!empty($this->_warehouse)) {
            $dealerDeliveries->where('dealer_deliveries.warehouse_id',  $this->_warehouse);
        }
        if (!empty($this->_from_date)) {
            $dealerDeliveries->where('dealer_deliveries.delivery_date', '>=', $this->_from_date);
        }
        if (!empty($this->_to_date)) {
            $dealerDeliveries->where('dealer_deliveries.delivery_date', '<=', $this->_to_date);
        }
        if (!empty($this->_category)) {
            $dealerDeliveries->where('products.category_id', $this->_category);
        }
        if (!empty($this->_warehouse)) {
            $dealerDeliveries->where('dealer_deliveries.warehouse_id',  $this->_warehouse);
        }

        if (!empty($this->_party) && $this->_party == 2) {
            $query = $dealerDeliveries;
        }
        elseif(!empty($this->_party) && $this->_party == 1)
        {
            $query = $deliveries;
        }

        else {
            $query = $dealerDeliveries->union($deliveries);
        }
        // if (isset($this->orderValue) && isset($this->dirValue)) {
        //     $query->orderBy($this->column_order[$this->orderValue], $this->dirValue);
        // } else if (isset($this->order)) {
        //     $query->orderBy(key($this->order), $this->order[key($this->order)]);
        // }
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
        $deliveries = DB::table('deliveries')
        ->join('sales', 'deliveries.sale_id', 'sales.id')
        ->join('warehouses', 'deliveries.warehouse_id', 'warehouses.id')
        ->join('delivery_products', 'deliveries.id', '=', 'delivery_products.delivery_id')
        ->join('customers', 'deliveries.customer_id', '=', 'customers.id')
        ->join('products', 'delivery_products.product_id', 'products.id')
        ->join('categories', 'products.category_id', 'categories.id')
        ->select('customers.name as name', 'products.name as product_name', 'delivery_products.delivery_qty as quantity', DB::raw("'customer' as type"), 'warehouses.name as warehouse_name', 'categories.name as category_name', 'sales.memo_no as invoice_no', 'deliveries.delivery_date as delivery_date', 'warehouses.id as warehouse_id', 'categories.id as category_id');

        $dealerDeliveries = DB::table('dealer_deliveries')
        ->join('dealer_sales', 'dealer_deliveries.dealer_sale_id', 'dealer_sales.id')
        ->join('warehouses', 'dealer_deliveries.warehouse_id', 'warehouses.id')
        ->join('dealer_delivery_products', 'dealer_deliveries.id', '=', 'dealer_delivery_products.dealer_delivery_id')
        ->join('dealers', 'dealer_deliveries.dealer_id', '=', 'dealers.id')
        ->join('products', 'dealer_delivery_products.product_id', 'products.id')
        ->join('categories', 'products.category_id', 'categories.id')
        ->select('dealers.name as name', 'products.name as product_name', 'dealer_delivery_products.delivery_qty as quantity', DB::raw("'dealer' as type"), 'warehouses.name as warehouse_name', 'categories.name as category_name', 'dealer_sales.memo_no as invoice_no', 'dealer_deliveries.delivery_date as delivery_date', 'warehouses.id as warehouse_id', 'categories.id as category_id')->union($deliveries)->get()->count();;

        return $dealerDeliveries;
    }
}
