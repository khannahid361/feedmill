<?php

namespace Modules\Product\Http\Controllers;

use App\Http\Controllers\BaseController;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Modules\Product\Entities\Product;
use Modules\Product\Entities\WarehouseProduct;

class ProductQtyConverterController extends BaseController
{

    public function create()
    {
        $this->setPageData('Product Manage', 'Product Manage', 'fas fa-box', [['name' => 'Product Manage']]);
        $products = DB::table('products as p')->join('warehouse_product as wp', 'p.id', 'wp.product_id')->get(['p.id as id', 'p.name as name', 'wp.qty as qty']);
        return view('product::qty_to_bag.create', compact('products'));
    }

    public function store(Request $request)
    {
        // dd($request->all());
        DB::beginTransaction();
        try {
            $warehouseProduct = WarehouseProduct::where(['product_id' => $request->product_id])->first();
            $warehouseProduct->qty = $request->qty;
            $warehouseProduct->bag_qty = $warehouseProduct->bag_qty + $request->bag_qty;
            $warehouseProduct->unit = 50;
            $message = $warehouseProduct->update();
            DB::commit();
        } catch (Exception $e) {
            DB::rollback();
        }
        if ($message) {
            echo "<script>alert('Data Saved Successfull');</script>";
        } else {
            echo "<script>alert('Data could not be saved');</script>";
        }
        return redirect()->back();
    }
}
