<?php
Route::middleware('auth:sanctum')->prefix('user')->namespace('User')->group(function () {

    Route::get('info', 'UserController@info')->name('user.info');
    Route::get('order_count', 'UserController@orderCount')->name('user.orderCount');
    Route::get('cart_count', 'UserController@cartCount')->name('user.cartCount');

    Route::post('bind_parent', 'UserController@bindParent')->name('user.bindParent');

    Route::post('bind_phone', 'UserController@bindPhone')->name('user.bindPhone');

    Route::get('ercode', 'WeChatController@ercode')->name('wechat.ercode');

    Route::get('wallet', 'WalletController@index')->name('wallet.index');
    Route::get('wallet_record', 'WalletRecordController@index')->name('wallet_record.index');

    Route::post('withdraw', 'WithdrawController@store')->name('withdraw.store');

    Route::get('address', 'AddressController@index')->name('address.index');
    Route::post('address', 'AddressController@store')->name('address.store');
    Route::patch('address/{id}', 'AddressController@update')->name('address.update');
    Route::delete('address/{id}', 'AddressController@destroy')->name('address.destroy');

});
