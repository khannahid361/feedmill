<?php

use Illuminate\Support\Facades\Route;

Route::group(['middleware' => ['auth']], function () {
    Route::get('sr-salary', 'SrSalaryController@index')->name('sr.salary');
    Route::group(['prefix' => 'sr-salary', 'as'=>'sr.salary.'], function () {
        Route::post('datatable-data', 'SrSalaryController@getDataTableData')->name('datatable.data');
        Route::get('add', 'SrSalaryController@create')->name('add');
        Route::post('store', 'SrSalaryController@store')->name('store');
        Route::get('month-wise-salary-generate/{month}', 'SrSalaryController@monthWiseSalaryGenerate')->name('month.wise.salary.generate');
    });
    Route::get('asm-salary', 'AsmSalaryController@index')->name('asm.salary');
    Route::group(['prefix' => 'asm-salary', 'as'=>'asm.salary.'], function () {
        Route::post('datatable-data', 'AsmSalaryController@getDataTableData')->name('datatable.data');
        Route::get('add', 'AsmSalaryController@create')->name('add');
        Route::post('store', 'AsmSalaryController@store')->name('store');
        Route::get('month-wise-salary-generate/{month}', 'AsmSalaryController@monthWiseSalaryGenerate')->name('month.wise.salary.generate');
    });
});
