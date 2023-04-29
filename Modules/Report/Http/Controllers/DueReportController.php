<?php

namespace Modules\Report\Http\Controllers;

use App\Http\Controllers\BaseController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Modules\Customer\Entities\Customer;
use Modules\Dealer\Entities\Dealer;
use Modules\Setting\Entities\CustomerGroup;
use Modules\Setting\Entities\Warehouse;
use Modules\Supplier\Entities\Supplier;

class DueReportController extends BaseController
{
    public function index()
    {
        if (permission('due-report-access')) {
            $this->setPageData('Due Report', 'Due Report', 'far fa-handshake', [['name' => 'Due Report']]);
            $data = [
                'warehouses'      => Warehouse::where('status', 1)->pluck('name', 'id'),
                'customer_groups' => CustomerGroup::where('status', 1)->get(),
                'locations'       => DB::table('locations')->where('status', 1)->get(),
            ];
            return view('report::due-report', $data);
        } else {
            return $this->access_blocked();
        }
    }

    public function get_due_data(Request $request)
    {
        $this->setPageData('Due Report', 'Due Report', 'far fa-handshake', [['name' => 'Due Report']]);
        if (permission('due-report-access')) {
            $customers = Customer::get();
            $dealers = Dealer::get();
            $suppliers = Supplier::get();
            $data = [];
            if ($request->participent_id == 1) {
                foreach ($customers as $key => $customer) {
                    $blnc = DB::table('customers as c')
                        ->selectRaw('c.id,b.id as coaid,b.code,((select ifnull(sum(debit),0) from transactions where chart_of_account_id= b.id AND approve = 1)-(select ifnull(sum(credit),0) from transactions where chart_of_account_id= b.id AND approve = 1)) as balance')
                        ->leftjoin('chart_of_accounts as b', 'c.id', '=', 'b.customer_id')
                        ->where('c.id', $customer->id)->first();
                    $balance = 0;
                    if ($blnc) {
                        $balance = $blnc->balance ? $blnc->balance : 0;
                    }
                    $data[$key]['sl'] = $key + 1;
                    $data[$key]['name'] = $customer->name;
                    $data[$key]['mobile'] = $customer->mobile;
                    $data[$key]['address'] = $customer->address;
                    $data[$key]['group'] = 'Customer';
                    $data[$key]['balance'] = $balance;
                }
            }
            if ($request->participent_id == 2) {
                foreach ($dealers as $key => $value) {
                    $blnc = DB::table('dealers as c')
                        ->selectRaw('c.id,b.id as coaid,b.code,((select ifnull(sum(debit),0) from transactions where chart_of_account_id= b.id AND approve = 1)-(select ifnull(sum(credit),0) from transactions where chart_of_account_id= b.id AND approve = 1)) as balance')
                        ->leftjoin('chart_of_accounts as b', 'c.id', '=', 'b.dealer_id')
                        ->where('c.id', $value->id)->first();
                    $balance = 0;
                    if ($blnc) {
                        $balance = $blnc->balance ? $blnc->balance : 0;
                    }
                    $data[$key]['sl'] = $key + 1;
                    $data[$key]['name'] = $value->name;
                    $data[$key]['mobile'] = $value->mobile;
                    $data[$key]['address'] = $value->address;
                    $data[$key]['group'] = 'Dealer';
                    $data[$key]['balance'] = $balance;
                }
            }
            if ($request->participent_id == 3) {
                foreach ($suppliers as $key => $value) {
                    $blnc = DB::table('suppliers as c')
                        ->selectRaw('c.id,b.id as coaid,b.code,((select ifnull(sum(debit),0) from transactions where chart_of_account_id= b.id AND approve = 1)-(select ifnull(sum(credit),0) from transactions where chart_of_account_id= b.id AND approve = 1)) as balance')
                        ->leftjoin('chart_of_accounts as b', 'c.id', '=', 'b.supplier_id')
                        ->where('c.id', $value->id)->first();
                    $balance = 0;
                    if ($blnc) {
                        $balance = $blnc->balance ? $blnc->balance : 0;
                    }
                    $data[$key]['sl'] = $key + 1;
                    $data[$key]['name'] = $value->name;
                    $data[$key]['mobile'] = $value->mobile;
                    $data[$key]['address'] = $value->address;
                    $data[$key]['group'] = 'Supplier';
                    $data[$key]['balance'] = $balance;
                }
            }
            if ($request->participent_id == 0) {
                $totalSupplier = $suppliers->count();
                $totalCustomer = $customers->count();
                $totalDealer = $dealers->count();
                $total = $totalSupplier + $totalCustomer + $totalDealer;

                foreach ($customers as $key => $customer) {
                    $blnc = DB::table('customers as c')
                        ->selectRaw('c.id,b.id as coaid,b.code,((select ifnull(sum(debit),0) from transactions where chart_of_account_id= b.id AND approve = 1)-(select ifnull(sum(credit),0) from transactions where chart_of_account_id= b.id AND approve = 1)) as balance')
                        ->leftjoin('chart_of_accounts as b', 'c.id', '=', 'b.customer_id')
                        ->where('c.id', $customer->id)->first();
                    $balance = 0;
                    if ($blnc) {
                        $balance = $blnc->balance ? $blnc->balance : 0;
                    }
                    $data[$key]['sl'] = $key + 1;
                    $data[$key]['name'] = $customer->name;
                    $data[$key]['mobile'] = $customer->mobile;
                    $data[$key]['address'] = $customer->address;
                    $data[$key]['group'] = 'Customer';
                    $data[$key]['balance'] = $balance;
                }

                foreach ($dealers as $key => $value) {
                    $blnc = DB::table('dealers as c')
                        ->selectRaw('c.id,b.id as coaid,b.code,((select ifnull(sum(debit),0) from transactions where chart_of_account_id= b.id AND approve = 1)-(select ifnull(sum(credit),0) from transactions where chart_of_account_id= b.id AND approve = 1)) as balance')
                        ->leftjoin('chart_of_accounts as b', 'c.id', '=', 'b.dealer_id')
                        ->where('c.id', $value->id)->first();
                    $balance = 0;
                    if ($blnc) {
                        $balance = $blnc->balance ? $blnc->balance : 0;
                    }
                    $data[$key+$totalCustomer]['sl'] = $key+$totalCustomer + 1;
                    $data[$key+$totalCustomer]['name'] = $value->name;
                    $data[$key+$totalCustomer]['mobile'] = $value->mobile;
                    $data[$key+$totalCustomer]['address'] = $value->address;
                    $data[$key+$totalCustomer]['group'] = 'Dealer';
                    $data[$key+$totalCustomer]['balance'] = $balance;
                }

                foreach ($suppliers as $key => $value) {
                    $blnc = DB::table('suppliers as c')
                        ->selectRaw('c.id,b.id as coaid,b.code,((select ifnull(sum(debit),0) from transactions where chart_of_account_id= b.id AND approve = 1)-(select ifnull(sum(credit),0) from transactions where chart_of_account_id= b.id AND approve = 1)) as balance')
                        ->leftjoin('chart_of_accounts as b', 'c.id', '=', 'b.supplier_id')
                        ->where('c.id', $value->id)->first();
                    $balance = 0;
                    if ($blnc) {
                        $balance = $blnc->balance ? $blnc->balance : 0;
                    }
                    $data[$totalCustomer + $totalDealer + $key]['sl'] = $totalCustomer + $totalDealer + $key + 1;
                    $data[$totalCustomer + $totalDealer + $key]['name'] = $value->name;
                    $data[$totalCustomer + $totalDealer + $key]['mobile'] = $value->mobile;
                    $data[$totalCustomer + $totalDealer + $key]['address'] = $value->address;
                    $data[$totalCustomer + $totalDealer + $key]['group'] = 'Supplier';
                    $data[$totalCustomer + $totalDealer + $key]['balance'] = $balance;
                }
            }
            // dd($data);
            return view('report::due-report-show', compact('data'));
        } else {
            return $this->access_blocked();
        }
    }
}
