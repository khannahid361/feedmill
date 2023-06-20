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

    Route::get('warehouse-product-ledger', 'WarehouseLedgerController@productLedger')->name('warehouse.product.ledger');
    Route::group(['prefix' => 'warehouse-product-ledger', 'as'=>'warehouse.product.ledger.'], function () {
        Route::post('datatable-data', 'WarehouseLedgerController@getProductLedgerData')->name('datatable.data');
    });

    Route::get('warehouse-material-ledger', 'WarehouseMaterialLedgerController@materialLedger')->name('warehouse.material.ledger');
    Route::group(['prefix' => 'warehouse-material-ledger', 'as'=>'warehouse.material.ledger.'], function () {
        Route::post('datatable-data', 'WarehouseMaterialLedgerController@materialDatatableData')->name('datatable.data');
    });
});
