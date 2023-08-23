<?php

namespace Modules\StockReturn\Http\Controllers;

use App\Models\Tax;
use Illuminate\Http\Request;
use Modules\Sale\Entities\Sale;
use Modules\Purchase\Entities\Purchase;
use App\Http\Controllers\BaseController;
use Modules\DealerSale\Entities\DealerSale;
use Modules\Material\Entities\Material;
use Modules\Setting\Entities\Warehouse;

class StockReturnController extends BaseController
{
    public function index()
    {
        if (permission('purchase-return-access')) {
            $this->setPageData('Return', 'Return', 'fas fa-undo-alt', [['name' => 'Return']]);
            return view('stockreturn::form');
        } else {
            return $this->access_blocked();
        }
    }
    public function return_sale(Request $request)
    {
        if (permission('sale-return-access')) {
            $sale = Sale::with(['sale_products', 'customer:id,name,shop_name', 'warehouse:id,name', 'salesmen:id,name,phone'])->where('memo_no', $request->get('memo_no'))->first();
            if ($sale) {
                $this->setPageData('Sale Return', 'Sale Return', 'fas fa-undo-alt', [['name' => 'Sale Return']]);
                $data = [
                    'sale'       => $sale,
                    'warehouses' => Warehouse::all(),
                    'materials'  => Material::where('category_id', 23)->pluck('material_name', 'id')->toArray()
                ];
                return view('stockreturn::sale.edit', $data);
            } else {
                return redirect('return')->with(['status' => 'error', 'message' => 'No Data Found']);
            }
        } else {
            return $this->access_blocked();
        }
    }
    public function return_purchase(Request $request)
    {
        if (permission('purchase-return-access')) {
            $purchase    = Purchase::with('purchase_materials', 'supplier')->where('memo_no', $request->get('memo_no'))->first();
            if ($purchase) {
                $this->setPageData('Purchase Return', 'Purchase Return', 'fas fa-undo-alt', [['name' => 'Purchase Return']]);
                $data = [
                    'purchase'   => $purchase,
                    'warehouses' => Warehouse::all()
                ];
                return view('stockreturn::purchase.edit', $data);
            } else {
                return redirect('return')->with(['status' => 'error', 'message' => 'No Purchase Data Found']);
            }
        } else {
            return $this->access_blocked();
        }
    }

    public function returnDealerSale(Request $request)
    {
        if (permission('sale-return-access')) {
            $sale = DealerSale::with(['sale_products', 'dealer:id,name,shop_name', 'warehouse:id,name'])->where('memo_no', $request->get('memo_no'))->first();
            if ($sale) {
                $this->setPageData('Dealer Sale Return', 'Dealer Sale Return', 'fas fa-undo-alt', [['name' => 'Dealer Sale Return']]);
                $data = [
                    'sale'       => $sale,
                    'warehouses' => Warehouse::all(),
                    'materials'  => Material::where('category_id', 23)->pluck('material_name', 'id')->toArray()
                ];
                return view('stockreturn::dealer-sale.edit', $data);
            } else {
                return redirect('return')->with(['status' => 'error', 'message' => 'No Data Found']);
            }
        } else {
            return $this->access_blocked();
        }
    }
}
