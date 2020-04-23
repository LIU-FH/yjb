<?php
Route::prefix('auth')->group(function () {
    Route::post('wx_login', 'AuthController@wxLogin')->name('auth.wxLogin');
    Route::post('phone_login', 'AuthController@phoneLogin')->name('auth.phoneLogin');
});

