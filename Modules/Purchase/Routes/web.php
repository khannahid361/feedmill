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
    Route::get('purchase', 'PurchaseController@index')->name('purchase');
    Route::group(['prefix' => 'purchase', 'as'=>'purchase.'], function () {
        Route::get('add', 'PurchaseController@create')->name('create');
        Route::post('datatable-data', 'PurchaseController@get_datatable_data')->name('datatable.data');
        Route::post('store', 'PurchaseController@store')->name('store');
        Route::post('update', 'PurchaseController@update')->name('update');
        Route::get('change-status/{id}/{status}','PurchaseController@changeStatus')->name('change.status');
        Route::get('edit/{id}', 'PurchaseController@edit')->name('edit');
        Route::get('view/{id}', 'PurchaseController@show')->name('view');
        Route::post('delete', 'PurchaseController@delete')->name('delete');
        Route::post('bulk-delete', 'PurchaseController@bulk_delete')->name('bulk.delete');
    });
    //Purchase Payment Routes
    Route::post('purchase-payment-store-or-update', 'PaymentController@store_or_update')->name('purchase.payment.store.or.update');
    Route::post('purchase-payment/view', 'PaymentController@show')->name('purchase.payment.show');
    Route::post('purchase-payment/edit', 'PaymentController@edit')->name('purchase.payment.edit');
    Route::post('purchase-payment/delete', 'PaymentController@delete')->name('purchase.payment.delete');

});
