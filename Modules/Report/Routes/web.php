<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::group(['middleware' => ['auth']], function () {
    //Closing Route
    Route::get('closing', 'ClosingReportController@index')->name('closing');
    Route::post('closing-data', 'ClosingReportController@closing_data')->name('closing.data');
    Route::post('closing/store', 'ClosingReportController@store')->name('closing.store');

    //Closing Report Route
    Route::get('closing-report', 'ClosingReportController@report')->name('closing.report');
    Route::post('closing-report/datatable-data', 'ClosingReportController@get_datatable_data')->name('closing.report.datatable.data');
    Route::post('closing-report/show', 'ClosingReportController@show')->name('closing.report.show');
    Route::post('closing-report/delete', 'ClosingReportController@delete')->name('closing.report.delete');

    //Warehouse Closing Report Route
    Route::get('warehouse-closing-report', 'WarehouseClosingReportController@index')->name('warehouse.closing.report');
    Route::post('warehouse-closing-report/datatable-data', 'WarehouseClosingReportController@get_datatable_data')->name('warehouse.closing.report.datatable.data');

    //Today Sales Report Route
    Route::get('today-sales-report', 'TodaySalesReportController@index')->name('today.sales.report');
    Route::post('today-sales-report/datatable-data', 'TodaySalesReportController@get_datatable_data')->name('today.sales.report.datatable.data');

    //Sales Report Route
    Route::get('sales-report', 'SalesReportController@index')->name('sales.report');
    Route::post('sales-report/datatable-data', 'SalesReportController@get_datatable_data')->name('sales.report.datatable.data');

    //Todays Customer Receipt Route
    Route::get('todays-customer-receipt', 'TodaysCustomerReceiptController@index')->name('todays.customer.receipt');
    Route::post('todays-customer-receipt/datatable-data', 'TodaysCustomerReceiptController@get_datatable_data')->name('todays.customer.receipt.datatable.data');

    //Customer Receipt Route
    Route::get('customer-receipt-list', 'CustomerReceiptController@index')->name('customer.receipt.list');
    Route::post('customer-receipt-list/datatable-data', 'CustomerReceiptController@get_datatable_data')->name('customer.receipt.list.datatable.data');

    //Salesman Wise Sales Report Route
    Route::get('salesman-wise-sales-report', 'SalesmanWiseSalesReportController@index')->name('salesman.wise.sales.report');
    Route::post('salesman-wise-sales-report/datatable-data', 'SalesmanWiseSalesReportController@get_datatable_data')->name('salesman.wise.sales.report.datatable.data');

    //SR Commission Report Route
    Route::get('sr-commission-report', 'SalesmanCommissionReportController@index')->name('sr.commission.report');
    Route::post('sr-commission-report/datatable-data', 'SalesmanCommissionReportController@get_datatable_data')->name('sr.commission.report.datatable.data');

    //Shipping Cost Report Route
    Route::get('shipping-cost-report', 'ShippingCostReportController@index')->name('shipping.cost.report');
    Route::post('shipping-cost-report/datatable-data', 'ShippingCostReportController@get_datatable_data')->name('shipping.cost.report.datatable.data');

    //Collection Report Route
    Route::get('collection-report', 'CollectionReportController@index')->name('collection.report');
    Route::post('collection-report/datatable-data', 'CollectionReportController@get_datatable_data')->name('collection.report.datatable.data');

    //Product Wise Sales Report Route
    Route::get('product-wise-sales-report', 'ProductWiseSalesReportController@index')->name('product.wise.sales.report');
    Route::post('product-wise-sales-report/datatable-data', 'ProductWiseSalesReportController@get_datatable_data')->name('product.wise.sales.report.datatable.data');

    //Warehouse Expense Report Route
    Route::get('warehouse-expense-report', 'ExpenseReportController@index')->name('warehouse.expense.report');
    Route::post('warehouse-expense-report/datatable-data', 'ExpenseReportController@get_datatable_data')->name('warehouse.expense.report.datatable.data');

    //Damage Report Route
    Route::get('damage-report', 'DamageReportController@index')->name('damage.report');
    Route::post('damage-report/datatable-data', 'DamageReportController@get_datatable_data')->name('damage.report.datatable.data');

    //Warehouse Summary Report Route
    Route::get('warehouse-summary', 'WarehouseSummaryController@index')->name('warehouse.summary');
    Route::post('warehouse-summary/data', 'WarehouseSummaryController@summary_data')->name('warehouse.summary.data');

    //Coupon Received Report Routes
    Route::get('coupon-received-report', 'ReceivedCouponController@index')->name('coupon.received.report');
    Route::post('coupon-received-report/datatable-data', 'ReceivedCouponController@get_datatable_data')->name('coupon.received.report.datatable.data');

    //Inventory Report Routes
    Route::get('inventory-report', 'InventoryController@index')->name('inventory.report');
    Route::post('inventory-report/datatable-data', 'InventoryController@get_datatable_data')->name('inventory.report.datatable.data');

    //Material Alert Report Route
    Route::get('material-stock-alert-report', 'MaterialStockAlertController@index')->name('material.stock.alert.report');
    Route::post('material-stock-alert-report/datatable-data', 'MaterialStockAlertController@get_datatable_data')->name('material.stock.alert.report.datatable.data');

    //Product Alert Report Route
    Route::get('product-stock-alert-report', 'ProductStockAlertController@index')->name('product.stock.alert.report');
    Route::post('product-stock-alert-report/datatable-data', 'ProductStockAlertController@get_datatable_data')->name('product.stock.alert.report.datatable.data');

    //Transfer Report Routes
    Route::get('transfer-report', 'TransferReportController@index')->name('transfer.report');
    Route::post('transfer-report/datatable-data', 'TransferReportController@get_datatable_data')->name('transfer.report.datatable.data');

    //Finish Goods Inventory Report Routes
    Route::get('finish-goods-inventory-report', 'FinishGoodsInventoryController@index')->name('finish.goods.inventory.report');
    Route::post('finish-goods-inventory-report/datatable-data', 'FinishGoodsInventoryController@get_datatable_data')->name('finish.goods.inventory.report.datatable.data');

    //Material Issue Report Routes
    Route::get('material-issue-report', 'MaterialIssueReportController@index')->name('material.issue.report');
    Route::post('material-issue-report/datatable-data', 'MaterialIssueReportController@get_datatable_data')->name('material.issue.report.datatable.data');

    //Batch Wise Coupon Report Routes
    Route::get('batch-wise-coupon-report', 'BatchWiseCouponController@index')->name('batch.wise.coupon.report');
    Route::post('batch-wise-coupon-report/datatable-data', 'BatchWiseCouponController@get_datatable_data')->name('batch.wise.coupon.report.datatable.data');

    //purchase Report
    Route::get('purchase-report', 'PurchaseReportController@index')->name('purchase.report');
    Route::post('purchase-report/datatable-data', 'PurchaseReportController@get_datatable_data')->name('purchase.report.datatable.data');

    //Supplier Due Report
    Route::get('supplier-due-report', 'SupplierDueReportController@index')->name('supplier.due.report');
    Route::post('supplier-due-report/datatable-data', 'SupplierDueReportController@get_datatable_data')->name('supplier.due.report.datatable.data');

    //Customer Due Report
    Route::get('customer-due-report', 'CustomerDueReportController@index')->name('customer.due.report');
    Route::post('customer-due-report/datatable-data', 'CustomerDueReportController@get_datatable_data')->name('customer.due.report.datatable.data');

    //Expired Product Report
    Route::get('expired-product-report', 'ExpiredProductReportController@index')->name('expired.product.report');
    Route::post('expired-product-report/datatable-data', 'ExpiredProductReportController@get_datatable_data')->name('expired.product.report.datatable.data');

    //Due Report
    Route::get('due-report', 'DueReportController@index')->name('due.report');
    Route::post('get-due-report-data', 'DueReportController@get_due_data')->name('get.due.report.data');

    //Dealer Report
    Route::get('dealer-report', 'DealerReportController@index')->name('dealer.report');
    Route::post('dealer-report/datatable-data', 'DealerReportController@get_datatable_data')->name('dealer.report.datatable.data');

    //Income Statement
    Route::get('income-statement-report', 'IncomeStatementReportController@report')->name('income.statement.report');

    //Dealer sales Report Route
    Route::get('dealer-sales-report', 'DealerSalesReportController@index')->name('dealer.sales.report');
    Route::post('dealer-sales-report/datatable-data', 'DealerSalesReportController@get_datatable_data')->name('dealer.sales.report.datatable.data');

    //Dealer monthly sales report
    Route::get('monthly-sales-report', 'MonthlyDealerSaleReportController@index')->name('monthly.dealer.sales.report');
    Route::post('monthly-sales-report/data', 'MonthlyDealerSaleReportController@productLedgerData')->name('monthly.dealer.sales.report.data');

    //Employee Ledger
    Route::get('employee-ledger', 'EmployeeLedgerController@index')->name('employee.ledger');
    Route::post('employee-ledger/data', 'EmployeeLedgerController@report')->name('employee.ledger.data');
});
