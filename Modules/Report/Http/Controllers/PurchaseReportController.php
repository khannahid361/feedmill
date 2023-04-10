<?php
namespace Modules\Report\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\BaseController;
use Modules\Report\Entities\PurchaseReport;

// use Modules\Report\Entities\SalesReport;

class PurchaseReportController extends BaseController{
    public function __construct(PurchaseReport $model){
        $this->model = $model;
    }
    public function index(){
        if(permission('purchase-report-access')){
            $this->setPageData('Purchase Report','Purchase Report','fas fa-file',[['name' => 'Purchase Report']]);
            $data = [
                'supplier'    => DB::table('suppliers')->where([['status',1]])->select('name','id')->get()
            ];
            return view('report::purchase-report',$data);
        }else{
            return $this->access_blocked();
        }
    }
    public function get_datatable_data(Request $request){
        if($request->ajax()){
           if(permission('purchase-report-access')){
                if (!empty($request->memo_no)) {
                    $this->model->setMemoNo($request->memo_no);
                }
                if (!empty($request->start_date)) {
                    $this->model->setFromDate($request->start_date);
                }
                if (!empty($request->end_date)) {
                    $this->model->setToDate($request->end_date);
                }
                if (!empty($request->supplier_id)) {
                    // return $request->supplier_id;
                    $this->model->setSupplierID($request->supplier_id);
                }
                $this->set_datatable_default_properties($request);
                $list = $this->model->getDatatableList();

//                return response()->json($list);

                $data = [];
                $no = $request->input('start');
                foreach ($list as $value) {
                    $no++;
                    $row    = [];
                    $row[]  = $value->memo_no;
                    $row[]  = $value->supplier_name;
                    $row[]  = $value->purchase_date;
                    $row[]  = $value->item;
                    $row[]  = $value->total_qty;
                    $row[]  = $value->total_cost;
                    $row[]  = $value->grand_total;
                    $row[]  = $value->paid_amount;
                    $row[]  = $value->created_by;
                    $data[] = $row;
                }
                return $this->datatable_draw($request->input('draw'),$this->model->count_all(), $this->model->count_filtered(), $data);
            }
       }else{
           return response()->json($this->unauthorized());
       }
    }
    protected function products($sale_id){
        $return_products = DB::table('sale_products as sp')
        ->leftjoin('products as p','sp.product_id','=','p.id')
        ->leftjoin('units as u','sp.sale_unit_id','=','u.id')
        ->select('sp.*','p.name','p.code','u.unit_name','u.unit_code')
        ->where('sp.sale_id',$sale_id)
        ->get();
        $name = $code = $unit = $qty = $price = $tax = $subtotal = '';
        if($return_products) {
            foreach ($return_products as $item) {
                $name       .= "<li class='pl-3'>".$item->name."</li>";
                $code       .= "<li class='pl-3'>".$item->code."</li>";
                $unit       .= "<li>".$item->unit_name."</li>";
                $qty        .= "<li>".number_format($item->qty,2,'.','')."</li>";
                $price      .= "<li class='pr-3'>".number_format($item->net_unit_price,2,'.','')."</li>";
                $tax      .= "<li class='pr-3'>".number_format($item->tax,2,'.','')."</li>";
                $subtotal   .= "<li class='pr-3'>".number_format($item->total,2,'.','')."</li>";
            }
        }
        return [
            'name'  => '<ul style="list-style:none;margin:0;padding:0;">'.$name.'</ul>',
            'code'     => '<ul style="list-style:none;margin:0;padding:0;">'.$code.'</ul>',
            'unit'     => '<ul style="list-style:none;margin:0;padding:0;">'.$unit.'</ul>',
            'qty'      => '<ul style="list-style:none;margin:0;padding:0;">'.$qty.'</ul>',
            'price'    => '<ul style="list-style:none;margin:0;padding:0;">'.$price.'</ul>',
            'tax'    => '<ul style="list-style:none;margin:0;padding:0;">'.$tax.'</ul>',
            'subtotal' => '<ul style="list-style:none;margin:0;padding:0;">'.$subtotal.'</ul>',
        ];
    }

}
