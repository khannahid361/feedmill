<?php

use Illuminate\Support\Facades\Route;
Route::group(['middleware' => ['auth']], function () {
    Route::get('dealer-sale', 'DealerSaleController@index')->name('dealer.sale');
    Route::group(['prefix' => 'dealer-sale', 'as'=>'dealer.sale.'], function () {
        Route::post('datatable-data', 'DealerSaleController@get_datatable_data')->name('datatable.data');
        Route::get('add', 'DealerSaleController@create')->name('add');
        Route::post('store', 'DealerSaleController@store')->name('store');
        Route::get('details/{id}', 'DealerSaleController@show')->name('show');
        Route::get('edit/{id}', 'DealerSaleController@edit')->name('edit');
        Route::post('update', 'DealerSaleController@update')->name('update');
        Route::post('delete', 'DealerSaleController@delete')->name('delete');
        Route::post('change-status','DealerSaleController@changeStatus')->name('status.change');
        Route::get('delivery/{id}','DealerSaleController@delivery')->name('product.delivery');
        Route::post('delivery-store','DealerSaleController@deliveryStore')->name('product.delivery.store');
        Route::get('product-delivery-available-list','DealerSaleController@productDeliveryAvailableList')->name('product.delivery.available.list');
        Route::get('product-delivery-invoice/{id}','DealerSaleController@productDeliveryInvoice')->name('product.delivery.invoice');
        Route::post('product-autocomplete-search', 'ProductController@product_autocomplete_search');
        Route::post('product-search', 'ProductController@product_search')->name('product.search');
        Route::post('product-select-search', 'ProductController@product_select_search');
        Route::post('product-search-with-id', 'ProductController@product_search_with_id')->name('product.search.with.id');
    });
});
