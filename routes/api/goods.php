<?php
Route::prefix('goods')->namespace('Goods')->group(function () {
    Route::get('goods', 'GoodsController@index')->name('goods.index');
    Route::get('goods/{id}', 'GoodsController@show')->name('goods.show');
    Route::get('goods_group', 'GoodsGroupController@index')->name('goods.index');
    Route::middleware('auth:sanctum')->group(function () {
        Route::get('goods_search', 'GoodsSearchController@index')->name('goods_search.index');
        Route::post('goods_search', 'GoodsSearchController@store')->name('goods_search.store');
        Route::get('goods_cart', 'GoodsCartController@index')->name('goods_cart.index');
        Route::post('goods_cart', 'GoodsCartController@store')->name('goods_cart.store');
        Route::patch('goods_cart/{id}', 'GoodsCartController@update')->name('goods_cart.update');
        Route::delete('goods_cart/{id}', 'GoodsCartController@destroy')->name('goods_cart.destroy');
    });
});
