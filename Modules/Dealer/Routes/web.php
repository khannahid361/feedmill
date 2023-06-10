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
    Route::get('dealer', 'DealerController@index')->name('dealer');
    Route::group(['prefix' => 'dealer', 'as'=>'dealer.'], function () {
        Route::post('datatable-data', 'DealerController@get_datatable_data')->name('datatable.data');
        Route::get('add', 'DealerController@create')->name('add');
        Route::post('store-or-update', 'DealerController@store_or_update_data')->name('store.or.update');
        Route::get('edit/{id}', 'DealerController@edit')->name('edit');
        Route::post('view', 'DealerController@show')->name('view');
        Route::post('delete', 'DealerController@delete')->name('delete');
        Route::post('bulk-delete', 'DealerController@bulk_delete')->name('bulk.delete');
        Route::post('change-status', 'DealerController@change_status')->name('change.status');
        Route::get('previous-balance/{id}', 'DealerController@previous_balance');
    });

    Route::post('warehouse-wise-dealer-list','DealerController@warehouseWiseDealerList');

    Route::post('upazila-wise-dealer-list', 'DealerController@upazila_wise_dealer_list')->name('upazila.wise.dealer.list');
    //dealer Ledger Routes
    Route::get('dealer-ledger', 'DealerLedgerController@index')->name('dealer.ledger');
    Route::post('dealer-ledger/datatable-data', 'DealerLedgerController@get_datatable_data')->name('dealer.ledger.datatable.data');

    //dealer Advance Routes
    Route::get('dealer-advance', 'DealerAdvanceController@index')->name('dealer.advance');
    Route::group(['prefix' => 'dealer-advance', 'as'=>'dealer.advance.'], function () {
        Route::post('datatable-data', 'DealerAdvanceController@get_datatable_data')->name('datatable.data');
        Route::post('store-or-update', 'DealerAdvanceController@store_or_update_data')->name('store.or.update');
        Route::post('edit', 'DealerAdvanceController@edit')->name('edit');
        Route::post('view', 'DealerAdvanceController@show')->name('view');
        Route::post('delete', 'DealerAdvanceController@delete')->name('delete');
        Route::post('bulk-delete', 'DealerAdvanceController@bulk_delete')->name('bulk.delete');
        Route::post('change-status', 'DealerAdvanceController@change_status')->name('change.status');
    });

    //Monthly commission Target
    Route::get('dealer-monthly-commission', 'MonthlyTargetController@index')->name('dealer.monthly.commission');
    Route::group(['prefix' => 'dealer-monthly-commission', 'as'=>'dealer.monthly.commission.'], function () {
        Route::post('datatable-data', 'MonthlyTargetController@get_datatable_data')->name('datatable.data');
        Route::get('create', 'MonthlyTargetController@create')->name('create');
        Route::post('store', 'MonthlyTargetController@store')->name('store');
        Route::post('datatable-data', 'MonthlyTargetController@datatableData')->name('datatableData');
        Route::get('edit/{id}', 'MonthlyTargetController@edit')->name('edit');
        Route::post('show', 'MonthlyTargetController@show')->name('show');
        Route::post('update/{id}', 'MonthlyTargetController@update')->name('update');
        Route::post('generate', 'MonthlyTargetController@generateMonthlyCommission')->name('generate');
        Route::get('ledger', 'DealerMonthlyCommissionLedgerController@index')->name('ledger');
        Route::post('ledger-datatable-data', 'DealerMonthlyCommissionLedgerController@datatableData')->name('ledger.datatable');
    });

    //Yearly commission Target
    Route::get('dealer-yearly-commission', 'YearlyTargetController@index')->name('dealer.yearly.commission');
    Route::group(['prefix' => 'dealer-yearly-commission', 'as'=>'dealer.yearly.commission.'], function () {
        Route::post('datatable-data', 'YearlyTargetController@get_datatable_data')->name('datatable.data');
        Route::get('create', 'YearlyTargetController@create')->name('create');
        Route::post('store', 'YearlyTargetController@store')->name('store');
        Route::post('datatable-data', 'YearlyTargetController@datatableData')->name('datatableData');
        Route::get('edit/{id}', 'YearlyTargetController@edit')->name('edit');
        Route::post('show', 'YearlyTargetController@show')->name('show');
        Route::post('update/{id}', 'YearlyTargetController@update')->name('update');
        Route::post('generate', 'YearlyTargetController@generateCommission')->name('generate');
        Route::get('ledger', 'DealerYearlyCommissionLedgerController@index')->name('ledger');
        Route::post('ledger-datatable-data', 'DealerYearlyCommissionLedgerController@datatableData')->name('ledger.datatable');
    });

    //Monthly commission payment
    Route::get('dealer-monthly-commission-payment', 'MonthlyTargetController@dealerMonthlyCommissionIdex')->name('dealer.monthly.commission.payment');
    Route::get('dealer-monthly-commission-payment-create', 'MonthlyTargetController@dealerMonthlyCommissionCreate')->name('dealer.monthly.commission.payment.create');
    Route::get('dealer/commission-due/{dealer_id}', 'MonthlyTargetController@getDealerCommissionDueAmount')->name('get.dealer.commission.due');
    Route::post('dealer-monthly-commission-payment', 'MonthlyTargetController@dealerMonthlyCommissionPayment')->name('dealer.monthly.commission.payment.store');

    //Yearly commission payment
    Route::get('dealer-yearly-commission-payment', 'YearlyTargetController@dealerCommissionIdex')->name('dealer.yearly.commission.payment');
    Route::get('dealer-yearly-commission-payment-create', 'YearlyTargetController@dealerCommissionCreate')->name('dealer.yearly.commission.payment.create');
    Route::get('dealer-yearly-commission-due/{dealer_id}', 'YearlyTargetController@getDealerCommissionDueAmount')->name('get.dealer.yearly.commission.due');
    Route::post('dealer-yearly-commission-payment', 'YearlyTargetController@dealerCommissionPayment')->name('dealer.yearly.commission.payment.store');
});
