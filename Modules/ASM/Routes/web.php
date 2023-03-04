<?php

use Illuminate\Support\Facades\Route;

Route::get('asm', 'ASMController@index')->name('asm');
Route::group(['prefix' => 'asm', 'as'=>'asm.'], function () {
    Route::post('datatable-data', 'ASMController@getDataTableData')->name('datatable.data');
    Route::post('store-or-update', 'ASMController@storeOrUpdate')->name('store.or.update');
    Route::post('update', 'ASMController@update')->name('update');
    Route::get('add', 'ASMController@create')->name('add');
    Route::get('edit/{id}', 'ASMController@edit')->name('edit');
    Route::post('view', 'ASMController@show')->name('view');
    Route::post('delete', 'ASMController@delete')->name('delete');
});
Route::get('warehouse-wise-asm-list/{warehouse_id}', 'ASMController@warehouseWiseASMLIst')->name('warehouse.wise.asm.list');
Route::get('asm-monthly-target', 'ASMMonthlyTargetController@index')->name('asm.monthly.target');
Route::group(['prefix' => 'asm-monthly-target', 'as'=>'asm.monthly.target.'], function () {
    Route::post('datatable-data', 'ASMMonthlyTargetController@getDataTableData')->name('datatable.data');
    Route::post('store', 'ASMMonthlyTargetController@store')->name('store');
    Route::post('update', 'ASMMonthlyTargetController@update')->name('update');
    Route::get('add', 'ASMMonthlyTargetController@create')->name('add');
    Route::post('edit', 'ASMMonthlyTargetController@edit')->name('edit');
    Route::post('delete', 'ASMMonthlyTargetController@delete')->name('delete');
});
Route::get('asm-ledger', 'ASMLedgerController@index')->name('asm.ledger');
Route::post('asm-ledger-datatable-data', 'ASMLedgerController@getDataTableData')->name('asm.representative.ledger.datatable.data');
