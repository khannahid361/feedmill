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
       Route::get('sale', 'SaleController@index')->name('sale');
       Route::group(['prefix' => 'sale', 'as'=>'sale.'], function () {
            Route::post('datatable-data', 'SaleController@get_datatable_data')->name('datatable.data');
            Route::get('add', 'SaleController@create')->name('add');
            Route::post('store', 'SaleController@store')->name('store');
            Route::get('details/{id}', 'SaleController@show')->name('show');
            Route::get('edit/{id}', 'SaleController@edit')->name('edit');
            Route::post('update', 'SaleController@update')->name('update');
            Route::post('delete', 'SaleController@delete')->name('delete');
            Route::post('change-status','SaleController@changeStatus')->name('status.change');
            Route::get('delivery/{id}','SaleController@delivery')->name('product.delivery');
            Route::post('delivery-store','SaleController@deliveryStore')->name('product.delivery.store');
            Route::get('product-delivery-available-list','SaleController@productDeliveryAvailableList')->name('product.delivery.available.list');
            Route::get('product-delivery-invoice/{id}','SaleController@productDeliveryInvoice')->name('product.delivery.invoice');
            Route::post('product-autocomplete-search', 'ProductController@product_autocomplete_search');
            Route::post('product-search', 'ProductController@product_search')->name('product.search');
            Route::post('product-select-search', 'ProductController@product_select_search');
            Route::post('product-search-with-id', 'ProductController@product_search_with_id')->name('product.search.with.id');
            Route::post('product-search-with-dealer-id', 'ProductController@dealerProductSearch')->name('product.search.with.dealer.id');
       });
    Route::get('payment-account-list/{id}','SaleController@paymentAccountList')->name('payment.account.list');
});
