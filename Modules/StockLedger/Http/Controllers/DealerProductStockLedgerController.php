<?php

namespace Modules\StockLedger\Http\Controllers;

use App\Http\Controllers\BaseController;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Modules\Dealer\Entities\Dealer;
use Modules\Product\Entities\Product;

class DealerProductStockLedgerController extends BaseController
{
    public function index()
    {
        if (permission('product-ledger-access')) {
            $title   = 'Dealer Product Ledger';
            $this->setPageData($title, $title, 'fas fa-file', [['name' => $title]]);
            $data = [
                'products'  => Product::all(),
                'categories' => Category::all(),
                'parties'   => Dealer::all()
            ];
            return view('stockledger::productLedger.dealerIndex', $data);
        } else {
            return $this->access_blocked();
        }
    }

    public function productLedgerData(Request $request)
    {
        $table         = '';
        $saleScale     = 0;
        $saleQty       = 0;
        $sales         = DB::table('products as p')
            ->join('categories as c', 'p.category_id', '=', 'c.id')
            ->join('units as u', 'p.base_unit_id', '=', 'u.id')
            ->join('dealer_sale_products as sp', 'sp.product_id', '=', 'p.id')
            ->join('dealer_sales as s', 'sp.dealer_sale_id', '=', 's.id')
            ->join('dealers as pa', 's.dealer_id', '=', 'pa.id')
            ->where([['s.status', '=', 2]])
            ->whereBetween('s.sale_date', [$request->start_date, $request->end_date])
            ->when(request('product_id'), function ($q1) {
                $q1->where('p.id', '=', request('product_id'));
            })
            ->when(request('category_id'), function ($q2) {
                $q2->where('p.category_id', '=', request('category_id'));
            })
            ->when(request('dealer_id'), function ($q3) {
                $q3->where('s.dealer_id', '=', request('dealer_id'));
            })
            ->select('s.memo_no as invoiceNo', 's.sale_date as saleDate', 'pa.name as partyName', 'p.name as productName', 'u.unit_name as unitName', 'u.unit_code as unitCode', 'c.name as categoryName', 'sp.total as scale', 'sp.qty as qty', 'sp.net_unit_price as price')
            //
            ->get();
        //        return $sales;
        // dd($sales);
        $table      .= '<table style="margin-bottom:10px !important;">
                            <tr>
                                <td class="text-center">
                                    <h1 class="name m-0 head_title" style="text-transform: uppercase"><b>' . (config('settings.title') ? config('settings.title') : env('APP_NAME')) . '</b></h1>
                                    <h3 class="name m-0 head_address"><b>' . (config('settings.address') ?  config('settings.address') : env('APP_NAME')) . '</b></h3>
                                      <p style="font-weight: normal;font-weight:bold;margin: 10px auto 5px auto;font-weight: bold;background: gray;width: 250px;color: white;text-align: center;padding:5px 0;}">' . __('Product Ledger') . '</p>
                                    <p style="font-weight: normal;margin:0;font-weight:bold;">' . __('Date') . ': ' . date('d-m-Y', strtotime($request->start_date)) . ' ' . __('To') . ' ' . date('d-m-Y', strtotime($request->end_date)) . '</p>
                                </td>
                            </tr>
                        </table>';
        $table      .= '<table style="margin-bottom:10px !important;">
                            <thead>
                                <tr class="text-center btn-primary">
                                    <th>' . __('Invoice No') . '</th>
                                    <th>' . __('Date') . '</th>
                                    <th>' . __('Dealer') . '</th>
                                    <th>' . __('Product') . '</th>
                                    <th>' . __('Category') . '</th>
                                     <th>' . __('Qty') . '</th>
                                    <th>' . __('Price') . '</th>
                                    <th>' . __('Total Price') . '</th>

                                </tr>
                            </thead>';
        $table      .= '<tbody>';
        foreach ($sales as $sale) {
            $table  .= '<tr class="text-center">
                          <td class="no">' . $sale->invoiceNo . '</td>
                          <td class="no">' . date('d-M-Y', strtotime($sale->saleDate)) . '</td>
                          <td class="no">' . $sale->partyName . '</td>
                          <td class="no">' . $sale->productName . '</td>
                          <td class="no">' . $sale->categoryName . '</td>
                              <td class="no">' . number_format($sale->qty, 2) . '</td>
                          <td class="no">' . number_format($sale->price, 2) . '</td>
                          <td class="no">' . number_format($sale->scale, 2) . '</td>

                        </tr>';
            $saleScale = $saleScale + $sale->scale;
            $saleQty   = $saleQty   + $sale->qty;
        }
        $table   .= '</tbody><tfoot>';
        $table   .= '<tr class="text-center">
                       <td class="no" colspan="5">Total</td>
                        <td class="no">' . number_format($saleQty, 2) . '</td>
                       <td class="no"></td>
                        <td class="no">' . number_format($saleScale, 2) . '</td>
                     </tr>';
        $table   .= '</tfoot></table>';
        return $table;
    }
}
