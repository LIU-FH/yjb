<?php
Route::middleware('auth:sanctum')->prefix('pay')->namespace('Pay')->group(function () {
    Route::post('wx', 'WxPayController@pay')->name('wxpay.pay');
    Route::post('wx/notify', 'WxPayController@notify')->name('wxpay.notify');
});
