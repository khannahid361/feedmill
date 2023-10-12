<?php

namespace App\Http\Controllers;


use Illuminate\Support\Facades\DB;
use App\Http\Controllers\BaseController;


class HomeController extends BaseController
{
    public function index()
    {
        if (permission('dashboard-access')) {
            $this->setPageData('Dashboard', 'Dashboard', 'fas fa-technometer');
            $start = strtotime(date('Y') . '-01-01');
            $end = strtotime(date('Y') . '-12-31');
            $yearly_sale_amount = [];
            $yearly_purchase_amount = [];
            while ($start < $end) {
                $start_date = date('Y') . '-' . date('m', $start) . '-01';
                $end_date = date('Y') . '-' . date('m', $start) . '-31';
                $sale_amount = DB::table('sales')->whereDate('sale_date', '>=', $start_date)->whereDate('sale_date', '<=', $end_date)->sum('grand_total');
                $dealer_sale_amount = DB::table('dealer_sales')->whereDate('sale_date', '>=', $start_date)->whereDate('sale_date', '<=', $end_date)->sum('grand_total');
                $purchase_amount = DB::table('purchases')->whereDate('purchase_date', '>=', $start_date)->whereDate('purchase_date', '<=', $end_date)->sum('grand_total');
                $yearly_sale_amount[] = number_format($sale_amount + $dealer_sale_amount, 2, '.', '');
                $yearly_purchase_amount[] = number_format($purchase_amount, 2, '.', '');
                $start = strtotime('+1 month', $start);
            }
//            dd($purchase_amount);
            return view('home', compact('yearly_sale_amount', 'yearly_purchase_amount'));
        } else {
            return redirect('unauthorized')->with(['status' => 'error', 'message' => 'Unauthorized Access Blocked']);
        }
    }

