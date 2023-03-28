<?php

use Illuminate\Support\Facades\Route;

Route::get('dealer-panel-login', 'LoginController@showLoginForm')->name('dealer.panel.login');
Route::group(['prefix' => 'dealer-panel', 'as'=>'dealer.panel.'], function () {
    Route::post('login-handle', 'LoginController@loginHandle')->name('login.handle');
    Route::post('logout', 'LoginController@logOut')->name('logout');
    Route::get('profile', 'LoginController@profile')->name('profile');
    Route::get('dashboard', 'DealerPanelController@dashboard')->name('dashboard');
    Route::get('sale-index', 'DealerPanelController@saleIndex')->name('sale.index');
    Route::post('sale-datatable-data', 'DealerPanelController@get_datatable_data')->name('sale.datatable.data');
    Route::get('sale-add', 'DealerPanelController@saleCreate')->name('sale.add');
    Route::post('sale-store', 'DealerPanelController@saleStore')->name('sale.store');
    Route::get('details/{id}', 'DealerPanelController@saleShow')->name('sale.show');
    Route::get('edit/{id}', 'DealerPanelController@saleEdit')->name('sale.edit');
    Route::post('update', 'DealerPanelController@saleUpdate')->name('sale.update');
    Route::post('delete', 'DealerPanelController@saleDelete')->name('sale.delete');
    Route::post('product-search-with-id', 'DealerPanelController@product_search_with_id')->name('product.search.with.id');

    Route::get('product-index', 'DealerProductController@productIndex')->name('product.index');
    Route::post('product-datatable-data', 'DealerProductController@get_datatable_data')->name('product.datatable.data');
    Route::post('receive', 'DealerProductController@receive_transfered_products')->name('receive');
    Route::get('data/{id}', 'DealerProductController@transfer_product_data')->name('data');


});
