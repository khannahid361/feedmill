<?php

use Illuminate\Support\Facades\Route;

Route::group(['middleware' => ['auth']], function () {
    Route::get('product-stock-report', 'ProductStockController@index')->name('product.stock.report');
    Route::group(['prefix' => 'product-stock', 'as'=>'product.stock.report.'], function () {
        Route::post('datatable-data', 'ProductStockController@getProductStockData')->name('datatable.data');
    });
    Route::get('material-stock-report', 'MaterialStockController@index')->name('material.stock');
    Route::group(['prefix' => 'material-stock-report', 'as'=>'material.stock.report.'], function () {
        Route::post('datatable-data', 'MaterialStockController@getMaterialStockData')->name('datatable.data');
    });
});
