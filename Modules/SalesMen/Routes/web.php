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
    Route::get('sales-representative', 'SalesMenController@index')->name('sales.representative');
    Route::group(['prefix' => 'sales-representative', 'as'=>'sales.representative.'], function () {
        Route::post('datatable-data', 'SalesMenController@get_datatable_data')->name('datatable.data');
        Route::post('store-or-update', 'SalesMenController@store_or_update_data')->name('store.or.update');
        Route::get('add', 'SalesMenController@create')->name('add');
        Route::get('edit/{id}', 'SalesMenController@edit')->name('edit');
        Route::post('view', 'SalesMenController@show')->name('view');
        Route::post('delete', 'SalesMenController@delete')->name('delete');
        Route::post('bulk-delete', 'SalesMenController@bulk_delete')->name('bulk.delete');
        Route::post('change-status', 'SalesMenController@change_status')->name('change.status');
        Route::post('upazila-area-list', 'SalesMenController@upazila_area_list')->name('upazila.area.list');
//        Route::post('daily-area-list', 'SalesMenController@daily_area_list')->name('daily.area.list');
        Route::get('due-amount/{id}', 'SalesMenController@due_amount');
    });
    Route::get('salesmen-area-list/{id}','SalesMenController@salesMenAreaList');
    Route::get('warehouse-wise-salesmen-list/{warehouse_id}', 'SalesMenController@warehouse_wise_salesmen_list')->name('warehouse.wise.salesmen.list');
    Route::get('sr-monthly-target', 'SalesmanMonthlyTargetController@index')->name('sr.monthly.target');
    Route::group(['prefix' => 'sr-monthly-target', 'as'=>'sr.monthly.target.'], function () {
        Route::post('datatable-data', 'SalesmanMonthlyTargetController@get_datatable_data')->name('datatable.data');
        Route::post('store', 'SalesmanMonthlyTargetController@store')->name('store');
        Route::post('update', 'SalesmanMonthlyTargetController@update')->name('update');
        Route::get('add', 'SalesmanMonthlyTargetController@create')->name('add');
        Route::post('edit', 'SalesmanMonthlyTargetController@edit')->name('edit');
        Route::post('delete', 'SalesmanMonthlyTargetController@delete')->name('delete');
        Route::post('bulk-delete', 'SalesmanMonthlyTargetController@bulk_delete')->name('bulk.delete');
    });
    Route::get('sr-product-commission', 'SalesMenProductCommissionController@index')->name('sr.product.commission');
    Route::group(['prefix' => 'sr-product-wise-commission', 'as'=>'sr.product.commission.'], function () {
        Route::post('datatable-data', 'SalesMenProductCommissionController@getDataTableData')->name('datatable.data');
        Route::post('store', 'SalesMenProductCommissionController@store')->name('store');
        Route::post('update', 'SalesMenProductCommissionController@update')->name('update');
        Route::get('add','SalesMenProductCommissionController@create')->name('add');
        Route::get('edit/{id}', 'SalesMenProductCommissionController@edit')->name('edit');
        Route::get('view/{id}', 'SalesMenProductCommissionController@show')->name('view');
        Route::post('delete', 'SalesMenProductCommissionController@delete')->name('delete');
    });
    Route::get('sr-product-target', 'SalesMenProductTargetController@index')->name('sr.product.target');
    Route::group(['prefix' => 'sr-product-wise-target', 'as'=>'sr.product.target.'], function () {
        Route::post('datatable-data', 'SalesMenProductTargetController@getDataTableData')->name('datatable.data');
        Route::post('store', 'SalesMenProductTargetController@store')->name('store');
        Route::post('update', 'SalesMenProductTargetController@update')->name('update');
        Route::get('add', 'SalesMenProductTargetController@create')->name('add');
        Route::post('edit', 'SalesMenProductTargetController@edit')->name('edit');
        Route::post('delete', 'SalesMenProductTargetController@delete')->name('delete');
    });
    Route::get('salesmen-ledger', 'SalesmenLedgerController@index')->name('salesmen.ledger');
    Route::post('salesmen-ledger-datatable-data', 'SalesmenLedgerController@get_datatable_data')->name('sales.representative.ledger.datatable.data');
    Route::post('sales-men-upazila-list','SalesMenController@upazilaList')->name('sr.men.upazila.list');
});
