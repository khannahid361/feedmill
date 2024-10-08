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

Route::get('material-stock-ledger', 'MaterialStockLedgerController@index')->name('material.stock.ledger');
Route::post('material-stock-ledger/data', 'MaterialStockLedgerController@get_datatable_data')->name('material.stock.ledger.data');

Route::get('product-stock-ledger', 'FinishedGoodsStockLedgerController@index')->name('product.stock.ledger');
Route::post('product-stock-ledger/data', 'FinishedGoodsStockLedgerController@get_datatable_data')->name('product.stock.ledger.data');

Route::get('product-ledger', 'ProductLedgerController@index')->name('product.ledger');
Route::post('product-ledger/data', 'ProductLedgerController@productLedgerData')->name('product.ledger.data');

Route::get('dealer-product-ledger', 'DealerProductStockLedgerController@index')->name('dealer.product.ledger');
Route::post('dealer-product-ledger/data', 'DealerProductStockLedgerController@productLedgerData')->name('dealer.product.ledger.data');
