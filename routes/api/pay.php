<?php
Route::prefix('pay')->namespace('Pay')->group(function () {
    Route::post('wx', 'WxPayController@pay')->name('wxpay.pay');
    Route::post('wx/notify', 'WxPayController@notify')->name('wxpay.notify');
});
