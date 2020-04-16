<?php
Route::prefix('auth')->group(function () {
    Route::post('login', 'AuthController@login')->name('auth.login');
});
Route::post('upload', 'AuthController@upload')->name('auth.upload');

