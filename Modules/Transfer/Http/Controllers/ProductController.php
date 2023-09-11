<?php

namespace Modules\Transfer\Http\Controllers;

use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Modules\Product\Entities\WarehouseProduct;

class ProductController extends Controller{

   public function stock(Request $request){
       $stock = WarehouseProduct::where(['warehouse_id' => $request->warehouse_id,'product_id' => $request->product_id])->first();
       return response()->json($stock);
   }
}
