<?php

namespace Modules\Product\Http\Controllers;

use App\Http\Controllers\BaseController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Modules\Product\Entities\Product;

class ProductQtyConverterController extends BaseController
{

    public function create()
    {
        $this->setPageData('Product Manage', 'Product Manage', 'fas fa-box', [['name' => 'Product Manage']]);
        $products = DB::table('products as p')->join('warehouse_product as wp','p.id','wp.product_id')->get();
        return view('product::qty_to_bag.create',compact('products'));
    }

    public function store()
    {
        //
    }
}
