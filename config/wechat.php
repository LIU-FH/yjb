<?php
return [
    'app_id' => env("WX_APP_ID"),
    'secret' => env("WX_SECRET"),

    'response_type' => 'array',

    'log' => [
        'level' => 'debug',
        'file' => __DIR__ . '/wechat.log',
    ],

    'mch_id' => 'your-mch-id',
    'key' => '11111111111111111111111111111111',   // API 密钥

    // 如需使用敏感接口（如退款、发送红包等）需要配置 API 证书路径(登录商户平台下载 API 证书)
    'cert_path' => 'path/to/your/cert.pem', // XXX: 绝对路径！！！！
    'key_path' => 'path/to/your/key',      // XXX: 绝对路径！！！！

    'notify_url' => '默认的订单回调地址',     // 你也可以在下单时单独设置来想覆盖它
];
