/*
 Navicat Premium Data Transfer

 Source Server         : 172.18.28.209
 Source Server Type    : MySQL
 Source Server Version : 50562
 Source Host           : 172.18.28.209:3306
 Source Schema         : yjb

 Target Server Type    : MySQL
 Target Server Version : 50562
 File Encoding         : 65001

 Date: 12/04/2020 20:58:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户ID',
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `tel` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系方式',
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '城市地区',
  `details` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '详细地址',
  `default` tinyint(4) NOT NULL DEFAULT 0 COMMENT '默认',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `permission` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES (2, 0, 2, '管理员', 'fa-user-secret', NULL, NULL, NULL, '2020-04-10 02:51:41');
INSERT INTO `admin_menu` VALUES (3, 2, 3, '管理员', 'fa-list-ul', 'auth/users', NULL, NULL, '2020-04-10 03:41:52');
INSERT INTO `admin_menu` VALUES (4, 2, 4, '角色', 'fa-user', 'auth/roles', NULL, NULL, '2020-04-10 02:54:42');
INSERT INTO `admin_menu` VALUES (5, 2, 5, '权限', 'fa-ban', 'auth/permissions', NULL, NULL, '2020-04-10 02:55:12');
INSERT INTO `admin_menu` VALUES (6, 2, 6, '菜单', 'fa-sliders', 'auth/menu', NULL, NULL, '2020-04-10 03:57:45');
INSERT INTO `admin_menu` VALUES (7, 2, 7, '操作日志', 'fa-history', 'auth/logs', NULL, NULL, '2020-04-10 02:55:39');
INSERT INTO `admin_menu` VALUES (8, 0, 10, '开发助手', 'fa-gears', NULL, NULL, '2020-04-09 15:47:04', '2020-04-10 03:32:28');
INSERT INTO `admin_menu` VALUES (9, 8, 11, 'Scaffold', 'fa-keyboard-o', 'helpers/scaffold', NULL, '2020-04-09 15:47:04', '2020-04-10 03:32:28');
INSERT INTO `admin_menu` VALUES (10, 8, 12, 'Database terminal', 'fa-database', 'helpers/terminal/database', NULL, '2020-04-09 15:47:04', '2020-04-10 03:32:28');
INSERT INTO `admin_menu` VALUES (11, 8, 13, 'Laravel artisan', 'fa-terminal', 'helpers/terminal/artisan', NULL, '2020-04-09 15:47:04', '2020-04-10 03:32:28');
INSERT INTO `admin_menu` VALUES (12, 8, 14, 'Routes', 'fa-list-alt', 'helpers/routes', NULL, '2020-04-09 15:47:04', '2020-04-10 03:32:28');
INSERT INTO `admin_menu` VALUES (13, 0, 8, '错误日志', 'fa-bug', 'logs', NULL, '2020-04-09 15:47:57', '2020-04-10 03:32:28');
INSERT INTO `admin_menu` VALUES (14, 0, 9, 'Redis管理', 'fa-database', 'redis', NULL, '2020-04-09 15:49:04', '2020-04-10 03:32:28');
INSERT INTO `admin_menu` VALUES (15, 0, 0, '用户管理', 'fa-user', NULL, NULL, '2020-04-10 03:38:22', '2020-04-10 03:38:22');
INSERT INTO `admin_menu` VALUES (16, 15, 0, '用户列表', 'fa-list-ul', 'user/user', NULL, '2020-04-10 03:38:52', '2020-04-10 03:38:52');
INSERT INTO `admin_menu` VALUES (17, 15, 0, '钱包管理', 'fa-google-wallet', 'user/wallet', NULL, '2020-04-10 03:39:33', '2020-04-10 03:39:46');
INSERT INTO `admin_menu` VALUES (18, 15, 0, '钱包记录', 'fa-history', 'user/wallet_record', NULL, '2020-04-10 03:40:54', '2020-04-10 03:41:37');
INSERT INTO `admin_menu` VALUES (19, 15, 0, '提现申请', 'fa-credit-card', 'user/withdraw', NULL, '2020-04-10 03:43:04', '2020-04-10 03:56:57');
INSERT INTO `admin_menu` VALUES (20, 15, 0, '地址管理', 'fa-map-marker', 'user/address', NULL, '2020-04-10 03:43:35', '2020-04-10 03:43:35');
INSERT INTO `admin_menu` VALUES (21, 0, 0, '商品管理', 'fa-bars', NULL, NULL, '2020-04-10 03:46:07', '2020-04-10 03:46:07');
INSERT INTO `admin_menu` VALUES (22, 21, 0, '商品列表', 'fa-list-ul', 'goods/goods', NULL, '2020-04-10 03:46:28', '2020-04-10 03:46:28');
INSERT INTO `admin_menu` VALUES (23, 21, 0, '会员寻品', 'fa-search', 'goods/goods_search', NULL, '2020-04-10 03:46:55', '2020-04-10 03:47:18');
INSERT INTO `admin_menu` VALUES (24, 0, 0, '订单管理', 'fa-bars', NULL, NULL, '2020-04-10 03:48:01', '2020-04-10 03:48:01');
INSERT INTO `admin_menu` VALUES (25, 24, 0, '订单列表', 'fa-list-ul', 'order/order', NULL, '2020-04-10 03:50:33', '2020-04-10 03:50:33');
INSERT INTO `admin_menu` VALUES (26, 24, 0, '订单详情', 'fa-list-alt', 'order/order_details', NULL, '2020-04-10 03:52:48', '2020-04-10 03:55:41');
INSERT INTO `admin_menu` VALUES (27, 24, 0, '更新记录', 'fa-history', '/order/order_record', NULL, '2020-04-10 03:53:54', '2020-04-10 03:53:54');
INSERT INTO `admin_menu` VALUES (28, 24, 0, '订单评论', 'fa-commenting-o', 'order/order_comment', NULL, '2020-04-10 03:54:25', '2020-04-10 03:54:37');

-- ----------------------------
-- Table structure for admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_operation_log_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 811 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
INSERT INTO `admin_operation_log` VALUES (1, 1, 'admin', 'GET', '172.17.119.33', '[]', '2020-04-09 15:45:53', '2020-04-09 15:45:53');
INSERT INTO `admin_operation_log` VALUES (2, 1, 'admin/auth/users', 'GET', '172.17.119.33', '{\"_pjax\":\"#pjax-container\"}', '2020-04-09 15:45:58', '2020-04-09 15:45:58');
INSERT INTO `admin_operation_log` VALUES (3, 1, 'admin/auth/permissions', 'GET', '172.17.119.33', '{\"_pjax\":\"#pjax-container\"}', '2020-04-09 15:45:59', '2020-04-09 15:45:59');
INSERT INTO `admin_operation_log` VALUES (4, 1, 'admin', 'GET', '172.17.119.33', '{\"_pjax\":\"#pjax-container\"}', '2020-04-09 15:46:05', '2020-04-09 15:46:05');
INSERT INTO `admin_operation_log` VALUES (5, 1, 'admin', 'GET', '172.17.119.33', '[]', '2020-04-09 15:47:09', '2020-04-09 15:47:09');
INSERT INTO `admin_operation_log` VALUES (6, 1, 'admin', 'GET', '172.17.119.33', '[]', '2020-04-09 15:49:08', '2020-04-09 15:49:08');
INSERT INTO `admin_operation_log` VALUES (7, 1, 'admin/redis', 'GET', '172.17.119.33', '{\"_pjax\":\"#pjax-container\"}', '2020-04-09 15:49:12', '2020-04-09 15:49:12');
INSERT INTO `admin_operation_log` VALUES (8, 1, 'admin', 'GET', '172.17.119.33', '[]', '2020-04-09 15:49:13', '2020-04-09 15:49:13');
INSERT INTO `admin_operation_log` VALUES (9, 1, 'admin/logs', 'GET', '172.17.119.33', '{\"_pjax\":\"#pjax-container\"}', '2020-04-09 15:49:13', '2020-04-09 15:49:13');
INSERT INTO `admin_operation_log` VALUES (10, 1, 'admin/logs', 'GET', '172.17.119.33', '{\"_pjax\":\"#pjax-container\"}', '2020-04-09 15:50:11', '2020-04-09 15:50:11');
INSERT INTO `admin_operation_log` VALUES (11, 1, 'admin/redis', 'GET', '172.17.119.33', '{\"_pjax\":\"#pjax-container\"}', '2020-04-09 15:50:11', '2020-04-09 15:50:11');
INSERT INTO `admin_operation_log` VALUES (12, 1, 'admin/logs', 'GET', '172.17.119.33', '[]', '2020-04-09 15:50:12', '2020-04-09 15:50:12');
INSERT INTO `admin_operation_log` VALUES (13, 1, 'admin/logs', 'GET', '172.17.119.33', '{\"_pjax\":\"#pjax-container\"}', '2020-04-09 15:50:14', '2020-04-09 15:50:14');
INSERT INTO `admin_operation_log` VALUES (14, 1, 'admin/logs', 'GET', '172.17.119.33', '[]', '2020-04-09 15:52:51', '2020-04-09 15:52:51');
INSERT INTO `admin_operation_log` VALUES (15, 1, 'admin/logs', 'GET', '172.17.119.33', '{\"_pjax\":\"#pjax-container\"}', '2020-04-09 15:52:54', '2020-04-09 15:52:54');
INSERT INTO `admin_operation_log` VALUES (16, 1, 'admin', 'GET', '172.17.119.33', '[]', '2020-04-09 15:53:00', '2020-04-09 15:53:00');
INSERT INTO `admin_operation_log` VALUES (17, 1, 'admin/dashboard', 'GET', '172.17.119.33', '[]', '2020-04-09 15:53:00', '2020-04-09 15:53:00');
INSERT INTO `admin_operation_log` VALUES (18, 1, 'admin/auth/users', 'GET', '172.17.119.33', '[]', '2020-04-09 15:53:04', '2020-04-09 15:53:04');
INSERT INTO `admin_operation_log` VALUES (19, 1, 'admin/auth/roles', 'GET', '172.17.119.33', '[]', '2020-04-09 15:53:05', '2020-04-09 15:53:05');
INSERT INTO `admin_operation_log` VALUES (20, 1, 'admin/logs', 'GET', '172.17.119.33', '[]', '2020-04-09 15:53:07', '2020-04-09 15:53:07');
INSERT INTO `admin_operation_log` VALUES (21, 1, 'admin/redis', 'GET', '172.17.119.33', '[]', '2020-04-09 15:53:09', '2020-04-09 15:53:09');
INSERT INTO `admin_operation_log` VALUES (22, 1, 'admin/redis', 'GET', '172.17.119.33', '[]', '2020-04-09 15:53:14', '2020-04-09 15:53:14');
INSERT INTO `admin_operation_log` VALUES (23, 1, 'admin/redis', 'GET', '172.17.119.33', '[]', '2020-04-09 15:53:36', '2020-04-09 15:53:36');
INSERT INTO `admin_operation_log` VALUES (24, 1, 'admin/helpers/scaffold', 'GET', '172.17.119.33', '[]', '2020-04-09 15:53:49', '2020-04-09 15:53:49');
INSERT INTO `admin_operation_log` VALUES (25, 1, 'admin/helpers/terminal/database', 'GET', '172.17.119.33', '[]', '2020-04-09 15:53:50', '2020-04-09 15:53:50');
INSERT INTO `admin_operation_log` VALUES (26, 1, 'admin/helpers/terminal/artisan', 'GET', '172.17.119.33', '[]', '2020-04-09 15:53:51', '2020-04-09 15:53:51');
INSERT INTO `admin_operation_log` VALUES (27, 1, 'admin/helpers/scaffold', 'GET', '172.17.119.33', '[]', '2020-04-09 15:57:18', '2020-04-09 15:57:18');
INSERT INTO `admin_operation_log` VALUES (28, 1, 'admin/helpers/scaffold', 'POST', '172.17.119.33', '{\"table_name\":\"goods\",\"model_name\":\"App\\\\Models\\\\Goods\\\\Goods\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\Goods\\\\GoodsController\",\"create\":[\"migration\",\"model\",\"controller\",\"migrate\"],\"fields\":[{\"name\":\"title\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u5546\\u54c1\\u540d\\u79f0\"},{\"name\":\"img\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u5c55\\u793a\\u56fe\"},{\"name\":\"price\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u4ef7\\u683c\"},{\"name\":\"discount\",\"type\":\"float\",\"key\":null,\"default\":null,\"comment\":\"\\u6298\\u6263\"},{\"name\":\"tags\",\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"\\u6807\\u7b7e\"},{\"name\":\"stock\",\"type\":\"integer\",\"key\":null,\"default\":\"0\",\"comment\":\"\\u5546\\u54c1\\u5e93\\u5b58\"},{\"name\":\"sku\",\"type\":\"text\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"\\u5546\\u54c1sku\"},{\"name\":\"click_count\",\"type\":\"integer\",\"key\":null,\"default\":\"0\",\"comment\":\"\\u67e5\\u770b\\u6b21\\u6570\"},{\"name\":\"buy_count\",\"type\":\"integer\",\"key\":null,\"default\":\"0\",\"comment\":\"\\u8d2d\\u4e70\\u6b21\\u6570\"},{\"name\":\"status\",\"type\":\"tinyInteger\",\"key\":null,\"default\":\"0\",\"comment\":\"\\u72b6\\u6001\\uff1a0\\uff1a\\u672a\\u4e0a\\u67b6\\uff1a1\\uff1a\\u4e0a\\u67b6\\u4e2d\"}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"pSz9qVNYnoJ91e0zE7FsWmvC2hmkhtryIG2ZOXdb\"}', '2020-04-09 16:03:06', '2020-04-09 16:03:06');
INSERT INTO `admin_operation_log` VALUES (29, 1, 'admin/helpers/scaffold', 'GET', '172.17.119.33', '[]', '2020-04-09 16:03:07', '2020-04-09 16:03:07');
INSERT INTO `admin_operation_log` VALUES (30, 1, 'admin/helpers/scaffold', 'POST', '172.17.119.33', '{\"table_name\":\"goods\",\"model_name\":\"App\\\\Models\\\\Goods\\\\Goods\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\Goods\\\\GoodsController\",\"create\":[\"migration\",\"model\",\"controller\",\"migrate\"],\"fields\":[{\"name\":\"title\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u5546\\u54c1\\u540d\\u79f0\"},{\"name\":\"img\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u5c55\\u793a\\u56fe\"},{\"name\":\"price\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u4ef7\\u683c\"},{\"name\":\"discount\",\"type\":\"float\",\"key\":null,\"default\":null,\"comment\":\"\\u6298\\u6263\"},{\"name\":\"tags\",\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"\\u6807\\u7b7e\"},{\"name\":\"stock\",\"type\":\"integer\",\"key\":null,\"default\":\"0\",\"comment\":\"\\u5546\\u54c1\\u5e93\\u5b58\"},{\"name\":\"sku\",\"type\":\"text\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"\\u5546\\u54c1sku\"},{\"name\":\"click_count\",\"type\":\"integer\",\"key\":null,\"default\":\"0\",\"comment\":\"\\u67e5\\u770b\\u6b21\\u6570\"},{\"name\":\"buy_count\",\"type\":\"integer\",\"key\":null,\"default\":\"0\",\"comment\":\"\\u8d2d\\u4e70\\u6b21\\u6570\"},{\"name\":\"status\",\"type\":\"tinyInteger\",\"key\":null,\"default\":\"0\",\"comment\":\"\\u72b6\\u6001\\uff1a0\\uff1a\\u672a\\u4e0a\\u67b6\\uff1a1\\uff1a\\u4e0a\\u67b6\\u4e2d\"}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"pSz9qVNYnoJ91e0zE7FsWmvC2hmkhtryIG2ZOXdb\"}', '2020-04-09 16:03:32', '2020-04-09 16:03:32');
INSERT INTO `admin_operation_log` VALUES (31, 1, 'admin/helpers/scaffold', 'GET', '172.17.119.33', '[]', '2020-04-09 16:03:33', '2020-04-09 16:03:33');
INSERT INTO `admin_operation_log` VALUES (32, 1, 'admin/helpers/scaffold', 'POST', '172.17.119.33', '{\"table_name\":\"goods_search\",\"model_name\":\"App\\\\Models\\\\Goods\\\\GoodsSearch\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\GoodsSearchController\",\"create\":[\"migration\",\"model\",\"controller\",\"migrate\"],\"fields\":[{\"name\":\"user_id\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u7528\\u6237ID\"},{\"name\":\"type\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u4ea7\\u54c1\\u7c7b\\u578b\"},{\"name\":\"name\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u4ea7\\u54c1\\u540d\\u79f0\"},{\"name\":\"price\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u4ef7\\u683c\"},{\"name\":\"num\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u6570\\u91cf\"},{\"name\":\"imgs\",\"type\":\"text\",\"key\":null,\"default\":null,\"comment\":\"\\u56fe\\u7247\"},{\"name\":\"status\",\"type\":\"tinyInteger\",\"key\":null,\"default\":null,\"comment\":\"\\u72b6\\u6001\\uff1a0\\uff1a\\u67e5\\u627e\\u4e2d\\uff1b1\\uff1a\\u5df2\\u56de\\u590d\"}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"pSz9qVNYnoJ91e0zE7FsWmvC2hmkhtryIG2ZOXdb\"}', '2020-04-09 16:06:17', '2020-04-09 16:06:17');
INSERT INTO `admin_operation_log` VALUES (33, 1, 'admin/helpers/scaffold', 'GET', '172.17.119.33', '[]', '2020-04-09 16:06:17', '2020-04-09 16:06:17');
INSERT INTO `admin_operation_log` VALUES (34, 1, 'admin/helpers/scaffold', 'POST', '172.17.119.33', '{\"table_name\":\"order_comment\",\"model_name\":\"App\\\\Models\\\\Order\\\\OrderComment\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\Order\\\\OrderCommentController\",\"create\":[\"migration\",\"model\",\"controller\",\"migrate\"],\"fields\":[{\"name\":\"order_id\",\"type\":\"integer\",\"key\":null,\"default\":null,\"comment\":\"\\u8ba2\\u5355ID\"},{\"name\":\"user_id\",\"type\":\"integer\",\"key\":null,\"default\":null,\"comment\":\"\\u7528\\u6237ID\"},{\"name\":\"content\",\"type\":\"text\",\"key\":null,\"default\":null,\"comment\":\"\\u5185\\u5bb9\"},{\"name\":\"imgs\",\"type\":\"text\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":\"\\u56fe\\u7247\"},{\"name\":\"start\",\"type\":\"tinyInteger\",\"key\":null,\"default\":\"0\",\"comment\":\"\\u661f\\u7ea7\"}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"pSz9qVNYnoJ91e0zE7FsWmvC2hmkhtryIG2ZOXdb\"}', '2020-04-09 16:10:04', '2020-04-09 16:10:04');
INSERT INTO `admin_operation_log` VALUES (35, 1, 'admin/helpers/scaffold', 'GET', '172.17.119.33', '[]', '2020-04-09 16:10:05', '2020-04-09 16:10:05');
INSERT INTO `admin_operation_log` VALUES (36, 1, 'admin/helpers/scaffold', 'POST', '172.17.119.33', '{\"table_name\":\"orders\",\"model_name\":\"App\\\\Models\\\\Order\\\\Order\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\Order\\\\OrderController\",\"create\":[\"migration\",\"model\",\"controller\",\"migrate\"],\"fields\":[{\"name\":\"order_no\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u8ba2\\u5355\\u7f16\\u53f7\"},{\"name\":\"user_id\",\"type\":\"integer\",\"key\":null,\"default\":null,\"comment\":\"\\u7528\\u6237ID\"},{\"name\":\"coun\",\"type\":\"integer\",\"key\":null,\"default\":null,\"comment\":\"\\u5546\\u54c1\\u6570\\u91cf\"},{\"name\":\"amount_total\",\"type\":\"decimal\",\"key\":null,\"default\":null,\"comment\":\"\\u5546\\u54c1\\u603b\\u4ef7\"},{\"name\":\"amount\",\"type\":\"decimal\",\"key\":null,\"default\":null,\"comment\":\"\\u5b9e\\u4ed8\\u91d1\\u989d\"},{\"name\":\"balance\",\"type\":\"decimal\",\"key\":null,\"default\":null,\"comment\":\"\\u4f59\\u989d\\u652f\\u4ed8\\u91d1\\u989d\"},{\"name\":\"wx_balance\",\"type\":\"decimal\",\"key\":null,\"default\":null,\"comment\":\"\\u5fae\\u4fe1\\u652f\\u4ed8\\u91d1\\u989d\"},{\"name\":\"discount\",\"type\":\"decimal\",\"key\":null,\"default\":null,\"comment\":\"\\u6298\\u6263\\u91d1\\u989d\"},{\"name\":\"address_name\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u59d3\\u540d\"},{\"name\":\"address_tel\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u624b\\u673a\\u53f7\"},{\"name\":\"address_details\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u5730\\u5740\"},{\"name\":\"status\",\"type\":\"tinyInteger\",\"key\":null,\"default\":null,\"comment\":\"\\u8ba2\\u5355\\u72b6\\u6001 0\\u672a\\u4ed8\\u6b3e,1\\u5df2\\u4ed8\\u6b3e,2\\u5df2\\u53d1\\u8d27,3\\u5df2\\u7b7e\\u6536,-1\\u9000\\u8d27\\u7533\\u8bf7,-2\\u9000\\u8d27\\u4e2d,-3\\u5df2\\u9000\\u8d27,-4\\u53d6\\u6d88\\u4ea4\\u6613\"}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"pSz9qVNYnoJ91e0zE7FsWmvC2hmkhtryIG2ZOXdb\"}', '2020-04-09 16:14:06', '2020-04-09 16:14:06');
INSERT INTO `admin_operation_log` VALUES (37, 1, 'admin/helpers/scaffold', 'GET', '172.17.119.33', '[]', '2020-04-09 16:14:07', '2020-04-09 16:14:07');
INSERT INTO `admin_operation_log` VALUES (38, 1, 'admin/helpers/scaffold', 'POST', '172.17.119.33', '{\"table_name\":\"order_record\",\"model_name\":\"App\\\\Models\\\\Order\\\\OrderRecord\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\Order\\\\OrderRecordController\",\"create\":[\"migration\",\"model\",\"controller\",\"migrate\"],\"fields\":[{\"name\":\"order_id\",\"type\":\"integer\",\"key\":null,\"default\":null,\"comment\":\"\\u8ba2\\u5355ID\"},{\"name\":\"explanation\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u72b6\\u6001\\u66f4\\u65b0\\u8bf4\\u660e\"},{\"name\":\"extend_data\",\"type\":\"text\",\"key\":null,\"default\":null,\"comment\":\"\\u6269\\u5c55\\u6570\\u636e\"},{\"name\":\"status\",\"type\":\"tinyInteger\",\"key\":null,\"default\":null,\"comment\":\"\\u72b6\\u6001\\u503c\"}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"pSz9qVNYnoJ91e0zE7FsWmvC2hmkhtryIG2ZOXdb\"}', '2020-04-09 16:16:03', '2020-04-09 16:16:03');
INSERT INTO `admin_operation_log` VALUES (39, 1, 'admin/helpers/scaffold', 'GET', '172.17.119.33', '[]', '2020-04-09 16:16:04', '2020-04-09 16:16:04');
INSERT INTO `admin_operation_log` VALUES (40, 1, 'admin/helpers/scaffold', 'POST', '172.17.119.33', '{\"table_name\":\"orders_details\",\"model_name\":\"App\\\\Models\\\\Order\\\\OrderDetails\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\Order\\\\OrderDetailsController\",\"create\":[\"migration\",\"model\",\"controller\",\"migrate\"],\"fields\":[{\"name\":\"order_id\",\"type\":\"integer\",\"key\":null,\"default\":null,\"comment\":\"\\u8ba2\\u5355ID\"},{\"name\":\"goods_id\",\"type\":\"integer\",\"key\":null,\"default\":null,\"comment\":\"\\u5546\\u54c1ID\"},{\"name\":\"title\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u540d\\u79f0\"},{\"name\":\"price\",\"type\":\"decimal\",\"key\":null,\"default\":null,\"comment\":\"\\u4ef7\\u683c\"},{\"name\":\"num\",\"type\":\"integer\",\"key\":null,\"default\":null,\"comment\":\"\\u6570\\u91cf\"},{\"name\":\"property\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u5c5e\\u6027\"},{\"name\":\"extend_data\",\"type\":\"text\",\"key\":null,\"default\":null,\"comment\":\"\\u6269\\u5c55\\u6570\\u636e\"}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"pSz9qVNYnoJ91e0zE7FsWmvC2hmkhtryIG2ZOXdb\"}', '2020-04-09 16:18:24', '2020-04-09 16:18:24');
INSERT INTO `admin_operation_log` VALUES (41, 1, 'admin/helpers/scaffold', 'GET', '172.17.119.33', '[]', '2020-04-09 16:18:25', '2020-04-09 16:18:25');
INSERT INTO `admin_operation_log` VALUES (42, 1, 'admin/helpers/scaffold', 'POST', '172.17.119.33', '{\"table_name\":\"address\",\"model_name\":\"App\\\\Models\\\\User\\\\Address\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\User\\\\AddressController\",\"create\":[\"migration\",\"model\",\"controller\",\"migrate\"],\"fields\":[{\"name\":\"user_id\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u7528\\u6237ID\"},{\"name\":\"name\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u59d3\\u540d\"},{\"name\":\"tel\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u8054\\u7cfb\\u65b9\\u5f0f\"},{\"name\":\"city\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u57ce\\u5e02\\u5730\\u533a\"},{\"name\":\"details\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u8be6\\u7ec6\\u5730\\u5740\"},{\"name\":\"sort\",\"type\":\"integer\",\"key\":null,\"default\":null,\"comment\":\"\\u6392\\u5e8f\"}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"pSz9qVNYnoJ91e0zE7FsWmvC2hmkhtryIG2ZOXdb\"}', '2020-04-09 16:20:56', '2020-04-09 16:20:56');
INSERT INTO `admin_operation_log` VALUES (43, 1, 'admin/helpers/scaffold', 'GET', '172.17.119.33', '[]', '2020-04-09 16:20:57', '2020-04-09 16:20:57');
INSERT INTO `admin_operation_log` VALUES (44, 1, 'admin/helpers/scaffold', 'POST', '172.17.119.33', '{\"table_name\":\"wallet\",\"model_name\":\"App\\\\Models\\\\User\\\\Wallet\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\User\\\\WalletController\",\"create\":[\"migration\",\"model\",\"controller\",\"migrate\"],\"fields\":[{\"name\":\"user_id\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u7528\\u6237ID\"},{\"name\":\"balance\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u4f59\\u989d\"},{\"name\":\"freeze\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u51bb\\u7ed3\\u91d1\\u989d\"},{\"name\":\"withdraw\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u53ef\\u63d0\\u73b0\\u91d1\\u989d\"}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"pSz9qVNYnoJ91e0zE7FsWmvC2hmkhtryIG2ZOXdb\"}', '2020-04-09 16:25:29', '2020-04-09 16:25:29');
INSERT INTO `admin_operation_log` VALUES (45, 1, 'admin/helpers/scaffold', 'GET', '172.17.119.33', '[]', '2020-04-09 16:25:30', '2020-04-09 16:25:30');
INSERT INTO `admin_operation_log` VALUES (46, 1, 'admin', 'GET', '172.17.119.33', '[]', '2020-04-09 16:29:51', '2020-04-09 16:29:51');
INSERT INTO `admin_operation_log` VALUES (47, 1, 'admin/dashboard', 'GET', '172.17.119.33', '[]', '2020-04-09 16:29:52', '2020-04-09 16:29:52');
INSERT INTO `admin_operation_log` VALUES (48, 1, 'admin/helpers/scaffold', 'GET', '172.17.119.33', '[]', '2020-04-09 16:29:56', '2020-04-09 16:29:56');
INSERT INTO `admin_operation_log` VALUES (49, 1, 'admin/helpers/scaffold', 'POST', '172.17.119.33', '{\"table_name\":\"wallet_record\",\"model_name\":\"App\\\\Models\\\\User\\\\WalletRecord\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\User\\\\WalletRecordController\",\"create\":[\"migration\",\"model\",\"controller\",\"migrate\"],\"fields\":[{\"name\":\"user_id\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u7528\\u6237ID\"},{\"name\":\"wallet_id\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u94b1\\u5305ID\"},{\"name\":\"amount\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u91d1\\u989d\"},{\"name\":\"type_id\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u7c7b\\u578b\"},{\"name\":\"change\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u91d1\\u989d\\u53d8\\u52a8\\uff1a-1\\uff1a\\u6263\\u94b1\\uff0c1\\uff1a\\u52a0\\u94b1\"},{\"name\":\"desc\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u8bf4\\u660e\"},{\"name\":\"remark\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u5907\\u6ce8\"},{\"name\":\"expand_data\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u6269\\u5c55\\u6570\\u636e\"}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"pSz9qVNYnoJ91e0zE7FsWmvC2hmkhtryIG2ZOXdb\"}', '2020-04-09 16:31:52', '2020-04-09 16:31:52');
INSERT INTO `admin_operation_log` VALUES (50, 1, 'admin/helpers/scaffold', 'GET', '172.17.119.33', '[]', '2020-04-09 16:31:53', '2020-04-09 16:31:53');
INSERT INTO `admin_operation_log` VALUES (51, 1, 'admin/helpers/scaffold', 'POST', '172.17.119.33', '{\"table_name\":\"withdraw\",\"model_name\":\"App\\\\Models\\\\User\\\\Withdraw\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\User\\\\WithdrawController\",\"create\":[\"migration\",\"model\",\"controller\",\"migrate\"],\"fields\":[{\"name\":\"user_id\",\"type\":\"integer\",\"key\":null,\"default\":null,\"comment\":\"\\u7528\\u6237ID\"},{\"name\":\"wallet_id\",\"type\":\"integer\",\"key\":null,\"default\":null,\"comment\":\"\\u94b1\\u5305ID\"},{\"name\":\"type\",\"type\":\"tinyInteger\",\"key\":null,\"default\":null,\"comment\":\"\\u7c7b\\u578b\\uff1a1\\uff1a\\u5fae\\u4fe1\\uff1a2\\uff1a\\u94f6\\u884c\\u5361\"},{\"name\":\"name\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u59d3\\u540d\"},{\"name\":\"tel\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u624b\\u673a\\u53f7\"},{\"name\":\"bank_card\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u5361\\u53f7\"},{\"name\":\"bank_address\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u5f00\\u6237\\u884c\"},{\"name\":\"status\",\"type\":\"tinyInteger\",\"key\":null,\"default\":null,\"comment\":\"\\u72b6\\u6001\\uff1a-1\\uff1a\\u9000\\u56de\\uff1b0\\uff1a\\u7533\\u8bf7\\u4e2d\\uff1a1\\uff1a\\u5df2\\u540c\\u610f\\uff08\\u63d0\\u73b0\\u4e2d\\uff09\\uff1b2\\uff1a\\u63d0\\u73b0\\u6210\\u529f\\uff1b\"},{\"name\":\"remark\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u5907\\u6ce8\"}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"pSz9qVNYnoJ91e0zE7FsWmvC2hmkhtryIG2ZOXdb\"}', '2020-04-09 16:36:10', '2020-04-09 16:36:10');
INSERT INTO `admin_operation_log` VALUES (52, 1, 'admin/helpers/scaffold', 'GET', '172.17.119.33', '[]', '2020-04-09 16:36:11', '2020-04-09 16:36:11');
INSERT INTO `admin_operation_log` VALUES (53, 1, 'admin/helpers/scaffold', 'POST', '172.17.119.33', '{\"table_name\":\"users\",\"model_name\":\"App\\\\Models\\\\User\\\\User\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\User\\\\UserController\",\"create\":[\"migration\",\"model\",\"controller\",\"migrate\"],\"fields\":[{\"name\":\"openid\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"openid\"},{\"name\":\"unionid\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"unionid\"},{\"name\":\"parent_id\",\"type\":\"integer\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"nickname\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u7528\\u6237\\u6635\\u79f0\"},{\"name\":\"avatarurl\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u7528\\u6237\\u5934\\u50cf\"},{\"name\":\"gender\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u6027\\u522b\\uff1a0\\uff1a\\u7537\\uff1b1\\uff1a\\u5973\\uff1b2\\uff1a\\u672a\\u77e5\"},{\"name\":\"phone\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u624b\\u673a\\u53f7\"},{\"name\":\"last_login_time\",\"type\":\"timestamp\",\"key\":null,\"default\":null,\"comment\":\"\\u6700\\u540e\\u767b\\u5f55\\u65f6\\u95f4\"},{\"name\":\"status\",\"type\":\"tinyInteger\",\"key\":null,\"default\":null,\"comment\":\"\\u72b6\\u6001\\uff1a0\\uff1a\\u6b63\\u5e38\\uff1b1\\uff1a\\u7981\\u6b62\\u767b\\u5f55\"},{\"name\":\"qr_code\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u4e13\\u5c5e\\u4e8c\\u7ef4\\u7801\"}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"pSz9qVNYnoJ91e0zE7FsWmvC2hmkhtryIG2ZOXdb\"}', '2020-04-09 16:40:33', '2020-04-09 16:40:33');
INSERT INTO `admin_operation_log` VALUES (54, 1, 'admin/helpers/scaffold', 'GET', '172.17.119.33', '[]', '2020-04-09 16:40:34', '2020-04-09 16:40:34');
INSERT INTO `admin_operation_log` VALUES (55, 1, 'admin/helpers/scaffold', 'POST', '172.17.119.33', '{\"table_name\":\"users\",\"model_name\":\"App\\\\Models\\\\User\\\\User\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\User\\\\UserController\",\"create\":[\"migration\",\"model\",\"controller\",\"migrate\"],\"fields\":[{\"name\":\"openid\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"openid\"},{\"name\":\"unionid\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"unionid\"},{\"name\":\"parent_id\",\"type\":\"integer\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"nickname\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u7528\\u6237\\u6635\\u79f0\"},{\"name\":\"avatarurl\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u7528\\u6237\\u5934\\u50cf\"},{\"name\":\"gender\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u6027\\u522b\\uff1a0\\uff1a\\u7537\\uff1b1\\uff1a\\u5973\\uff1b2\\uff1a\\u672a\\u77e5\"},{\"name\":\"phone\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u624b\\u673a\\u53f7\"},{\"name\":\"last_login_time\",\"type\":\"timestamp\",\"key\":null,\"default\":null,\"comment\":\"\\u6700\\u540e\\u767b\\u5f55\\u65f6\\u95f4\"},{\"name\":\"status\",\"type\":\"tinyInteger\",\"key\":null,\"default\":null,\"comment\":\"\\u72b6\\u6001\\uff1a0\\uff1a\\u6b63\\u5e38\\uff1b1\\uff1a\\u7981\\u6b62\\u767b\\u5f55\"},{\"name\":\"qr_code\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u4e13\\u5c5e\\u4e8c\\u7ef4\\u7801\"}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"pSz9qVNYnoJ91e0zE7FsWmvC2hmkhtryIG2ZOXdb\"}', '2020-04-09 16:40:50', '2020-04-09 16:40:50');
INSERT INTO `admin_operation_log` VALUES (56, 1, 'admin/helpers/scaffold', 'GET', '172.17.119.33', '[]', '2020-04-09 16:40:52', '2020-04-09 16:40:52');
INSERT INTO `admin_operation_log` VALUES (57, 1, 'admin', 'GET', '172.17.119.33', '[]', '2020-04-09 16:43:03', '2020-04-09 16:43:03');
INSERT INTO `admin_operation_log` VALUES (58, 1, 'admin', 'GET', '192.168.117.81', '[]', '2020-04-10 02:47:59', '2020-04-10 02:47:59');
INSERT INTO `admin_operation_log` VALUES (59, 1, 'admin/dashboard', 'GET', '192.168.117.81', '[]', '2020-04-10 02:50:03', '2020-04-10 02:50:03');
INSERT INTO `admin_operation_log` VALUES (60, 1, 'admin/logs', 'GET', '192.168.117.81', '[]', '2020-04-10 02:50:49', '2020-04-10 02:50:49');
INSERT INTO `admin_operation_log` VALUES (61, 1, 'admin/auth/users', 'GET', '192.168.117.81', '[]', '2020-04-10 02:50:59', '2020-04-10 02:50:59');
INSERT INTO `admin_operation_log` VALUES (62, 1, 'admin/auth/roles', 'GET', '192.168.117.81', '[]', '2020-04-10 02:51:03', '2020-04-10 02:51:03');
INSERT INTO `admin_operation_log` VALUES (63, 1, 'admin/auth/permissions', 'GET', '192.168.117.81', '[]', '2020-04-10 02:51:05', '2020-04-10 02:51:05');
INSERT INTO `admin_operation_log` VALUES (64, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 02:51:06', '2020-04-10 02:51:06');
INSERT INTO `admin_operation_log` VALUES (65, 1, 'admin/auth/menu/2/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 02:51:15', '2020-04-10 02:51:15');
INSERT INTO `admin_operation_log` VALUES (66, 1, 'admin/auth/menu/2', 'PUT', '192.168.117.81', '{\"parent_id\":\"0\",\"title\":\"\\u7ba1\\u7406\\u5458\",\"icon\":\"fa-user-secret\",\"uri\":null,\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/auth\\/menu\"}', '2020-04-10 02:51:41', '2020-04-10 02:51:41');
INSERT INTO `admin_operation_log` VALUES (67, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 02:51:41', '2020-04-10 02:51:41');
INSERT INTO `admin_operation_log` VALUES (68, 1, 'admin/auth/menu/3/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 02:53:40', '2020-04-10 02:53:40');
INSERT INTO `admin_operation_log` VALUES (69, 1, 'admin/auth/menu/3', 'PUT', '192.168.117.81', '{\"parent_id\":\"2\",\"title\":\"\\u7ba1\\u7406\\u5458\\u5217\\u8868\",\"icon\":\"fa-user\",\"uri\":\"auth\\/users\",\"roles\":[null],\"permission\":null,\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/auth\\/menu\"}', '2020-04-10 02:54:12', '2020-04-10 02:54:12');
INSERT INTO `admin_operation_log` VALUES (70, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 02:54:12', '2020-04-10 02:54:12');
INSERT INTO `admin_operation_log` VALUES (71, 1, 'admin/auth/roles', 'GET', '192.168.117.81', '[]', '2020-04-10 02:54:18', '2020-04-10 02:54:18');
INSERT INTO `admin_operation_log` VALUES (72, 1, 'admin/auth/users', 'GET', '192.168.117.81', '[]', '2020-04-10 02:54:22', '2020-04-10 02:54:22');
INSERT INTO `admin_operation_log` VALUES (73, 1, 'admin/auth/roles', 'GET', '192.168.117.81', '[]', '2020-04-10 02:54:26', '2020-04-10 02:54:26');
INSERT INTO `admin_operation_log` VALUES (74, 1, 'admin/auth/menu/4/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 02:54:30', '2020-04-10 02:54:30');
INSERT INTO `admin_operation_log` VALUES (75, 1, 'admin/auth/menu/4', 'PUT', '192.168.117.81', '{\"parent_id\":\"2\",\"title\":\"\\u89d2\\u8272\",\"icon\":\"fa-user\",\"uri\":\"auth\\/roles\",\"roles\":[null],\"permission\":null,\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/auth\\/menu\"}', '2020-04-10 02:54:42', '2020-04-10 02:54:42');
INSERT INTO `admin_operation_log` VALUES (76, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 02:54:43', '2020-04-10 02:54:43');
INSERT INTO `admin_operation_log` VALUES (77, 1, 'admin', 'GET', '192.168.117.81', '[]', '2020-04-10 02:54:45', '2020-04-10 02:54:45');
INSERT INTO `admin_operation_log` VALUES (78, 1, 'admin/dashboard', 'GET', '192.168.117.81', '[]', '2020-04-10 02:54:46', '2020-04-10 02:54:46');
INSERT INTO `admin_operation_log` VALUES (79, 1, 'admin/auth/users', 'GET', '192.168.117.81', '[]', '2020-04-10 02:54:49', '2020-04-10 02:54:49');
INSERT INTO `admin_operation_log` VALUES (80, 1, 'admin/auth/roles', 'GET', '192.168.117.81', '[]', '2020-04-10 02:54:50', '2020-04-10 02:54:50');
INSERT INTO `admin_operation_log` VALUES (81, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 02:54:52', '2020-04-10 02:54:52');
INSERT INTO `admin_operation_log` VALUES (82, 1, 'admin/auth/menu/3/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 02:54:54', '2020-04-10 02:54:54');
INSERT INTO `admin_operation_log` VALUES (83, 1, 'admin/auth/menu/3', 'PUT', '192.168.117.81', '{\"parent_id\":\"2\",\"title\":\"\\u7ba1\\u7406\\u5458\",\"icon\":\"fa-user\",\"uri\":\"auth\\/users\",\"roles\":[null],\"permission\":null,\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/auth\\/menu\"}', '2020-04-10 02:54:57', '2020-04-10 02:54:57');
INSERT INTO `admin_operation_log` VALUES (84, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 02:54:58', '2020-04-10 02:54:58');
INSERT INTO `admin_operation_log` VALUES (85, 1, 'admin/auth/permissions', 'GET', '192.168.117.81', '[]', '2020-04-10 02:55:01', '2020-04-10 02:55:01');
INSERT INTO `admin_operation_log` VALUES (86, 1, 'admin/auth/menu/5/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 02:55:09', '2020-04-10 02:55:09');
INSERT INTO `admin_operation_log` VALUES (87, 1, 'admin/auth/menu/5', 'PUT', '192.168.117.81', '{\"parent_id\":\"2\",\"title\":\"\\u6743\\u9650\",\"icon\":\"fa-ban\",\"uri\":\"auth\\/permissions\",\"roles\":[null],\"permission\":null,\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/auth\\/menu\"}', '2020-04-10 02:55:12', '2020-04-10 02:55:12');
INSERT INTO `admin_operation_log` VALUES (88, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 02:55:12', '2020-04-10 02:55:12');
INSERT INTO `admin_operation_log` VALUES (89, 1, 'admin/auth/menu/6/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 02:55:16', '2020-04-10 02:55:16');
INSERT INTO `admin_operation_log` VALUES (90, 1, 'admin/auth/menu/6', 'PUT', '192.168.117.81', '{\"parent_id\":\"2\",\"title\":\"\\u83dc\\u5355\",\"icon\":\"fa-bars\",\"uri\":\"auth\\/menu\",\"roles\":[null],\"permission\":null,\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/auth\\/menu\"}', '2020-04-10 02:55:22', '2020-04-10 02:55:22');
INSERT INTO `admin_operation_log` VALUES (91, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 02:55:22', '2020-04-10 02:55:22');
INSERT INTO `admin_operation_log` VALUES (92, 1, 'admin/auth/menu/7/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 02:55:25', '2020-04-10 02:55:25');
INSERT INTO `admin_operation_log` VALUES (93, 1, 'admin/auth/menu/7/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 02:55:35', '2020-04-10 02:55:35');
INSERT INTO `admin_operation_log` VALUES (94, 1, 'admin/auth/menu/7/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 02:55:36', '2020-04-10 02:55:36');
INSERT INTO `admin_operation_log` VALUES (95, 1, 'admin/auth/menu/7', 'PUT', '192.168.117.81', '{\"parent_id\":\"2\",\"title\":\"\\u64cd\\u4f5c\\u65e5\\u5fd7\",\"icon\":\"fa-history\",\"uri\":\"auth\\/logs\",\"roles\":[null],\"permission\":null,\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\",\"_method\":\"PUT\"}', '2020-04-10 02:55:39', '2020-04-10 02:55:39');
INSERT INTO `admin_operation_log` VALUES (96, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 02:55:39', '2020-04-10 02:55:39');
INSERT INTO `admin_operation_log` VALUES (97, 1, 'admin/auth/menu/8/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 02:55:43', '2020-04-10 02:55:43');
INSERT INTO `admin_operation_log` VALUES (98, 1, 'admin/auth/menu/8/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 02:55:46', '2020-04-10 02:55:46');
INSERT INTO `admin_operation_log` VALUES (99, 1, 'admin/auth/menu/8', 'PUT', '192.168.117.81', '{\"parent_id\":\"0\",\"title\":\"\\u5f00\\u53d1\\u52a9\\u624b\",\"icon\":\"fa-gears\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\",\"_method\":\"PUT\"}', '2020-04-10 02:55:52', '2020-04-10 02:55:52');
INSERT INTO `admin_operation_log` VALUES (100, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 02:55:52', '2020-04-10 02:55:52');
INSERT INTO `admin_operation_log` VALUES (101, 1, 'admin/auth/menu/13/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 02:55:56', '2020-04-10 02:55:56');
INSERT INTO `admin_operation_log` VALUES (102, 1, 'admin/auth/menu/13/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 02:55:58', '2020-04-10 02:55:58');
INSERT INTO `admin_operation_log` VALUES (103, 1, 'admin/auth/menu/13', 'PUT', '192.168.117.81', '{\"parent_id\":\"0\",\"title\":\"\\u9519\\u8bef\\u65e5\\u5fd7\",\"icon\":\"fa-bug\",\"uri\":\"logs\",\"roles\":[null],\"permission\":null,\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\",\"_method\":\"PUT\"}', '2020-04-10 02:56:12', '2020-04-10 02:56:12');
INSERT INTO `admin_operation_log` VALUES (104, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 02:56:12', '2020-04-10 02:56:12');
INSERT INTO `admin_operation_log` VALUES (105, 1, 'admin/auth/permissions', 'GET', '192.168.117.81', '[]', '2020-04-10 03:31:39', '2020-04-10 03:31:39');
INSERT INTO `admin_operation_log` VALUES (106, 1, 'admin', 'GET', '192.168.117.81', '[]', '2020-04-10 03:31:45', '2020-04-10 03:31:45');
INSERT INTO `admin_operation_log` VALUES (107, 1, 'admin/dashboard', 'GET', '192.168.117.81', '[]', '2020-04-10 03:31:46', '2020-04-10 03:31:46');
INSERT INTO `admin_operation_log` VALUES (108, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 03:31:54', '2020-04-10 03:31:54');
INSERT INTO `admin_operation_log` VALUES (109, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 03:31:58', '2020-04-10 03:31:58');
INSERT INTO `admin_operation_log` VALUES (110, 1, 'admin/auth/menu/14/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 03:32:07', '2020-04-10 03:32:07');
INSERT INTO `admin_operation_log` VALUES (111, 1, 'admin/auth/menu/14/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 03:32:09', '2020-04-10 03:32:09');
INSERT INTO `admin_operation_log` VALUES (112, 1, 'admin/auth/menu/14', 'PUT', '192.168.117.81', '{\"parent_id\":\"0\",\"title\":\"Redis\\u7ba1\\u7406\",\"icon\":\"fa-database\",\"uri\":\"redis\",\"roles\":[null],\"permission\":null,\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\",\"_method\":\"PUT\"}', '2020-04-10 03:32:21', '2020-04-10 03:32:21');
INSERT INTO `admin_operation_log` VALUES (113, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 03:32:21', '2020-04-10 03:32:21');
INSERT INTO `admin_operation_log` VALUES (114, 1, 'admin/auth/menu', 'POST', '192.168.117.81', '{\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":13},{\\\"id\\\":14},{\\\"id\\\":8,\\\"children\\\":[{\\\"id\\\":9},{\\\"id\\\":10},{\\\"id\\\":11},{\\\"id\\\":12}]}]\"}', '2020-04-10 03:32:28', '2020-04-10 03:32:28');
INSERT INTO `admin_operation_log` VALUES (115, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 03:32:28', '2020-04-10 03:32:28');
INSERT INTO `admin_operation_log` VALUES (116, 1, 'admin', 'GET', '192.168.117.81', '[]', '2020-04-10 03:34:11', '2020-04-10 03:34:11');
INSERT INTO `admin_operation_log` VALUES (117, 1, 'admin/dashboard', 'GET', '192.168.117.81', '[]', '2020-04-10 03:34:12', '2020-04-10 03:34:12');
INSERT INTO `admin_operation_log` VALUES (118, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 03:34:19', '2020-04-10 03:34:19');
INSERT INTO `admin_operation_log` VALUES (119, 1, 'admin/auth/menu/1', 'DELETE', '192.168.117.81', '{\"_method\":\"delete\",\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\"}', '2020-04-10 03:35:43', '2020-04-10 03:35:43');
INSERT INTO `admin_operation_log` VALUES (120, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 03:35:44', '2020-04-10 03:35:44');
INSERT INTO `admin_operation_log` VALUES (121, 1, 'admin', 'GET', '192.168.117.81', '[]', '2020-04-10 03:35:48', '2020-04-10 03:35:48');
INSERT INTO `admin_operation_log` VALUES (122, 1, 'admin/dashboard', 'GET', '192.168.117.81', '[]', '2020-04-10 03:35:48', '2020-04-10 03:35:48');
INSERT INTO `admin_operation_log` VALUES (123, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 03:38:00', '2020-04-10 03:38:00');
INSERT INTO `admin_operation_log` VALUES (124, 1, 'admin/auth/menu', 'POST', '192.168.117.81', '{\"parent_id\":\"0\",\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"fa-user\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\"}', '2020-04-10 03:38:22', '2020-04-10 03:38:22');
INSERT INTO `admin_operation_log` VALUES (125, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 03:38:22', '2020-04-10 03:38:22');
INSERT INTO `admin_operation_log` VALUES (126, 1, 'admin/auth/menu', 'POST', '192.168.117.81', '{\"parent_id\":\"15\",\"title\":\"\\u7528\\u6237\\u5217\\u8868\",\"icon\":\"fa-list-ul\",\"uri\":\"user\\/user\",\"roles\":[null],\"permission\":null,\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\"}', '2020-04-10 03:38:52', '2020-04-10 03:38:52');
INSERT INTO `admin_operation_log` VALUES (127, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 03:38:52', '2020-04-10 03:38:52');
INSERT INTO `admin_operation_log` VALUES (128, 1, 'admin/auth/menu', 'POST', '192.168.117.81', '{\"parent_id\":\"0\",\"title\":\"\\u94b1\\u5305\\u7ba1\\u7406\",\"icon\":\"fa-google-wallet\",\"uri\":\"user\\/wallet\",\"roles\":[null],\"permission\":null,\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\"}', '2020-04-10 03:39:33', '2020-04-10 03:39:33');
INSERT INTO `admin_operation_log` VALUES (129, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 03:39:33', '2020-04-10 03:39:33');
INSERT INTO `admin_operation_log` VALUES (130, 1, 'admin/auth/menu/17/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 03:39:37', '2020-04-10 03:39:37');
INSERT INTO `admin_operation_log` VALUES (131, 1, 'admin/auth/menu/17/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 03:39:40', '2020-04-10 03:39:40');
INSERT INTO `admin_operation_log` VALUES (132, 1, 'admin/auth/menu/17/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 03:39:40', '2020-04-10 03:39:40');
INSERT INTO `admin_operation_log` VALUES (133, 1, 'admin/auth/menu/17', 'PUT', '192.168.117.81', '{\"parent_id\":\"15\",\"title\":\"\\u94b1\\u5305\\u7ba1\\u7406\",\"icon\":\"fa-google-wallet\",\"uri\":\"user\\/wallet\",\"roles\":[null],\"permission\":null,\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\",\"_method\":\"PUT\"}', '2020-04-10 03:39:45', '2020-04-10 03:39:45');
INSERT INTO `admin_operation_log` VALUES (134, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 03:39:46', '2020-04-10 03:39:46');
INSERT INTO `admin_operation_log` VALUES (135, 1, 'admin/auth/menu', 'POST', '192.168.117.81', '{\"parent_id\":\"15\",\"title\":\"\\u94b1\\u5305\\u8bb0\\u5f55\",\"icon\":\"fa-bars\",\"uri\":\"user\\/wallet_record\",\"roles\":[null],\"permission\":null,\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\"}', '2020-04-10 03:40:54', '2020-04-10 03:40:54');
INSERT INTO `admin_operation_log` VALUES (136, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 03:40:55', '2020-04-10 03:40:55');
INSERT INTO `admin_operation_log` VALUES (137, 1, 'admin/auth/menu/6/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 03:40:57', '2020-04-10 03:40:57');
INSERT INTO `admin_operation_log` VALUES (138, 1, 'admin/auth/menu/6/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 03:40:58', '2020-04-10 03:40:58');
INSERT INTO `admin_operation_log` VALUES (139, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 03:41:13', '2020-04-10 03:41:13');
INSERT INTO `admin_operation_log` VALUES (140, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 03:41:20', '2020-04-10 03:41:20');
INSERT INTO `admin_operation_log` VALUES (141, 1, 'admin/auth/menu/7/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 03:41:23', '2020-04-10 03:41:23');
INSERT INTO `admin_operation_log` VALUES (142, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 03:41:28', '2020-04-10 03:41:28');
INSERT INTO `admin_operation_log` VALUES (143, 1, 'admin/auth/menu/18/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 03:41:33', '2020-04-10 03:41:33');
INSERT INTO `admin_operation_log` VALUES (144, 1, 'admin/auth/menu/18', 'PUT', '192.168.117.81', '{\"parent_id\":\"15\",\"title\":\"\\u94b1\\u5305\\u8bb0\\u5f55\",\"icon\":\"fa-history\",\"uri\":\"user\\/wallet_record\",\"roles\":[null],\"permission\":null,\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/auth\\/menu\"}', '2020-04-10 03:41:36', '2020-04-10 03:41:36');
INSERT INTO `admin_operation_log` VALUES (145, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 03:41:37', '2020-04-10 03:41:37');
INSERT INTO `admin_operation_log` VALUES (146, 1, 'admin/auth/menu/3/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 03:41:40', '2020-04-10 03:41:40');
INSERT INTO `admin_operation_log` VALUES (147, 1, 'admin/auth/menu/3', 'PUT', '192.168.117.81', '{\"parent_id\":\"2\",\"title\":\"\\u7ba1\\u7406\\u5458\",\"icon\":\"fa-list-ul\",\"uri\":\"auth\\/users\",\"roles\":[null],\"permission\":null,\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/auth\\/menu\"}', '2020-04-10 03:41:52', '2020-04-10 03:41:52');
INSERT INTO `admin_operation_log` VALUES (148, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 03:41:52', '2020-04-10 03:41:52');
INSERT INTO `admin_operation_log` VALUES (149, 1, 'admin', 'GET', '192.168.117.81', '[]', '2020-04-10 03:41:55', '2020-04-10 03:41:55');
INSERT INTO `admin_operation_log` VALUES (150, 1, 'admin/dashboard', 'GET', '192.168.117.81', '[]', '2020-04-10 03:41:55', '2020-04-10 03:41:55');
INSERT INTO `admin_operation_log` VALUES (151, 1, 'admin/user/user', 'GET', '192.168.117.81', '[]', '2020-04-10 03:42:03', '2020-04-10 03:42:03');
INSERT INTO `admin_operation_log` VALUES (152, 1, 'admin/user/wallet', 'GET', '192.168.117.81', '[]', '2020-04-10 03:42:05', '2020-04-10 03:42:05');
INSERT INTO `admin_operation_log` VALUES (153, 1, 'admin/user/wallet_record', 'GET', '192.168.117.81', '[]', '2020-04-10 03:42:06', '2020-04-10 03:42:06');
INSERT INTO `admin_operation_log` VALUES (154, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 03:42:19', '2020-04-10 03:42:19');
INSERT INTO `admin_operation_log` VALUES (155, 1, 'admin/auth/menu', 'POST', '192.168.117.81', '{\"parent_id\":\"15\",\"title\":\"\\u63d0\\u73b0\\u7533\\u8bf7\",\"icon\":\"fa-bars\",\"uri\":\"user\\/withdraw\",\"roles\":[null],\"permission\":null,\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\"}', '2020-04-10 03:43:04', '2020-04-10 03:43:04');
INSERT INTO `admin_operation_log` VALUES (156, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 03:43:04', '2020-04-10 03:43:04');
INSERT INTO `admin_operation_log` VALUES (157, 1, 'admin/auth/menu', 'POST', '192.168.117.81', '{\"parent_id\":\"15\",\"title\":\"\\u5730\\u5740\\u7ba1\\u7406\",\"icon\":\"fa-map-marker\",\"uri\":\"user\\/address\",\"roles\":[null],\"permission\":null,\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\"}', '2020-04-10 03:43:35', '2020-04-10 03:43:35');
INSERT INTO `admin_operation_log` VALUES (158, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 03:43:36', '2020-04-10 03:43:36');
INSERT INTO `admin_operation_log` VALUES (159, 1, 'admin/auth/menu', 'POST', '192.168.117.81', '{\"parent_id\":\"0\",\"title\":\"\\u5546\\u54c1\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\"}', '2020-04-10 03:46:07', '2020-04-10 03:46:07');
INSERT INTO `admin_operation_log` VALUES (160, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 03:46:08', '2020-04-10 03:46:08');
INSERT INTO `admin_operation_log` VALUES (161, 1, 'admin/auth/menu', 'POST', '192.168.117.81', '{\"parent_id\":\"21\",\"title\":\"\\u5546\\u54c1\\u5217\\u8868\",\"icon\":\"fa-list-ul\",\"uri\":\"goods\\/goods\",\"roles\":[null],\"permission\":null,\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\"}', '2020-04-10 03:46:28', '2020-04-10 03:46:28');
INSERT INTO `admin_operation_log` VALUES (162, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 03:46:28', '2020-04-10 03:46:28');
INSERT INTO `admin_operation_log` VALUES (163, 1, 'admin/auth/menu', 'POST', '192.168.117.81', '{\"parent_id\":\"0\",\"title\":\"\\u4f1a\\u5458\\u5bfb\\u54c1\",\"icon\":\"fa-bars\",\"uri\":\"goods\\/goods_search\",\"roles\":[null],\"permission\":null,\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\"}', '2020-04-10 03:46:55', '2020-04-10 03:46:55');
INSERT INTO `admin_operation_log` VALUES (164, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 03:46:55', '2020-04-10 03:46:55');
INSERT INTO `admin_operation_log` VALUES (165, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 03:47:02', '2020-04-10 03:47:02');
INSERT INTO `admin_operation_log` VALUES (166, 1, 'admin/auth/menu/23/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 03:47:06', '2020-04-10 03:47:06');
INSERT INTO `admin_operation_log` VALUES (167, 1, 'admin/auth/menu/23', 'PUT', '192.168.117.81', '{\"parent_id\":\"21\",\"title\":\"\\u4f1a\\u5458\\u5bfb\\u54c1\",\"icon\":\"fa-search\",\"uri\":\"goods\\/goods_search\",\"roles\":[null],\"permission\":null,\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/auth\\/menu\"}', '2020-04-10 03:47:18', '2020-04-10 03:47:18');
INSERT INTO `admin_operation_log` VALUES (168, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 03:47:18', '2020-04-10 03:47:18');
INSERT INTO `admin_operation_log` VALUES (169, 1, 'admin', 'GET', '192.168.117.81', '[]', '2020-04-10 03:47:21', '2020-04-10 03:47:21');
INSERT INTO `admin_operation_log` VALUES (170, 1, 'admin', 'GET', '192.168.117.81', '[]', '2020-04-10 03:47:36', '2020-04-10 03:47:36');
INSERT INTO `admin_operation_log` VALUES (171, 1, 'admin', 'GET', '192.168.117.81', '[]', '2020-04-10 03:47:37', '2020-04-10 03:47:37');
INSERT INTO `admin_operation_log` VALUES (172, 1, 'admin/dashboard', 'GET', '192.168.117.81', '[]', '2020-04-10 03:47:38', '2020-04-10 03:47:38');
INSERT INTO `admin_operation_log` VALUES (173, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 03:47:47', '2020-04-10 03:47:47');
INSERT INTO `admin_operation_log` VALUES (174, 1, 'admin/auth/menu', 'POST', '192.168.117.81', '{\"parent_id\":\"0\",\"title\":\"\\u8ba2\\u5355\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\"}', '2020-04-10 03:48:01', '2020-04-10 03:48:01');
INSERT INTO `admin_operation_log` VALUES (175, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 03:48:01', '2020-04-10 03:48:01');
INSERT INTO `admin_operation_log` VALUES (176, 1, 'admin/user/user', 'GET', '192.168.117.81', '[]', '2020-04-10 03:48:56', '2020-04-10 03:48:56');
INSERT INTO `admin_operation_log` VALUES (177, 1, 'admin/user/user', 'GET', '192.168.117.81', '[]', '2020-04-10 03:48:59', '2020-04-10 03:48:59');
INSERT INTO `admin_operation_log` VALUES (178, 1, 'admin/user/wallet', 'GET', '192.168.117.81', '[]', '2020-04-10 03:48:59', '2020-04-10 03:48:59');
INSERT INTO `admin_operation_log` VALUES (179, 1, 'admin/user/withdraw', 'GET', '192.168.117.81', '[]', '2020-04-10 03:49:01', '2020-04-10 03:49:01');
INSERT INTO `admin_operation_log` VALUES (180, 1, 'admin/auth/menu', 'POST', '192.168.117.81', '{\"parent_id\":\"24\",\"title\":\"\\u8ba2\\u5355\\u5217\\u8868\",\"icon\":\"fa-list-ul\",\"uri\":\"order\\/order\",\"roles\":[null],\"permission\":null,\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\"}', '2020-04-10 03:50:33', '2020-04-10 03:50:33');
INSERT INTO `admin_operation_log` VALUES (181, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 03:50:34', '2020-04-10 03:50:34');
INSERT INTO `admin_operation_log` VALUES (182, 1, 'admin/auth/menu', 'POST', '192.168.117.81', '{\"parent_id\":\"24\",\"title\":\"\\u8ba2\\u5355\\u8be6\\u60c5\",\"icon\":\"fa-bars\",\"uri\":\"order\\/order_details\",\"roles\":[null],\"permission\":null,\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\"}', '2020-04-10 03:52:48', '2020-04-10 03:52:48');
INSERT INTO `admin_operation_log` VALUES (183, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 03:52:48', '2020-04-10 03:52:48');
INSERT INTO `admin_operation_log` VALUES (184, 1, 'admin/auth/menu', 'POST', '192.168.117.81', '{\"parent_id\":\"24\",\"title\":\"\\u66f4\\u65b0\\u8bb0\\u5f55\",\"icon\":\"fa-history\",\"uri\":\"\\/order\\/order_record\",\"roles\":[null],\"permission\":null,\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\"}', '2020-04-10 03:53:54', '2020-04-10 03:53:54');
INSERT INTO `admin_operation_log` VALUES (185, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 03:53:55', '2020-04-10 03:53:55');
INSERT INTO `admin_operation_log` VALUES (186, 1, 'admin/auth/menu', 'POST', '192.168.117.81', '{\"parent_id\":\"0\",\"title\":\"\\u8ba2\\u5355\\u8bc4\\u8bba\",\"icon\":\"fa-commenting-o\",\"uri\":\"order\\/order_comment\",\"roles\":[null],\"permission\":null,\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\"}', '2020-04-10 03:54:25', '2020-04-10 03:54:25');
INSERT INTO `admin_operation_log` VALUES (187, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 03:54:25', '2020-04-10 03:54:25');
INSERT INTO `admin_operation_log` VALUES (188, 1, 'admin/auth/menu/28/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 03:54:31', '2020-04-10 03:54:31');
INSERT INTO `admin_operation_log` VALUES (189, 1, 'admin/auth/menu/28', 'PUT', '192.168.117.81', '{\"parent_id\":\"24\",\"title\":\"\\u8ba2\\u5355\\u8bc4\\u8bba\",\"icon\":\"fa-commenting-o\",\"uri\":\"order\\/order_comment\",\"roles\":[null],\"permission\":null,\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/auth\\/menu\"}', '2020-04-10 03:54:37', '2020-04-10 03:54:37');
INSERT INTO `admin_operation_log` VALUES (190, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 03:54:37', '2020-04-10 03:54:37');
INSERT INTO `admin_operation_log` VALUES (191, 1, 'admin', 'GET', '192.168.117.81', '[]', '2020-04-10 03:54:44', '2020-04-10 03:54:44');
INSERT INTO `admin_operation_log` VALUES (192, 1, 'admin/dashboard', 'GET', '192.168.117.81', '[]', '2020-04-10 03:54:45', '2020-04-10 03:54:45');
INSERT INTO `admin_operation_log` VALUES (193, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 03:54:48', '2020-04-10 03:54:48');
INSERT INTO `admin_operation_log` VALUES (194, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 03:54:53', '2020-04-10 03:54:53');
INSERT INTO `admin_operation_log` VALUES (195, 1, 'admin/auth/menu/26/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 03:54:58', '2020-04-10 03:54:58');
INSERT INTO `admin_operation_log` VALUES (196, 1, 'admin/auth/menu/26', 'PUT', '192.168.117.81', '{\"parent_id\":\"24\",\"title\":\"\\u8ba2\\u5355\\u8be6\\u60c5\",\"icon\":\"fa-list-alt\",\"uri\":\"order\\/order_details\",\"roles\":[null],\"permission\":null,\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/auth\\/menu\"}', '2020-04-10 03:55:40', '2020-04-10 03:55:40');
INSERT INTO `admin_operation_log` VALUES (197, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 03:55:41', '2020-04-10 03:55:41');
INSERT INTO `admin_operation_log` VALUES (198, 1, 'admin/auth/menu/19/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 03:55:46', '2020-04-10 03:55:46');
INSERT INTO `admin_operation_log` VALUES (199, 1, 'admin/auth/menu/19', 'PUT', '192.168.117.81', '{\"parent_id\":\"15\",\"title\":\"\\u63d0\\u73b0\\u7533\\u8bf7\",\"icon\":\"fa-credit-card\",\"uri\":\"user\\/withdraw\",\"roles\":[null],\"permission\":null,\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/auth\\/menu\"}', '2020-04-10 03:56:57', '2020-04-10 03:56:57');
INSERT INTO `admin_operation_log` VALUES (200, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 03:56:57', '2020-04-10 03:56:57');
INSERT INTO `admin_operation_log` VALUES (201, 1, 'admin/auth/menu/6/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 03:57:07', '2020-04-10 03:57:07');
INSERT INTO `admin_operation_log` VALUES (202, 1, 'admin/auth/menu/6', 'PUT', '192.168.117.81', '{\"parent_id\":\"2\",\"title\":\"\\u83dc\\u5355\",\"icon\":\"fa-sliders\",\"uri\":\"auth\\/menu\",\"roles\":[null],\"permission\":null,\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/auth\\/menu\"}', '2020-04-10 03:57:45', '2020-04-10 03:57:45');
INSERT INTO `admin_operation_log` VALUES (203, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 03:57:45', '2020-04-10 03:57:45');
INSERT INTO `admin_operation_log` VALUES (204, 1, 'admin', 'GET', '192.168.117.81', '[]', '2020-04-10 03:57:54', '2020-04-10 03:57:54');
INSERT INTO `admin_operation_log` VALUES (205, 1, 'admin/dashboard', 'GET', '192.168.117.81', '[]', '2020-04-10 03:57:55', '2020-04-10 03:57:55');
INSERT INTO `admin_operation_log` VALUES (206, 1, 'admin/logs', 'GET', '192.168.117.81', '[]', '2020-04-10 03:58:03', '2020-04-10 03:58:03');
INSERT INTO `admin_operation_log` VALUES (207, 1, 'admin/helpers/scaffold', 'GET', '192.168.117.81', '[]', '2020-04-10 03:59:18', '2020-04-10 03:59:18');
INSERT INTO `admin_operation_log` VALUES (208, 1, 'admin/helpers/scaffold', 'GET', '192.168.117.81', '[]', '2020-04-10 03:59:22', '2020-04-10 03:59:22');
INSERT INTO `admin_operation_log` VALUES (209, 1, 'admin/helpers/scaffold', 'POST', '192.168.117.81', '{\"table_name\":\"goods_group\",\"model_name\":\"App\\\\Models\\\\Goods\\\\GoodsGroup\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\Goods\\\\GoodsGroupController\",\"create\":[\"migration\",\"model\",\"controller\",\"migrate\"],\"fields\":[{\"name\":\"goods_id\",\"type\":\"integer\",\"key\":null,\"default\":null,\"comment\":\"\\u5546\\u54c1ID\"},{\"name\":\"start_date\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u5f00\\u59cb\\u65e5\\u671f\"},{\"name\":\"end_date\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u7ed3\\u675f\\u65e5\\u671f\"},{\"name\":\"start_time\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u5f00\\u59cb\\u65f6\\u95f4\"},{\"name\":\"end_time\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":\"\\u7ed3\\u675f\\u65f6\\u95f4\"},{\"name\":\"status\",\"type\":\"tinyInteger\",\"key\":null,\"default\":null,\"comment\":\"\\u72b6\\u6001\\uff1a0\\uff1a\\u672a\\u4e0a\\u67b6\\uff1a1\\uff1a\\u4e0a\\u67b6\\u4e2d\"}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\"}', '2020-04-10 04:06:08', '2020-04-10 04:06:08');
INSERT INTO `admin_operation_log` VALUES (210, 1, 'admin/helpers/scaffold', 'GET', '192.168.117.81', '[]', '2020-04-10 04:06:11', '2020-04-10 04:06:11');
INSERT INTO `admin_operation_log` VALUES (211, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 04:06:50', '2020-04-10 04:06:50');
INSERT INTO `admin_operation_log` VALUES (212, 1, 'admin/auth/menu', 'POST', '192.168.117.81', '{\"parent_id\":\"21\",\"title\":\"\\u56e2\\u8d2d\\u5546\\u54c1\",\"icon\":\"fa-object-group\",\"uri\":\"goods\\/goods_group\",\"roles\":[null],\"permission\":null,\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\"}', '2020-04-10 04:07:50', '2020-04-10 04:07:50');
INSERT INTO `admin_operation_log` VALUES (213, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 04:07:51', '2020-04-10 04:07:51');
INSERT INTO `admin_operation_log` VALUES (214, 1, 'admin', 'GET', '192.168.117.81', '[]', '2020-04-10 04:07:55', '2020-04-10 04:07:55');
INSERT INTO `admin_operation_log` VALUES (215, 1, 'admin', 'GET', '192.168.117.81', '[]', '2020-04-10 04:08:03', '2020-04-10 04:08:03');
INSERT INTO `admin_operation_log` VALUES (216, 1, 'admin/dashboard', 'GET', '192.168.117.81', '[]', '2020-04-10 04:08:04', '2020-04-10 04:08:04');
INSERT INTO `admin_operation_log` VALUES (217, 1, 'admin', 'GET', '192.168.117.81', '[]', '2020-04-10 04:08:08', '2020-04-10 04:08:08');
INSERT INTO `admin_operation_log` VALUES (218, 1, 'admin/dashboard', 'GET', '192.168.117.81', '[]', '2020-04-10 04:08:08', '2020-04-10 04:08:08');
INSERT INTO `admin_operation_log` VALUES (219, 1, 'admin/goods/goods_group', 'GET', '192.168.117.81', '[]', '2020-04-10 04:08:13', '2020-04-10 04:08:13');
INSERT INTO `admin_operation_log` VALUES (220, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 04:08:20', '2020-04-10 04:08:20');
INSERT INTO `admin_operation_log` VALUES (221, 1, 'admin/goods/goods_search', 'GET', '192.168.117.81', '[]', '2020-04-10 04:08:22', '2020-04-10 04:08:22');
INSERT INTO `admin_operation_log` VALUES (222, 1, 'admin/goods/goods_group', 'GET', '192.168.117.81', '[]', '2020-04-10 04:08:23', '2020-04-10 04:08:23');
INSERT INTO `admin_operation_log` VALUES (223, 1, 'admin/goods/goods_search', 'GET', '192.168.117.81', '[]', '2020-04-10 04:08:30', '2020-04-10 04:08:30');
INSERT INTO `admin_operation_log` VALUES (224, 1, 'admin/goods/goods_group', 'GET', '192.168.117.81', '[]', '2020-04-10 04:08:32', '2020-04-10 04:08:32');
INSERT INTO `admin_operation_log` VALUES (225, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 04:08:47', '2020-04-10 04:08:47');
INSERT INTO `admin_operation_log` VALUES (226, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 04:08:52', '2020-04-10 04:08:52');
INSERT INTO `admin_operation_log` VALUES (227, 1, 'admin/auth/menu/29/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 04:08:57', '2020-04-10 04:08:57');
INSERT INTO `admin_operation_log` VALUES (228, 1, 'admin/auth/menu/29', 'PUT', '192.168.117.81', '{\"parent_id\":\"21\",\"title\":\"\\u56e2\\u8d2d\\u5546\\u54c1\",\"icon\":\"fa-user-plus\",\"uri\":\"goods\\/goods_group\",\"roles\":[null],\"permission\":null,\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/auth\\/menu\"}', '2020-04-10 04:11:21', '2020-04-10 04:11:21');
INSERT INTO `admin_operation_log` VALUES (229, 1, 'admin/auth/menu', 'GET', '192.168.117.81', '[]', '2020-04-10 04:11:21', '2020-04-10 04:11:21');
INSERT INTO `admin_operation_log` VALUES (230, 1, 'admin', 'GET', '192.168.117.81', '[]', '2020-04-10 04:11:26', '2020-04-10 04:11:26');
INSERT INTO `admin_operation_log` VALUES (231, 1, 'admin/dashboard', 'GET', '192.168.117.81', '[]', '2020-04-10 04:11:26', '2020-04-10 04:11:26');
INSERT INTO `admin_operation_log` VALUES (232, 1, 'admin/goods/goods_group', 'GET', '192.168.117.81', '[]', '2020-04-10 04:11:30', '2020-04-10 04:11:30');
INSERT INTO `admin_operation_log` VALUES (233, 1, 'admin/goods/goods_search', 'GET', '192.168.117.81', '[]', '2020-04-10 04:11:31', '2020-04-10 04:11:31');
INSERT INTO `admin_operation_log` VALUES (234, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 04:11:32', '2020-04-10 04:11:32');
INSERT INTO `admin_operation_log` VALUES (235, 1, 'admin/user/wallet_record', 'GET', '192.168.117.81', '[]', '2020-04-10 04:11:47', '2020-04-10 04:11:47');
INSERT INTO `admin_operation_log` VALUES (236, 1, 'admin/user/wallet', 'GET', '192.168.117.81', '[]', '2020-04-10 04:11:48', '2020-04-10 04:11:48');
INSERT INTO `admin_operation_log` VALUES (237, 1, 'admin/user/withdraw', 'GET', '192.168.117.81', '[]', '2020-04-10 04:11:49', '2020-04-10 04:11:49');
INSERT INTO `admin_operation_log` VALUES (238, 1, 'admin/user/user', 'GET', '192.168.117.81', '[]', '2020-04-10 04:11:58', '2020-04-10 04:11:58');
INSERT INTO `admin_operation_log` VALUES (239, 1, 'admin', 'GET', '192.168.117.81', '[]', '2020-04-10 04:59:42', '2020-04-10 04:59:42');
INSERT INTO `admin_operation_log` VALUES (240, 1, 'admin/dashboard', 'GET', '192.168.117.81', '[]', '2020-04-10 04:59:43', '2020-04-10 04:59:43');
INSERT INTO `admin_operation_log` VALUES (241, 1, 'admin', 'GET', '192.168.117.81', '[]', '2020-04-10 05:00:07', '2020-04-10 05:00:07');
INSERT INTO `admin_operation_log` VALUES (242, 1, 'admin/dashboard', 'GET', '192.168.117.81', '[]', '2020-04-10 05:00:08', '2020-04-10 05:00:08');
INSERT INTO `admin_operation_log` VALUES (243, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 05:00:11', '2020-04-10 05:00:11');
INSERT INTO `admin_operation_log` VALUES (244, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 05:00:19', '2020-04-10 05:00:19');
INSERT INTO `admin_operation_log` VALUES (245, 1, 'admin/goods/goods/create', 'GET', '192.168.117.81', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-10 05:00:22', '2020-04-10 05:00:22');
INSERT INTO `admin_operation_log` VALUES (246, 1, 'admin/goods/goods/create', 'GET', '192.168.117.81', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-10 05:00:30', '2020-04-10 05:00:30');
INSERT INTO `admin_operation_log` VALUES (247, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 05:01:04', '2020-04-10 05:01:04');
INSERT INTO `admin_operation_log` VALUES (248, 1, 'admin/goods/goods/create', 'GET', '192.168.117.81', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-10 05:01:06', '2020-04-10 05:01:06');
INSERT INTO `admin_operation_log` VALUES (249, 1, 'admin/goods/goods', 'POST', '192.168.117.81', '{\"title\":\"\\u6d4b\\u8bd5\\u5546\\u54c1\",\"img\":\"https:\\/\\/lh3.googleusercontent.com\\/proxy\\/t7sbKUNHaKJNIDy6u2Ba21k8klOo-ueyhgNdexUQ1SatG8wH4bEjf5Qtzz1EbT8pUqRxkZFvWuk-GIYl\",\"price\":\"100\",\"discount\":\"0.8\",\"tags\":\"\\u70ed\\u9500\",\"stock\":\"1000\",\"sku\":null,\"click_count\":\"0\",\"buy_count\":\"0\",\"status\":\"1\",\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods\",\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-10 05:02:24', '2020-04-10 05:02:24');
INSERT INTO `admin_operation_log` VALUES (250, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 05:02:25', '2020-04-10 05:02:25');
INSERT INTO `admin_operation_log` VALUES (251, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 05:02:25', '2020-04-10 05:02:25');
INSERT INTO `admin_operation_log` VALUES (252, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 05:09:25', '2020-04-10 05:09:25');
INSERT INTO `admin_operation_log` VALUES (253, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 05:09:29', '2020-04-10 05:09:29');
INSERT INTO `admin_operation_log` VALUES (254, 1, 'admin/goods/goods_group', 'GET', '192.168.117.81', '[]', '2020-04-10 05:09:35', '2020-04-10 05:09:35');
INSERT INTO `admin_operation_log` VALUES (255, 1, 'admin/goods/goods_group/create', 'GET', '192.168.117.81', '{\"_ifraem_id_\":\"iframe__admin_goods_goods_group\"}', '2020-04-10 05:09:38', '2020-04-10 05:09:38');
INSERT INTO `admin_operation_log` VALUES (256, 1, 'admin/goods/goods_group', 'POST', '192.168.117.81', '{\"goods_id\":\"1\",\"start_date\":\"2020-04-10\",\"end_date\":\"2020-05-10\",\"start_time\":\"10:00:00\",\"end_time\":\"22:00:00\",\"status\":\"1\",\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods_group\",\"_ifraem_id_\":\"iframe__admin_goods_goods_group\"}', '2020-04-10 05:11:14', '2020-04-10 05:11:14');
INSERT INTO `admin_operation_log` VALUES (257, 1, 'admin/goods/goods_group', 'GET', '192.168.117.81', '[]', '2020-04-10 05:11:14', '2020-04-10 05:11:14');
INSERT INTO `admin_operation_log` VALUES (258, 1, 'admin/goods/goods_group', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 05:13:22', '2020-04-10 05:13:22');
INSERT INTO `admin_operation_log` VALUES (259, 1, 'admin', 'GET', '192.168.117.81', '[]', '2020-04-10 05:16:41', '2020-04-10 05:16:41');
INSERT INTO `admin_operation_log` VALUES (260, 1, 'admin/dashboard', 'GET', '192.168.117.81', '[]', '2020-04-10 05:16:41', '2020-04-10 05:16:41');
INSERT INTO `admin_operation_log` VALUES (261, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 05:16:45', '2020-04-10 05:16:45');
INSERT INTO `admin_operation_log` VALUES (262, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 05:17:01', '2020-04-10 05:17:01');
INSERT INTO `admin_operation_log` VALUES (263, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 05:17:05', '2020-04-10 05:17:05');
INSERT INTO `admin_operation_log` VALUES (264, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 05:19:00', '2020-04-10 05:19:00');
INSERT INTO `admin_operation_log` VALUES (265, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 05:19:14', '2020-04-10 05:19:14');
INSERT INTO `admin_operation_log` VALUES (266, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 05:19:29', '2020-04-10 05:19:29');
INSERT INTO `admin_operation_log` VALUES (267, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 05:19:45', '2020-04-10 05:19:45');
INSERT INTO `admin_operation_log` VALUES (268, 1, 'admin', 'GET', '192.168.117.81', '[]', '2020-04-10 05:20:56', '2020-04-10 05:20:56');
INSERT INTO `admin_operation_log` VALUES (269, 1, 'admin/dashboard', 'GET', '192.168.117.81', '[]', '2020-04-10 05:20:57', '2020-04-10 05:20:57');
INSERT INTO `admin_operation_log` VALUES (270, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 05:21:02', '2020-04-10 05:21:02');
INSERT INTO `admin_operation_log` VALUES (271, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 05:21:11', '2020-04-10 05:21:11');
INSERT INTO `admin_operation_log` VALUES (272, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 05:21:14', '2020-04-10 05:21:14');
INSERT INTO `admin_operation_log` VALUES (273, 1, 'admin/goods/goods/1/edit', 'GET', '192.168.117.81', '[]', '2020-04-10 05:21:51', '2020-04-10 05:21:51');
INSERT INTO `admin_operation_log` VALUES (274, 1, 'admin/goods/goods/1', 'GET', '192.168.117.81', '[]', '2020-04-10 05:21:55', '2020-04-10 05:21:55');
INSERT INTO `admin_operation_log` VALUES (275, 1, 'admin', 'GET', '192.168.117.81', '[]', '2020-04-10 05:22:37', '2020-04-10 05:22:37');
INSERT INTO `admin_operation_log` VALUES (276, 1, 'admin/dashboard', 'GET', '192.168.117.81', '[]', '2020-04-10 05:22:37', '2020-04-10 05:22:37');
INSERT INTO `admin_operation_log` VALUES (277, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 05:22:40', '2020-04-10 05:22:40');
INSERT INTO `admin_operation_log` VALUES (278, 1, 'admin/goods/goods/1/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 05:22:45', '2020-04-10 05:22:45');
INSERT INTO `admin_operation_log` VALUES (279, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 05:22:50', '2020-04-10 05:22:50');
INSERT INTO `admin_operation_log` VALUES (280, 1, 'admin/goods/goods_group', 'GET', '192.168.117.81', '[]', '2020-04-10 05:22:56', '2020-04-10 05:22:56');
INSERT INTO `admin_operation_log` VALUES (281, 1, 'admin/goods/goods_group', 'GET', '192.168.117.81', '[]', '2020-04-10 05:22:59', '2020-04-10 05:22:59');
INSERT INTO `admin_operation_log` VALUES (282, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 05:23:19', '2020-04-10 05:23:19');
INSERT INTO `admin_operation_log` VALUES (283, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 05:27:16', '2020-04-10 05:27:16');
INSERT INTO `admin_operation_log` VALUES (284, 1, 'admin', 'GET', '192.168.117.81', '[]', '2020-04-10 05:27:57', '2020-04-10 05:27:57');
INSERT INTO `admin_operation_log` VALUES (285, 1, 'admin/dashboard', 'GET', '192.168.117.81', '[]', '2020-04-10 05:27:57', '2020-04-10 05:27:57');
INSERT INTO `admin_operation_log` VALUES (286, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 05:28:04', '2020-04-10 05:28:04');
INSERT INTO `admin_operation_log` VALUES (287, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 05:34:25', '2020-04-10 05:34:25');
INSERT INTO `admin_operation_log` VALUES (288, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 05:35:44', '2020-04-10 05:35:44');
INSERT INTO `admin_operation_log` VALUES (289, 1, 'admin', 'GET', '192.168.117.81', '[]', '2020-04-10 05:35:51', '2020-04-10 05:35:51');
INSERT INTO `admin_operation_log` VALUES (290, 1, 'admin/dashboard', 'GET', '192.168.117.81', '[]', '2020-04-10 05:35:51', '2020-04-10 05:35:51');
INSERT INTO `admin_operation_log` VALUES (291, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 05:35:54', '2020-04-10 05:35:54');
INSERT INTO `admin_operation_log` VALUES (292, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 05:36:46', '2020-04-10 05:36:46');
INSERT INTO `admin_operation_log` VALUES (293, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 05:36:55', '2020-04-10 05:36:55');
INSERT INTO `admin_operation_log` VALUES (294, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 05:37:29', '2020-04-10 05:37:29');
INSERT INTO `admin_operation_log` VALUES (295, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 05:38:56', '2020-04-10 05:38:56');
INSERT INTO `admin_operation_log` VALUES (296, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 05:39:14', '2020-04-10 05:39:14');
INSERT INTO `admin_operation_log` VALUES (297, 1, 'admin/goods/goods/1', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 05:40:16', '2020-04-10 05:40:16');
INSERT INTO `admin_operation_log` VALUES (298, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 05:40:23', '2020-04-10 05:40:23');
INSERT INTO `admin_operation_log` VALUES (299, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 05:40:43', '2020-04-10 05:40:43');
INSERT INTO `admin_operation_log` VALUES (300, 1, 'admin', 'GET', '192.168.117.81', '[]', '2020-04-10 05:43:52', '2020-04-10 05:43:52');
INSERT INTO `admin_operation_log` VALUES (301, 1, 'admin/dashboard', 'GET', '192.168.117.81', '[]', '2020-04-10 05:43:53', '2020-04-10 05:43:53');
INSERT INTO `admin_operation_log` VALUES (302, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 05:45:45', '2020-04-10 05:45:45');
INSERT INTO `admin_operation_log` VALUES (303, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 05:45:48', '2020-04-10 05:45:48');
INSERT INTO `admin_operation_log` VALUES (304, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 05:46:33', '2020-04-10 05:46:33');
INSERT INTO `admin_operation_log` VALUES (305, 1, 'admin/helpers/scaffold', 'GET', '192.168.117.81', '[]', '2020-04-10 05:51:16', '2020-04-10 05:51:16');
INSERT INTO `admin_operation_log` VALUES (306, 1, 'admin/goods/goods/1/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 05:58:49', '2020-04-10 05:58:49');
INSERT INTO `admin_operation_log` VALUES (307, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 06:01:54', '2020-04-10 06:01:54');
INSERT INTO `admin_operation_log` VALUES (308, 1, 'admin/goods/goods/1/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 06:01:58', '2020-04-10 06:01:58');
INSERT INTO `admin_operation_log` VALUES (309, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 06:02:08', '2020-04-10 06:02:08');
INSERT INTO `admin_operation_log` VALUES (310, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 06:02:10', '2020-04-10 06:02:10');
INSERT INTO `admin_operation_log` VALUES (311, 1, 'admin/goods/goods/1/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 06:03:06', '2020-04-10 06:03:06');
INSERT INTO `admin_operation_log` VALUES (312, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 06:03:10', '2020-04-10 06:03:10');
INSERT INTO `admin_operation_log` VALUES (313, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 06:03:16', '2020-04-10 06:03:16');
INSERT INTO `admin_operation_log` VALUES (314, 1, 'admin/goods/goods/1', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 06:03:18', '2020-04-10 06:03:18');
INSERT INTO `admin_operation_log` VALUES (315, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 06:03:29', '2020-04-10 06:03:29');
INSERT INTO `admin_operation_log` VALUES (316, 1, 'admin/goods/goods_search', 'GET', '192.168.117.81', '[]', '2020-04-10 06:03:35', '2020-04-10 06:03:35');
INSERT INTO `admin_operation_log` VALUES (317, 1, 'admin/goods/goods_group', 'GET', '192.168.117.81', '[]', '2020-04-10 06:03:38', '2020-04-10 06:03:38');
INSERT INTO `admin_operation_log` VALUES (318, 1, 'admin/goods/goods_search', 'GET', '192.168.117.81', '[]', '2020-04-10 06:03:42', '2020-04-10 06:03:42');
INSERT INTO `admin_operation_log` VALUES (319, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 06:07:18', '2020-04-10 06:07:18');
INSERT INTO `admin_operation_log` VALUES (320, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 06:07:21', '2020-04-10 06:07:21');
INSERT INTO `admin_operation_log` VALUES (321, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 06:07:46', '2020-04-10 06:07:46');
INSERT INTO `admin_operation_log` VALUES (322, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 06:08:00', '2020-04-10 06:08:00');
INSERT INTO `admin_operation_log` VALUES (323, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 06:09:40', '2020-04-10 06:09:40');
INSERT INTO `admin_operation_log` VALUES (324, 1, 'admin/goods/goods/1/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 06:09:43', '2020-04-10 06:09:43');
INSERT INTO `admin_operation_log` VALUES (325, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 06:09:48', '2020-04-10 06:09:48');
INSERT INTO `admin_operation_log` VALUES (326, 1, 'admin/goods/goods_search', 'GET', '192.168.117.81', '[]', '2020-04-10 06:10:12', '2020-04-10 06:10:12');
INSERT INTO `admin_operation_log` VALUES (327, 1, 'admin/goods/goods_search', 'GET', '192.168.117.81', '[]', '2020-04-10 06:10:17', '2020-04-10 06:10:17');
INSERT INTO `admin_operation_log` VALUES (328, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 06:10:18', '2020-04-10 06:10:18');
INSERT INTO `admin_operation_log` VALUES (329, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 06:10:21', '2020-04-10 06:10:21');
INSERT INTO `admin_operation_log` VALUES (330, 1, 'admin/goods/goods_search', 'GET', '192.168.117.81', '[]', '2020-04-10 06:10:23', '2020-04-10 06:10:23');
INSERT INTO `admin_operation_log` VALUES (331, 1, 'admin/goods/goods_group', 'GET', '192.168.117.81', '[]', '2020-04-10 06:10:26', '2020-04-10 06:10:26');
INSERT INTO `admin_operation_log` VALUES (332, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 06:10:34', '2020-04-10 06:10:34');
INSERT INTO `admin_operation_log` VALUES (333, 1, 'admin/auth/users', 'GET', '192.168.117.81', '[]', '2020-04-10 06:12:10', '2020-04-10 06:12:10');
INSERT INTO `admin_operation_log` VALUES (334, 1, 'admin/order/order', 'GET', '192.168.117.81', '[]', '2020-04-10 06:12:13', '2020-04-10 06:12:13');
INSERT INTO `admin_operation_log` VALUES (335, 1, 'admin/user/user', 'GET', '192.168.117.81', '[]', '2020-04-10 06:12:17', '2020-04-10 06:12:17');
INSERT INTO `admin_operation_log` VALUES (336, 1, 'admin/user/user/create', 'GET', '192.168.117.81', '{\"_ifraem_id_\":\"iframe__admin_user_user\"}', '2020-04-10 06:12:47', '2020-04-10 06:12:47');
INSERT INTO `admin_operation_log` VALUES (337, 1, 'admin/user/user', 'POST', '192.168.117.81', '{\"openid\":\"11111111111111111\",\"unionid\":\"22222222222222222\",\"parent_id\":\"0\",\"nickname\":\"\\u6d4b\\u8bd5\\u7528\\u6237001\",\"avatarurl\":\"https:\\/\\/lh3.googleusercontent.com\\/proxy\\/FBdbSrYzLU8i7XcZqyF5IT75IT2v3vjodtnemqSziV0Z2e836gZmzAnJOked0bLtyyYbtA9_eBof6TvUkgDv4gr_TXe8rmtBeXXkgHLRBethf5wp\",\"gender\":\"1\",\"phone\":\"11111111111\",\"last_login_time\":null,\"status\":\"1\",\"qr_code\":null,\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/user\\/user\",\"_ifraem_id_\":\"iframe__admin_user_user\"}', '2020-04-10 06:13:27', '2020-04-10 06:13:27');
INSERT INTO `admin_operation_log` VALUES (338, 1, 'admin/user/user/create', 'GET', '192.168.117.81', '{\"_ifraem_id_\":\"iframe__admin_user_user\"}', '2020-04-10 06:13:27', '2020-04-10 06:13:27');
INSERT INTO `admin_operation_log` VALUES (339, 1, 'admin/user/user', 'POST', '192.168.117.81', '{\"openid\":\"11111111111111111\",\"unionid\":\"22222222222222222\",\"parent_id\":\"0\",\"nickname\":\"\\u6d4b\\u8bd5\\u7528\\u6237001\",\"avatarurl\":\"https:\\/\\/lh3.googleusercontent.com\\/proxy\\/FBdbSrYzLU8i7XcZqyF5IT75IT2v3vjodtnemqSziV0Z2e836gZmzAnJOked0bLtyyYbtA9_eBof6TvUkgDv4gr_TXe8rmtBeXXkgHLRBethf5wp\",\"gender\":\"1\",\"phone\":\"11111111111\",\"last_login_time\":\"1\",\"status\":\"1\",\"qr_code\":\"1\",\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/user\\/user\\/create?_ifraem_id_=iframe__admin_user_user\",\"_ifraem_id_\":\"iframe__admin_user_user\"}', '2020-04-10 06:13:32', '2020-04-10 06:13:32');
INSERT INTO `admin_operation_log` VALUES (340, 1, 'admin/user/user/create', 'GET', '192.168.117.81', '{\"_ifraem_id_\":\"iframe__admin_user_user\"}', '2020-04-10 06:13:33', '2020-04-10 06:13:33');
INSERT INTO `admin_operation_log` VALUES (341, 1, 'admin/user/user', 'POST', '192.168.117.81', '{\"openid\":\"11111111111111111\",\"unionid\":\"22222222222222222\",\"parent_id\":\"0\",\"nickname\":\"\\u6d4b\\u8bd5\\u7528\\u6237001\",\"avatarurl\":\"https:\\/\\/lh3.googleusercontent.com\\/proxy\\/FBdbSrYzLU8i7XcZqyF5IT75IT2v3vjodtnemqSziV0Z2e836gZmzAnJOked0bLtyyYbtA9_eBof6TvUkgDv4gr_TXe8rmtBeXXkgHLRBethf5wp\",\"gender\":\"1\",\"phone\":\"11111111111\",\"last_login_time\":null,\"status\":\"1\",\"qr_code\":null,\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/user\\/user\\/create?_ifraem_id_=iframe__admin_user_user\",\"_ifraem_id_\":\"iframe__admin_user_user\"}', '2020-04-10 06:14:22', '2020-04-10 06:14:22');
INSERT INTO `admin_operation_log` VALUES (342, 1, 'admin/user/user/create', 'GET', '192.168.117.81', '{\"_ifraem_id_\":\"iframe__admin_user_user\"}', '2020-04-10 06:14:22', '2020-04-10 06:14:22');
INSERT INTO `admin_operation_log` VALUES (343, 1, 'admin/user/user', 'POST', '192.168.117.81', '{\"openid\":\"11111111111111111\",\"unionid\":\"22222222222222222\",\"parent_id\":\"0\",\"nickname\":\"\\u6d4b\\u8bd5\\u7528\\u6237001\",\"avatarurl\":\"https:\\/\\/lh3.googleusercontent.com\\/proxy\\/FBdbSrYzLU8i7XcZqyF5IT75IT2v3vjodtnemqSziV0Z2e836gZmzAnJOked0bLtyyYbtA9_eBof6TvUkgDv4gr_TXe8rmtBeXXkgHLRBethf5wp\",\"gender\":\"1\",\"phone\":\"11111111111\",\"last_login_time\":null,\"status\":\"1\",\"qr_code\":null,\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/user\\/user\\/create?_ifraem_id_=iframe__admin_user_user\",\"_ifraem_id_\":\"iframe__admin_user_user\"}', '2020-04-10 06:14:34', '2020-04-10 06:14:34');
INSERT INTO `admin_operation_log` VALUES (344, 1, 'admin/user/user/create', 'GET', '192.168.117.81', '{\"_ifraem_id_\":\"iframe__admin_user_user\"}', '2020-04-10 06:14:35', '2020-04-10 06:14:35');
INSERT INTO `admin_operation_log` VALUES (345, 1, 'admin/user/user', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 06:16:42', '2020-04-10 06:16:42');
INSERT INTO `admin_operation_log` VALUES (346, 1, 'admin/user/wallet', 'GET', '192.168.117.81', '[]', '2020-04-10 06:25:22', '2020-04-10 06:25:22');
INSERT INTO `admin_operation_log` VALUES (347, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 06:25:25', '2020-04-10 06:25:25');
INSERT INTO `admin_operation_log` VALUES (348, 1, 'admin/goods/goods/1/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 06:25:29', '2020-04-10 06:25:29');
INSERT INTO `admin_operation_log` VALUES (349, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 06:25:50', '2020-04-10 06:25:50');
INSERT INTO `admin_operation_log` VALUES (350, 1, 'admin/goods/goods/create', 'GET', '192.168.117.81', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-10 06:25:52', '2020-04-10 06:25:52');
INSERT INTO `admin_operation_log` VALUES (351, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 06:26:14', '2020-04-10 06:26:14');
INSERT INTO `admin_operation_log` VALUES (352, 1, 'admin/goods/goods/1/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 06:26:17', '2020-04-10 06:26:17');
INSERT INTO `admin_operation_log` VALUES (353, 1, 'admin/goods/goods/create', 'GET', '192.168.117.81', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-10 06:26:18', '2020-04-10 06:26:18');
INSERT INTO `admin_operation_log` VALUES (354, 1, 'admin/goods/goods_search', 'GET', '192.168.117.81', '[]', '2020-04-10 06:26:46', '2020-04-10 06:26:46');
INSERT INTO `admin_operation_log` VALUES (355, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 06:26:47', '2020-04-10 06:26:47');
INSERT INTO `admin_operation_log` VALUES (356, 1, 'admin/goods/goods/create', 'GET', '192.168.117.81', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-10 06:26:54', '2020-04-10 06:26:54');
INSERT INTO `admin_operation_log` VALUES (357, 1, 'admin/goods/goods', 'POST', '192.168.117.81', '{\"title\":\"\\u6d4b\\u8bd5\\u5546\\u54c1\\u4e8c\",\"img\":\"https:\\/\\/lh3.googleusercontent.com\\/proxy\\/h3LsSOcQQ-FA03Hvm4L-UgTfbj4B13SD42O3OiLCng8p-wCvJSWABN3cH2klgjTQ-nQqrfH4IEN21bALVOBD1MNCSiXeMnPEdU7kmJtFjnh_WfdgjjC_mA6sX1vpzKoDpQU\",\"price\":\"60\",\"discount\":\"0.91\",\"tags\":null,\"stock\":\"0\",\"details\":\"https:\\/\\/lh3.googleusercontent.com\\/proxy\\/h3LsSOcQQ-FA03Hvm4L-UgTfbj4B13SD42O3OiLCng8p-wCvJSWABN3cH2klgjTQ-nQqrfH4IEN21bALVOBD1MNCSiXeMnPEdU7kmJtFjnh_WfdgjjC_mA6sX1vpzKoDpQU\",\"category_id\":\"1\",\"click_count\":\"0\",\"buy_count\":\"0\",\"status\":\"0\",\"_token\":\"dUwHYb9LhJQxDl9CIsyfD5h91IeXnFjR21gpsfnO\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods\",\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-10 06:28:05', '2020-04-10 06:28:05');
INSERT INTO `admin_operation_log` VALUES (358, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 06:28:05', '2020-04-10 06:28:05');
INSERT INTO `admin_operation_log` VALUES (359, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 06:28:06', '2020-04-10 06:28:06');
INSERT INTO `admin_operation_log` VALUES (360, 1, 'admin/goods/goods/2/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 06:28:13', '2020-04-10 06:28:13');
INSERT INTO `admin_operation_log` VALUES (361, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 06:29:25', '2020-04-10 06:29:25');
INSERT INTO `admin_operation_log` VALUES (362, 1, 'admin/goods/goods/create', 'GET', '192.168.117.81', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-10 06:29:27', '2020-04-10 06:29:27');
INSERT INTO `admin_operation_log` VALUES (363, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 06:30:41', '2020-04-10 06:30:41');
INSERT INTO `admin_operation_log` VALUES (364, 1, 'admin/goods/goods/create', 'GET', '192.168.117.81', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-10 06:30:43', '2020-04-10 06:30:43');
INSERT INTO `admin_operation_log` VALUES (365, 1, 'admin/goods/goods/create', 'GET', '192.168.117.81', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-10 06:31:31', '2020-04-10 06:31:31');
INSERT INTO `admin_operation_log` VALUES (366, 1, 'admin/goods/goods/create', 'GET', '192.168.117.81', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-10 06:32:12', '2020-04-10 06:32:12');
INSERT INTO `admin_operation_log` VALUES (367, 1, 'admin/goods/goods/create', 'GET', '192.168.117.81', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-10 06:35:55', '2020-04-10 06:35:55');
INSERT INTO `admin_operation_log` VALUES (368, 1, 'admin/goods/goods/create', 'GET', '192.168.117.81', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-10 06:36:09', '2020-04-10 06:36:09');
INSERT INTO `admin_operation_log` VALUES (369, 1, 'admin/goods/goods/create', 'GET', '192.168.117.81', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-10 06:36:12', '2020-04-10 06:36:12');
INSERT INTO `admin_operation_log` VALUES (370, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 06:37:12', '2020-04-10 06:37:12');
INSERT INTO `admin_operation_log` VALUES (371, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 06:37:15', '2020-04-10 06:37:15');
INSERT INTO `admin_operation_log` VALUES (372, 1, 'admin/goods/goods/create', 'GET', '192.168.117.81', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-10 06:37:17', '2020-04-10 06:37:17');
INSERT INTO `admin_operation_log` VALUES (373, 1, 'admin/goods/goods/create', 'GET', '192.168.117.81', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-10 06:38:22', '2020-04-10 06:38:22');
INSERT INTO `admin_operation_log` VALUES (374, 1, 'admin/goods/goods/1/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 06:38:29', '2020-04-10 06:38:29');
INSERT INTO `admin_operation_log` VALUES (375, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 06:38:45', '2020-04-10 06:38:45');
INSERT INTO `admin_operation_log` VALUES (376, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 06:39:44', '2020-04-10 06:39:44');
INSERT INTO `admin_operation_log` VALUES (377, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 06:40:11', '2020-04-10 06:40:11');
INSERT INTO `admin_operation_log` VALUES (378, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 06:41:03', '2020-04-10 06:41:03');
INSERT INTO `admin_operation_log` VALUES (379, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 06:42:35', '2020-04-10 06:42:35');
INSERT INTO `admin_operation_log` VALUES (380, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '{\"id\":null,\"title\":null,\"tags\":null,\"category_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-04-10 06:42:40', '2020-04-10 06:42:40');
INSERT INTO `admin_operation_log` VALUES (381, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\",\"id\":null,\"title\":null,\"tags\":null,\"category_id\":\"0\"}', '2020-04-10 06:42:43', '2020-04-10 06:42:43');
INSERT INTO `admin_operation_log` VALUES (382, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 06:42:45', '2020-04-10 06:42:45');
INSERT INTO `admin_operation_log` VALUES (383, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 06:42:52', '2020-04-10 06:42:52');
INSERT INTO `admin_operation_log` VALUES (384, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 06:43:19', '2020-04-10 06:43:19');
INSERT INTO `admin_operation_log` VALUES (385, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 06:46:11', '2020-04-10 06:46:11');
INSERT INTO `admin_operation_log` VALUES (386, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 06:46:40', '2020-04-10 06:46:40');
INSERT INTO `admin_operation_log` VALUES (387, 1, 'admin/goods/goods_search', 'GET', '192.168.117.81', '[]', '2020-04-10 06:46:52', '2020-04-10 06:46:52');
INSERT INTO `admin_operation_log` VALUES (388, 1, 'admin/goods/goods_group', 'GET', '192.168.117.81', '[]', '2020-04-10 06:46:56', '2020-04-10 06:46:56');
INSERT INTO `admin_operation_log` VALUES (389, 1, 'admin/goods/goods_group/create', 'GET', '192.168.117.81', '{\"_ifraem_id_\":\"iframe__admin_goods_goods_group\"}', '2020-04-10 06:47:12', '2020-04-10 06:47:12');
INSERT INTO `admin_operation_log` VALUES (390, 1, 'admin/goods/goods_group/1/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 06:47:17', '2020-04-10 06:47:17');
INSERT INTO `admin_operation_log` VALUES (391, 1, 'admin/goods/goods_group', 'GET', '192.168.117.81', '[]', '2020-04-10 06:47:21', '2020-04-10 06:47:21');
INSERT INTO `admin_operation_log` VALUES (392, 1, 'admin/goods/goods_group/create', 'GET', '192.168.117.81', '{\"_ifraem_id_\":\"iframe__admin_goods_goods_group\"}', '2020-04-10 06:47:23', '2020-04-10 06:47:23');
INSERT INTO `admin_operation_log` VALUES (393, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 06:50:04', '2020-04-10 06:50:04');
INSERT INTO `admin_operation_log` VALUES (394, 1, 'admin/goods/goods/create', 'GET', '192.168.117.81', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-10 06:50:06', '2020-04-10 06:50:06');
INSERT INTO `admin_operation_log` VALUES (395, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 06:50:39', '2020-04-10 06:50:39');
INSERT INTO `admin_operation_log` VALUES (396, 1, 'admin/goods/goods/create', 'GET', '192.168.117.81', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-10 06:50:40', '2020-04-10 06:50:40');
INSERT INTO `admin_operation_log` VALUES (397, 1, 'admin/goods/goods/create', 'GET', '192.168.117.81', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-10 06:50:44', '2020-04-10 06:50:44');
INSERT INTO `admin_operation_log` VALUES (398, 1, 'admin/goods/goods/create', 'GET', '192.168.117.81', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-10 06:51:18', '2020-04-10 06:51:18');
INSERT INTO `admin_operation_log` VALUES (399, 1, 'admin/goods/goods/1/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 06:52:01', '2020-04-10 06:52:01');
INSERT INTO `admin_operation_log` VALUES (400, 1, 'admin/goods/goods/1/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 06:52:04', '2020-04-10 06:52:04');
INSERT INTO `admin_operation_log` VALUES (401, 1, 'admin/goods/goods/2/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 06:52:07', '2020-04-10 06:52:07');
INSERT INTO `admin_operation_log` VALUES (402, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 06:52:12', '2020-04-10 06:52:12');
INSERT INTO `admin_operation_log` VALUES (403, 1, 'admin/goods/goods/1/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 06:52:16', '2020-04-10 06:52:16');
INSERT INTO `admin_operation_log` VALUES (404, 1, 'admin/goods/goods_group', 'GET', '192.168.117.81', '[]', '2020-04-10 06:54:15', '2020-04-10 06:54:15');
INSERT INTO `admin_operation_log` VALUES (405, 1, 'admin/goods/goods_group/create', 'GET', '192.168.117.81', '{\"_ifraem_id_\":\"iframe__admin_goods_goods_group\"}', '2020-04-10 06:54:16', '2020-04-10 06:54:16');
INSERT INTO `admin_operation_log` VALUES (406, 1, 'admin/goods/goods_group/create', 'GET', '192.168.117.81', '{\"_ifraem_id_\":\"iframe__admin_goods_goods_group\"}', '2020-04-10 06:55:10', '2020-04-10 06:55:10');
INSERT INTO `admin_operation_log` VALUES (407, 1, 'admin/goods/goods_group/create', 'GET', '192.168.117.81', '{\"_ifraem_id_\":\"iframe__admin_goods_goods_group\"}', '2020-04-10 06:55:30', '2020-04-10 06:55:30');
INSERT INTO `admin_operation_log` VALUES (408, 1, 'admin/goods/goods_group/create', 'GET', '192.168.117.81', '{\"_ifraem_id_\":\"iframe__admin_goods_goods_group\"}', '2020-04-10 06:58:53', '2020-04-10 06:58:53');
INSERT INTO `admin_operation_log` VALUES (409, 1, 'admin/goods/goods_group/create', 'GET', '192.168.117.81', '{\"_ifraem_id_\":\"iframe__admin_goods_goods_group\"}', '2020-04-10 06:59:07', '2020-04-10 06:59:07');
INSERT INTO `admin_operation_log` VALUES (410, 1, 'admin/goods/goods_group/create', 'GET', '192.168.117.81', '{\"_ifraem_id_\":\"iframe__admin_goods_goods_group\"}', '2020-04-10 07:01:28', '2020-04-10 07:01:28');
INSERT INTO `admin_operation_log` VALUES (411, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '{\"category_id\":\"1?\"}', '2020-04-10 07:01:28', '2020-04-10 07:01:28');
INSERT INTO `admin_operation_log` VALUES (412, 1, 'admin/goods/goods_group/create', 'GET', '192.168.117.81', '{\"_ifraem_id_\":\"iframe__admin_goods_goods_group\"}', '2020-04-10 07:01:57', '2020-04-10 07:01:57');
INSERT INTO `admin_operation_log` VALUES (413, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '{\"category_id\":\"1?\"}', '2020-04-10 07:01:58', '2020-04-10 07:01:58');
INSERT INTO `admin_operation_log` VALUES (414, 1, 'admin/goods/goods_group/create', 'GET', '192.168.117.81', '{\"_ifraem_id_\":\"iframe__admin_goods_goods_group\"}', '2020-04-10 07:02:28', '2020-04-10 07:02:28');
INSERT INTO `admin_operation_log` VALUES (415, 1, 'admin/goods/goods_group/create', 'GET', '192.168.117.81', '{\"_ifraem_id_\":\"iframe__admin_goods_goods_group\"}', '2020-04-10 07:03:32', '2020-04-10 07:03:32');
INSERT INTO `admin_operation_log` VALUES (416, 1, 'admin/goods/goods_group/create', 'GET', '192.168.117.81', '{\"_ifraem_id_\":\"iframe__admin_goods_goods_group\"}', '2020-04-10 07:03:49', '2020-04-10 07:03:49');
INSERT INTO `admin_operation_log` VALUES (417, 1, 'admin/goods/goods_group/1/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 07:04:01', '2020-04-10 07:04:01');
INSERT INTO `admin_operation_log` VALUES (418, 1, 'admin/goods/goods_group/1', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 07:04:08', '2020-04-10 07:04:08');
INSERT INTO `admin_operation_log` VALUES (419, 1, 'admin/goods/goods_group', 'GET', '192.168.117.81', '[]', '2020-04-10 07:04:13', '2020-04-10 07:04:13');
INSERT INTO `admin_operation_log` VALUES (420, 1, 'admin/goods/goods_group', 'GET', '192.168.117.81', '[]', '2020-04-10 07:04:16', '2020-04-10 07:04:16');
INSERT INTO `admin_operation_log` VALUES (421, 1, 'admin/goods/goods_group/create', 'GET', '192.168.117.81', '{\"_ifraem_id_\":\"iframe__admin_goods_goods_group\"}', '2020-04-10 07:04:20', '2020-04-10 07:04:20');
INSERT INTO `admin_operation_log` VALUES (422, 1, 'admin/goods/goods_group', 'GET', '192.168.117.81', '[]', '2020-04-10 07:05:05', '2020-04-10 07:05:05');
INSERT INTO `admin_operation_log` VALUES (423, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 07:06:20', '2020-04-10 07:06:20');
INSERT INTO `admin_operation_log` VALUES (424, 1, 'admin/goods/goods/1', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 07:06:24', '2020-04-10 07:06:24');
INSERT INTO `admin_operation_log` VALUES (425, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 07:06:25', '2020-04-10 07:06:25');
INSERT INTO `admin_operation_log` VALUES (426, 1, 'admin/goods/goods_search', 'GET', '192.168.117.81', '[]', '2020-04-10 07:06:34', '2020-04-10 07:06:34');
INSERT INTO `admin_operation_log` VALUES (427, 1, 'admin/goods/goods_group/1', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 07:06:37', '2020-04-10 07:06:37');
INSERT INTO `admin_operation_log` VALUES (428, 1, 'admin/goods/goods_group', 'GET', '192.168.117.81', '[]', '2020-04-10 07:06:38', '2020-04-10 07:06:38');
INSERT INTO `admin_operation_log` VALUES (429, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 07:06:51', '2020-04-10 07:06:51');
INSERT INTO `admin_operation_log` VALUES (430, 1, 'admin/goods/goods/2', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 07:06:55', '2020-04-10 07:06:55');
INSERT INTO `admin_operation_log` VALUES (431, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 07:06:56', '2020-04-10 07:06:56');
INSERT INTO `admin_operation_log` VALUES (432, 1, 'admin/goods/goods_group', 'GET', '192.168.117.81', '[]', '2020-04-10 07:09:49', '2020-04-10 07:09:49');
INSERT INTO `admin_operation_log` VALUES (433, 1, 'admin/goods/goods_group', 'GET', '192.168.117.81', '[]', '2020-04-10 07:09:52', '2020-04-10 07:09:52');
INSERT INTO `admin_operation_log` VALUES (434, 1, 'admin/goods/goods_group', 'GET', '192.168.117.81', '[]', '2020-04-10 07:10:07', '2020-04-10 07:10:07');
INSERT INTO `admin_operation_log` VALUES (435, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 07:11:31', '2020-04-10 07:11:31');
INSERT INTO `admin_operation_log` VALUES (436, 1, 'admin/goods/goods_group', 'GET', '192.168.117.81', '[]', '2020-04-10 07:11:32', '2020-04-10 07:11:32');
INSERT INTO `admin_operation_log` VALUES (437, 1, 'admin/goods/goods_group', 'GET', '192.168.117.81', '[]', '2020-04-10 07:11:42', '2020-04-10 07:11:42');
INSERT INTO `admin_operation_log` VALUES (438, 1, 'admin/goods/goods_group', 'GET', '192.168.117.81', '[]', '2020-04-10 07:13:01', '2020-04-10 07:13:01');
INSERT INTO `admin_operation_log` VALUES (439, 1, 'admin/goods/goods_search', 'GET', '192.168.117.81', '[]', '2020-04-10 07:13:04', '2020-04-10 07:13:04');
INSERT INTO `admin_operation_log` VALUES (440, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 07:13:07', '2020-04-10 07:13:07');
INSERT INTO `admin_operation_log` VALUES (441, 1, 'admin/goods/goods_search', 'GET', '192.168.117.81', '[]', '2020-04-10 07:13:11', '2020-04-10 07:13:11');
INSERT INTO `admin_operation_log` VALUES (442, 1, 'admin/goods/goods_group', 'GET', '192.168.117.81', '[]', '2020-04-10 07:13:14', '2020-04-10 07:13:14');
INSERT INTO `admin_operation_log` VALUES (443, 1, 'admin/goods/goods_search', 'GET', '192.168.117.81', '[]', '2020-04-10 07:13:25', '2020-04-10 07:13:25');
INSERT INTO `admin_operation_log` VALUES (444, 1, 'admin/goods/goods_search', 'GET', '192.168.117.81', '[]', '2020-04-10 07:13:29', '2020-04-10 07:13:29');
INSERT INTO `admin_operation_log` VALUES (445, 1, 'admin/goods/goods_group', 'GET', '192.168.117.81', '[]', '2020-04-10 07:13:33', '2020-04-10 07:13:33');
INSERT INTO `admin_operation_log` VALUES (446, 1, 'admin/goods/goods_group/create', 'GET', '192.168.117.81', '{\"_ifraem_id_\":\"iframe__admin_goods_goods_group\"}', '2020-04-10 07:13:35', '2020-04-10 07:13:35');
INSERT INTO `admin_operation_log` VALUES (447, 1, 'admin/goods/goods_group/1/edit', 'GET', '192.168.117.81', '{\"_pjax\":\"#pjax-container\"}', '2020-04-10 07:13:40', '2020-04-10 07:13:40');
INSERT INTO `admin_operation_log` VALUES (448, 1, 'admin/user/user', 'GET', '192.168.117.81', '[]', '2020-04-10 07:13:50', '2020-04-10 07:13:50');
INSERT INTO `admin_operation_log` VALUES (449, 1, 'admin/user/user', 'GET', '192.168.117.81', '[]', '2020-04-10 07:15:13', '2020-04-10 07:15:13');
INSERT INTO `admin_operation_log` VALUES (450, 1, 'admin/user/user', 'GET', '192.168.117.81', '[]', '2020-04-10 07:15:43', '2020-04-10 07:15:43');
INSERT INTO `admin_operation_log` VALUES (451, 1, 'admin/user/user', 'GET', '192.168.117.81', '[]', '2020-04-10 07:15:48', '2020-04-10 07:15:48');
INSERT INTO `admin_operation_log` VALUES (452, 1, 'admin/user/user', 'GET', '192.168.117.81', '[]', '2020-04-10 07:16:17', '2020-04-10 07:16:17');
INSERT INTO `admin_operation_log` VALUES (453, 1, 'admin/user/user', 'GET', '192.168.117.81', '[]', '2020-04-10 07:17:56', '2020-04-10 07:17:56');
INSERT INTO `admin_operation_log` VALUES (454, 1, 'admin/user/wallet', 'GET', '192.168.117.81', '[]', '2020-04-10 07:18:58', '2020-04-10 07:18:58');
INSERT INTO `admin_operation_log` VALUES (455, 1, 'admin/user/address', 'GET', '192.168.117.81', '[]', '2020-04-10 07:19:22', '2020-04-10 07:19:22');
INSERT INTO `admin_operation_log` VALUES (456, 1, 'admin/user/withdraw', 'GET', '192.168.117.81', '[]', '2020-04-10 07:19:23', '2020-04-10 07:19:23');
INSERT INTO `admin_operation_log` VALUES (457, 1, 'admin/user/user', 'GET', '192.168.117.81', '[]', '2020-04-10 07:19:28', '2020-04-10 07:19:28');
INSERT INTO `admin_operation_log` VALUES (458, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 07:19:32', '2020-04-10 07:19:32');
INSERT INTO `admin_operation_log` VALUES (459, 1, 'admin/goods/goods_search', 'GET', '192.168.117.81', '[]', '2020-04-10 07:19:33', '2020-04-10 07:19:33');
INSERT INTO `admin_operation_log` VALUES (460, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 07:20:15', '2020-04-10 07:20:15');
INSERT INTO `admin_operation_log` VALUES (461, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 07:20:18', '2020-04-10 07:20:18');
INSERT INTO `admin_operation_log` VALUES (462, 1, 'admin', 'GET', '192.168.117.81', '[]', '2020-04-10 07:20:20', '2020-04-10 07:20:20');
INSERT INTO `admin_operation_log` VALUES (463, 1, 'admin/dashboard', 'GET', '192.168.117.81', '[]', '2020-04-10 07:20:21', '2020-04-10 07:20:21');
INSERT INTO `admin_operation_log` VALUES (464, 1, 'admin/goods/goods', 'GET', '192.168.117.81', '[]', '2020-04-10 07:20:23', '2020-04-10 07:20:23');
INSERT INTO `admin_operation_log` VALUES (465, 1, 'admin/order/order_record', 'GET', '192.168.117.81', '[]', '2020-04-10 07:20:35', '2020-04-10 07:20:35');
INSERT INTO `admin_operation_log` VALUES (466, 1, 'admin/order/order_details', 'GET', '192.168.117.81', '[]', '2020-04-10 07:20:36', '2020-04-10 07:20:36');
INSERT INTO `admin_operation_log` VALUES (467, 1, 'admin/user/wallet_record', 'GET', '192.168.117.81', '[]', '2020-04-10 07:20:40', '2020-04-10 07:20:40');
INSERT INTO `admin_operation_log` VALUES (468, 1, 'admin', 'GET', '192.168.170.177', '[]', '2020-04-10 14:33:01', '2020-04-10 14:33:01');
INSERT INTO `admin_operation_log` VALUES (469, 1, 'admin/dashboard', 'GET', '192.168.170.177', '[]', '2020-04-10 14:33:02', '2020-04-10 14:33:02');
INSERT INTO `admin_operation_log` VALUES (470, 1, 'admin/goods/goods', 'GET', '192.168.170.177', '[]', '2020-04-10 14:33:07', '2020-04-10 14:33:07');
INSERT INTO `admin_operation_log` VALUES (471, 1, 'admin/goods/goods', 'GET', '192.168.170.177', '[]', '2020-04-10 14:33:12', '2020-04-10 14:33:12');
INSERT INTO `admin_operation_log` VALUES (472, 1, 'admin/goods/goods', 'GET', '192.168.170.177', '[]', '2020-04-10 14:33:15', '2020-04-10 14:33:15');
INSERT INTO `admin_operation_log` VALUES (473, 1, 'admin', 'GET', '172.18.76.209', '[]', '2020-04-11 15:48:29', '2020-04-11 15:48:29');
INSERT INTO `admin_operation_log` VALUES (474, 1, 'admin/dashboard', 'GET', '172.18.76.209', '[]', '2020-04-11 15:48:33', '2020-04-11 15:48:33');
INSERT INTO `admin_operation_log` VALUES (475, 1, 'admin/auth/logout', 'GET', '172.18.76.209', '{\"_pjax\":\"#pjax-container\"}', '2020-04-11 15:48:36', '2020-04-11 15:48:36');
INSERT INTO `admin_operation_log` VALUES (476, 1, 'admin', 'GET', '172.18.76.209', '[]', '2020-04-11 15:49:00', '2020-04-11 15:49:00');
INSERT INTO `admin_operation_log` VALUES (477, 1, 'admin/dashboard', 'GET', '172.18.76.209', '[]', '2020-04-11 15:49:01', '2020-04-11 15:49:01');
INSERT INTO `admin_operation_log` VALUES (478, 1, 'admin/goods/goods', 'GET', '172.18.76.209', '[]', '2020-04-11 15:49:05', '2020-04-11 15:49:05');
INSERT INTO `admin_operation_log` VALUES (479, 1, 'admin/goods/goods', 'GET', '172.18.76.209', '[]', '2020-04-11 15:49:12', '2020-04-11 15:49:12');
INSERT INTO `admin_operation_log` VALUES (480, 1, 'admin/goods/goods', 'GET', '172.18.76.209', '[]', '2020-04-11 15:49:16', '2020-04-11 15:49:16');
INSERT INTO `admin_operation_log` VALUES (481, 1, 'admin/goods/goods', 'GET', '172.18.76.209', '[]', '2020-04-11 15:49:19', '2020-04-11 15:49:19');
INSERT INTO `admin_operation_log` VALUES (482, 1, 'admin/goods/goods/1/edit', 'GET', '172.18.76.209', '{\"_pjax\":\"#pjax-container\"}', '2020-04-11 15:49:42', '2020-04-11 15:49:42');
INSERT INTO `admin_operation_log` VALUES (483, 1, 'admin/goods/goods', 'GET', '172.18.76.209', '{\"_pjax\":\"#pjax-container\"}', '2020-04-11 15:59:07', '2020-04-11 15:59:07');
INSERT INTO `admin_operation_log` VALUES (484, 1, 'admin/goods/goods', 'GET', '172.18.76.209', '[]', '2020-04-11 15:59:11', '2020-04-11 15:59:11');
INSERT INTO `admin_operation_log` VALUES (485, 1, 'admin', 'GET', '172.18.76.209', '[]', '2020-04-11 16:00:37', '2020-04-11 16:00:37');
INSERT INTO `admin_operation_log` VALUES (486, 1, 'admin/dashboard', 'GET', '172.18.76.209', '[]', '2020-04-11 16:00:38', '2020-04-11 16:00:38');
INSERT INTO `admin_operation_log` VALUES (487, 1, 'admin/goods/goods', 'GET', '172.18.76.209', '[]', '2020-04-11 16:00:47', '2020-04-11 16:00:47');
INSERT INTO `admin_operation_log` VALUES (488, 1, 'admin/goods/goods_search', 'GET', '172.18.76.209', '[]', '2020-04-11 16:00:49', '2020-04-11 16:00:49');
INSERT INTO `admin_operation_log` VALUES (489, 1, 'admin/goods/goods_search', 'GET', '172.18.76.209', '[]', '2020-04-11 16:10:03', '2020-04-11 16:10:03');
INSERT INTO `admin_operation_log` VALUES (490, 1, 'admin/goods/goods', 'GET', '172.18.76.209', '[]', '2020-04-11 16:50:05', '2020-04-11 16:50:05');
INSERT INTO `admin_operation_log` VALUES (491, 1, 'admin', 'GET', '172.18.76.209', '[]', '2020-04-11 16:50:10', '2020-04-11 16:50:10');
INSERT INTO `admin_operation_log` VALUES (492, 1, 'admin/dashboard', 'GET', '172.18.76.209', '[]', '2020-04-11 16:50:11', '2020-04-11 16:50:11');
INSERT INTO `admin_operation_log` VALUES (493, 1, 'admin/goods/goods', 'GET', '172.18.76.209', '[]', '2020-04-11 16:50:14', '2020-04-11 16:50:14');
INSERT INTO `admin_operation_log` VALUES (494, 1, 'admin/goods/goods/1/edit', 'GET', '172.18.76.209', '{\"_pjax\":\"#pjax-container\"}', '2020-04-11 16:50:17', '2020-04-11 16:50:17');
INSERT INTO `admin_operation_log` VALUES (495, 1, 'admin/goods/goods', 'GET', '172.18.76.209', '[]', '2020-04-11 16:50:37', '2020-04-11 16:50:37');
INSERT INTO `admin_operation_log` VALUES (496, 1, 'admin/goods/goods/1/edit', 'GET', '172.18.76.209', '{\"_pjax\":\"#pjax-container\"}', '2020-04-11 16:50:39', '2020-04-11 16:50:39');
INSERT INTO `admin_operation_log` VALUES (497, 1, 'admin/goods/goods/1', 'GET', '172.18.76.209', '{\"_pjax\":\"#pjax-container\"}', '2020-04-11 16:52:39', '2020-04-11 16:52:39');
INSERT INTO `admin_operation_log` VALUES (498, 1, 'admin/goods/goods/1', 'GET', '172.18.76.209', '[]', '2020-04-11 16:52:40', '2020-04-11 16:52:40');
INSERT INTO `admin_operation_log` VALUES (499, 1, 'admin/goods/goods', 'GET', '172.18.76.209', '[]', '2020-04-11 16:52:52', '2020-04-11 16:52:52');
INSERT INTO `admin_operation_log` VALUES (500, 1, 'admin/goods/goods/create', 'GET', '172.18.76.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-11 16:52:53', '2020-04-11 16:52:53');
INSERT INTO `admin_operation_log` VALUES (501, 1, 'admin/goods/goods', 'POST', '172.18.76.209', '{\"title\":\"\\u6d4b\\u8bd5\",\"price\":\"1.00\",\"discount\":\"0.1\",\"tags\":[\"\\u6d4b\\u8bd5\",null],\"stock\":\"7\",\"category_id\":\"0\",\"click_count\":\"3\",\"buy_count\":\"3\",\"status\":\"on\",\"_token\":\"I9yKjOuiw3efcIvmTkqnt3J7JkPy10uWcqKRLgnx\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods\",\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-11 16:53:47', '2020-04-11 16:53:47');
INSERT INTO `admin_operation_log` VALUES (502, 1, 'admin/goods/goods/create', 'GET', '172.18.76.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-11 16:53:48', '2020-04-11 16:53:48');
INSERT INTO `admin_operation_log` VALUES (503, 1, 'admin/goods/goods', 'POST', '172.18.76.209', '{\"title\":\"\\u6d4b\\u8bd5\",\"price\":\"1.00\",\"discount\":\"0.1\",\"tags\":[null],\"stock\":\"7\",\"category_id\":\"0\",\"click_count\":\"3\",\"buy_count\":\"3\",\"status\":\"on\",\"_token\":\"I9yKjOuiw3efcIvmTkqnt3J7JkPy10uWcqKRLgnx\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods\\/create?_ifraem_id_=iframe__admin_goods_goods\",\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-11 16:55:10', '2020-04-11 16:55:10');
INSERT INTO `admin_operation_log` VALUES (504, 1, 'admin/goods/goods/create', 'GET', '172.18.76.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-11 16:55:12', '2020-04-11 16:55:12');
INSERT INTO `admin_operation_log` VALUES (505, 1, 'admin/goods/goods', 'GET', '172.18.76.209', '[]', '2020-04-11 16:57:56', '2020-04-11 16:57:56');
INSERT INTO `admin_operation_log` VALUES (506, 1, 'admin/goods/goods/1/edit', 'GET', '172.18.76.209', '{\"_pjax\":\"#pjax-container\"}', '2020-04-11 16:57:58', '2020-04-11 16:57:58');
INSERT INTO `admin_operation_log` VALUES (507, 1, 'admin/goods/goods/1', 'PUT', '172.18.76.209', '{\"title\":\"\\u6d4b\\u8bd5\\u5546\\u54c1\",\"price\":\"100.00\",\"discount\":\"0.8\",\"tags\":[\"\\u70ed\\u9500\",null],\"stock\":\"1000\",\"category_id\":\"0\",\"click_count\":\"0\",\"buy_count\":\"0\",\"status\":\"on\",\"_token\":\"I9yKjOuiw3efcIvmTkqnt3J7JkPy10uWcqKRLgnx\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods\"}', '2020-04-11 17:02:37', '2020-04-11 17:02:37');
INSERT INTO `admin_operation_log` VALUES (508, 1, 'admin/goods/goods', 'GET', '172.18.76.209', '[]', '2020-04-11 17:02:38', '2020-04-11 17:02:38');
INSERT INTO `admin_operation_log` VALUES (509, 1, 'admin/goods/goods', 'GET', '172.18.76.209', '[]', '2020-04-11 17:02:43', '2020-04-11 17:02:43');
INSERT INTO `admin_operation_log` VALUES (510, 1, 'admin/goods/goods', 'GET', '172.18.76.209', '[]', '2020-04-11 17:03:45', '2020-04-11 17:03:45');
INSERT INTO `admin_operation_log` VALUES (511, 1, 'admin', 'GET', '172.18.76.209', '[]', '2020-04-11 17:05:52', '2020-04-11 17:05:52');
INSERT INTO `admin_operation_log` VALUES (512, 1, 'admin/dashboard', 'GET', '172.18.76.209', '[]', '2020-04-11 17:05:52', '2020-04-11 17:05:52');
INSERT INTO `admin_operation_log` VALUES (513, 1, 'admin/goods/goods', 'GET', '172.18.76.209', '[]', '2020-04-11 17:05:58', '2020-04-11 17:05:58');
INSERT INTO `admin_operation_log` VALUES (514, 1, 'admin', 'GET', '172.18.76.209', '[]', '2020-04-11 17:07:33', '2020-04-11 17:07:33');
INSERT INTO `admin_operation_log` VALUES (515, 1, 'admin/dashboard', 'GET', '172.18.76.209', '[]', '2020-04-11 17:07:34', '2020-04-11 17:07:34');
INSERT INTO `admin_operation_log` VALUES (516, 1, 'admin/goods/goods', 'GET', '172.18.76.209', '[]', '2020-04-11 17:07:37', '2020-04-11 17:07:37');
INSERT INTO `admin_operation_log` VALUES (517, 1, 'admin/goods/goods/1/edit', 'GET', '172.18.76.209', '{\"_pjax\":\"#pjax-container\"}', '2020-04-11 17:07:40', '2020-04-11 17:07:40');
INSERT INTO `admin_operation_log` VALUES (518, 1, 'admin/goods/goods', 'GET', '172.18.76.209', '[]', '2020-04-11 17:07:53', '2020-04-11 17:07:53');
INSERT INTO `admin_operation_log` VALUES (519, 1, 'admin/goods/goods/create', 'GET', '172.18.76.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-11 17:07:54', '2020-04-11 17:07:54');
INSERT INTO `admin_operation_log` VALUES (520, 1, 'admin/goods/goods/create', 'GET', '172.18.76.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-11 17:07:58', '2020-04-11 17:07:58');
INSERT INTO `admin_operation_log` VALUES (521, 1, 'admin/goods/goods', 'POST', '172.18.76.209', '{\"title\":\"123\",\"price\":\"1.00\",\"discount\":\"1\",\"tags\":[\"1\",null],\"stock\":\"2\",\"category_id\":\"0\",\"click_count\":\"0\",\"buy_count\":\"0\",\"status\":\"off\",\"_token\":\"I9yKjOuiw3efcIvmTkqnt3J7JkPy10uWcqKRLgnx\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods\",\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-11 17:08:20', '2020-04-11 17:08:20');
INSERT INTO `admin_operation_log` VALUES (522, 1, 'admin/goods/goods/create', 'GET', '172.18.76.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-11 17:08:21', '2020-04-11 17:08:21');
INSERT INTO `admin_operation_log` VALUES (523, 1, 'admin/goods/goods', 'GET', '172.18.76.209', '[]', '2020-04-11 17:10:25', '2020-04-11 17:10:25');
INSERT INTO `admin_operation_log` VALUES (524, 1, 'admin/goods/goods', 'GET', '172.18.76.209', '[]', '2020-04-11 17:10:29', '2020-04-11 17:10:29');
INSERT INTO `admin_operation_log` VALUES (525, 1, 'admin/goods/goods/create', 'GET', '172.18.76.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-11 17:13:46', '2020-04-11 17:13:46');
INSERT INTO `admin_operation_log` VALUES (526, 1, 'admin/goods/goods', 'POST', '172.18.76.209', '{\"title\":\"12\",\"price\":\"1.00\",\"discount\":\"1\",\"tags\":[\"123\",null],\"stock\":\"0\",\"category_id\":\"0\",\"click_count\":\"0\",\"buy_count\":\"0\",\"status\":\"off\",\"_token\":\"I9yKjOuiw3efcIvmTkqnt3J7JkPy10uWcqKRLgnx\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods\",\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-11 17:14:04', '2020-04-11 17:14:04');
INSERT INTO `admin_operation_log` VALUES (527, 1, 'admin/goods/goods/create', 'GET', '172.18.76.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-11 17:14:05', '2020-04-11 17:14:05');
INSERT INTO `admin_operation_log` VALUES (528, 1, 'admin/goods/goods', 'GET', '172.18.76.209', '[]', '2020-04-11 17:20:12', '2020-04-11 17:20:12');
INSERT INTO `admin_operation_log` VALUES (529, 1, 'admin/user/user', 'GET', '172.18.76.209', '[]', '2020-04-11 17:20:48', '2020-04-11 17:20:48');
INSERT INTO `admin_operation_log` VALUES (530, 1, 'admin/goods/goods', 'GET', '172.18.76.209', '[]', '2020-04-11 17:20:52', '2020-04-11 17:20:52');
INSERT INTO `admin_operation_log` VALUES (531, 1, 'admin/goods/goods/1/edit', 'GET', '172.18.76.209', '{\"_pjax\":\"#pjax-container\"}', '2020-04-11 17:20:56', '2020-04-11 17:20:56');
INSERT INTO `admin_operation_log` VALUES (532, 1, 'admin/goods/goods', 'GET', '172.18.76.209', '[]', '2020-04-11 17:25:54', '2020-04-11 17:25:54');
INSERT INTO `admin_operation_log` VALUES (533, 1, 'admin/goods/goods/1/edit', 'GET', '172.18.76.209', '{\"_pjax\":\"#pjax-container\"}', '2020-04-11 17:25:57', '2020-04-11 17:25:57');
INSERT INTO `admin_operation_log` VALUES (534, 1, 'admin/goods/goods', 'GET', '172.18.76.209', '[]', '2020-04-11 17:26:02', '2020-04-11 17:26:02');
INSERT INTO `admin_operation_log` VALUES (535, 1, 'admin/goods/goods/create', 'GET', '172.18.76.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-11 17:26:04', '2020-04-11 17:26:04');
INSERT INTO `admin_operation_log` VALUES (536, 1, 'admin/goods/goods', 'POST', '172.18.76.209', '{\"title\":\"12\",\"price\":\"1.00\",\"discount\":\"12\",\"tags\":[\"123123\",null],\"stock\":\"0\",\"category_id\":\"0\",\"click_count\":\"0\",\"buy_count\":\"0\",\"status\":\"on\",\"_token\":\"I9yKjOuiw3efcIvmTkqnt3J7JkPy10uWcqKRLgnx\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods\",\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-11 17:26:32', '2020-04-11 17:26:32');
INSERT INTO `admin_operation_log` VALUES (537, 1, 'admin/goods/goods/create', 'GET', '172.18.76.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-11 17:26:34', '2020-04-11 17:26:34');
INSERT INTO `admin_operation_log` VALUES (538, 1, 'admin/goods/goods_search', 'GET', '172.18.76.209', '[]', '2020-04-11 17:27:57', '2020-04-11 17:27:57');
INSERT INTO `admin_operation_log` VALUES (539, 1, 'admin/goods/goods_search', 'GET', '172.18.76.209', '[]', '2020-04-11 17:30:46', '2020-04-11 17:30:46');
INSERT INTO `admin_operation_log` VALUES (540, 1, 'admin/goods/goods_search', 'GET', '172.18.76.209', '[]', '2020-04-11 17:30:59', '2020-04-11 17:30:59');
INSERT INTO `admin_operation_log` VALUES (541, 1, 'admin/goods/goods_search', 'GET', '172.18.76.209', '[]', '2020-04-11 17:31:18', '2020-04-11 17:31:18');
INSERT INTO `admin_operation_log` VALUES (542, 1, 'admin/goods/goods_search', 'GET', '172.18.76.209', '[]', '2020-04-11 17:31:42', '2020-04-11 17:31:42');
INSERT INTO `admin_operation_log` VALUES (543, 1, 'admin/goods/goods_search', 'GET', '172.18.76.209', '[]', '2020-04-11 17:31:46', '2020-04-11 17:31:46');
INSERT INTO `admin_operation_log` VALUES (544, 1, 'admin/goods/goods_search/create', 'GET', '172.18.76.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods_search\"}', '2020-04-11 17:32:25', '2020-04-11 17:32:25');
INSERT INTO `admin_operation_log` VALUES (545, 1, 'admin/goods/goods_search/create', 'GET', '172.18.76.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods_search\"}', '2020-04-11 17:32:28', '2020-04-11 17:32:28');
INSERT INTO `admin_operation_log` VALUES (546, 1, 'admin/goods/goods_search', 'POST', '172.18.76.209', '{\"user_id\":\"123\",\"type\":\"123\",\"name\":\"123\",\"price\":\"123\",\"num\":\"123\",\"more\":\"123\",\"status\":null,\"_token\":\"I9yKjOuiw3efcIvmTkqnt3J7JkPy10uWcqKRLgnx\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods_search\",\"_ifraem_id_\":\"iframe__admin_goods_goods_search\"}', '2020-04-11 17:32:42', '2020-04-11 17:32:42');
INSERT INTO `admin_operation_log` VALUES (547, 1, 'admin/goods/goods_search/create', 'GET', '172.18.76.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods_search\"}', '2020-04-11 17:32:45', '2020-04-11 17:32:45');
INSERT INTO `admin_operation_log` VALUES (548, 1, 'admin/logs', 'GET', '172.18.76.209', '[]', '2020-04-11 17:32:55', '2020-04-11 17:32:55');
INSERT INTO `admin_operation_log` VALUES (549, 1, 'admin/goods/goods_search', 'POST', '172.18.76.209', '{\"user_id\":\"123\",\"type\":\"123\",\"name\":\"123\",\"price\":\"123\",\"num\":\"123\",\"more\":\"123\",\"status\":null,\"_token\":\"I9yKjOuiw3efcIvmTkqnt3J7JkPy10uWcqKRLgnx\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods_search\\/create?_ifraem_id_=iframe__admin_goods_goods_search\",\"_ifraem_id_\":\"iframe__admin_goods_goods_search\"}', '2020-04-11 17:33:48', '2020-04-11 17:33:48');
INSERT INTO `admin_operation_log` VALUES (550, 1, 'admin/goods/goods_search/create', 'GET', '172.18.76.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods_search\"}', '2020-04-11 17:33:49', '2020-04-11 17:33:49');
INSERT INTO `admin_operation_log` VALUES (551, 1, 'admin/goods/goods_search', 'POST', '172.18.76.209', '{\"user_id\":\"123\",\"type\":\"123\",\"name\":\"123\",\"price\":\"123\",\"num\":\"123\",\"more\":\"123\",\"status\":null,\"_token\":\"I9yKjOuiw3efcIvmTkqnt3J7JkPy10uWcqKRLgnx\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods_search\\/create?_ifraem_id_=iframe__admin_goods_goods_search\",\"_ifraem_id_\":\"iframe__admin_goods_goods_search\"}', '2020-04-11 17:35:50', '2020-04-11 17:35:50');
INSERT INTO `admin_operation_log` VALUES (552, 1, 'admin/goods/goods_search/create', 'GET', '172.18.76.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods_search\"}', '2020-04-11 17:35:51', '2020-04-11 17:35:51');
INSERT INTO `admin_operation_log` VALUES (553, 1, 'admin/goods/goods_search', 'POST', '172.18.76.209', '{\"user_id\":\"123\",\"type\":\"123\",\"name\":\"123\",\"price\":\"123\",\"num\":\"123\",\"more\":\"123\",\"status\":null,\"_token\":\"I9yKjOuiw3efcIvmTkqnt3J7JkPy10uWcqKRLgnx\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods_search\\/create?_ifraem_id_=iframe__admin_goods_goods_search\",\"_ifraem_id_\":\"iframe__admin_goods_goods_search\"}', '2020-04-11 17:36:36', '2020-04-11 17:36:36');
INSERT INTO `admin_operation_log` VALUES (554, 1, 'admin/goods/goods_search/create', 'GET', '172.18.76.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods_search\"}', '2020-04-11 17:36:38', '2020-04-11 17:36:38');
INSERT INTO `admin_operation_log` VALUES (555, 1, 'admin/goods/goods_search', 'POST', '172.18.76.209', '{\"user_id\":\"123\",\"type\":\"123\",\"name\":\"123\",\"price\":\"123\",\"num\":\"123\",\"more\":\"123\",\"status\":null,\"_token\":\"I9yKjOuiw3efcIvmTkqnt3J7JkPy10uWcqKRLgnx\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods_search\\/create?_ifraem_id_=iframe__admin_goods_goods_search\",\"_ifraem_id_\":\"iframe__admin_goods_goods_search\"}', '2020-04-11 17:38:13', '2020-04-11 17:38:13');
INSERT INTO `admin_operation_log` VALUES (556, 1, 'admin/goods/goods_search/create', 'GET', '172.18.76.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods_search\"}', '2020-04-11 17:38:14', '2020-04-11 17:38:14');
INSERT INTO `admin_operation_log` VALUES (557, 1, 'admin/goods/goods', 'GET', '172.18.76.209', '[]', '2020-04-11 17:39:34', '2020-04-11 17:39:34');
INSERT INTO `admin_operation_log` VALUES (558, 1, 'admin/goods/goods/create', 'GET', '172.18.76.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-11 17:39:36', '2020-04-11 17:39:36');
INSERT INTO `admin_operation_log` VALUES (559, 1, 'admin/goods/goods', 'POST', '172.18.76.209', '{\"title\":\"123\",\"price\":null,\"discount\":\"123\",\"tags\":[null],\"stock\":\"0\",\"category_id\":\"0\",\"click_count\":\"0\",\"buy_count\":\"0\",\"status\":\"off\",\"_token\":\"I9yKjOuiw3efcIvmTkqnt3J7JkPy10uWcqKRLgnx\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods\",\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-11 17:39:51', '2020-04-11 17:39:51');
INSERT INTO `admin_operation_log` VALUES (560, 1, 'admin/goods/goods/create', 'GET', '172.18.76.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-11 17:39:52', '2020-04-11 17:39:52');
INSERT INTO `admin_operation_log` VALUES (561, 1, 'admin/goods/goods_search', 'POST', '172.18.76.209', '{\"user_id\":\"123\",\"type\":\"123\",\"name\":\"123\",\"price\":\"123\",\"num\":\"123\",\"more\":\"123\",\"status\":\"0\",\"_token\":\"I9yKjOuiw3efcIvmTkqnt3J7JkPy10uWcqKRLgnx\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods_search\\/create?_ifraem_id_=iframe__admin_goods_goods_search\",\"_ifraem_id_\":\"iframe__admin_goods_goods_search\"}', '2020-04-11 17:41:19', '2020-04-11 17:41:19');
INSERT INTO `admin_operation_log` VALUES (562, 1, 'admin/goods/goods_search/create', 'GET', '172.18.76.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods_search\"}', '2020-04-11 17:41:19', '2020-04-11 17:41:19');
INSERT INTO `admin_operation_log` VALUES (563, 1, 'admin/goods/goods_search', 'GET', '172.18.76.209', '{\"_pjax\":\"#pjax-container\"}', '2020-04-11 17:41:20', '2020-04-11 17:41:20');
INSERT INTO `admin_operation_log` VALUES (564, 1, 'admin/goods/goods_search/3/edit', 'GET', '172.18.76.209', '{\"_pjax\":\"#pjax-container\"}', '2020-04-11 17:42:13', '2020-04-11 17:42:13');
INSERT INTO `admin_operation_log` VALUES (565, 1, 'admin/goods/goods_search/3', 'PUT', '172.18.76.209', '{\"user_id\":\"123\",\"type\":\"123\",\"name\":\"123\",\"price\":\"123\",\"num\":\"123\",\"more\":\"123\",\"status\":\"0\",\"_token\":\"I9yKjOuiw3efcIvmTkqnt3J7JkPy10uWcqKRLgnx\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods_search\"}', '2020-04-11 17:42:44', '2020-04-11 17:42:44');
INSERT INTO `admin_operation_log` VALUES (566, 1, 'admin/goods/goods_search', 'GET', '172.18.76.209', '[]', '2020-04-11 17:42:45', '2020-04-11 17:42:45');
INSERT INTO `admin_operation_log` VALUES (567, 1, 'admin/goods/goods_search/3/edit', 'GET', '172.18.76.209', '{\"_pjax\":\"#pjax-container\"}', '2020-04-11 17:42:49', '2020-04-11 17:42:49');
INSERT INTO `admin_operation_log` VALUES (568, 1, 'admin/goods/goods', 'POST', '172.18.76.209', '{\"title\":\"123\",\"price\":null,\"discount\":\"123\",\"tags\":[null],\"stock\":\"0\",\"category_id\":\"0\",\"click_count\":\"0\",\"buy_count\":\"0\",\"status\":\"off\",\"_token\":\"I9yKjOuiw3efcIvmTkqnt3J7JkPy10uWcqKRLgnx\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods\\/create?_ifraem_id_=iframe__admin_goods_goods\",\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-11 17:43:19', '2020-04-11 17:43:19');
INSERT INTO `admin_operation_log` VALUES (569, 1, 'admin/goods/goods/create', 'GET', '172.18.76.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-11 17:43:21', '2020-04-11 17:43:21');
INSERT INTO `admin_operation_log` VALUES (570, 1, 'admin/goods/goods_search', 'GET', '172.18.76.209', '[]', '2020-04-11 17:46:19', '2020-04-11 17:46:19');
INSERT INTO `admin_operation_log` VALUES (571, 1, 'admin/goods/goods_search/3/edit', 'GET', '172.18.76.209', '{\"_pjax\":\"#pjax-container\"}', '2020-04-11 17:46:23', '2020-04-11 17:46:23');
INSERT INTO `admin_operation_log` VALUES (572, 1, 'admin/goods/goods_search/3', 'PUT', '172.18.76.209', '{\"user_id\":\"123\",\"type\":\"123\",\"name\":\"123\",\"price\":\"123\",\"num\":\"123\",\"more\":\"123\",\"status\":\"0\",\"_token\":\"I9yKjOuiw3efcIvmTkqnt3J7JkPy10uWcqKRLgnx\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods_search\"}', '2020-04-11 17:46:30', '2020-04-11 17:46:30');
INSERT INTO `admin_operation_log` VALUES (573, 1, 'admin/goods/goods_search', 'GET', '172.18.76.209', '[]', '2020-04-11 17:46:30', '2020-04-11 17:46:30');
INSERT INTO `admin_operation_log` VALUES (574, 1, 'admin/_handle_action_', 'POST', '172.18.76.209', '{\"_key\":\"3\",\"_model\":\"App_Models_Goods_GoodsSearch\",\"_token\":\"I9yKjOuiw3efcIvmTkqnt3J7JkPy10uWcqKRLgnx\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2020-04-11 17:46:37', '2020-04-11 17:46:37');
INSERT INTO `admin_operation_log` VALUES (575, 1, 'admin/goods/goods_search', 'GET', '172.18.76.209', '{\"_pjax\":\"#pjax-container\"}', '2020-04-11 17:46:37', '2020-04-11 17:46:37');
INSERT INTO `admin_operation_log` VALUES (576, 1, 'admin/goods/goods_search/1', 'GET', '172.18.76.209', '{\"_pjax\":\"#pjax-container\"}', '2020-04-11 17:46:43', '2020-04-11 17:46:43');
INSERT INTO `admin_operation_log` VALUES (577, 1, 'admin/goods/goods', 'GET', '172.18.76.209', '[]', '2020-04-11 17:55:42', '2020-04-11 17:55:42');
INSERT INTO `admin_operation_log` VALUES (578, 1, 'admin/goods/goods_search', 'GET', '172.18.76.209', '[]', '2020-04-11 17:55:47', '2020-04-11 17:55:47');
INSERT INTO `admin_operation_log` VALUES (579, 1, 'admin/goods/goods', 'GET', '172.18.76.209', '[]', '2020-04-11 17:56:22', '2020-04-11 17:56:22');
INSERT INTO `admin_operation_log` VALUES (580, 1, 'admin/goods/goods_search', 'GET', '172.18.76.209', '[]', '2020-04-11 17:56:25', '2020-04-11 17:56:25');
INSERT INTO `admin_operation_log` VALUES (581, 1, 'admin/goods/goods_search', 'GET', '172.18.76.209', '[]', '2020-04-11 17:56:27', '2020-04-11 17:56:27');
INSERT INTO `admin_operation_log` VALUES (582, 1, 'admin/goods/goods_search', 'GET', '172.18.76.209', '[]', '2020-04-11 17:56:37', '2020-04-11 17:56:37');
INSERT INTO `admin_operation_log` VALUES (583, 1, 'admin/goods/goods_search', 'GET', '172.18.76.209', '[]', '2020-04-11 17:56:41', '2020-04-11 17:56:41');
INSERT INTO `admin_operation_log` VALUES (584, 1, 'admin/goods/goods_search', 'GET', '172.18.76.209', '[]', '2020-04-11 17:56:43', '2020-04-11 17:56:43');
INSERT INTO `admin_operation_log` VALUES (585, 1, 'admin/goods/goods_search', 'GET', '172.18.76.209', '[]', '2020-04-11 17:57:18', '2020-04-11 17:57:18');
INSERT INTO `admin_operation_log` VALUES (586, 1, 'admin/goods/goods_search', 'GET', '172.18.76.209', '[]', '2020-04-11 17:57:21', '2020-04-11 17:57:21');
INSERT INTO `admin_operation_log` VALUES (587, 1, 'admin/goods/goods', 'GET', '172.18.76.209', '[]', '2020-04-11 18:10:29', '2020-04-11 18:10:29');
INSERT INTO `admin_operation_log` VALUES (588, 1, 'admin/_handle_action_', 'POST', '172.18.76.209', '{\"_key\":\"1\",\"_model\":\"App_Models_Goods_Goods\",\"_token\":\"I9yKjOuiw3efcIvmTkqnt3J7JkPy10uWcqKRLgnx\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2020-04-11 18:10:33', '2020-04-11 18:10:33');
INSERT INTO `admin_operation_log` VALUES (589, 1, 'admin/goods/goods', 'GET', '172.18.76.209', '{\"_pjax\":\"#pjax-container\"}', '2020-04-11 18:10:34', '2020-04-11 18:10:34');
INSERT INTO `admin_operation_log` VALUES (590, 1, 'admin/_handle_action_', 'POST', '172.18.76.209', '{\"_key\":\"2\",\"_model\":\"App_Models_Goods_Goods\",\"_token\":\"I9yKjOuiw3efcIvmTkqnt3J7JkPy10uWcqKRLgnx\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2020-04-11 18:10:37', '2020-04-11 18:10:37');
INSERT INTO `admin_operation_log` VALUES (591, 1, 'admin/goods/goods', 'GET', '172.18.76.209', '{\"_pjax\":\"#pjax-container\"}', '2020-04-11 18:10:38', '2020-04-11 18:10:38');
INSERT INTO `admin_operation_log` VALUES (592, 1, 'admin/goods/goods', 'GET', '172.18.76.209', '[]', '2020-04-11 18:10:43', '2020-04-11 18:10:43');
INSERT INTO `admin_operation_log` VALUES (593, 1, 'admin/goods/goods/create', 'GET', '172.18.76.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-11 18:10:45', '2020-04-11 18:10:45');
INSERT INTO `admin_operation_log` VALUES (594, 1, 'admin/goods/goods', 'POST', '172.18.76.209', '{\"title\":\"\\u6d4b\\u8bd5\",\"price\":\"1.00\",\"discount\":\"123\",\"tags\":[\"123\",null],\"stock\":\"0\",\"category_id\":\"0\",\"click_count\":\"1\",\"buy_count\":\"1\",\"status\":\"on\",\"_token\":\"I9yKjOuiw3efcIvmTkqnt3J7JkPy10uWcqKRLgnx\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods\",\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-11 18:11:37', '2020-04-11 18:11:37');
INSERT INTO `admin_operation_log` VALUES (595, 1, 'admin/goods/goods/create', 'GET', '172.18.76.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-11 18:11:38', '2020-04-11 18:11:38');
INSERT INTO `admin_operation_log` VALUES (596, 1, 'admin/goods/goods', 'POST', '172.18.76.209', '{\"title\":\"\\u6d4b\\u8bd5\",\"price\":\"1.00\",\"discount\":\"123\",\"tags\":[\"13\",null],\"stock\":\"0\",\"category_id\":\"0\",\"click_count\":\"1\",\"buy_count\":\"1\",\"status\":\"on\",\"_token\":\"I9yKjOuiw3efcIvmTkqnt3J7JkPy10uWcqKRLgnx\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods\\/create?_ifraem_id_=iframe__admin_goods_goods\",\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-11 18:12:38', '2020-04-11 18:12:38');
INSERT INTO `admin_operation_log` VALUES (597, 1, 'admin/goods/goods/create', 'GET', '172.18.76.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-11 18:12:39', '2020-04-11 18:12:39');
INSERT INTO `admin_operation_log` VALUES (598, 1, 'admin/goods/goods', 'POST', '172.18.76.209', '{\"title\":\"\\u6d4b\\u8bd5\",\"price\":\"1.00\",\"discount\":\"123\",\"tags\":[\"123\",null],\"stock\":\"2\",\"category_id\":\"0\",\"click_count\":\"1\",\"buy_count\":\"1\",\"status\":\"on\",\"_token\":\"I9yKjOuiw3efcIvmTkqnt3J7JkPy10uWcqKRLgnx\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods\\/create?_ifraem_id_=iframe__admin_goods_goods\",\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-11 18:13:47', '2020-04-11 18:13:47');
INSERT INTO `admin_operation_log` VALUES (599, 1, 'admin/goods/goods/create', 'GET', '172.18.76.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-11 18:13:48', '2020-04-11 18:13:48');
INSERT INTO `admin_operation_log` VALUES (600, 1, 'admin/goods/goods', 'POST', '172.18.76.209', '{\"title\":\"\\u6d4b\\u8bd5\",\"price\":\"1.00\",\"discount\":\"123\",\"tags\":[\"12313\",null],\"stock\":\"2\",\"category_id\":\"0\",\"click_count\":\"1\",\"buy_count\":\"1\",\"status\":\"on\",\"_token\":\"I9yKjOuiw3efcIvmTkqnt3J7JkPy10uWcqKRLgnx\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods\\/create?_ifraem_id_=iframe__admin_goods_goods\",\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-11 18:15:01', '2020-04-11 18:15:01');
INSERT INTO `admin_operation_log` VALUES (601, 1, 'admin/goods/goods/create', 'GET', '172.18.76.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-11 18:15:02', '2020-04-11 18:15:02');
INSERT INTO `admin_operation_log` VALUES (602, 1, 'admin/order/order', 'GET', '172.18.76.209', '[]', '2020-04-11 18:43:56', '2020-04-11 18:43:56');
INSERT INTO `admin_operation_log` VALUES (603, 1, 'admin/user/user', 'GET', '172.18.76.209', '[]', '2020-04-11 18:44:01', '2020-04-11 18:44:01');
INSERT INTO `admin_operation_log` VALUES (604, 1, 'admin', 'GET', '172.18.28.209', '[]', '2020-04-12 03:01:03', '2020-04-12 03:01:03');
INSERT INTO `admin_operation_log` VALUES (605, 1, 'admin/dashboard', 'GET', '172.18.28.209', '[]', '2020-04-12 03:01:07', '2020-04-12 03:01:07');
INSERT INTO `admin_operation_log` VALUES (606, 1, 'admin/goods/goods_group', 'GET', '172.18.28.209', '[]', '2020-04-12 03:01:15', '2020-04-12 03:01:15');
INSERT INTO `admin_operation_log` VALUES (607, 1, 'admin/goods/goods_group', 'GET', '172.18.28.209', '[]', '2020-04-12 03:01:18', '2020-04-12 03:01:18');
INSERT INTO `admin_operation_log` VALUES (608, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 03:01:32', '2020-04-12 03:01:32');
INSERT INTO `admin_operation_log` VALUES (609, 1, 'admin/goods/goods_group', 'GET', '172.18.28.209', '[]', '2020-04-12 03:02:14', '2020-04-12 03:02:14');
INSERT INTO `admin_operation_log` VALUES (610, 1, 'admin/helpers/scaffold', 'GET', '172.18.28.209', '[]', '2020-04-12 03:02:24', '2020-04-12 03:02:24');
INSERT INTO `admin_operation_log` VALUES (611, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 03:02:56', '2020-04-12 03:02:56');
INSERT INTO `admin_operation_log` VALUES (612, 1, 'admin/goods/goods_search', 'GET', '172.18.28.209', '[]', '2020-04-12 03:03:11', '2020-04-12 03:03:11');
INSERT INTO `admin_operation_log` VALUES (613, 1, 'admin/goods/goods_group', 'GET', '172.18.28.209', '[]', '2020-04-12 03:03:14', '2020-04-12 03:03:14');
INSERT INTO `admin_operation_log` VALUES (614, 1, 'admin/goods/goods_search', 'GET', '172.18.28.209', '[]', '2020-04-12 03:03:19', '2020-04-12 03:03:19');
INSERT INTO `admin_operation_log` VALUES (615, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 03:03:23', '2020-04-12 03:03:23');
INSERT INTO `admin_operation_log` VALUES (616, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:03:36', '2020-04-12 03:03:36');
INSERT INTO `admin_operation_log` VALUES (617, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 03:04:12', '2020-04-12 03:04:12');
INSERT INTO `admin_operation_log` VALUES (618, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 03:04:16', '2020-04-12 03:04:16');
INSERT INTO `admin_operation_log` VALUES (619, 1, 'admin', 'GET', '172.18.28.209', '[]', '2020-04-12 03:09:31', '2020-04-12 03:09:31');
INSERT INTO `admin_operation_log` VALUES (620, 1, 'admin/dashboard', 'GET', '172.18.28.209', '[]', '2020-04-12 03:09:32', '2020-04-12 03:09:32');
INSERT INTO `admin_operation_log` VALUES (621, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 03:09:36', '2020-04-12 03:09:36');
INSERT INTO `admin_operation_log` VALUES (622, 1, 'admin', 'GET', '172.18.28.209', '[]', '2020-04-12 03:10:39', '2020-04-12 03:10:39');
INSERT INTO `admin_operation_log` VALUES (623, 1, 'admin/dashboard', 'GET', '172.18.28.209', '[]', '2020-04-12 03:10:39', '2020-04-12 03:10:39');
INSERT INTO `admin_operation_log` VALUES (624, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 03:10:42', '2020-04-12 03:10:42');
INSERT INTO `admin_operation_log` VALUES (625, 1, 'admin/auth/menu', 'GET', '172.18.28.209', '[]', '2020-04-12 03:11:04', '2020-04-12 03:11:04');
INSERT INTO `admin_operation_log` VALUES (626, 1, 'admin/auth/menu/29', 'DELETE', '172.18.28.209', '{\"_method\":\"delete\",\"_token\":\"oEWnAHvka6gODhOPNJDoowWs3Br0lJTVqkQ4KigT\"}', '2020-04-12 03:11:08', '2020-04-12 03:11:08');
INSERT INTO `admin_operation_log` VALUES (627, 1, 'admin/auth/menu', 'GET', '172.18.28.209', '{\"_pjax\":\"#pjax-container\"}', '2020-04-12 03:11:09', '2020-04-12 03:11:09');
INSERT INTO `admin_operation_log` VALUES (628, 1, 'admin', 'GET', '172.18.28.209', '[]', '2020-04-12 03:11:14', '2020-04-12 03:11:14');
INSERT INTO `admin_operation_log` VALUES (629, 1, 'admin/dashboard', 'GET', '172.18.28.209', '[]', '2020-04-12 03:11:15', '2020-04-12 03:11:15');
INSERT INTO `admin_operation_log` VALUES (630, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 03:11:17', '2020-04-12 03:11:17');
INSERT INTO `admin_operation_log` VALUES (631, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:11:19', '2020-04-12 03:11:19');
INSERT INTO `admin_operation_log` VALUES (632, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 03:15:32', '2020-04-12 03:15:32');
INSERT INTO `admin_operation_log` VALUES (633, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:15:34', '2020-04-12 03:15:34');
INSERT INTO `admin_operation_log` VALUES (634, 1, 'admin/goods/goods', 'POST', '172.18.28.209', '{\"title\":\"1\",\"price\":\"1.00\",\"discount\":\"1\",\"tags\":[null],\"stock\":\"0\",\"category_id\":\"1\",\"click_count\":\"1\",\"buy_count\":\"1\",\"start_time\":\"2020-04-12 00:00:00\",\"end_time\":\"2020-04-12 00:00:00\",\"send_time\":\"2020-04-12 00:00:00\",\"status\":\"on\",\"_token\":\"oEWnAHvka6gODhOPNJDoowWs3Br0lJTVqkQ4KigT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods\",\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:16:08', '2020-04-12 03:16:08');
INSERT INTO `admin_operation_log` VALUES (635, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:17:09', '2020-04-12 03:17:09');
INSERT INTO `admin_operation_log` VALUES (636, 1, 'admin/goods/goods', 'POST', '172.18.28.209', '{\"title\":\"1\",\"price\":\"1.00\",\"discount\":\"1\",\"tags\":[\"123123\",null],\"stock\":\"1\",\"category_id\":\"1\",\"click_count\":\"1\",\"buy_count\":\"1\",\"start_time\":\"2020-04-12 00:00:00\",\"end_time\":\"2020-04-12 00:00:00\",\"send_time\":\"2020-04-12 00:00:00\",\"status\":\"on\",\"_token\":\"oEWnAHvka6gODhOPNJDoowWs3Br0lJTVqkQ4KigT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods\\/create?_ifraem_id_=iframe__admin_goods_goods\",\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:19:20', '2020-04-12 03:19:20');
INSERT INTO `admin_operation_log` VALUES (637, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:19:21', '2020-04-12 03:19:21');
INSERT INTO `admin_operation_log` VALUES (638, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 03:20:34', '2020-04-12 03:20:34');
INSERT INTO `admin_operation_log` VALUES (639, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:20:36', '2020-04-12 03:20:36');
INSERT INTO `admin_operation_log` VALUES (640, 1, 'admin/goods/goods', 'POST', '172.18.28.209', '{\"title\":\"123\",\"_token\":\"oEWnAHvka6gODhOPNJDoowWs3Br0lJTVqkQ4KigT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods\",\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:20:43', '2020-04-12 03:20:43');
INSERT INTO `admin_operation_log` VALUES (641, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:20:44', '2020-04-12 03:20:44');
INSERT INTO `admin_operation_log` VALUES (642, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 03:21:08', '2020-04-12 03:21:08');
INSERT INTO `admin_operation_log` VALUES (643, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:21:09', '2020-04-12 03:21:09');
INSERT INTO `admin_operation_log` VALUES (644, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:21:13', '2020-04-12 03:21:13');
INSERT INTO `admin_operation_log` VALUES (645, 1, 'admin/goods/goods', 'POST', '172.18.28.209', '{\"title\":\"123\",\"_token\":\"oEWnAHvka6gODhOPNJDoowWs3Br0lJTVqkQ4KigT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods\",\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:21:20', '2020-04-12 03:21:20');
INSERT INTO `admin_operation_log` VALUES (646, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:21:21', '2020-04-12 03:21:21');
INSERT INTO `admin_operation_log` VALUES (647, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:21:50', '2020-04-12 03:21:50');
INSERT INTO `admin_operation_log` VALUES (648, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:22:08', '2020-04-12 03:22:08');
INSERT INTO `admin_operation_log` VALUES (649, 1, 'admin/goods/goods', 'POST', '172.18.28.209', '{\"title\":\"123123\",\"price\":\"1.00\",\"discount\":\"0.12\",\"tags\":[\"123\",null],\"_token\":\"oEWnAHvka6gODhOPNJDoowWs3Br0lJTVqkQ4KigT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods\",\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:22:27', '2020-04-12 03:22:27');
INSERT INTO `admin_operation_log` VALUES (650, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:22:28', '2020-04-12 03:22:28');
INSERT INTO `admin_operation_log` VALUES (651, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:22:43', '2020-04-12 03:22:43');
INSERT INTO `admin_operation_log` VALUES (652, 1, 'admin/goods/goods', 'POST', '172.18.28.209', '{\"title\":\"123123\",\"stock\":\"0\",\"_token\":\"oEWnAHvka6gODhOPNJDoowWs3Br0lJTVqkQ4KigT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods\",\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:22:51', '2020-04-12 03:22:51');
INSERT INTO `admin_operation_log` VALUES (653, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:22:53', '2020-04-12 03:22:53');
INSERT INTO `admin_operation_log` VALUES (654, 1, 'admin/goods/goods', 'POST', '172.18.28.209', '{\"title\":\"123123\",\"stock\":\"0\",\"_token\":\"oEWnAHvka6gODhOPNJDoowWs3Br0lJTVqkQ4KigT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods\\/create?_ifraem_id_=iframe__admin_goods_goods\",\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:24:03', '2020-04-12 03:24:03');
INSERT INTO `admin_operation_log` VALUES (655, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:24:04', '2020-04-12 03:24:04');
INSERT INTO `admin_operation_log` VALUES (656, 1, 'admin/goods/goods', 'POST', '172.18.28.209', '{\"title\":\"123123\",\"stock\":\"0\",\"_token\":\"oEWnAHvka6gODhOPNJDoowWs3Br0lJTVqkQ4KigT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods\\/create?_ifraem_id_=iframe__admin_goods_goods\",\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:25:30', '2020-04-12 03:25:30');
INSERT INTO `admin_operation_log` VALUES (657, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:25:32', '2020-04-12 03:25:32');
INSERT INTO `admin_operation_log` VALUES (658, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:27:07', '2020-04-12 03:27:07');
INSERT INTO `admin_operation_log` VALUES (659, 1, 'admin/goods/goods', 'POST', '172.18.28.209', '{\"category_id\":\"0\",\"click_count\":\"0\",\"buy_count\":\"0\",\"start_time\":null,\"end_time\":null,\"send_time\":null,\"_token\":\"oEWnAHvka6gODhOPNJDoowWs3Br0lJTVqkQ4KigT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods\",\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:27:11', '2020-04-12 03:27:11');
INSERT INTO `admin_operation_log` VALUES (660, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:27:12', '2020-04-12 03:27:12');
INSERT INTO `admin_operation_log` VALUES (661, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:27:31', '2020-04-12 03:27:31');
INSERT INTO `admin_operation_log` VALUES (662, 1, 'admin/goods/goods', 'POST', '172.18.28.209', '{\"category_id\":\"0\",\"click_count\":\"0\",\"buy_count\":\"0\",\"start_time\":null,\"end_time\":null,\"send_time\":null,\"_token\":\"oEWnAHvka6gODhOPNJDoowWs3Br0lJTVqkQ4KigT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods\",\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:27:47', '2020-04-12 03:27:47');
INSERT INTO `admin_operation_log` VALUES (663, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:27:48', '2020-04-12 03:27:48');
INSERT INTO `admin_operation_log` VALUES (664, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:28:05', '2020-04-12 03:28:05');
INSERT INTO `admin_operation_log` VALUES (665, 1, 'admin/goods/goods', 'POST', '172.18.28.209', '{\"tags\":[\"123123\",null],\"_token\":\"oEWnAHvka6gODhOPNJDoowWs3Br0lJTVqkQ4KigT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods\",\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:28:11', '2020-04-12 03:28:11');
INSERT INTO `admin_operation_log` VALUES (666, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:28:12', '2020-04-12 03:28:12');
INSERT INTO `admin_operation_log` VALUES (667, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 03:30:54', '2020-04-12 03:30:54');
INSERT INTO `admin_operation_log` VALUES (668, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:30:55', '2020-04-12 03:30:55');
INSERT INTO `admin_operation_log` VALUES (669, 1, 'admin/goods/goods', 'POST', '172.18.28.209', '{\"_token\":\"oEWnAHvka6gODhOPNJDoowWs3Br0lJTVqkQ4KigT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods\",\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:31:01', '2020-04-12 03:31:01');
INSERT INTO `admin_operation_log` VALUES (670, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:31:03', '2020-04-12 03:31:03');
INSERT INTO `admin_operation_log` VALUES (671, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 03:32:53', '2020-04-12 03:32:53');
INSERT INTO `admin_operation_log` VALUES (672, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:32:55', '2020-04-12 03:32:55');
INSERT INTO `admin_operation_log` VALUES (673, 1, 'admin/goods/goods', 'POST', '172.18.28.209', '{\"title\":\"1231\",\"price\":\"1.00\",\"discount\":\"0.6\",\"tags\":[\"123123\",null],\"stock\":\"1\",\"category_id\":\"1\",\"click_count\":\"1\",\"buy_count\":\"1\",\"start_time\":null,\"end_time\":null,\"send_time\":null,\"status\":\"off\",\"_token\":\"oEWnAHvka6gODhOPNJDoowWs3Br0lJTVqkQ4KigT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods\",\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:33:21', '2020-04-12 03:33:21');
INSERT INTO `admin_operation_log` VALUES (674, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:33:22', '2020-04-12 03:33:22');
INSERT INTO `admin_operation_log` VALUES (675, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:34:18', '2020-04-12 03:34:18');
INSERT INTO `admin_operation_log` VALUES (676, 1, 'admin/goods/goods', 'POST', '172.18.28.209', '{\"title\":\"1231\",\"price\":null,\"discount\":\"123\",\"tags\":[\"123\",null],\"stock\":\"0\",\"_token\":\"oEWnAHvka6gODhOPNJDoowWs3Br0lJTVqkQ4KigT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods\",\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:34:29', '2020-04-12 03:34:29');
INSERT INTO `admin_operation_log` VALUES (677, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 03:34:30', '2020-04-12 03:34:30');
INSERT INTO `admin_operation_log` VALUES (678, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '{\"_pjax\":\"#pjax-container\"}', '2020-04-12 03:34:31', '2020-04-12 03:34:31');
INSERT INTO `admin_operation_log` VALUES (679, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:35:01', '2020-04-12 03:35:01');
INSERT INTO `admin_operation_log` VALUES (680, 1, 'admin/goods/goods', 'POST', '172.18.28.209', '{\"title\":\"13213\",\"price\":\"12.00\",\"discount\":\"0.8\",\"tags\":[\"123\",null],\"stock\":\"1\",\"category_id\":\"2\",\"click_count\":\"2\",\"buy_count\":\"2\",\"start_time\":\"2020-04-09 23:59:59\",\"end_time\":\"2020-04-12 00:00:00\",\"send_time\":\"2020-04-12 00:00:00\",\"status\":\"on\",\"_token\":\"oEWnAHvka6gODhOPNJDoowWs3Br0lJTVqkQ4KigT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods\",\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:35:34', '2020-04-12 03:35:34');
INSERT INTO `admin_operation_log` VALUES (681, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 03:35:34', '2020-04-12 03:35:34');
INSERT INTO `admin_operation_log` VALUES (682, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '{\"_pjax\":\"#pjax-container\"}', '2020-04-12 03:35:35', '2020-04-12 03:35:35');
INSERT INTO `admin_operation_log` VALUES (683, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:37:11', '2020-04-12 03:37:11');
INSERT INTO `admin_operation_log` VALUES (684, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 03:37:18', '2020-04-12 03:37:18');
INSERT INTO `admin_operation_log` VALUES (685, 1, 'admin', 'GET', '172.18.28.209', '[]', '2020-04-12 03:37:21', '2020-04-12 03:37:21');
INSERT INTO `admin_operation_log` VALUES (686, 1, 'admin/dashboard', 'GET', '172.18.28.209', '[]', '2020-04-12 03:37:21', '2020-04-12 03:37:21');
INSERT INTO `admin_operation_log` VALUES (687, 1, 'admin', 'GET', '172.18.28.209', '[]', '2020-04-12 03:37:21', '2020-04-12 03:37:21');
INSERT INTO `admin_operation_log` VALUES (688, 1, 'admin/dashboard', 'GET', '172.18.28.209', '[]', '2020-04-12 03:37:22', '2020-04-12 03:37:22');
INSERT INTO `admin_operation_log` VALUES (689, 1, 'admin/user/user', 'GET', '172.18.28.209', '[]', '2020-04-12 03:37:24', '2020-04-12 03:37:24');
INSERT INTO `admin_operation_log` VALUES (690, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 03:37:28', '2020-04-12 03:37:28');
INSERT INTO `admin_operation_log` VALUES (691, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:37:30', '2020-04-12 03:37:30');
INSERT INTO `admin_operation_log` VALUES (692, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:38:12', '2020-04-12 03:38:12');
INSERT INTO `admin_operation_log` VALUES (693, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:38:15', '2020-04-12 03:38:15');
INSERT INTO `admin_operation_log` VALUES (694, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:39:35', '2020-04-12 03:39:35');
INSERT INTO `admin_operation_log` VALUES (695, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:40:47', '2020-04-12 03:40:47');
INSERT INTO `admin_operation_log` VALUES (696, 1, 'admin/goods/goods/1/edit', 'GET', '172.18.28.209', '{\"_pjax\":\"#pjax-container\"}', '2020-04-12 03:40:53', '2020-04-12 03:40:53');
INSERT INTO `admin_operation_log` VALUES (697, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:40:56', '2020-04-12 03:40:56');
INSERT INTO `admin_operation_log` VALUES (698, 1, 'admin/goods/goods', 'POST', '172.18.28.209', '{\"title\":\"12313\",\"price\":null,\"discount\":\"0.1\",\"tags\":[\"1231\",null],\"stock\":\"2\",\"_file_sort_\":{\"details\":null},\"category_id\":\"1\",\"click_count\":\"0\",\"buy_count\":\"0\",\"start_time\":null,\"end_time\":null,\"send_time\":null,\"status\":\"off\",\"_token\":\"oEWnAHvka6gODhOPNJDoowWs3Br0lJTVqkQ4KigT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods\\/1\\/edit\",\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:41:22', '2020-04-12 03:41:22');
INSERT INTO `admin_operation_log` VALUES (699, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:41:23', '2020-04-12 03:41:23');
INSERT INTO `admin_operation_log` VALUES (700, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:42:00', '2020-04-12 03:42:00');
INSERT INTO `admin_operation_log` VALUES (701, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '{\"_pjax\":\"#pjax-container\"}', '2020-04-12 03:43:21', '2020-04-12 03:43:21');
INSERT INTO `admin_operation_log` VALUES (702, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:43:23', '2020-04-12 03:43:23');
INSERT INTO `admin_operation_log` VALUES (703, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:44:00', '2020-04-12 03:44:00');
INSERT INTO `admin_operation_log` VALUES (704, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:44:19', '2020-04-12 03:44:19');
INSERT INTO `admin_operation_log` VALUES (705, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:44:49', '2020-04-12 03:44:49');
INSERT INTO `admin_operation_log` VALUES (706, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:45:20', '2020-04-12 03:45:20');
INSERT INTO `admin_operation_log` VALUES (707, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:48:19', '2020-04-12 03:48:19');
INSERT INTO `admin_operation_log` VALUES (708, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:51:00', '2020-04-12 03:51:00');
INSERT INTO `admin_operation_log` VALUES (709, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:51:45', '2020-04-12 03:51:45');
INSERT INTO `admin_operation_log` VALUES (710, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:51:49', '2020-04-12 03:51:49');
INSERT INTO `admin_operation_log` VALUES (711, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:53:13', '2020-04-12 03:53:13');
INSERT INTO `admin_operation_log` VALUES (712, 1, 'admin/goods/goods', 'POST', '172.18.28.209', '{\"title\":\"123123\",\"price\":\"12.00\",\"discount\":\"7\",\"tags\":[\"123123\",null],\"stock\":\"2\",\"_file_sort_\":{\"details\":null},\"category_id\":\"1\",\"click_count\":\"1\",\"buy_count\":\"1\",\"start_time\":\"2020-04-12 00:00:00\",\"end_time\":\"2020-04-12 00:00:00\",\"send_time\":\"2020-04-12 00:00:00\",\"status\":\"on\",\"_token\":\"oEWnAHvka6gODhOPNJDoowWs3Br0lJTVqkQ4KigT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods\",\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:54:06', '2020-04-12 03:54:06');
INSERT INTO `admin_operation_log` VALUES (713, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 03:54:07', '2020-04-12 03:54:07');
INSERT INTO `admin_operation_log` VALUES (714, 1, 'admin/_handle_action_', 'POST', '172.18.28.209', '{\"_key\":\"1\",\"_model\":\"App_Models_Goods_Goods\",\"_token\":\"oEWnAHvka6gODhOPNJDoowWs3Br0lJTVqkQ4KigT\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2020-04-12 03:57:46', '2020-04-12 03:57:46');
INSERT INTO `admin_operation_log` VALUES (715, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '{\"_pjax\":\"#pjax-container\"}', '2020-04-12 03:57:46', '2020-04-12 03:57:46');
INSERT INTO `admin_operation_log` VALUES (716, 1, 'admin/_handle_action_', 'POST', '172.18.28.209', '{\"_key\":\"2\",\"_model\":\"App_Models_Goods_Goods\",\"_token\":\"oEWnAHvka6gODhOPNJDoowWs3Br0lJTVqkQ4KigT\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2020-04-12 03:57:50', '2020-04-12 03:57:50');
INSERT INTO `admin_operation_log` VALUES (717, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '{\"_pjax\":\"#pjax-container\"}', '2020-04-12 03:59:31', '2020-04-12 03:59:31');
INSERT INTO `admin_operation_log` VALUES (718, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 04:00:27', '2020-04-12 04:00:27');
INSERT INTO `admin_operation_log` VALUES (719, 1, 'admin/goods/goods_search', 'GET', '172.18.28.209', '[]', '2020-04-12 04:00:29', '2020-04-12 04:00:29');
INSERT INTO `admin_operation_log` VALUES (720, 1, 'admin/_handle_action_', 'POST', '172.18.28.209', '{\"_key\":\"1\",\"_model\":\"App_Models_Goods_GoodsSearch\",\"_token\":\"oEWnAHvka6gODhOPNJDoowWs3Br0lJTVqkQ4KigT\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2020-04-12 04:00:33', '2020-04-12 04:00:33');
INSERT INTO `admin_operation_log` VALUES (721, 1, 'admin/goods/goods_search', 'GET', '172.18.28.209', '{\"_pjax\":\"#pjax-container\"}', '2020-04-12 04:00:33', '2020-04-12 04:00:33');
INSERT INTO `admin_operation_log` VALUES (722, 1, 'admin/_handle_action_', 'POST', '172.18.28.209', '{\"_key\":\"2\",\"_model\":\"App_Models_Goods_GoodsSearch\",\"_token\":\"oEWnAHvka6gODhOPNJDoowWs3Br0lJTVqkQ4KigT\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2020-04-12 04:00:37', '2020-04-12 04:00:37');
INSERT INTO `admin_operation_log` VALUES (723, 1, 'admin/goods/goods_search', 'GET', '172.18.28.209', '{\"_pjax\":\"#pjax-container\"}', '2020-04-12 04:00:37', '2020-04-12 04:00:37');
INSERT INTO `admin_operation_log` VALUES (724, 1, 'admin/_handle_action_', 'POST', '172.18.28.209', '{\"_key\":\"2\",\"_model\":\"App_Models_Goods_GoodsSearch\",\"_token\":\"oEWnAHvka6gODhOPNJDoowWs3Br0lJTVqkQ4KigT\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2020-04-12 04:00:41', '2020-04-12 04:00:41');
INSERT INTO `admin_operation_log` VALUES (725, 1, 'admin/_handle_action_', 'POST', '172.18.28.209', '{\"_key\":\"4\",\"_model\":\"App_Models_Goods_GoodsSearch\",\"_token\":\"oEWnAHvka6gODhOPNJDoowWs3Br0lJTVqkQ4KigT\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2020-04-12 04:00:47', '2020-04-12 04:00:47');
INSERT INTO `admin_operation_log` VALUES (726, 1, 'admin/goods/goods_search', 'GET', '172.18.28.209', '{\"_pjax\":\"#pjax-container\"}', '2020-04-12 04:00:48', '2020-04-12 04:00:48');
INSERT INTO `admin_operation_log` VALUES (727, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 04:00:53', '2020-04-12 04:00:53');
INSERT INTO `admin_operation_log` VALUES (728, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 04:00:55', '2020-04-12 04:00:55');
INSERT INTO `admin_operation_log` VALUES (729, 1, 'admin/goods/goods', 'POST', '172.18.28.209', '{\"title\":\"\\u72d7\\u5b50\",\"price\":\"988.00\",\"discount\":\"8\",\"tags\":[\"\\u70ed\\u9500\",\"\\u65b0\\u54c1\",null],\"stock\":\"5\",\"_file_sort_\":{\"details\":null},\"category_id\":\"1\",\"click_count\":\"0\",\"buy_count\":\"0\",\"start_time\":null,\"end_time\":null,\"send_time\":null,\"status\":\"off\",\"_token\":\"oEWnAHvka6gODhOPNJDoowWs3Br0lJTVqkQ4KigT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods\",\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 04:02:19', '2020-04-12 04:02:19');
INSERT INTO `admin_operation_log` VALUES (730, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 04:02:19', '2020-04-12 04:02:19');
INSERT INTO `admin_operation_log` VALUES (731, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '{\"_pjax\":\"#pjax-container\"}', '2020-04-12 04:02:20', '2020-04-12 04:02:20');
INSERT INTO `admin_operation_log` VALUES (732, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 04:02:32', '2020-04-12 04:02:32');
INSERT INTO `admin_operation_log` VALUES (733, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 04:03:49', '2020-04-12 04:03:49');
INSERT INTO `admin_operation_log` VALUES (734, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 04:05:53', '2020-04-12 04:05:53');
INSERT INTO `admin_operation_log` VALUES (735, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 04:05:56', '2020-04-12 04:05:56');
INSERT INTO `admin_operation_log` VALUES (736, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 04:08:14', '2020-04-12 04:08:14');
INSERT INTO `admin_operation_log` VALUES (737, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 04:08:17', '2020-04-12 04:08:17');
INSERT INTO `admin_operation_log` VALUES (738, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 04:08:52', '2020-04-12 04:08:52');
INSERT INTO `admin_operation_log` VALUES (739, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 04:08:56', '2020-04-12 04:08:56');
INSERT INTO `admin_operation_log` VALUES (740, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 04:09:17', '2020-04-12 04:09:17');
INSERT INTO `admin_operation_log` VALUES (741, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 04:09:44', '2020-04-12 04:09:44');
INSERT INTO `admin_operation_log` VALUES (742, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 04:10:25', '2020-04-12 04:10:25');
INSERT INTO `admin_operation_log` VALUES (743, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 04:10:28', '2020-04-12 04:10:28');
INSERT INTO `admin_operation_log` VALUES (744, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 04:10:50', '2020-04-12 04:10:50');
INSERT INTO `admin_operation_log` VALUES (745, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 04:11:24', '2020-04-12 04:11:24');
INSERT INTO `admin_operation_log` VALUES (746, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 04:12:57', '2020-04-12 04:12:57');
INSERT INTO `admin_operation_log` VALUES (747, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 04:15:09', '2020-04-12 04:15:09');
INSERT INTO `admin_operation_log` VALUES (748, 1, 'admin/goods/goods/5/edit', 'GET', '172.18.28.209', '{\"_pjax\":\"#pjax-container\"}', '2020-04-12 04:15:41', '2020-04-12 04:15:41');
INSERT INTO `admin_operation_log` VALUES (749, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 04:16:33', '2020-04-12 04:16:33');
INSERT INTO `admin_operation_log` VALUES (750, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 04:16:36', '2020-04-12 04:16:36');
INSERT INTO `admin_operation_log` VALUES (751, 1, 'admin/goods/goods/4/edit', 'GET', '172.18.28.209', '{\"_pjax\":\"#pjax-container\"}', '2020-04-12 04:16:40', '2020-04-12 04:16:40');
INSERT INTO `admin_operation_log` VALUES (752, 1, 'admin/goods/goods/4', 'PUT', '172.18.28.209', '{\"title\":\"\\u72d7\\u5b50\\u72d7\\u5b50\\u72d7\\u5b50\\u72d7\\u5b50\",\"price\":\"988.00\",\"discount\":\"7\",\"tags\":[\"\\u70ed\\u9500\",\"\\u65b0\\u54c1\",null],\"stock\":\"5\",\"_file_sort_\":{\"details\":null},\"category_id\":\"2\",\"click_count\":\"0\",\"buy_count\":\"0\",\"start_time\":null,\"end_time\":null,\"send_time\":null,\"status\":\"off\",\"_token\":\"oEWnAHvka6gODhOPNJDoowWs3Br0lJTVqkQ4KigT\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods\"}', '2020-04-12 04:16:51', '2020-04-12 04:16:51');
INSERT INTO `admin_operation_log` VALUES (753, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 04:16:51', '2020-04-12 04:16:51');
INSERT INTO `admin_operation_log` VALUES (754, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 04:17:35', '2020-04-12 04:17:35');
INSERT INTO `admin_operation_log` VALUES (755, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 04:17:39', '2020-04-12 04:17:39');
INSERT INTO `admin_operation_log` VALUES (756, 1, 'admin/goods/goods/5/edit', 'GET', '172.18.28.209', '{\"_pjax\":\"#pjax-container\"}', '2020-04-12 04:17:54', '2020-04-12 04:17:54');
INSERT INTO `admin_operation_log` VALUES (757, 1, 'admin/goods/goods/5', 'PUT', '172.18.28.209', '{\"title\":\"\\u72d7\\u5b50\\u72d7\\u5b50\\u72d7\\u5b50\\u72d7\\u5b50\",\"price\":\"988.00\",\"discount\":\"7\",\"tags\":[\"\\u70ed\\u9500\",\"\\u65b0\\u54c1\",null],\"stock\":\"5\",\"_file_sort_\":{\"details\":null},\"category_id\":\"2\",\"click_count\":\"0\",\"buy_count\":\"0\",\"start_time\":null,\"end_time\":null,\"send_time\":null,\"status\":\"off\",\"_token\":\"oEWnAHvka6gODhOPNJDoowWs3Br0lJTVqkQ4KigT\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods\"}', '2020-04-12 04:18:06', '2020-04-12 04:18:06');
INSERT INTO `admin_operation_log` VALUES (758, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 04:18:06', '2020-04-12 04:18:06');
INSERT INTO `admin_operation_log` VALUES (759, 1, 'admin/goods/goods/3/edit', 'GET', '172.18.28.209', '{\"_pjax\":\"#pjax-container\"}', '2020-04-12 04:18:11', '2020-04-12 04:18:11');
INSERT INTO `admin_operation_log` VALUES (760, 1, 'admin/goods/goods/3', 'PUT', '172.18.28.209', '{\"title\":\"\\u72d7\\u5b50\",\"price\":\"988.00\",\"discount\":\"9\",\"tags\":[\"\\u70ed\\u9500\",\"\\u65b0\\u54c1\",null],\"stock\":\"5\",\"_file_sort_\":{\"details\":null},\"category_id\":\"1\",\"click_count\":\"0\",\"buy_count\":\"0\",\"start_time\":null,\"end_time\":null,\"send_time\":null,\"status\":\"on\",\"_token\":\"oEWnAHvka6gODhOPNJDoowWs3Br0lJTVqkQ4KigT\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods\"}', '2020-04-12 04:18:15', '2020-04-12 04:18:15');
INSERT INTO `admin_operation_log` VALUES (761, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 04:18:16', '2020-04-12 04:18:16');
INSERT INTO `admin_operation_log` VALUES (762, 1, 'admin/goods/goods/4/edit', 'GET', '172.18.28.209', '{\"_pjax\":\"#pjax-container\"}', '2020-04-12 04:18:20', '2020-04-12 04:18:20');
INSERT INTO `admin_operation_log` VALUES (763, 1, 'admin/goods/goods/4', 'PUT', '172.18.28.209', '{\"title\":\"\\u72d7\\u5b50\\u72d7\\u5b50\\u72d7\\u5b50\\u72d7\\u5b50\",\"price\":\"988.00\",\"discount\":\"9\",\"tags\":[\"\\u70ed\\u9500\",\"\\u65b0\\u54c1\",null],\"stock\":\"5\",\"_file_sort_\":{\"details\":null},\"category_id\":\"2\",\"click_count\":\"0\",\"buy_count\":\"0\",\"start_time\":null,\"end_time\":null,\"send_time\":null,\"status\":\"on\",\"_token\":\"oEWnAHvka6gODhOPNJDoowWs3Br0lJTVqkQ4KigT\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods\"}', '2020-04-12 04:18:24', '2020-04-12 04:18:24');
INSERT INTO `admin_operation_log` VALUES (764, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 04:18:24', '2020-04-12 04:18:24');
INSERT INTO `admin_operation_log` VALUES (765, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 04:19:02', '2020-04-12 04:19:02');
INSERT INTO `admin_operation_log` VALUES (766, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 04:19:06', '2020-04-12 04:19:06');
INSERT INTO `admin_operation_log` VALUES (767, 1, 'admin/goods/goods/5/edit', 'GET', '172.18.28.209', '{\"_pjax\":\"#pjax-container\"}', '2020-04-12 04:19:10', '2020-04-12 04:19:10');
INSERT INTO `admin_operation_log` VALUES (768, 1, 'admin/goods/goods/5', 'PUT', '172.18.28.209', '{\"title\":\"\\u72d7\\u5b50\\u72d7\\u5b50\\u72d7\\u5b50\\u72d7\\u5b50\",\"price\":\"988.00\",\"discount\":\"8\",\"tags\":[\"\\u70ed\\u9500\",\"\\u65b0\\u54c1\",null],\"stock\":\"5\",\"_file_sort_\":{\"details\":null},\"category_id\":\"2\",\"click_count\":\"0\",\"buy_count\":\"0\",\"start_time\":null,\"end_time\":null,\"send_time\":null,\"status\":\"on\",\"_token\":\"oEWnAHvka6gODhOPNJDoowWs3Br0lJTVqkQ4KigT\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods\"}', '2020-04-12 04:19:20', '2020-04-12 04:19:20');
INSERT INTO `admin_operation_log` VALUES (769, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 04:19:20', '2020-04-12 04:19:20');
INSERT INTO `admin_operation_log` VALUES (770, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '{\"_sort\":{\"column\":\"stock\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2020-04-12 04:20:01', '2020-04-12 04:20:01');
INSERT INTO `admin_operation_log` VALUES (771, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '{\"_sort\":{\"column\":\"stock\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2020-04-12 04:20:03', '2020-04-12 04:20:03');
INSERT INTO `admin_operation_log` VALUES (772, 1, 'admin/goods/goods/3/edit', 'GET', '172.18.28.209', '{\"_pjax\":\"#pjax-container\"}', '2020-04-12 04:20:24', '2020-04-12 04:20:24');
INSERT INTO `admin_operation_log` VALUES (773, 1, 'admin/goods/goods/3', 'PUT', '172.18.28.209', '{\"title\":\"\\u72d7\\u5b50\",\"price\":\"988.00\",\"discount\":\"9\",\"tags\":[\"\\u70ed\\u9500\",\"\\u65b0\\u54c1\",null],\"stock\":\"5\",\"_file_sort_\":{\"details\":null},\"category_id\":\"1\",\"click_count\":\"0\",\"buy_count\":\"0\",\"start_time\":null,\"end_time\":null,\"send_time\":null,\"status\":\"on\",\"_token\":\"oEWnAHvka6gODhOPNJDoowWs3Br0lJTVqkQ4KigT\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods?_sort%5Bcolumn%5D=stock&_sort%5Btype%5D=asc\"}', '2020-04-12 04:20:31', '2020-04-12 04:20:31');
INSERT INTO `admin_operation_log` VALUES (774, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '{\"_sort\":{\"column\":\"stock\",\"type\":\"asc\"}}', '2020-04-12 04:20:31', '2020-04-12 04:20:31');
INSERT INTO `admin_operation_log` VALUES (775, 1, 'admin/goods/goods/3/edit', 'GET', '172.18.28.209', '{\"_pjax\":\"#pjax-container\"}', '2020-04-12 04:21:35', '2020-04-12 04:21:35');
INSERT INTO `admin_operation_log` VALUES (776, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '{\"_pjax\":\"#pjax-container\"}', '2020-04-12 04:24:42', '2020-04-12 04:24:42');
INSERT INTO `admin_operation_log` VALUES (777, 1, 'admin/goods/goods/7/edit', 'GET', '172.18.28.209', '{\"_pjax\":\"#pjax-container\"}', '2020-04-12 04:24:49', '2020-04-12 04:24:49');
INSERT INTO `admin_operation_log` VALUES (778, 1, 'admin/goods/goods/7', 'PUT', '172.18.28.209', '{\"title\":\"\\u72d7\\u5b50\\u72d7\\u5b50\\u72d7\\u5b50\\u72d7\\u5b50\",\"price\":\"988.00\",\"discount\":\"6;9\",\"tags\":[\"\\u70ed\\u9500\",\"\\u65b0\\u54c1\",null],\"stock\":\"5\",\"_file_sort_\":{\"details\":null},\"category_id\":\"1\",\"click_count\":\"0\",\"buy_count\":\"0\",\"start_time\":null,\"end_time\":null,\"send_time\":null,\"status\":\"on\",\"_token\":\"oEWnAHvka6gODhOPNJDoowWs3Br0lJTVqkQ4KigT\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods\"}', '2020-04-12 04:25:00', '2020-04-12 04:25:00');
INSERT INTO `admin_operation_log` VALUES (779, 1, 'admin/goods/goods/7/edit', 'GET', '172.18.28.209', '[]', '2020-04-12 04:25:01', '2020-04-12 04:25:01');
INSERT INTO `admin_operation_log` VALUES (780, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '{\"_pjax\":\"#pjax-container\"}', '2020-04-12 04:25:25', '2020-04-12 04:25:25');
INSERT INTO `admin_operation_log` VALUES (781, 1, 'admin/goods/goods/3', 'GET', '172.18.28.209', '{\"_pjax\":\"#pjax-container\"}', '2020-04-12 04:25:29', '2020-04-12 04:25:29');
INSERT INTO `admin_operation_log` VALUES (782, 1, 'admin/goods/goods/3', 'GET', '172.18.28.209', '[]', '2020-04-12 04:25:31', '2020-04-12 04:25:31');
INSERT INTO `admin_operation_log` VALUES (783, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 04:25:39', '2020-04-12 04:25:39');
INSERT INTO `admin_operation_log` VALUES (784, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 04:27:03', '2020-04-12 04:27:03');
INSERT INTO `admin_operation_log` VALUES (785, 1, 'admin/goods/goods', 'POST', '172.18.28.209', '{\"title\":\"123\",\"price\":null,\"discount\":\"9\",\"tags\":[\"1231\",null],\"stock\":\"0\",\"_file_sort_\":{\"details\":null},\"category_id\":\"1\",\"click_count\":\"0\",\"buy_count\":\"0\",\"start_time\":null,\"end_time\":null,\"send_time\":null,\"status\":\"off\",\"_token\":\"oEWnAHvka6gODhOPNJDoowWs3Br0lJTVqkQ4KigT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods\",\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 04:27:47', '2020-04-12 04:27:47');
INSERT INTO `admin_operation_log` VALUES (786, 1, 'admin/goods/goods/create', 'GET', '172.18.28.209', '{\"_ifraem_id_\":\"iframe__admin_goods_goods\"}', '2020-04-12 04:27:48', '2020-04-12 04:27:48');
INSERT INTO `admin_operation_log` VALUES (787, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 04:29:32', '2020-04-12 04:29:32');
INSERT INTO `admin_operation_log` VALUES (788, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 04:50:03', '2020-04-12 04:50:03');
INSERT INTO `admin_operation_log` VALUES (789, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '{\"id\":null,\"title\":null,\"tags\":null,\"category_id\":\"3\",\"status\":null,\"_pjax\":\"#pjax-container\"}', '2020-04-12 04:50:13', '2020-04-12 04:50:13');
INSERT INTO `admin_operation_log` VALUES (790, 1, 'admin/goods/goods/7/edit', 'GET', '172.18.28.209', '{\"_pjax\":\"#pjax-container\"}', '2020-04-12 06:14:14', '2020-04-12 06:14:14');
INSERT INTO `admin_operation_log` VALUES (791, 1, 'admin/goods/goods/7', 'PUT', '172.18.28.209', '{\"title\":\"\\u72d7\\u5b50\\u72d7\\u5b50\\u72d7\\u5b50\\u72d7\\u5b50\",\"price\":\"988.00\",\"discount\":\"0.9\",\"tags\":[\"\\u70ed\\u9500\",\"\\u65b0\\u54c1\",null],\"stock\":\"5\",\"_file_sort_\":{\"details\":null},\"category_id\":\"3\",\"click_count\":\"0\",\"buy_count\":\"0\",\"start_time\":\"2020-04-12 12:49:34\",\"end_time\":\"2020-04-15 12:49:38\",\"send_time\":\"2020-04-16 12:49:43\",\"status\":\"on\",\"_token\":\"oEWnAHvka6gODhOPNJDoowWs3Br0lJTVqkQ4KigT\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.laravel.local\\/admin\\/goods\\/goods?id=&title=&tags=&category_id=3&status=\"}', '2020-04-12 06:14:26', '2020-04-12 06:14:26');
INSERT INTO `admin_operation_log` VALUES (792, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '{\"id\":null,\"title\":null,\"tags\":null,\"category_id\":\"3\",\"status\":null}', '2020-04-12 06:14:27', '2020-04-12 06:14:27');
INSERT INTO `admin_operation_log` VALUES (793, 1, 'admin/helpers/scaffold', 'GET', '172.18.28.209', '[]', '2020-04-12 06:29:40', '2020-04-12 06:29:40');
INSERT INTO `admin_operation_log` VALUES (794, 1, 'admin', 'GET', '172.18.28.209', '[]', '2020-04-12 06:29:46', '2020-04-12 06:29:46');
INSERT INTO `admin_operation_log` VALUES (795, 1, 'admin/dashboard', 'GET', '172.18.28.209', '[]', '2020-04-12 06:29:46', '2020-04-12 06:29:46');
INSERT INTO `admin_operation_log` VALUES (796, 1, 'admin/helpers/scaffold', 'GET', '172.18.28.209', '[]', '2020-04-12 06:29:50', '2020-04-12 06:29:50');
INSERT INTO `admin_operation_log` VALUES (797, 1, 'admin/helpers/scaffold', 'GET', '172.18.28.209', '[]', '2020-04-12 06:30:01', '2020-04-12 06:30:01');
INSERT INTO `admin_operation_log` VALUES (798, 1, 'admin/helpers/scaffold', 'GET', '172.18.28.209', '[]', '2020-04-12 06:30:03', '2020-04-12 06:30:03');
INSERT INTO `admin_operation_log` VALUES (799, 1, 'admin/helpers/scaffold', 'POST', '172.18.28.209', '{\"table_name\":\"goods_cart\",\"model_name\":\"App\\\\Models\\\\Goods\\\\GoodsCart\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\Goods\\\\GoodsCartController\",\"create\":[\"migration\",\"model\",\"controller\",\"migrate\"],\"fields\":[{\"name\":\"user_id\",\"type\":\"integer\",\"key\":null,\"default\":null,\"comment\":\"\\u7528\\u6237ID\"},{\"name\":\"goods_id\",\"type\":\"integer\",\"key\":null,\"default\":null,\"comment\":\"\\u5546\\u54c1ID\"},{\"name\":\"num\",\"type\":\"integer\",\"key\":null,\"default\":null,\"comment\":\"\\u6570\\u91cf\"},{\"name\":\"sku\",\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"oEWnAHvka6gODhOPNJDoowWs3Br0lJTVqkQ4KigT\"}', '2020-04-12 06:31:30', '2020-04-12 06:31:30');
INSERT INTO `admin_operation_log` VALUES (800, 1, 'admin/helpers/scaffold', 'GET', '172.18.28.209', '[]', '2020-04-12 06:31:31', '2020-04-12 06:31:31');
INSERT INTO `admin_operation_log` VALUES (801, 1, 'admin', 'GET', '172.18.28.209', '[]', '2020-04-12 06:43:16', '2020-04-12 06:43:16');
INSERT INTO `admin_operation_log` VALUES (802, 1, 'admin/dashboard', 'GET', '172.18.28.209', '[]', '2020-04-12 06:43:17', '2020-04-12 06:43:17');
INSERT INTO `admin_operation_log` VALUES (803, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 09:16:10', '2020-04-12 09:16:10');
INSERT INTO `admin_operation_log` VALUES (804, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 09:16:21', '2020-04-12 09:16:21');
INSERT INTO `admin_operation_log` VALUES (805, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 09:16:57', '2020-04-12 09:16:57');
INSERT INTO `admin_operation_log` VALUES (806, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 09:17:01', '2020-04-12 09:17:01');
INSERT INTO `admin_operation_log` VALUES (807, 1, 'admin/user/user', 'GET', '172.18.28.209', '[]', '2020-04-12 09:18:06', '2020-04-12 09:18:06');
INSERT INTO `admin_operation_log` VALUES (808, 1, 'admin/user/user', 'GET', '172.18.28.209', '[]', '2020-04-12 09:18:10', '2020-04-12 09:18:10');
INSERT INTO `admin_operation_log` VALUES (809, 1, 'admin/goods/goods', 'GET', '172.18.28.209', '[]', '2020-04-12 09:18:15', '2020-04-12 09:18:15');
INSERT INTO `admin_operation_log` VALUES (810, 1, 'admin/goods/goods_search', 'GET', '172.18.28.209', '[]', '2020-04-12 09:18:16', '2020-04-12 09:18:16');

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `http_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_permissions_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `admin_permissions_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES (1, 'All permission', '*', '', '*', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (6, 'Admin helpers', 'ext.helpers', '', '/helpers/*', '2020-04-09 15:47:05', '2020-04-09 15:47:05');
INSERT INTO `admin_permissions` VALUES (7, 'Logs', 'ext.log-viewer', '', '/logs*', '2020-04-09 15:47:57', '2020-04-09 15:47:57');
INSERT INTO `admin_permissions` VALUES (8, 'Redis Manager', 'ext.redis-manager', '', '/redis*', '2020-04-09 15:49:04', '2020-04-09 15:49:04');
INSERT INTO `admin_permissions` VALUES (9, 'Tab-dashboard', 'tabs.dashboard', '', '/dashboard', '2020-04-09 15:50:47', '2020-04-09 15:50:47');

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu`  (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  INDEX `admin_role_menu_role_id_menu_id_index`(`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------
INSERT INTO `admin_role_menu` VALUES (1, 2, NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions`  (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  INDEX `admin_role_permissions_role_id_permission_id_index`(`role_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
INSERT INTO `admin_role_permissions` VALUES (1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users`  (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  INDEX `admin_role_users_role_id_user_id_index`(`role_id`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
INSERT INTO `admin_role_users` VALUES (1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_roles_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `admin_roles_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES (1, 'Administrator', 'administrator', '2020-04-09 15:45:15', '2020-04-09 15:45:15');

-- ----------------------------
-- Table structure for admin_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_permissions`;
CREATE TABLE `admin_user_permissions`  (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  INDEX `admin_user_permissions_user_id_permission_id_index`(`user_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_users_username_unique`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES (1, 'admin', '$2y$10$x3iFyaV6QngZX0kQWnW.z.B5UEiRLATZx0DaY7KlMKToBJDxRDgZy', 'Administrator', NULL, 'n9GAQxB1KycZC7cDAJRILmBKO2xWtKKwvgS4VTx4mS73akHtozdETB33xOzU', '2020-04-09 15:45:15', '2020-04-09 15:45:15');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品名称',
  `img` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '展示图',
  `price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '价格',
  `discount` float(8, 2) NOT NULL COMMENT '折扣',
  `tags` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标签',
  `stock` int(11) NOT NULL DEFAULT 0 COMMENT '商品库存',
  `sku` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '商品sku',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '详情',
  `click_count` int(11) NOT NULL DEFAULT 0 COMMENT '查看次数',
  `buy_count` int(11) NOT NULL DEFAULT 0 COMMENT '购买次数',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态：0：未上架：1：上架中',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `send_time` datetime NULL DEFAULT NULL COMMENT '发货时间',
  `category_id` int(11) NOT NULL DEFAULT 0 COMMENT '分类ID',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (3, '狗子', 'images/63942da4135e9c59d07064d4e6d100b2.jpg', '988', 0.90, '热销,新品', 5, NULL, 'images/b6645147da9dd41af019afd41dec9c69.jpg,images/b92edb5a81016e3b32f14b95e43a73c3.jpg,images/fab50dcc0db79e8a045b36a818900dd5.jpg', 0, 0, 1, NULL, NULL, NULL, 1, '2020-04-12 04:02:19', '2020-04-12 04:20:31');
INSERT INTO `goods` VALUES (4, '狗子狗子狗子狗子', 'images/63942da4135e9c59d07064d4e6d100b2.jpg', '988', 0.90, '热销,新品', 5, NULL, 'images/b6645147da9dd41af019afd41dec9c69.jpg,images/b92edb5a81016e3b32f14b95e43a73c3.jpg,images/fab50dcc0db79e8a045b36a818900dd5.jpg', 0, 0, 1, '2020-04-12 12:49:02', '2020-04-13 12:49:05', NULL, 2, '2020-04-12 04:02:19', '2020-04-12 04:18:24');
INSERT INTO `goods` VALUES (5, '狗子狗子狗子狗子', 'images/63942da4135e9c59d07064d4e6d100b2.jpg', '988', 0.90, '热销,新品', 5, NULL, 'images/b6645147da9dd41af019afd41dec9c69.jpg,images/b92edb5a81016e3b32f14b95e43a73c3.jpg,images/fab50dcc0db79e8a045b36a818900dd5.jpg', 0, 0, 1, '2020-04-12 12:49:12', '2020-04-13 12:49:15', NULL, 2, '2020-04-12 04:02:19', '2020-04-12 04:19:20');
INSERT INTO `goods` VALUES (6, '狗子狗子狗子狗子', 'images/63942da4135e9c59d07064d4e6d100b2.jpg', '988', 0.90, '热销,新品', 5, NULL, 'images/b6645147da9dd41af019afd41dec9c69.jpg,images/b92edb5a81016e3b32f14b95e43a73c3.jpg,images/fab50dcc0db79e8a045b36a818900dd5.jpg', 0, 0, 1, '2020-04-12 12:49:19', '2020-04-14 12:49:25', '2020-04-15 12:49:29', 3, '2020-04-12 04:02:19', '2020-04-12 04:02:19');
INSERT INTO `goods` VALUES (7, '狗子狗子狗子狗子', 'images/63942da4135e9c59d07064d4e6d100b2.jpg', '988', 0.90, '热销,新品', 5, NULL, 'images/b6645147da9dd41af019afd41dec9c69.jpg,images/b92edb5a81016e3b32f14b95e43a73c3.jpg,images/fab50dcc0db79e8a045b36a818900dd5.jpg,images/2272e21e453fc49f2452dd2143047444.jpg', 0, 0, 1, '2020-04-12 12:49:34', '2020-04-15 12:49:38', '2020-04-16 12:49:43', 3, '2020-04-12 04:02:19', '2020-04-12 06:14:26');
INSERT INTO `goods` VALUES (8, '狗子狗子狗子狗子', 'images/63942da4135e9c59d07064d4e6d100b2.jpg', '988', 0.90, '4月专属礼品', 5, NULL, 'images/b6645147da9dd41af019afd41dec9c69.jpg,images/b92edb5a81016e3b32f14b95e43a73c3.jpg,images/fab50dcc0db79e8a045b36a818900dd5.jpg', 0, 0, 1, NULL, NULL, NULL, 4, '2020-04-12 04:02:19', '2020-04-12 04:02:19');
INSERT INTO `goods` VALUES (9, '狗子狗子狗子狗子', 'images/63942da4135e9c59d07064d4e6d100b2.jpg', '988', 0.90, '4月专属礼品', 5, NULL, 'images/b6645147da9dd41af019afd41dec9c69.jpg,images/b92edb5a81016e3b32f14b95e43a73c3.jpg,images/fab50dcc0db79e8a045b36a818900dd5.jpg', 0, 0, 1, NULL, NULL, NULL, 4, '2020-04-12 04:02:19', '2020-04-12 04:02:19');
INSERT INTO `goods` VALUES (10, '狗子狗子狗子狗子', 'images/63942da4135e9c59d07064d4e6d100b2.jpg', '988', 0.90, '4月专属礼品', 5, NULL, 'images/b6645147da9dd41af019afd41dec9c69.jpg,images/b92edb5a81016e3b32f14b95e43a73c3.jpg,images/fab50dcc0db79e8a045b36a818900dd5.jpg', 0, 0, 1, NULL, NULL, NULL, 5, '2020-04-12 04:02:19', '2020-04-12 04:02:19');
INSERT INTO `goods` VALUES (11, '狗子狗子狗子狗子', 'images/63942da4135e9c59d07064d4e6d100b2.jpg', '988', 0.90, '4月专属礼品', 5, NULL, 'images/b6645147da9dd41af019afd41dec9c69.jpg,images/b92edb5a81016e3b32f14b95e43a73c3.jpg,images/fab50dcc0db79e8a045b36a818900dd5.jpg', 0, 0, 1, NULL, NULL, NULL, 5, '2020-04-12 04:02:19', '2020-04-12 04:02:19');
INSERT INTO `goods` VALUES (12, '狗子狗子狗子狗子', 'images/63942da4135e9c59d07064d4e6d100b2.jpg', '988', 0.90, '热销,新品', 5, NULL, 'images/b6645147da9dd41af019afd41dec9c69.jpg,images/b92edb5a81016e3b32f14b95e43a73c3.jpg,images/fab50dcc0db79e8a045b36a818900dd5.jpg', 0, 0, 1, NULL, NULL, NULL, 6, '2020-04-12 04:02:19', '2020-04-12 04:02:19');
INSERT INTO `goods` VALUES (13, '狗子狗子狗子狗子', 'images/63942da4135e9c59d07064d4e6d100b2.jpg', '988', 0.90, '升级指定产品A', 5, NULL, 'images/b6645147da9dd41af019afd41dec9c69.jpg,images/b92edb5a81016e3b32f14b95e43a73c3.jpg,images/fab50dcc0db79e8a045b36a818900dd5.jpg', 0, 0, 1, NULL, NULL, NULL, 6, '2020-04-12 04:02:19', '2020-04-12 04:02:19');
INSERT INTO `goods` VALUES (14, '狗子狗子狗子狗子', 'images/63942da4135e9c59d07064d4e6d100b2.jpg', '988', 0.90, '热销,新品', 5, NULL, 'images/b6645147da9dd41af019afd41dec9c69.jpg,images/b92edb5a81016e3b32f14b95e43a73c3.jpg,images/fab50dcc0db79e8a045b36a818900dd5.jpg', 0, 0, 1, NULL, NULL, NULL, 2, '2020-04-12 04:02:19', '2020-04-12 04:02:19');
INSERT INTO `goods` VALUES (15, '狗子狗子狗子狗子', 'images/63942da4135e9c59d07064d4e6d100b2.jpg', '988', 0.90, '升级指定产品B', 5, NULL, 'images/b6645147da9dd41af019afd41dec9c69.jpg,images/b92edb5a81016e3b32f14b95e43a73c3.jpg,images/fab50dcc0db79e8a045b36a818900dd5.jpg', 0, 0, 1, NULL, NULL, NULL, 6, '2020-04-12 04:02:19', '2020-04-12 04:02:19');
INSERT INTO `goods` VALUES (16, '狗子狗子狗子狗子', 'images/63942da4135e9c59d07064d4e6d100b2.jpg', '988', 0.90, '热销,新品', 5, NULL, 'images/b6645147da9dd41af019afd41dec9c69.jpg,images/b92edb5a81016e3b32f14b95e43a73c3.jpg,images/fab50dcc0db79e8a045b36a818900dd5.jpg', 0, 0, 1, NULL, NULL, NULL, 1, '2020-04-12 04:02:19', '2020-04-12 04:02:19');

-- ----------------------------
-- Table structure for goods_cart
-- ----------------------------
DROP TABLE IF EXISTS `goods_cart`;
CREATE TABLE `goods_cart`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `num` int(11) NOT NULL DEFAULT 1 COMMENT '数量',
  `sku` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of goods_cart
-- ----------------------------
INSERT INTO `goods_cart` VALUES (1, 1, 7, 1, NULL, '2020-04-12 06:40:46', '2020-04-12 06:40:46');
INSERT INTO `goods_cart` VALUES (5, 1, 6, 1, NULL, '2020-04-12 08:38:37', '2020-04-12 08:38:37');
INSERT INTO `goods_cart` VALUES (6, 1, 6, 1, NULL, '2020-04-12 08:38:39', '2020-04-12 08:38:39');
INSERT INTO `goods_cart` VALUES (7, 1, 7, 1, NULL, '2020-04-12 08:53:45', '2020-04-12 08:53:45');
INSERT INTO `goods_cart` VALUES (8, 1, 7, 1, NULL, '2020-04-12 08:57:07', '2020-04-12 08:57:07');
INSERT INTO `goods_cart` VALUES (9, 1, 7, 1, NULL, '2020-04-12 08:57:59', '2020-04-12 08:57:59');
INSERT INTO `goods_cart` VALUES (10, 1, 7, 1, NULL, '2020-04-12 08:58:04', '2020-04-12 08:58:04');
INSERT INTO `goods_cart` VALUES (11, 1, 7, 1, NULL, '2020-04-12 09:00:18', '2020-04-12 09:00:18');
INSERT INTO `goods_cart` VALUES (12, 1, 7, 1, NULL, '2020-04-12 09:00:35', '2020-04-12 09:00:35');
INSERT INTO `goods_cart` VALUES (13, 1, 7, 1, NULL, '2020-04-12 09:00:38', '2020-04-12 09:00:38');
INSERT INTO `goods_cart` VALUES (14, 1, 7, 1, NULL, '2020-04-12 09:00:59', '2020-04-12 09:00:59');
INSERT INTO `goods_cart` VALUES (15, 1, 7, 1, NULL, '2020-04-12 09:01:19', '2020-04-12 09:01:19');
INSERT INTO `goods_cart` VALUES (16, 1, 7, 1, NULL, '2020-04-12 09:01:31', '2020-04-12 09:01:31');
INSERT INTO `goods_cart` VALUES (17, 1, 7, 1, NULL, '2020-04-12 09:01:36', '2020-04-12 09:01:36');
INSERT INTO `goods_cart` VALUES (18, 1, 7, 1, NULL, '2020-04-12 09:01:48', '2020-04-12 09:01:48');
INSERT INTO `goods_cart` VALUES (19, 1, 7, 1, NULL, '2020-04-12 09:02:18', '2020-04-12 09:02:18');
INSERT INTO `goods_cart` VALUES (20, 1, 7, 1, NULL, '2020-04-12 09:02:20', '2020-04-12 09:02:20');
INSERT INTO `goods_cart` VALUES (21, 1, 7, 1, NULL, '2020-04-12 09:02:22', '2020-04-12 09:02:22');
INSERT INTO `goods_cart` VALUES (22, 1, 7, 1, NULL, '2020-04-12 09:27:27', '2020-04-12 09:27:27');
INSERT INTO `goods_cart` VALUES (23, 1, 6, 1, NULL, '2020-04-12 09:57:01', '2020-04-12 09:57:01');

-- ----------------------------
-- Table structure for goods_search
-- ----------------------------
DROP TABLE IF EXISTS `goods_search`;
CREATE TABLE `goods_search`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户ID',
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '产品类型',
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '产品名称',
  `price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '价格',
  `num` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数量',
  `imgs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '图片',
  `more` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更多要求',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态：0：未处理；1：已回复',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2016_01_04_173148_create_admin_tables', 1);
INSERT INTO `migrations` VALUES (4, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (5, '2020_04_09_160333_create_goods_table', 2);
INSERT INTO `migrations` VALUES (6, '2020_04_09_160617_create_goods_search_table', 3);
INSERT INTO `migrations` VALUES (7, '2020_04_09_161004_create_order_comment_table', 4);
INSERT INTO `migrations` VALUES (8, '2020_04_09_161406_create_orders_table', 5);
INSERT INTO `migrations` VALUES (9, '2020_04_09_161603_create_order_record_table', 6);
INSERT INTO `migrations` VALUES (10, '2020_04_09_161824_create_orders_details_table', 7);
INSERT INTO `migrations` VALUES (11, '2020_04_09_162056_create_address_table', 8);
INSERT INTO `migrations` VALUES (12, '2020_04_09_162529_create_wallet_table', 9);
INSERT INTO `migrations` VALUES (13, '2020_04_09_163152_create_wallet_record_table', 10);
INSERT INTO `migrations` VALUES (14, '2020_04_09_163610_create_withdraw_table', 11);
INSERT INTO `migrations` VALUES (15, '2020_04_09_164050_create_users_table', 12);
INSERT INTO `migrations` VALUES (16, '2020_04_10_040608_create_goods_group_table', 13);
INSERT INTO `migrations` VALUES (17, '2020_04_12_063130_create_goods_cart_table', 14);

-- ----------------------------
-- Table structure for order_comment
-- ----------------------------
DROP TABLE IF EXISTS `order_comment`;
CREATE TABLE `order_comment`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `imgs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '图片',
  `start` tinyint(4) NOT NULL COMMENT '星级',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for order_details
-- ----------------------------
DROP TABLE IF EXISTS `order_details`;
CREATE TABLE `order_details`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `price` decimal(8, 2) NOT NULL COMMENT '价格',
  `num` int(11) NOT NULL COMMENT '数量',
  `property` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '属性',
  `extend_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '扩展数据',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for order_record
-- ----------------------------
DROP TABLE IF EXISTS `order_record`;
CREATE TABLE `order_record`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `explanation` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '状态更新说明',
  `extend_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '扩展数据',
  `status` tinyint(4) NOT NULL COMMENT '状态值',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单编号',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `coun` int(11) NOT NULL COMMENT '商品数量',
  `amount_total` decimal(8, 2) NOT NULL COMMENT '商品总价',
  `amount` decimal(8, 2) NOT NULL COMMENT '实付金额',
  `balance` decimal(8, 2) NOT NULL COMMENT '余额支付金额',
  `wx_balance` decimal(8, 2) NOT NULL COMMENT '微信支付金额',
  `discount` decimal(8, 2) NOT NULL COMMENT '折扣',
  `discount_amount` decimal(10, 0) NULL DEFAULT NULL COMMENT '折扣金额',
  `address_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `address_tel` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手机号',
  `address_details` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '地址',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '订单状态 0未付款,1已付款,2已发货,3已签收,-1退货申请,-2退货中,-3已退货,-4取消交易',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `openid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'openid',
  `unionid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'unionid',
  `parent_id` int(11) NOT NULL,
  `nickname` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户昵称',
  `avatarurl` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户头像',
  `gender` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '性别：0：男；1：女；2：未知',
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `is_super` tinyint(4) NULL DEFAULT 0 COMMENT '是否是帮主：1：是：0：否',
  `last_login_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后登录时间',
  `status` tinyint(4) NULL DEFAULT 1 COMMENT '状态：0：正常；1：禁止登录',
  `qr_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '专属二维码',
  `keyword` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '11111111111111111', '22222222222222222', 0, '测试用户001', 'https://lh3.googleusercontent.com/proxy/FBdbSrYzLU8i7XcZqyF5IT75IT2v3vjodtnemqSziV0Z2e836gZmzAnJOked0bLtyyYbtA9_eBof6TvUkgDv4gr_TXe8rmtBeXXkgHLRBethf5wp', '1', '11111111111', 1, '2020-04-11 11:50:11', 1, NULL, NULL, '2020-04-10 06:14:35', '2020-04-10 06:14:35');

-- ----------------------------
-- Table structure for wallet
-- ----------------------------
DROP TABLE IF EXISTS `wallet`;
CREATE TABLE `wallet`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `balance` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '余额',
  `freeze` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '冻结金额',
  `withdraw` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '可提现金额',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of wallet
-- ----------------------------
INSERT INTO `wallet` VALUES (1, 1, 100, 0, 0, NULL, NULL);

-- ----------------------------
-- Table structure for wallet_record
-- ----------------------------
DROP TABLE IF EXISTS `wallet_record`;
CREATE TABLE `wallet_record`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `be_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '相关联用户ID',
  `amount` decimal(10, 0) NOT NULL COMMENT '金额',
  `type_id` int(11) NOT NULL COMMENT '类型',
  `change` tinyint(4) NOT NULL COMMENT '金额变动：-1：扣钱，1：加钱',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '说明',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `expand_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '扩展数据',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of wallet_record
-- ----------------------------
INSERT INTO `wallet_record` VALUES (1, 1, 1, 100, 1, 1, '消费返还金额（10%）', '', '', NULL, NULL);
INSERT INTO `wallet_record` VALUES (2, 1, 0, 100, 10, 100, '100', NULL, NULL, '2020-04-12 12:54:07', '2020-04-12 12:54:07');

-- ----------------------------
-- Table structure for withdraw
-- ----------------------------
DROP TABLE IF EXISTS `withdraw`;
CREATE TABLE `withdraw`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `type` tinyint(4) NOT NULL COMMENT '类型：1：微信：2：银行卡',
  `amount` decimal(10, 0) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `tel` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `bank_card` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '卡号',
  `bank_address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '开户行',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态：-1：退回；0：申请中：1：已同意（提现中）；2：提现成功；',
  `remark` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of withdraw
-- ----------------------------
INSERT INTO `withdraw` VALUES (1, 1, 1, 100, NULL, NULL, NULL, NULL, 0, NULL, '2020-04-12 12:53:46', '2020-04-12 12:53:46');
INSERT INTO `withdraw` VALUES (2, 1, 1, 100, NULL, NULL, NULL, NULL, 0, NULL, '2020-04-12 12:54:07', '2020-04-12 12:54:07');

SET FOREIGN_KEY_CHECKS = 1;
