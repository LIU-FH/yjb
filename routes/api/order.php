<?php
Route::middleware('auth:sanctum')->prefix('order')->namespace('Order')->group(function () {
    Route::get('order', 'OrderController@index')->name('order.index');
    Route::get('order/{id}', 'OrderController@show')->name('order.show');
    Route::post('order/', 'OrderController@store')->name('order.store');
    Route::post('order/update', 'OrderController@update')->name('order.update');
    Route::post('ready', 'OrderController@ready')->name('order.ready');
    Route::post('order_pay', 'OrderController@orderPay')->name('order.orderPay');
    Route::get('order_comment', 'OrderCommentController@index')->name('order_comment.index');
    Route::post('order_comment', 'OrderCommentController@store')->name('order_comment.store');
});
