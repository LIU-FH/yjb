<?php
Route::post('upload', 'IndexController@upload')->name('auth.upload');
Route::post('phone_code', 'IndexController@phoneCode')->name('user.phoneCode');
