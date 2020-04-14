<?php

use Illuminate\Routing\Router;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
], function (Router $router) {

    $router->get('/', 'HomeController@index')->name('admin.home');

    $router->group(['prefix' => 'goods', 'namespace' => 'Goods'], function (Router $router) {
        $router->resource('goods', 'GoodsController');
        $router->resource('goods_group', 'GoodsGroupController');
        $router->resource('goods_search', 'GoodsSearchController');
    });

    $router->group(['prefix' => 'order', 'namespace' => 'Order'], function (Router $router) {
        $router->resource('order', 'OrderController');
        $router->resource('order_details', 'OrderController');
        $router->resource('order_record', 'OrderController');
        $router->resource('order_comment', 'OrderController');

        $router->group(['prefix' => 'order_details'], function (Router $router) {
            $router->resource('', 'OrderDetailsController');
            $router->get('/{id}', 'OrderDetailsController@show')->name('show');
        });
        $router->group(['prefix' => 'order_record'], function (Router $router) {
            $router->resource('', 'OrderRecordController');
            $router->get('/{id}', 'OrderRecordController@show')->name('show');
        });
        $router->group(['prefix' => 'order_comment'], function (Router $router) {
            $router->resource('', 'OrderCommentController');
            $router->get('/{id}', 'OrderCommentController@show')->name('show');
        });
    });

    $router->group(['prefix' => 'user', 'namespace' => 'User'], function (Router $router) {
        $router->group(['prefix' => 'user'], function (Router $router) {
            $router->resource('', 'UserController');
            $router->get('/{id}', 'UserController@show')->name('show');
            $router->get('/{id}/edit', 'UserController@edit')->name('edit');
            $router->get('/create', 'UserController@create')->name('create');

        });
        $router->group(['prefix' => 'wallet'], function (Router $router) {
            $router->resource('', 'WalletController');
            $router->get('/{id}', 'WalletController@show')->name('show');
        });
        $router->group(['prefix' => 'wallet_record'], function (Router $router) {
            $router->resource('', 'WalletRecordController');
            $router->get('/{id}', 'WalletRecordController@show')->name('show');
        });
        $router->group(['prefix' => 'withdraw'], function (Router $router) {
            $router->resource('', 'WithdrawController');
            $router->get('/{id}', 'WithdrawController@show')->name('show');
            $router->get('/{id}/edit', 'WithdrawController@edit')->name('edit');
        });
        $router->group(['prefix' => 'address'], function (Router $router) {
            $router->resource('', 'AddressController');
            $router->get('/{id}', 'AddressController@show')->name('show');
        });
    });
});