    public function dashboard_data($start_date, $end_date)
    {
        if ($start_date && $end_date) {
            $totalCustomerDues = 0;
            $purchase = DB::table('purchases')->where([['purchase_status', '=', 1]])->whereDate('purchase_date', '>=', $start_date)->whereDate('purchase_date', '<=', $end_date)->sum('grand_total');
            $sale = DB::table('sales')->where([['status', '=', 2]])->whereDate('sale_date', '>=', $start_date)->whereDate('sale_date', '<=', $end_date)->sum('grand_total');
            $dealerSale = DB::table('dealer_sales')->where([['status', '=', 2]])->whereDate('sale_date', '>=', $start_date)->whereDate('sale_date', '<=', $end_date)->sum('grand_total');
            $expense = DB::table('expenses')->whereDate('date', '>=', $start_date)->whereDate('date', '<=', $end_date)->sum('amount');
            $supplierDue = DB::table('transactions as t')->join('chart_of_accounts as coa', 't.chart_of_account_id', '=', 'coa.id')->select(DB::raw("(SUM(t.credit) - SUM(t.debit)) as due"))->whereNotNull('coa.supplier_id')->whereDate('t.voucher_date', '<=', $end_date)->first();
            $dealersaleIncome = DB::table('transactions as t')->join('chart_of_accounts as coa', 't.chart_of_account_id', '=', 'coa.id')->select(DB::raw("(SUM(t.credit)) as income"))->whereNotNull('coa.dealer_id')->whereDate('t.voucher_date', '>=', $start_date)->whereDate('t.voucher_date', '<=', $end_date)->first();
            $saleIncome = DB::table('transactions as t')->join('chart_of_accounts as coa', 't.chart_of_account_id', '=', 'coa.id')->select(DB::raw("(SUM(t.credit)) as income"))->whereNotNull('coa.customer_id')->whereDate('t.voucher_date', '>=', $start_date)->whereDate('t.voucher_date', '<=', $end_date)->first();
            $income = $dealersaleIncome->income + $saleIncome->income;
            $customerDue = DB::table('sales as s')->leftJoin('customers as c', 's.customer_id', '=', 'c.id')->selectRaw('s.customer_id,s.due_amount,max(s.id) as last_due_id')->groupBy('s.customer_id')->where('s.due_amount', '>', 0)
                ->when($start_date, function ($q) use ($start_date) {
                    $q->whereDate('s.sale_date', '>=', $start_date);
                })
                ->when($end_date, function ($q) use ($end_date) {
                    $q->whereDate('s.sale_date', '<=', $end_date);
                })
                ->get();
            if (!$customerDue->isEmpty()) {
                foreach ($customerDue->chunk(10) as $chunk) {
                    foreach ($chunk as $value) {
                        $totalCustomerDues += $value->due_amount;
                    }
                }
            }

            $dealerDue = DB::table('dealer_sales as s')->leftJoin('dealers as c', 's.dealer_id', '=', 'c.id')->selectRaw('s.dealer_id,s.due_amount,max(s.id) as last_due_id')->groupBy('s.dealer_id')->where('s.due_amount', '>', 0)
                ->when($start_date, function ($q) use ($start_date) {
                    $q->whereDate('s.sale_date', '>=', $start_date);
                })
                ->when($end_date, function ($q) use ($end_date) {
                    $q->whereDate('s.sale_date', '<=', $end_date);
                })
                ->get();
            if (!$dealerDue->isEmpty()) {
                foreach ($dealerDue->chunk(10) as $chunk) {
                    foreach ($chunk as $value) {
                        $totalCustomerDues += $value->due_amount;
                    }
                }
            }
//            $srCommissionDue = DB::table('transactions as t')->join('chart_of_accounts as coa', 't.chart_of_account_id', '=', 'coa.id')->select(DB::raw("(SUM(t.credit) - SUM(t.debit)) as due_commission"))->whereNotNull('coa.salesmen_id')->whereDate('t.voucher_date', '<=', $end_date)->first();
            $customer = DB::table('customers')->count();
            $dealer = DB::table('dealers')->count();
            $totalCustomer = $customer + $dealer;

            //commission
            $yearlyCommission = DB::table('dealers as s')
                ->selectRaw('SUM((select ifnull(sum(credit), 0) from transactions where chart_of_account_id = b.id AND approve = 1)) as total_credit')
                ->selectRaw('SUM((select ifnull(sum(debit), 0) from transactions where chart_of_account_id = b.id AND approve = 1)) as total_debit')
                ->leftjoin('chart_of_accounts as b', 's.id', '=', 'b.dealer_id')
                ->where('b.parent_name', 'Commission Yearly Payable')
                ->where('b.level', '3')
                ->first();
            $monthlyCommission = DB::table('dealers as s')
                ->selectRaw('SUM((select ifnull(sum(credit), 0) from transactions where chart_of_account_id = b.id AND approve = 1)) as total_credit')
                ->selectRaw('SUM((select ifnull(sum(debit), 0) from transactions where chart_of_account_id = b.id AND approve = 1)) as total_debit')
                ->leftjoin('chart_of_accounts as b', 's.id', '=', 'b.dealer_id')
                ->where('b.parent_name', 'Commission Monthly Payable')
                ->where('b.level', '3')
                ->first();
            $commissionDue = $monthlyCommission->total_credit + $yearlyCommission->total_credit - $yearlyCommission->total_debit - $monthlyCommission->total_debit;
            $data = [
                'purchase' => $purchase,
                'sale' => $sale + $dealerSale,
                'income' => $income,
                'expense' => $expense,
                'supplierDue' => $supplierDue ? $supplierDue->due : 0,
                'customerDue' => $totalCustomerDues,
                'srCommissionDue' => $commissionDue,
                'totalCustomer' => $totalCustomer,
            ];
            return response()->json($data);
        }
    }

    public function unauthorized()
    {
        $this->setPageData('Unauthorized', 'Unauthorized', 'fas fa-ban', [['name' => 'Unauthorized']]);
        return view('unauthorized');
    }

    public function stock_alert()
    {
        $materials = DB::table('materials')->where('status', 1)->whereColumn('alert_qty', '>', 'qty')->count();
        $products = DB::table('warehouse_product as wp')
            ->join('products as p', 'wp.product_id', '=', 'p.id')
            ->join('categories as c', 'p.category_id', '=', 'c.id')
            ->join('units as u', 'p.unit_id', '=', 'u.id')
            ->selectRaw('wp.*,p.name,c.name as category_name,u.unit_name')
            ->groupBy('wp.product_id')
            ->whereColumn('p.alert_quantity', '>', 'wp.qty')->get()->count();
        return response()->json(['materials' => $materials, 'products' => $products]);
    }
}
