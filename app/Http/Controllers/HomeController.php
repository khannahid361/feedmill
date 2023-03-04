<?php

namespace App\Http\Controllers;


use Illuminate\Support\Facades\DB;
use App\Http\Controllers\BaseController;


class HomeController extends BaseController{
    public function index(){
        if (permission('dashboard-access')){
            $this->setPageData('Dashboard','Dashboard','fas fa-technometer');
            $start                  = strtotime(date('Y').'-01-01');
            $end                    = strtotime(date('Y').'-12-31');
            $yearly_sale_amount     = [];
            $yearly_purchase_amount = [];
            while ($start < $end) {
                $start_date               = date('Y').'-'.date('m',$start).'-01';
                $end_date                 = date('Y').'-'.date('m',$start).'-31';
                $sale_amount              = DB::table('sales')->whereDate('sale_date','>=',$start_date)->whereDate('sale_date','<=',$end_date)->sum('grand_total');
                $purchase_amount          = DB::table('purchases')->whereDate('purchase_date','>=',$start_date)->whereDate('purchase_date','<=',$end_date)->sum('grand_total');
                $yearly_sale_amount[]     = number_format($sale_amount,2,'.','');
                $yearly_purchase_amount[] = number_format($purchase_amount,2,'.','');
                $start                    = strtotime('+1 month',$start);
            }
            return view('home',compact('yearly_sale_amount','yearly_purchase_amount'));
        }else{
            return redirect('unauthorized')->with(['status'=>'error','message'=>'Unauthorized Access Blocked']);
        }
    }
    public function dashboard_data($start_date,$end_date){
        if($start_date && $end_date) {
            $totalCustomerDues = 0;
            $purchase          = DB::table('purchases')->where([['purchase_status','=',1]])->whereDate('purchase_date','>=',$start_date)->whereDate('purchase_date','<=',$end_date)->sum('grand_total');
            $sale              = DB::table('sales')->where([['status','=',2]])->whereDate('sale_date','>=',$start_date)->whereDate('sale_date','<=',$end_date)->sum('grand_total');
            $income            = DB::table('sales')->where([['status','=',2]])->whereDate('sale_date','>=',$start_date)->whereDate('sale_date','<=',$end_date)->sum('paid_amount');
            $expense           = DB::table('expenses')->whereDate('date','>=',$start_date)->whereDate('date','<=',$end_date)->sum('amount');
            $supplierDue       = DB::table('transactions as t')->join('chart_of_accounts as coa','t.chart_of_account_id','=','coa.id')->select(DB::raw("(SUM(t.credit) - SUM(t.debit)) as due"))->whereNotNull('coa.supplier_id')->whereDate('t.voucher_date','<=',$end_date)->first();
            $customerDue       = DB::table('sales as s')->leftJoin('customers as c','s.customer_id','=','c.id')->selectRaw('s.customer_id,s.due_amount,max(s.id) as last_due_id')->groupBy('s.customer_id')->where('s.due_amount','>',0)
                               ->when($start_date,function($q) use($start_date){
                                $q->whereDate('s.sale_date','>=',$start_date);
                               })
                               ->when($end_date,function($q) use($end_date){
                               $q->whereDate('s.sale_date','<=',$end_date);
                               })
                               ->get();
            if(!$customerDue->isEmpty()) {
                foreach ($customerDue->chunk(10) as $chunk) {
                    foreach ($chunk as $value) {
                        $totalCustomerDues += $value->due_amount;
                    }
                }
            }
            $srCommissionDue = DB::table('transactions as t')->join('chart_of_accounts as coa','t.chart_of_account_id','=','coa.id')->select(DB::raw("(SUM(t.credit) - SUM(t.debit)) as due_commission"))->whereNotNull('coa.salesmen_id')->whereDate('t.voucher_date','<=',$end_date)->first();
            $customer        = DB::table('customers')->count();
            $data = [
                'purchase'          => $purchase,
                'sale'              => $sale,
                'income'            => $income,
                'expense'           => $expense,
                'supplierDue'       => $supplierDue ? $supplierDue->due : 0,
                'customerDue'       => $totalCustomerDues,
                'srCommissionDue'   => $srCommissionDue ? $srCommissionDue->due_commission : 0,
                'totalCustomer'     => $customer,
            ];
            return response()->json($data);
        }
    }
    public function unauthorized(){
        $this->setPageData('Unauthorized','Unauthorized','fas fa-ban',[['name' => 'Unauthorized']]);
        return view('unauthorized');
    }
    public function stock_alert(){
        $materials = DB::table('materials')->where('status',1)->whereColumn('alert_qty','>','qty')->count();
        $products  = DB::table('warehouse_product as wp')
                     ->join('products as p','wp.product_id','=','p.id')
                     ->join('categories as c','p.category_id','=','c.id')
                     ->join('units as u','p.base_unit_id','=','u.id')
                     ->selectRaw('wp.*,p.name,c.name as category_name,u.unit_name')
                     ->groupBy('wp.product_id')
                     ->whereColumn('p.alert_quantity','>','wp.qty')->get()->count();
        return response()->json(['materials' => $materials,'products'=>$products]);
    }
}
