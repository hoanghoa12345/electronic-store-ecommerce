/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : electronic-store-ecommerce

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 15/06/2021 11:26:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(10) UNSIGNED NULL DEFAULT NULL,
  `updated_at` int(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------

-- ----------------------------
-- Table structure for autocomplete
-- ----------------------------
DROP TABLE IF EXISTS `autocomplete`;
CREATE TABLE `autocomplete`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) UNSIGNED NULL DEFAULT NULL,
  `updated_at` int(11) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of autocomplete
-- ----------------------------
INSERT INTO `autocomplete` VALUES (1, 'laptop', NULL, NULL);
INSERT INTO `autocomplete` VALUES (2, 'laptop dell', NULL, NULL);
INSERT INTO `autocomplete` VALUES (3, 'laptop asus', NULL, NULL);
INSERT INTO `autocomplete` VALUES (4, 'asus vivobook', NULL, NULL);

-- ----------------------------
-- Table structure for banners
-- ----------------------------
DROP TABLE IF EXISTS `banners`;
CREATE TABLE `banners`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `image` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `type` tinyint(1) NOT NULL,
  `created_at` int(11) UNSIGNED NULL DEFAULT NULL,
  `updated_at` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of banners
-- ----------------------------
INSERT INTO `banners` VALUES (1, 'Mua laptop acer giá tốt', 'Laptop Accer với chương trình khuyến mãi hấp dẫn', '/category/laptops', '/files/05_2021/banners/top-banner-1.jpg', 1, NULL, 1623034826);
INSERT INTO `banners` VALUES (2, 'Laptop HP cấu hình phù hợp cho nhu cầu văn phòng', 'Laptop HP với cấu hình phù hợp cho làm việc văn phòng và giải trí', '/category/index/laptops', '/files/05_2021/banners/top-banner-2.jpg', 1, NULL, NULL);
INSERT INTO `banners` VALUES (3, 'Laptop Assus Vivobook với phù hợp dành cho sinh viên', 'Laptop Asus cấu hình mạnh mẽ thiết kế trẻ trung năng động', '/category/index/laptops', '/files/05_2021/banners/top-banner-3.jpg', 1, NULL, NULL);
INSERT INTO `banners` VALUES (4, 'Laptops', 'laptops', '/category/index/laptops', '/files/05_2021/banners/4f811b84b7d04631e4e864ba30a6ffac.jpg', 2, NULL, 1622030985);
INSERT INTO `banners` VALUES (5, 'Apple', 'apple', '/category/index/apple', '/files/05_2021/banners/12ff5bc6ec6e3e22d82e506e0c05c022.jpg', 2, NULL, 1622031337);
INSERT INTO `banners` VALUES (6, 'Gaming Gear', 'Gaming Gear', '/category/index/gaming_gear', '/files/05_2021/banners/e4881c80818f84d5bfdecc3441714d1b.jpg', 2, NULL, 1622031376);
INSERT INTO `banners` VALUES (7, 'Điện máy giảm đến 36%', 'Điện máy giảm đến 36%', '/category/index/electronic', '/files/05_2021/banners/70cdaf182b0b5a3ea70d9fb942468ddb.jpg', 3, NULL, 1622031580);

-- ----------------------------
-- Table structure for brands
-- ----------------------------
DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` int(11) UNSIGNED NULL DEFAULT NULL,
  `updated_at` int(11) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of brands
-- ----------------------------
INSERT INTO `brands` VALUES (1, 'Acer', 'acer', '/files/06_2021/brands/1df1dc30be389c986c6c281f301ad653.png', 1619359468, NULL);
INSERT INTO `brands` VALUES (2, 'Samsung', 'samsung', '/files/06_2021/brands/37e50ca0022ab095e3c80ac11181be4e.jpg', 1619359477, 1622879237);
INSERT INTO `brands` VALUES (3, 'Asus', 'asus', '/files/06_2021/brands/1a34608e5b7f0f8d45a16424ca8573ce.png', 1619359486, 1622879286);
INSERT INTO `brands` VALUES (4, 'LG', 'lg', '/files/06_2021/brands/af71e1ddb40692901ea970d2fdb37b81.jpg', 1619359494, 1622879430);
INSERT INTO `brands` VALUES (5, 'Canon', 'canon', '/files/06_2021/brands/d0a73a0b0548308e912738c2fd3c8566.jpg', 1619359511, 1622879474);
INSERT INTO `brands` VALUES (6, 'HP', 'hp', '/files/06_2021/brands/68f7bf4d3ab26c61df5e739c46a74500.jpg', 1619359517, 1622879703);
INSERT INTO `brands` VALUES (8, 'Sony', 'sony', '/files/06_2021/brands/00dbe920c536e7eb23c68c4da013c5d6.jpg', 1619449228, 1622879765);
INSERT INTO `brands` VALUES (9, 'Apple', 'apple', '/files/06_2021/brands/91f981d971304fa1b39d4bad0f0e1bfa.jpeg', 1619452204, 1622880134);
INSERT INTO `brands` VALUES (10, 'Remax', 'remax', '/files/06_2021/brands/dfdac8cf9d8d6356c8028e64ecd9c00a.png', 1619491955, 1622879826);
INSERT INTO `brands` VALUES (11, 'MSI', 'msi', '/files/06_2021/brands/bd356b979f5e0f8867b632bee255845f.jpg', 1619535917, 1622879870);
INSERT INTO `brands` VALUES (12, 'Logitech', 'logitech', '/files/06_2021/brands/dc5ff3f61ab6c282a73c2f318283a877.jpg', 1622878974, 1622879179);

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` int(11) UNSIGNED NULL DEFAULT NULL,
  `updated_at` int(11) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (8, 'Laptops', 'laptops', '/files/05_2021/banners/147646cdcb54ccd8af4fb15c53182476.jpg', 1619355690, 1622099880);
INSERT INTO `categories` VALUES (9, 'Máy tính PC', 'may-tinh-pc', '/files/05_2021/banners/77073da47e386b26121d8696222b8d29.jpg', 1619355721, 1622121574);
INSERT INTO `categories` VALUES (10, 'Máy tính Mac', 'may-tinh-mac', 'default.png', 1619355736, NULL);
INSERT INTO `categories` VALUES (13, 'Loa và âm thanh', 'loa-va-am-thanh', 'default.png', 1619355829, 1621090535);
INSERT INTO `categories` VALUES (15, 'Máy in', 'may-in', 'default.png', 1619355849, NULL);
INSERT INTO `categories` VALUES (17, 'Smartphone', 'smartphone', 'default.png', 1619355873, NULL);
INSERT INTO `categories` VALUES (19, 'Smartwatch', 'smartwatch', 'default.png', 1619355895, NULL);
INSERT INTO `categories` VALUES (22, 'TV và màn hình', 'tv-va-man-hinh', 'default.png', 1619355971, NULL);

-- ----------------------------
-- Table structure for child_category
-- ----------------------------
DROP TABLE IF EXISTS `child_category`;
CREATE TABLE `child_category`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` int(11) UNSIGNED NULL DEFAULT NULL,
  `updated_at` int(11) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `constraint_parent_id`(`parent_id`) USING BTREE,
  CONSTRAINT `constraint_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of child_category
-- ----------------------------
INSERT INTO `child_category` VALUES (1, 8, 'Gaming Laptops', 'gaming-laptops', 1619355690, NULL);
INSERT INTO `child_category` VALUES (2, 8, 'Surface book', 'surface-book', 1621067211, NULL);
INSERT INTO `child_category` VALUES (3, 8, 'Ultra book', 'ultra-book', 1621085235, NULL);
INSERT INTO `child_category` VALUES (5, 9, 'Máy tính đồng bộ', 'may-tinh-dng-b', 1621091291, 1621092535);
INSERT INTO `child_category` VALUES (6, 9, 'Máy tính Mini', 'may-tinh-mini', 1621092620, 1621092644);
INSERT INTO `child_category` VALUES (7, 9, 'Linh kiện máy tính', 'linh-kin-may-tinh', 1621093051, NULL);
INSERT INTO `child_category` VALUES (8, 10, 'Macbook Pro', 'macbook-pro', 1621093174, NULL);
INSERT INTO `child_category` VALUES (9, 10, 'Mac Mini', 'mac-mini', 1621093188, NULL);
INSERT INTO `child_category` VALUES (10, 10, 'iMac', 'imac', 1621093199, NULL);
INSERT INTO `child_category` VALUES (11, 13, 'Tai nghe không dây', 'tai-nghe-khong-day', 1621093236, NULL);
INSERT INTO `child_category` VALUES (12, 13, 'Tai nghe bluetooth', 'tai-nghe-bluetooth', 1621093252, NULL);
INSERT INTO `child_category` VALUES (13, 13, 'Loa mini', 'loa-mini', 1621093261, NULL);
INSERT INTO `child_category` VALUES (14, 15, 'Máy in laser', 'may-in-laser', 1621093297, NULL);
INSERT INTO `child_category` VALUES (15, 17, 'Smartphone', 'smartphone', 1621093348, NULL);
INSERT INTO `child_category` VALUES (16, 17, 'Flagship', 'flagship', 1621093358, NULL);
INSERT INTO `child_category` VALUES (17, 19, 'Đồng hồ thông minh', 'dng-h-thong-minh', 1621093384, NULL);
INSERT INTO `child_category` VALUES (18, 19, 'Vòng đeo tay thông minh', 'vong-deo-tay-thong-minh', 1621093408, NULL);
INSERT INTO `child_category` VALUES (19, 22, 'Màn hình máy tính', 'man-hinh-may-tinh', 1621093444, 1621093490);
INSERT INTO `child_category` VALUES (20, 22, 'TV màn ảnh rộng', 'tv-man-nh-rng', 1621093477, NULL);
INSERT INTO `child_category` VALUES (21, 8, 'Laptop cơ bản', 'laptop-co-bn', 1621093562, NULL);

-- ----------------------------
-- Table structure for coupons
-- ----------------------------
DROP TABLE IF EXISTS `coupons`;
CREATE TABLE `coupons`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` enum('fixed','percent') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` double NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` int(11) UNSIGNED NULL DEFAULT NULL,
  `updated_at` int(11) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coupons
-- ----------------------------

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) UNSIGNED NOT NULL,
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `district` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `wards` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `constraint_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customers
-- ----------------------------

-- ----------------------------
-- Table structure for migration
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration`  (
  `type` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `migration` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('app', 'default', '001_create_users');
INSERT INTO `migration` VALUES ('app', 'default', '002_create_users_metadata');
INSERT INTO `migration` VALUES ('app', 'default', '003_create_customers');
INSERT INTO `migration` VALUES ('app', 'default', '004_create_products');
INSERT INTO `migration` VALUES ('app', 'default', '005_create_categories');
INSERT INTO `migration` VALUES ('app', 'default', '009_create_brands');
INSERT INTO `migration` VALUES ('app', 'default', '011_add_foreign_keys_products_table');
INSERT INTO `migration` VALUES ('app', 'default', '012_add_foreign_keys_customers_table');
INSERT INTO `migration` VALUES ('app', 'default', '013_create_users_groups');
INSERT INTO `migration` VALUES ('app', 'default', '014_add_fields_products');
INSERT INTO `migration` VALUES ('app', 'default', '015_create_child_category');
INSERT INTO `migration` VALUES ('app', 'default', '016_create_product_reviews');
INSERT INTO `migration` VALUES ('app', 'default', '017_create_shippings');
INSERT INTO `migration` VALUES ('app', 'default', '018_create_orders');
INSERT INTO `migration` VALUES ('app', 'default', '019_create_coupons');
INSERT INTO `migration` VALUES ('app', 'default', '020_create_post_categories');
INSERT INTO `migration` VALUES ('app', 'default', '021_create_post_comments');
INSERT INTO `migration` VALUES ('app', 'default', '022_create_posts');
INSERT INTO `migration` VALUES ('app', 'default', '023_create_order_details');

-- ----------------------------
-- Table structure for order_details
-- ----------------------------
DROP TABLE IF EXISTS `order_details`;
CREATE TABLE `order_details`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `rate` double NOT NULL,
  `amount` double NOT NULL,
  `created_at` int(11) UNSIGNED NULL DEFAULT NULL,
  `updated_at` int(11) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_details
-- ----------------------------
INSERT INTO `order_details` VALUES (1, 1, 4, 1, 5, 17000000, 1623649034, NULL);
INSERT INTO `order_details` VALUES (2, 2, 9, 4, 5, 11390000, 1623657996, NULL);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `sub_total` double NOT NULL,
  `shipping_id` int(11) UNSIGNED NULL DEFAULT NULL,
  `coupon` double NULL DEFAULT NULL,
  `total_amount` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `payment_method` enum('creditcard','paypal','cod','bankcard') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `payment_status` enum('paid','unpaid') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` enum('new','process','delivered','cancel') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `firstname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `country` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address1` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `created_at` int(11) UNSIGNED NULL DEFAULT NULL,
  `updated_at` int(11) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `constraint_orders_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `constraint_orders_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 'ea8251eb817db156581a175b07a53e0e', 1, 17000000, 1, 0, 17125000, 1, 'creditcard', 'paid', 'new', 'Hoang', 'Hoa', 'hoanghoa12@gmail.com', '+8422216523', 'Việt Nam', 'HCM City', '', 1623649034, NULL);
INSERT INTO `orders` VALUES (2, '3cc51f18decfb3c4c4ab588006838371', 2, 45560000, 1, 0, 45685000, 1, 'cod', 'paid', 'new', 'Hòa', 'Hoàng', 'hoadevap@hoadevapp.tk', '123456789', 'Việt Nam', 'Phường Ea Tam, Thành phố Buôn Ma Thuột, Tỉnh Đắk Lắk', '', 1623657996, NULL);

-- ----------------------------
-- Table structure for post_categories
-- ----------------------------
DROP TABLE IF EXISTS `post_categories`;
CREATE TABLE `post_categories`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` int(11) UNSIGNED NULL DEFAULT NULL,
  `updated_at` int(11) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post_categories
-- ----------------------------
INSERT INTO `post_categories` VALUES (1, 'Laptops', 'laptops', 'active', NULL, NULL);
INSERT INTO `post_categories` VALUES (2, 'Điện thoại', 'dien-thoai', 'active', 1622967686, NULL);

-- ----------------------------
-- Table structure for post_comments
-- ----------------------------
DROP TABLE IF EXISTS `post_comments`;
CREATE TABLE `post_comments`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` enum('active','unactive') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `replied_comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  `created_at` int(11) UNSIGNED NULL DEFAULT NULL,
  `updated_at` int(11) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post_comments
-- ----------------------------
INSERT INTO `post_comments` VALUES (1, 3, 1, 'Hello', 'active', 'Hi', 1, NULL, NULL);

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `summary` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `quote` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tags` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `post_cat_id` int(11) UNSIGNED NOT NULL,
  `added_by` int(11) UNSIGNED NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` int(11) UNSIGNED NULL DEFAULT NULL,
  `updated_at` int(11) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES (2, 'Acer ra mắt loạt sản phẩm laptop trang bị card đồ họa Nvidia GeForce RTX™ 30 Series', 'acer-ra-mat-loat-san-pham-laptop-trang-bi-card-do-hoa-nvidia-geforce-rtx-30-series', 'Acer ra mắt loạt sản phẩm laptop trang bị card đồ họa Nvidia GeForce RTX™ 30 Series', '<p>\r\n\r\n</p><h2>Tại sự kiện trực tuyến The New Revolution, Acer Việt Nam giới thiệu một loạt bản nâng cấp mới nhất trong dòng laptop gaming của hãng. Bằng việc trang bị vi xử lý đồ họa Nvidia GeForce RTX™ 30 Series mới nhất, các sản phẩm laptop gaming hàng đầu của Acer như Predator Helios 300 và Nitro 5 sẽ được đưa lên một tầm cao mới, sẵn sàng cùng game</h2><div></div><div></div><div></div><div><p><b>Predator Helios 300 – Vũ khí tối thượng</b></p><p>Chiếc laptop gaming cao cấp Predator Helios 300 là chiếc laptop mà mọi game thủ đều ao ước để sở hữu. Có thiết kế thu hút mọi ánh nhìn, Helios 300 vỏ kim loại nguyên khối nổi bật lên giữa đám đông với thiết kế đậm chất Predator. Logo Predator có đèn led phát sáng màu Electric Blue là điểm nhấn trên nền đen tổng thế của máy như đang thách thức mọi đối thủ trước mặt nó. Khối lượng máy chỉ 2.2kg khiến máy trở nên nhẹ nhàng với một chiếc laptop gaming nhưng vẫn giữ chất hầm hố.</p></div>\r\n\r\n<br><p></p>', 'Predator Helios 300 – Vũ khí tối thượng', '/files/06_2021/blogs/f20c8b3262158625de43c00f7c4b6661.jpg', 'Tags: laptop acer card đồ họa Swift Series Laptop Acer Swift X', 1, 3, 'active', 1622963665, NULL);
INSERT INTO `posts` VALUES (3, 'Laptop siêu nhẹ LG Gram 2021 ra mắt tại Việt Nam, giá từ 34.9 triệu đồng', 'laptop-sieu-nhe-lg-gram-2021-ra-mat-tai-viet-nam-gia-tu-349-trieu-dong', 'Laptop siêu nhẹ LG Gram 2021 ra mắt tại Việt Nam, giá từ 34.9 triệu đồng', '<p>\r\n\r\n</p><h2>Phiên bản 2021 của LG Gram mang tới một số cải tiến về thiết kế, cấu hình và pin.</h2><div></div><div></div><div></div><div><p>Mới đây, LG đã chính thức ra mắt tại thị trường Việt Nam phiên bản mới của dòng laptop siêu nhẹ Gram. LG Gram 2021 tiếp tục kế thừa ưu điểm về tính cơ động của phiên bản cũ, nhưng nay được nâng cấp về thiết kế, màn hình, cấu hình và pin.</p><p>LG Gram 2021 mang thiết kế mới vuông vức và góc cạnh hơn. Đặc biệt, với đối tượng người dùng nam giới, LG Gram 2021 càng trở nên hấp dẫn nhờ phiên bản màu đen mạnh mẽ, bên cạnh phiên bản màu trắng truyền thống. </p></div>\r\n\r\n<br><p></p>', 'Laptop siêu nhẹ LG Gram 2021 ra mắt tại Việt Nam, giá từ 34.9 triệu đồng', '/files/06_2021/blogs/8fc0c2ae57c93c9803e78034cf501ee9.png', 'lg-gram, lg, laptops', 1, 3, 'active', 1622964722, NULL);
INSERT INTO `posts` VALUES (4, 'Cáp USB-C sẽ được nâng cấp từ 100W lên 240W, đủ công suất để sạc cho laptop cấu hình cao', 'cap-usb-c-se-duoc-nang-cap-tu-100w-len-240w-du-cong-suat-de-sac-cho-laptop-cau-hinh-cao', 'Cáp USB-C sẽ được nâng cấp từ 100W lên 240W, đủ công suất để sạc cho laptop cấu hình cao', '<p>\r\n\r\n</p><h2>Có thể trong tương lai không xa, tất cả các thiết bị công nghệ bao gồm cả laptop cấu hình cao cũng sẽ sử dụng cổng kết nối USB-C để cấp nguồn và sạc pin.</h2><div></div><div><ul><li><a target=\"_blank\" rel=\"nofollow\" href=\"https://genk.vn/so-sanh-dau-noi-usb-c-loai-1-nghin-dong-va-5-nghin-dong-duoi-kinh-hien-vi-dat-hon-gap-5-nhung-chat-luong-co-hon-tuong-xung-20210403111653915.chn\">So sánh đầu nối USB-C loại 1 nghìn đồng và 5 nghìn đồng dưới kính hiển vi: đắt hơn gấp 5 nhưng chất lượng có hơn tương xứng?<i></i></a></li><li><a target=\"_blank\" rel=\"nofollow\" href=\"https://genk.vn/apple-se-khong-chuyen-cong-lightning-tren-iphone-sang-usb-c-20210302100751324.chn\">Apple sẽ không chuyển cổng Lightning trên iPhone sang USB-C<i></i></a></li><li><a target=\"_blank\" rel=\"nofollow\" href=\"https://genk.vn/apple-phat-hanh-macos-big-sur-1122-sua-loi-hong-phan-cung-khi-dung-voi-hub-usb-c-ben-thu-3-20210226182930858.chn\">Apple phát hành macOS Big Sur 11.2.2: Sửa lỗi hỏng phần cứng khi dùng với hub USB-C bên thứ 3<i></i></a></li></ul><div></div></div><div></div><div></div><div><p>Có thể trong tương lai không xa, tất cả các thiết bị công nghệ bao gồm cả laptop cấu hình cao  cũng sẽ sử dụng cổng kết nối USB-C để cấp nguồn và sạc pin. USB-IF vừa mới thông báo rằng kết nối USB-C sẽ được nâng cấp công suất từ 100W lên 240W. <br></p><p>Trước đây, thông số kỹ thuật của các bộ sạc USB-C bị giới hạn ở 100W, và điều đó chắc chắn đã kìm hãm sự phát triển của ngành công nghiệp công nghệ cao. Ví dụ như chiếc laptop Dell XPS 15 có thể sạc thông qua cổng USB-C, nhưng nó cần tới 130W để có thể chạy ở hiệu suất cao nhất. </p></div>\r\n\r\n<br><p></p>', 'Cáp USB-C sẽ được nâng cấp từ 100W lên 240W, đủ công suất để sạc cho laptop cấu hình cao', '/files/06_2021/blogs/c82c65009965c690689c7cec83c8ff6b.jpg', 'usb-c, cap sac', 1, 3, 'active', 1622964865, 1622965634);
INSERT INTO `posts` VALUES (5, 'Deal hot trong tuần: Loạt laptop giảm giá sâu, lên đến 8 triệu, cơ hội “lên đời” để work from home hiệu quả hơn trong mùa dịch này', 'deal-hot-trong-tuan-loat-laptop-giam-gia-sau-len-den-8-trieu-co-hoi-len-doi-de-work-from-home-hieu-qua-hon-trong-mua-dich-nay', 'Deal hot trong tuần: Loạt laptop giảm giá sâu, lên đến 8 triệu, cơ hội “lên đời” để work from home hiệu quả hơn trong mùa dịch này', '<p>\r\n\r\n</p><h2>Làm việc tại nhà hay học online vào mùa dịch mà laptop cũ lại đơ lag liên tục thì nhân cơ hội giảm giá này thay máy mới ngay đi còn gì nữa!</h2><div></div><div><ul><li><a target=\"_blank\" rel=\"nofollow\" href=\"https://genk.vn/fpt-shop-giam-den-24-trieu-dong-cho-hang-loat-laptop-gaming-tang-combo-phu-kien-lam-viec-tai-nha-20210507173243784.chn\">FPT Shop giảm đến 2,4 triệu đồng cho hàng loạt laptop gaming, tặng combo phụ kiện làm việc tại nhà<i></i></a></li><li><a target=\"_blank\" rel=\"nofollow\" href=\"https://genk.vn/tu-6-trieu-da-co-ca-loat-lua-chon-laptop-ryzen-3-ngon-bo-cuc-hop-cho-hoc-sinh-sinh-vien-20210505190906928.chn\">Từ hơn 8 triệu đã có cả loạt lựa chọn laptop Ryzen 3 ngon - bổ, cực hợp cho học sinh, sinh viên<i></i></a></li></ul><div></div></div><div></div><div></div><div><p><b>Apple MacBook Pro 13 Touch Bar M1 256GB 2020 giảm giá từ 35.990.000đ xuống còn 31.000.000đ</b></p></div>\r\n\r\n<br><p></p>', 'Deal hot trong tuần: Loạt laptop giảm giá sâu, lên đến 8 triệu, cơ hội “lên đời” để work from home hiệu quả hơn trong mùa dịch này', '/files/06_2021/blogs/5e6bbc57edd78b12bb6413920664d719.jpeg', 'macbook laptop', 1, 3, 'active', 1622965916, NULL);
INSERT INTO `posts` VALUES (6, 'Từ hơn 8 triệu đã có cả loạt lựa chọn laptop Ryzen 3 ngon - bổ, cực hợp cho học sinh, sinh viên', 'tu-hon-8-trieu-da-co-ca-loat-lua-chon-laptop-ryzen-3-ngon---bo-cuc-hop-cho-hoc-sinh-sinh-vien', 'Từ hơn 8 triệu đã có cả loạt lựa chọn laptop Ryzen 3 ngon - bổ, cực hợp cho học sinh, sinh viên', '<p>\r\n\r\n</p><h2>Chỉ từ 8 đến 10 triệu đồng bạn có thể “tậu” ngay 1 em laptop dùng chip Ryzen 3 hiệu năng mạnh mẽ vượt trội nhiều sản phẩm cùng tầm.</h2><div></div><div><ul><li><a target=\"_blank\" rel=\"nofollow\" href=\"https://genk.vn/loat-deal-ngon-bo-re-cho-may-tinh-bang-tu-3-trieu-da-mua-duoc-hang-chinh-hang-gia-tot-20210504172852064.chn\">Loạt deal ngon - bổ - rẻ cho máy tính bảng, từ 3 triệu đã mua được hàng chính hãng chất lượng<i></i></a></li><li><a target=\"_blank\" rel=\"nofollow\" href=\"https://genk.vn/bo-suu-tap-smartphone-tu-re-den-dat-van-giu-cong-35mm-danh-cho-nhung-nguoi-choi-he-cam-day-20210504142103313.chn\">Bộ sưu tập smartphone từ rẻ đến đắt vẫn giữ cổng 3.5mm dành cho những \"người chơi hệ cắm dây\"<i></i></a></li></ul><div></div></div><div></div><div></div><div><p></p><div><br>\r\n\r\n</div></div><br><p></p>', 'Từ hơn 8 triệu đã có cả loạt lựa chọn laptop Ryzen 3 ngon - bổ, cực hợp cho học sinh, sinh viên', '/files/06_2021/blogs/3c3c7607aa6af67964e9ee76b2d01871.jpg', 'laptop gia re, sinh vien', 1, 3, 'active', 1622966050, NULL);

-- ----------------------------
-- Table structure for product_reviews
-- ----------------------------
DROP TABLE IF EXISTS `product_reviews`;
CREATE TABLE `product_reviews`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `rating` double NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'active',
  `created_at` int(11) UNSIGNED NULL DEFAULT NULL,
  `updated_at` int(11) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `constraint_product_reviews_user_id`(`user_id`) USING BTREE,
  INDEX `constraint_product_reviews_product_id`(`product_id`) USING BTREE,
  CONSTRAINT `constraint_product_reviews_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `constraint_product_reviews_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_reviews
-- ----------------------------

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category_id` int(11) UNSIGNED NOT NULL,
  `small_description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `large_description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `regular_price` double NOT NULL,
  `discounted_price` double NOT NULL,
  `sku` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `primary_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `other_image` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `brand_id` int(11) UNSIGNED NOT NULL,
  `created_at` int(11) UNSIGNED NULL DEFAULT NULL,
  `updated_at` int(11) UNSIGNED NULL DEFAULT NULL,
  `child_cat_id` int(11) UNSIGNED NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'active',
  `colors` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `specifications` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `category_id_brand_id`(`category_id`, `brand_id`) USING BTREE,
  CONSTRAINT `constraint_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'Tai nghe Sony', 'tai-nghe-sony', 13, 'Tai nghe Sony với chất lượng âm thanh tuyệt vời', '<h2>Tai nghe Sony với chất lượng âm thanh tuyệt vời\r\n</h2>', 800000, 799000, 'SONY1276', 20, '/files/04_2021/products/756560a05d327822082e304294fd6051.jpg', 'a:6:{i:0;s:60:\"/files/04_2021/products/756560a05d327822082e304294fd6051.jpg\";i:1;s:60:\"/files/04_2021/products/3fc60f8806dd05c5d6dec04062c8797d.jpg\";i:2;s:60:\"/files/04_2021/products/bfe3983325429e09877ab5c8e7908da7.jpg\";i:3;s:60:\"/files/04_2021/products/ecbbffd223e15f96a271b04f6cefb40f.jpg\";i:4;s:60:\"/files/04_2021/products/855168f7b2b67e75c7390da1f595d2cd.jpg\";i:5;s:60:\"/files/04_2021/products/ae432a5548e98408f92a75e9110adec4.jpg\";}', 8, 1619451937, 1622034730, 1, 'active', '', '<h2>Tai nghe Sony với chất lượng âm thanh tuyệt vời\r\n</h2>');
INSERT INTO `products` VALUES (2, 'Iphone 6 Plus', 'iphone-6-plus', 17, 'Iphone 6 Plus', '<p>Iphone 6 Plus<br></p>', 4000000, 3990000, 'IP62386', 4, '/files/04_2021/products/3ddf86ba167630eae2e28b3cb4ba2ac2.jpg', 'a:7:{i:0;s:59:\"files\\04_2021\\products\\3ddf86ba167630eae2e28b3cb4ba2ac2.jpg\";i:1;s:59:\"files\\04_2021\\products\\8bbd17b8da6594708763257f41a3b8f5.jpg\";i:2;s:59:\"files\\04_2021\\products\\ee01cf7a1afe2ba89d70597c41c83f97.jpg\";i:3;s:59:\"files\\04_2021\\products\\d6ae65958ce968019f2c8f040fb81384.jpg\";i:4;s:59:\"files\\04_2021\\products\\ccea92f2fbd552ad452618a5760a206f.jpg\";i:5;s:59:\"files\\04_2021\\products\\152816dbd490e9f944b46b9ccb8377c6.jpg\";i:6;s:59:\"files\\04_2021\\products\\9e1fd40d5e8ac1ae90bad6bdd42778ec.jpg\";}', 9, 1619452561, 1621511977, 15, 'active', '', '');
INSERT INTO `products` VALUES (3, 'Máy in Cannon', 'may-in-cannon', 15, 'Máy in Cannon', '<p>Máy in Cannon<br></p>', 5000000, 4999999, 'CAN8654', 20, '/files/06_2021/products/c11fe022f6c220b0d8e95fcb1875e7a1.jpg', 'a:3:{i:0;s:60:\"/files/06_2021/products/c11fe022f6c220b0d8e95fcb1875e7a1.jpg\";i:1;s:60:\"/files/06_2021/products/285be373c3e5bf80df559d0e482a4f9c.jpg\";i:2;s:60:\"/files/06_2021/products/50aee30dc5d19b120354939f8068d227.jpg\";}', 5, 1619492205, 1622877719, 14, 'active', '', '');
INSERT INTO `products` VALUES (4, 'Laptop ASUS VivoBook 14 A412FA-EK734T', 'laptop-asus-vivobook-14-a412fa-ek734t', 8, '<li> CPU: Intel Core i5-10210U </li>\r\n<li> Màn hình: 14\" TN (1920 x 1080)</li>\r\n<li> RAM: 8GB (4GB + 4GB Onboard) DDR4 2666MHz</li> \r\n<li>  Đồ họa: Intel UHD Graphics</li> \r\n<li>  Lưu trữ: 512GB SSD M.2 NVMe </li> \r\n<li>  Hệ điều hành: Windows 10<l/i> \r\n<li>  Pin: 2 cell 37 Wh Pin rời</li> \r\n<li>  Khối lượng: 1.5 kg</li> ', '<p>\r\n\r\n</p><h2><strong>Màn hình không giới hạn</strong></h2><p>Laptop <strong>ASUS VivoBook 14 A412FA-EK734T</strong>&nbsp;với ngôn ngữ thiết kế NanoEdge trên cả 4 cạnh đem lại một màn hình gần như không viền, giúp tăng diện tích màn hình hiển thị lớn hơn trên khung máy. Bạn sẽ được trải nghiệm hình ảnh cực kỳ sống động đến choáng ngợp cho cả công việc và giải trí, xóa tan mọi giới hạn về năng lực, khơi nguồn cảm hứng cho bạn phá vỡ những ranh giới mới.</p><img alt=\"ASUS-VivoBook-14-A412-1\" src=\"http://electrostore.xyz/files/04_2021/products/ffce33db35794f3a5e1e7027547450f5.jpg\"><h2><strong>Kích thước nhỏ gọn hơn</strong></h2><p>Kích thước được thu gọn xuống mức tối thiểu nhờ màn hình NanoEdge không viền trên bốn cạnh, <strong>ASUS VivoBook 14 A412FA-EK734T</strong>&nbsp;sở hữu một thân hình nhỏ gọn và thanh mảnh hơn đáng kể so với thế hệ tiền nhiệm trước đó. Do đó không gian bàn làm việc của bạn sẽ trở nên gọn gàng nhờ chiếc máy tính chiếm ít diện tích này, và bạn cũng có thể thoải mái mang xách theo người khi xê dịch.</p><img alt=\"ASUS-VivoBook-14-A412-2\" src=\"http://electrostore.xyz/files/04_2021/products/b0a10e170eb7b96dbfc6ea3fb37229f5.jpg\"><h2><strong>Thoải mái thể hiện cá tính</strong></h2><p><strong>ASUS VivoBook 14 A412FA-EK734T </strong>đem đến nhiều phiên bản màu sắc trẻ trung được hoàn thiện để phù hợp với phong cách của bạn như: màu Bạc bóng bẩy và tinh tế, màu Xám tinh tế và trầm lắng hơn. Để khác biệt hơn bạn có thể chọn xu hướng mới với màu Xanh lông công có khả năng đổi màu sắc khi nhìn từ những góc độ khác nhau. Còn nếu bạn muốn tiên phong về phong cách, bạn có thể chọn màu Hồng san hô với lớp hoàn thiện tươi sáng.</p><img alt=\"ASUS-VivoBook-14-A412-3\" src=\"http://electrostore.xyz/files/04_2021/products/b0a10e170eb7b96dbfc6ea3fb37229f5.jpg\"><h2><strong>Hiệu năng xử lý tuyệt vời</strong></h2><p><strong>ASUS VivoBook 14 A412FA-EK734T</strong>&nbsp;với bộ vi xử lý Intel® Core™ mới nhất và card đồ họa rời NVIDIA GeForce (tùy chọn phiên bản cấu hình), bạn sẽ luôn sẵn sàng giải quyết mọi công việc hằng ngày nhanh chóng nhờ khả năng làm việc đa nhiệm, chỉnh sửa đa phương tiện và chơi game phổ thông. Và với kết nối không dây Wi-Fi 802.11ac hai băng tần, bạn sẽ được được trải nghiệm trực tuyến internet siêu nhanh với tốc độ lên đến 867Mbps mà không bị giật lag.</p><img alt=\"ASUS-VivoBook-14-A412-4\" src=\"http://electrostore.xyz/files/04_2021/products/b0a10e170eb7b96dbfc6ea3fb37229f5.jpg\"><h2><strong>Pin sử dụng cả ngày</strong></h2><p><strong>ASUS VivoBook 14 A412FA-EK734T</strong>&nbsp;giúp bạn di chuyển và làm việc thoải mái cả ngày nhờ pin lithium-polymer chất lượng cao có khả năng sử dụng liên tục trong thời gian dài. Công nghệ ASUS Battery Health Charging tích hợp độc quyền từ ASUS giúp pin tránh tình trạng bị sạc quá mức, giảm khả năng hư hại do phồng pin và nhờ đó kéo dài tuổi thọ pin, đảm bảo pin luôn ở trong tình trạng tốt nhất để đáp ứng nhu cầu của bạn.</p><img alt=\"ASUS-VivoBook-14-A412-5\" src=\"http://electrostore.xyz/files/04_2021/products/b0a10e170eb7b96dbfc6ea3fb37229f5.jpg\">\r\n\r\n<br><p></p>', 17000000, 16690000, '191201276', 120, '/files/04_2021/products/970b5b4f46d1db10d1732907534f81e2.jpg', 'a:6:{i:0;s:60:\"/files/04_2021/products/970b5b4f46d1db10d1732907534f81e2.jpg\";i:1;s:60:\"/files/04_2021/products/ffce33db35794f3a5e1e7027547450f5.jpg\";i:2;s:60:\"/files/04_2021/products/dbe7be3c7823ef5b8a9f661db300351d.jpg\";i:3;s:60:\"/files/04_2021/products/9c9d05d7fd2214b2ecc70e6bfc036000.jpg\";i:4;s:60:\"/files/04_2021/products/638c739e3ba1051c97bebf27438dcd57.jpg\";i:5;s:60:\"/files/04_2021/products/ffe3f9c26b48be1c0cdcf6762503c385.jpg\";}', 3, 1619523288, 1622100140, 1, 'active', '', '');
INSERT INTO `products` VALUES (5, 'Laptop MSI GF63', 'laptop-msi-gf63', 8, '<li>CPU: Intel Core i5 9300H</li>\r\n<li>Màn hình: 15.6\" IPS (1920 x 1080)</li>\r\n<li>RAM: 1 x 8GB DDR4</li>\r\n<li>Đồ họa: NVIDIA GeForce GTX 1650 4GB GDDR6 / Intel UHD Graphics 630</li>\r\n<li>Lưu trữ: 512GB SSD M.2 NVMe</li>\r\n<li>Hệ điều hành: Windows 10 Home 64-bit</li>\r\n<li>Pin: 3 cell 51 Wh Pin liền</li>\r\n<li>Khối lượng: 1.9 kg</li>', '<p>\r\n\r\n</p><div><div><div><div><div><div><div><img alt=\"msi-gf63-thin\" src=\"https://tmp.phongvu.vn/wp-content/uploads/2019/05/msi-gf63-thin.jpg\"><h2><strong>Thiết kế nhôm phay xước </strong></h2><p>Được chế tác bằng chất liệu chủ đạo là nhôm phay xước, <strong>MSI GF63 9SCXR-075VN</strong>&nbsp;là chiếc <a target=\"_blank\" rel=\"nofollow\" href=\"https://phongvu.vn/laptop-choi-game-716.cat\">laptop gaming</a>&nbsp;hiện đại được thiết kế theo xu hướng mới hiện nay: mỏng nhẹ và tinh tế. Với các chỉ số ấn tượng như trọng lượng 1.86kg và kích thước 21.7mm, bạn có thể mang theo và chơi game ở bất kỳ đâu cùng bạn bè.</p><img alt=\"\" src=\"https://tmp.phongvu.vn/wp-content/uploads/2019/05/msi-gf63-thin-1.jpg\"><h2><strong>Hiệu năng mạnh mẽ</strong></h2><p>Tuy có thiết kế nhỏ gọn nhưng <strong>MSI GF63 9SCXR-075VN</strong>&nbsp;lại mang sức mạnh gaming đến từ vi xử lý đa nhân Intel mới nhất cho hiệu suất vượt trội hơn hẳn so với thế hệ trước. Bên cạnh đó, sức mạnh đồ họa đến từ card GeForce của NVIDIA cho phép bạn có thể tải về và chơi tốt các tựa game phổ biến hiện nay.</p><img alt=\"\" src=\"https://tmp.phongvu.vn/wp-content/uploads/2019/05/msi-gf63-thin-2.jpg\"><h2><strong>Màn hình siêu mỏng</strong></h2><p>Giờ đây thưởng thức trò chơi nhập vai trên một màn hình có tỷ lệ khung hình lớn hơn là một lợi thế dành cho các game thủ. Với viền màn hình mỏng 4.9mm, màn hình của <strong>MSI GF63 9SCXR-075VN</strong>&nbsp;có tỷ lệ khung hình lớn hơn các dòng <a target=\"_blank\" rel=\"nofollow\" href=\"https://phongvu.vn/laptop-va-linh-kien-macbook-715.cat\">laptop</a>&nbsp;gaming truyền thống đem lại một trải nghiệm chơi game rõ ràng và choáng ngợp.</p><img alt=\"\" src=\"https://tmp.phongvu.vn/wp-content/uploads/2019/05/msi-gf63-thin-3.jpg\"><h2><strong>Pin sử dụng 7 tiếng</strong></h2><p>Pin mở rộng mới mang lại cho bạn hơn 7 giờ sử dụng khi làm việc và giải trí trên <strong>MSI GF63 9SCXR-075VN</strong>&nbsp;mà không cần cắm sạc. Bên cạnh đó, công nghệ sạc nhanh sẽ giúp bạn sẵn sàng trò chơi ở bất kỳ lúc nào.</p><img alt=\"\" src=\"https://tmp.phongvu.vn/wp-content/uploads/2019/05/msi-gf63-thin-4.jpg\"><h2><strong>Tản nhiệt hiệu quả và yên tĩnh</strong></h2><p>Hệ thống tản nhiệt của <strong>MSI GF63 9SCXR-075VN</strong>&nbsp;được thiết kế để luôn hoạt động một cách êm ái và luôn giữ nhiệt độ dưới tải kể cả khi chơi game trong thời gian dài.</p><img alt=\"\" src=\"https://tmp.phongvu.vn/wp-content/uploads/2019/05/msi-gf63-thin-5.jpg\"><h2><strong>Quản lý âm thanh với Nahimic 3</strong></h2><p>Bạn có thể tùy ý tinh chỉnh và cài đặt âm thanh bằng Phần mềm Nahimic 3 độc quyền trên <strong>MSI GF63 9SCXR-075VN</strong>, giúp tăng cường chất lượng âm thanh vòm 3D trong trò chơi và kiểm soát hữu hạn âm nhạc, phim và cuộc gọi hội nghị của bạn.</p><img alt=\"\" src=\"https://tmp.phongvu.vn/wp-content/uploads/2019/05/msi-gf63-thin-6.jpg\"><h2><strong>DRAGON CENTER 2.0 - Giám sát tối ưu</strong></h2><p>Thiết kế mới Dragon Center 2.0 trên <strong>MSI GF63 9SCXR-075VN</strong>&nbsp;sẽ tối ưu hóa mọi thứ hoàn toàn lên một tầm cao mới giúp bạn giám sát và tối ưu hóa thông qua các tùy chỉnh khác nhau và giải phóng bộ nhớ hệ thống để ưu tiên hiệu suất trong trò chơi.</p><img alt=\"\" src=\"https://tmp.phongvu.vn/wp-content/uploads/2019/05/msi-gf63-thin-7.jpg\"></div></div></div></div>Thu gọn nội dung</div></div></div><div><div><div><div><br>\r\n\r\n</div></div></div></div><br><p></p>', 20000000, 18990000, '200301339', 80, '/files/04_2021/products/9b91e069b039c46c219b5d9e31e84310.jpg', 'a:6:{i:0;s:60:\"/files/04_2021/products/9b91e069b039c46c219b5d9e31e84310.jpg\";i:1;s:60:\"/files/04_2021/products/960707188faa2c9b6450cd6ba9eaf39f.jpg\";i:2;s:60:\"/files/04_2021/products/3e96aaa5c44aaf99a5dce59351a96f23.jpg\";i:3;s:60:\"/files/04_2021/products/8cc67f58e5d16094f977e0e7599a7db2.jpg\";i:4;s:60:\"/files/04_2021/products/ded87cd3bc812aeb3325292eed830dff.jpg\";i:5;s:60:\"/files/04_2021/products/257e0b3c89f8fb9ee00d0c586dfa9679.jpg\";}', 11, 1619536509, 1622100112, 1, 'active', '', '');
INSERT INTO `products` VALUES (6, 'Chuột gaming Logitech G502 HERO (Đen)', 'chut-gaming-logitech-g502-hero-den', 9, '<li>Kiểu kết nối: Có dây</li>\r\n<li>Cảm biến: HERO</li>\r\n<li>Độ phân giải: 16000 DPI</li>\r\n<li>Tốc độ phản hồi: 1000 Hz (1ms)</li>\r\n<li>Màu sắc: Đen</li>', '<p>\r\n\r\n</p><h2><strong>Giới thiệu sản phẩm chuột chơi game Logitech G502 HERO</strong></h2><p><img width=\"1024\" alt=\"\" src=\"https://tmp.phongvu.vn/wp-content/uploads/2019/02/0c5b20bc-4607-48b0-85a9-417447d166bd._CR001464600_PT0_SX1464__-1024x420.jpg\" height=\"420\"></p><p>Trong những năm gần đây, ngành công nghiệp game nói chung phát triển rất mạnh mẽ trên toàn thế giới. Kéo theo đó là sự chạy đua của các thương hiệu lớn trên thế giới như <a target=\"_blank\" rel=\"nofollow\" href=\"http://bit.ly/2NJIgG3\">Razer</a>, <a target=\"_blank\" rel=\"nofollow\" href=\"http://bit.ly/2NKoxWQ\">SteelSeries,</a>&nbsp;<a target=\"_blank\" rel=\"nofollow\" href=\"http://bit.ly/2NMkxF1\">Corsair</a>… trong việc sản xuất và phát triển tất cả những gì xoay quanh nền công nghiệp triệu đô này như laptop/PC gaming, linh kiện máy tính và gaming gear. Thành lập vào năm 1981 tại Thụy Sĩ, <a target=\"_blank\" rel=\"nofollow\" href=\"http://bit.ly/2NLrGFI\">Logitech </a>nhanh chóng chiếm được chỗ đứng trong lòng các game thủ từ nghiệp dư tới chuyên nghiệp trên toàn thế giới với những sản phẩm được chú trọng cao về chất lượng và mang những thiết kế đặc trưng đến từ NSX, trong đó có thể kể đến Logitech G502,  Gaming Mouse thành công nhất của hãng.</p><p>Được giới thiệu với cộng động PC Gear quốc tế cách đây 5 năm, chuột Gaming Logitech G502 vẫn luôn giữ vững được ngôi vương và sự tin dùng của toàn bộ giới mộ đạo , được thể hiện qua vị trí Top 1 Gaming Mouse bán chạy nhất trên sàn thương mại điện tử Amazon. Một sự phối hợp hoàn hảo giữa cảm biến siêu tốc Pixart PMW3366 cùng với thiết kế mang âm hưởng ‘phi thuyền không gian’ của những tập phim khoa học viễn tưởng Star War, có thể nói G502 là một tác phẩm nghệ thuật hoàn chỉnh nhất mà thương hiệu công nghệ đến từ Thụy Sĩ Logitech từng chế tạo nên. Thậm chí hoàn hảo đến mức thiết kế và nội thất không hề thay đổi, có chăng chỉ thêm phần mê hoặc người dùng với lần nâng cấp RGB qua bản G502 Proteus Spectrum.</p><p><img width=\"614\" alt=\"Logitech g502 0\" src=\"https://tmp.phongvu.vn/wp-content/uploads/2019/02/Dl4TK5lX4AAWVdb.jpg\" height=\"346\"></p><p>Để tri ân một trong những Gaming Mouse bán chạy nhất của hãng, Logitech một lần nữa hoàn thiện và đưa G502 lên một tầm cao mới mang tên G502 Hero với sự tinh chỉnh và nâng cấp cảm biến quang học. Giờ đây, với cảm biến HERO 16K, Logitech G502 sẵn sàng để dẫn đầu cuộc chơi một lần nữa.</p><h3>Thông số kĩ thuật</h3><ul><li>Tên sản phẩm: Logitech G502 Hero</li><li>Cảm biến Logitech HERO 16K</li><li>DPI: 100 – 16000</li><li>Kết nối: USB 2.0/3.0, dây dẫn bọc lưới chống cắt</li><li>Thiết kế bất đối xứng dành cho người dùng thuận tay phải</li><li>LED RGB 16.8 triệu màu</li><li>Chip xử lý ARM 32-bit</li><li>11 nút lập trình được</li><li>Bộ nhớ có thể lưu trữ 5 chế độ</li><li>Kích thước: 132mm x 75mm x 40mm</li><li>Trọng lượng: 121g (đi kèm bộ 5 tạ với 3.6g mỗi tạ)</li><li>Phần mềm hỗ trợ: Logitech Gaming Software</li><li>Thời gian sử dụng: 50 triệu lần click.</li></ul><h3>Thiết kế</h3><p>Hoặc tinh tế như <a target=\"_blank\" rel=\"nofollow\" href=\"http://bit.ly/2NMlkWv\">Logitech G Pro</a>&nbsp;với những đường cong mềm mại và bề mặt phủ matte bóng mờ, hoặc phong trần, hiện đại và góc cạnh như <a target=\"_blank\" rel=\"nofollow\" href=\"https://phongvu.vn/chuot-ban-phim-ban-di/chuot-choi-game/logitech/chu-t-may-tinh-logitech-gaming-g903-den.html?utm_source=seo&amp;utm_medium=teknews\">Logitech G903</a>&nbsp;cao cấp. Thiết kế của Logitech G502 Hero thiên về nhiều hơn và gắn liền với chủ đề du hành không gian giống như G903, hay nói đúng hơn, chính chuột Gaming G502 hàng đầu đã khai mở hình ảnh hoàn toàn hiện đại, rũ bỏ quan niệm tẻ nhạt về một Logitech chỉ biết sản xuất phụ kiện văn phòng. Trong khi G903 mang hình bóng của một nhân vật viễn tưởng có ảnh hưởng nhất nhì đối với lịch sử điện ảnh sci-fi: Darth Vader thì <a target=\"_blank\" rel=\"nofollow\" href=\"http://bit.ly/2NNaKia\">Logitech G502 Hero</a>&nbsp;và toàn bộ tiền nhiệm lại có cấu trúc hoạt tiết làm liên tưởng tới Millenium Falcon trong màu đen.</p><p><img width=\"828\" alt=\"Logitech G502 hero 1\" src=\"https://tmp.phongvu.vn/wp-content/uploads/2019/02/photo-1-15369174892421104756511.jpg\" height=\"511\"></p><p>Sản phẩm mang thiết kế dành riêng cho những người thuận tay phải với thân chuột hơi cao hơn ở phía bên trái, mang lại sự thoải mái nhất cho người sử dụng. Logo được thiết kế hơi lệch sang bên trái, nằm ở khoảng trống tạo ra giữa ngón tay trỏ và ngón tay cái giúp cho hiệu ứng LED của của G502 trên logo có thể dễ dàng nhìn thấy ngay cả khi sử dụng sản phẩm (điều mà ít người làm được). Chuột được phủ một lớp sơn đen, hơi nhám và khó bám vân tay. Điều này giúp cho chuột luôn giữ được sự “đẹp mã” của mình, kể cả trong thời gian dài sử dụng. Hai bên hông chuột được bọc cao su cao cấp, giúp tăng khả năng bám tay của sản phẩm. Do thiết kế dành riêng cho người thuận tay phải, bên trái chuột được mọc thêm một chiếc “cánh” nhằm mục đích đỡ ngón cái của người sử dụng, nhằm tạo cảm giác thoải mái nhất cho người sử dụng. G502 Hero được trang bị hệ thống LED RGB tại logo và khu vực thể hiện profile hay mức DPI của mình.</p><p>Logitech G502 Hero sở hữu tới 12 nút bấm và 11 trong số đó có khả năng tùy chỉnh qua phần mềm. Các nút bấm được bố trí hợp lý, nhằm hỗ trợ tối đa cho nhiệm vụ chính của sản phẩm là gaming. Đặc biệt, nút cuộn chuột (scroll) được làm bằng kim loại và có hai tùy chỉnh: cuộn thông thường và cuộn siêu tốc. Người sử dụng có thể thay đổi giữa hai khả năng này của scroll qua nút bấm ở ngay bên dưới, tùy vào nhu cầu sử dụng. Hơn thế nữa, scroll còn có thể &nbsp;click sang trái và phải, vì vậy mà số lượng nút bấm tùy chỉnh của G502 được nâng lên con số 11.</p><p><img width=\"1024\" alt=\"Logitech G502 Hero cam bien hero 16k\" src=\"https://tmp.phongvu.vn/wp-content/uploads/2019/02/maxresdefault-5-1024x576.jpg\" height=\"576\"></p><p>Logitech G502 Hero sẽ chẳng khác gì G502 Proteus Spectrum nếu không có sự nâng cấp vượt trội nhờ vào cảm biến HERO 16K. Đây là công nghệ cảm biến mới được chính Logitech phát triển và tích hợp vào G502 Hero cũng như G Pro Hero. Với khả năng điều chỉnh DPI từ 100-16000 và di chuyển 400+ IPS (inch per second), dường như Logitech G502 Hero sẽ là trợ thủ đắc lực cho những game thủ CS:GO, COD, PUBG,… đưa kĩ năng flick thần sầu của người chơi lên một tầm cao mới. Thêm vào đó, 3 tấm feet Teflon to và dày, giúp cho khả năng di chuyển chuột khi sử dụng được mượt mà và êm ái.</p><h3>Trải nghiệm người dùng</h3><p>Hiển nhiên, G502 Hero được chế tác dành riêng cho người thuận tay phải. Với phần vân cao su hai bên hông và thiết kế “cánh”, nếu không dùng cho Gaming thì quả thực mua về chỉ để lướt Web cũng không có gì sai. Người sử dụng sẽ cảm thấy  yên tâm với độ bám chắc chắn ‘như keo’ của G502 Hero nhưng không cần tới quá nhiều lực mà lại vô cùng thoải mái nhờ có vùng nghỉ ngón tay hợp lý.</p><p>Nhờ những yếu tố trên, khối lượng 121g của G502 Hero trên thực tế không hề dễ gây mỏi. Thậm chí với những player có lòng bàn tay to và ưa “đầm tay” thì G502 Hero hoàn toàn có thể chiếm được tình cảm của họ với 5 chiếc tạ chuột cân nặng 3.6g/chiếc. Nắp khoang tạ chuột có thể tháo/lắp dễ dàng với nam châm, hoàn toàn không ảnh hưởng tới thiết kế bên trong của sản phẩm. Tuy nhiên, tôi cho rằng gamer Việt không thực sự cần tới tính năng này khi mẫu tay của chúng ta tương đối nhỏ, hoặc ở mức vừa so với người phương Tây.</p><p><img width=\"602\" alt=\"logitech g502 hero weight chuot\" src=\"https://tmp.phongvu.vn/wp-content/uploads/2019/02/heavy.png\" height=\"370\"></p><p>Dẫu vậy, thật tốt khi biết rằng có một lựa chọn vô cùng chất lượng, có khả năng tùy chỉnh cao như Steelseries Rival 600 mà giá thành lại dễ thở hơn.</p><p>Tâm điểm của G502 Hero, không đáng để bàn cãi, đó chính là cảm biến HERO 16K do chính Logitech phát triển. Hãy cùng xem liệu sự thay đổi này mang lại điểm khác biệt thực sự đáng chú ý hay chỉ là một chiêu trò Marketing tăng khả năng nhận diện thương hiệu.</p><p>Theo như thông cáo của chính Logitech cũng như trải nghiệm trên thực tế, HERO 16K là phần linh kiện giúp G502 được nâng cấp mạnh mẽ và nâng mức DPI tối đa của con chuột gaming này lên tới 16,000 trong khi tiêu thụ điện năng ít hơn Pixart PMW3366 đang kể. Hiện tại chỉ có sốít sản phẩm gaming mouse mới có thể đạt được tới 16K DPI như <a target=\"_blank\" rel=\"nofollow\" href=\"http://bit.ly/2J3ojsS\">Corsair Scimitar Pro</a>,<a target=\"_blank\" rel=\"nofollow\" href=\"http://bit.ly/2NMm7Xt\">&nbsp;Razer Death Adder Elite</a>, <a target=\"_blank\" rel=\"nofollow\" href=\"https://phongvu.vn/chuot-ban-phim-ban-di/chuot-choi-game/razer/chu-t-may-tinh-razer-mamba.html?utm_source=seo&amp;utm_medium=teknews\">Razer Mamba</a>. Những cái tên trên đều nằm trong mức giá thành từ 1700K (DeathAdder) cho tới 2000K +. Điều đó biến Logitech G502 Hero thành một sự nâng cấp cực kì thỏa đáng từ bản Proteus Spectrum khi giới hạn DPI  cũ hoàn toàn bị vượt mặt mà giá thành cho sự thay đổi này gần như không tồn tại (1700K – 1800K)</p><p><img width=\"869\" alt=\"Hero 16k vs Pixart pmw3366\" src=\"https://tmp.phongvu.vn/wp-content/uploads/2019/02/5zvVdcq.jpg\" height=\"473\"></p><p>Mặt khác, DPI càng cao không có nghĩa là thao tác game của người sử dụng càng chính xác. Trái lại, 16K DPI trên thực tế khiến cho di chuyển con trỏ chuột vô cùng khó khăn bởi nó quá nhạy kể cả khi đã chỉnh mức Sensitivity trong game và ngoài Windows tới mức thấp nhất. Do vậy, tôi không khuyến khích các bạn đẩy tối đa thông số điểm ảnh/ inch của chuột nếu chỉ chơi game trên màn hình có độ phân giải Full HD 1920 x 1080.</p><p>Trước kia, một trong những điểm yếu nhất của Logitech G502 đó chính là tuổi thọ của các nút trái/ phải cơ học chỉ giới hạn trong 20 triệu lần click, thua xa switch Omron 50 triệu lần nhấp của ”cặp đôi hoàn hảo” Rival 310 và Sensei 310 của đối thủ Steelseries sừng sỏ cũng đến từ Bắc Âu. Giờ đây với khi đã được nâng cấp, người dùng G502 Hero hoàn toàn có thể tự tin sánh vai và ngẩng đầu đôi chút khi sản phẩm cao cấp của mình sẽ không yểu mệnh.</p><h3>G Hub</h3><p>Tính năng Plug &amp; Play cho phép G502 Proteus Spectrum cắm vào là có thể sử dụng ngay. Tuy vậy, để có thể cài đặt chức năng cho từng phím, mức DPI hay hiệu ứng LED của sản phẩm thì người sử dụng phải sử dụng đến phần mềm. Trước kia tôi không hề thoải mái khi sử dụng sản phẩm của Logitech, không phải bởi vì chất lượng gear tệ. Thực chất, phần mềm Logitech Gaming Software mới là điều ngăn cản tình yêu bắt đầu bởi giao diện kém thu hút, không hấp dẫn và thiếu tính cộng đồng – những yếu tố mà Steelseries Engine và Corsair iCUE đã và đang làm rất tốt.</p><p>Tuy nhiên với sự ra mắt của G Hub gần đây, giao diện thân thiện và dễ sử dụng mới khiến việc tinh chỉnh và cá nhân hóa gear Logitech trở nên hấp dẫn hơn bao giờ hết.</p><p><img width=\"1264\" alt=\"\" src=\"https://tmp.phongvu.vn/wp-content/uploads/2019/02/123123.jpg\" height=\"450\"></p><p>Đầu tiên, G502 được trang bị sẵn bộ nhớ trên chuột cho những cài đặt của sản phẩm. Do đó, người sử dụng có thể lựa chọn sử dụng bộ nhớ của chuột hay là bộ nhớ của máy tính để cài đặt. Nếu bạn thường xuyên mang G502 đi chinh chiến cùng anh em chiến hữu, lựa chọn cài đặt vào bộ nhớ chuột sẽ rất hữu ích vì bạn sẽ không cần thiết phải cài đặt lại khi sử dụng ở những chiếc PC hay laptop khác nhau. Do vậy, chúng ta sẽ chủ yếu phân tích khả năng này của G502 Hero. Và thay vì chỉ có thể lưu lại được 3 profile tùy chỉnh giống như Proteus Spectrum, Hero đã có thể lưu lại tới 5 giao diện cài đặt, sẵn sàng phục vụ người dùng trong mọi tình huống.</p><p>Với profile, người sử dụng có thể lựa chọn tối đa 5 mức DPI trải dài tư 100 tới 16000. Do mức DPI tối đa mà hầu hết những gamer hay bất cứ ai trên thế giới thường xuyên sử dụng chỉ vào khoảng 3200, nên khả năng của G502 Hero có thể bao trọn toàn bộ nhu cầu của người sử dụng. Người sử dụng có thể cài đặt 2 mức DPI mặc định (Default) hay mức DPI thay đổi tạm thời (Shift) trong 5 mức DPI tối đa của sản phẩm. Điều này rất có ích cho gamer FPS trong những trường hợp phải thay đổi DPI bất ngờ như chuyển đổi từ spray sang sniper.</p><p>Thêm vào đó, giao diện Color Screen Sampler cho phép đèn RGB Logitech G502 Hero thay đổi theo Wallpaper của PC, thêm một lựa chọn nữa cho hành trình cá đồng bộ và cá nhân hóa  dàn PC của chúng ta.</p><p><img width=\"1024\" alt=\"\" src=\"https://tmp.phongvu.vn/wp-content/uploads/2019/02/Screenshot_20-1024x698.png\" height=\"698\"></p><h3>Tổng kết</h3><p>Có thể nâng cấp Logitech G502 không phải là bước đi đột phá nhất của thương hiệu tới từ Thụy Sĩ, dẫu cho chưa thực sự phát huy tiềm năng của cảm biến Hero 16K mạnh mẽ nhưng tiêu thụ điện năng ít hơn (dễ dàng có thể tạo nên phiên bản G502 Wireless). Tuy nhiên với việc hoàn thiện một trong những sản phẩm hấp dẫn và bán chạy nhất của mình trong khi không hề thay đổi giá thành, Logitech quả thực biết quan tâm tới người tiêu dùng và là một nước cờ đúng đắn.</p>\r\n\r\n<br><p></p>', 1800000, 1790000, '1810470', 0, '/files/05_2021/products/5778c9ddbdcef3efac3ae047255ca1e8.jpg', 'a:6:{i:0;s:60:\"/files/05_2021/products/5778c9ddbdcef3efac3ae047255ca1e8.jpg\";i:1;s:60:\"/files/05_2021/products/1c44e6a0dd537f4d31cfd821fa009131.jpg\";i:2;s:60:\"/files/05_2021/products/6e32370b675ebabd9452988091a13418.jpg\";i:3;s:60:\"/files/05_2021/products/97c8041e08776d9b2c902b38bd7be84b.jpg\";i:4;s:60:\"/files/05_2021/products/a4483133d2abe3312729553b662970ad.jpg\";i:5;s:60:\"/files/05_2021/products/89f2fbc31327dbadf9eda3064d580644.jpg\";}', 1, 1620051208, 1622260196, 5, 'active', '', '');
INSERT INTO `products` VALUES (7, 'Điện Thoại Di Động iPhone 11 64GB (BLACK)', 'din-thoi-di-dng-iphone-11-64gb-black', 17, '- Chính hãng, Mới 100%, Nguyên seal\r\n- Màn hình: 6.1\" Liquid Retina IPS LCD\r\n- Camera sau: 2x 12MP\r\n- Camera trước: 12MP\r\n- CPU: A13 Bionic\r\n- Bộ nhớ: 64GB\r\n- RAM: 4GB\r\n- Hệ điều hành: IOS', '<p>\r\n\r\n</p><h3>iPhone 11 64GB (BLACK) (MHDA3VN/A) một sản phẩm điện thoại đẳng cấp đến từ nhà Apple . Với hiệu năng vượt trội và thiết kế đột phá, đầy sang trọng. Chiếc điện thoại này được đánh giá là một trong những sản phẩm nổi bật, tích hợp nhiều công nghệ hiện đại, hứa hẹn sẽ đem đến cho người dùng những trải nghiệm tuyệt vời.</h3><h4><strong>Màn hình 6.1 inch Liquid Retina IPS LCD sắc nét, thiết kế với màu đen huyền ảo, sang trọng, thu hút mọi ánh nhìn</strong></h4><p>Điện Thoại Di Động iPhone 11 64GB (BLACK) (MHDA3VN/A) sở hữu màn hình tai thỏ Liquid Retina IPS LCD 6.1 inch đem đến một không gian hiển thị rộng đáp ứng hoàn hảo các nhu cầu.</p><p>Thêm vào đó việc Apple sử dụng màn hình LCD trên chiếc iPhone 11 64G MHDA3VN/A của mình sẽ mang tới những hình ảnh với màu sắc rõ nét và trung thực đến tuyệt mỹ.</p><img alt=\"iPhone 11 64GB BLACK MHDA3VNA  Thu ht mi nh nhn\" src=\"https://tmp.phongvu.vn/wp-content/uploads/2021/04/iPhone-11-64GB-BLACK-MHDA3VNA-1.jpg\"><p>Hiện nay, iPhone 11 64GB được Apple gửi đến người dùng 6 phiên bản màu sắc: Đen, Đỏ, Trắng, Vàng, Tím, Xanh mint để các bạn thỏa sức lựa chọn. Trong đó màu đen vẫn là một trong những màu sắc được yêu thích nhất khi mang lại cảm giác huyền bí, sang trọng và không bao giờ bị lỗi thời.</p><h4><strong>Trang bị chip A13 Bionic, Ram 4GB, bộ nhớ 64GB chiếc iPhone 11 64GB (BLACK) được đánh giá cao về hiệu năng</strong></h4><p>Chip A13 Bionic giúp chiếc iPhone 11 64GB (BLACK) (MHDA3VN/A) trở nên mạnh mẽ hơn, ít tốn điện năng hơn so với các thế hệ iPhone trước đây. </p><p>Cùng với Ram 4GB, các tác vụ được chiếc điện thoại này xử lý nhanh chóng và mượt mà hơn rất nhiều. Bạn sẽ không còn phải trải qua những phút giây giật, lag, treo máy nhất là khi đang xem những video hấp dẫn.</p><img alt=\"iPhone 11 64GB BLACK MHDA3VNA  Chip hin i \" src=\"https://tmp.phongvu.vn/wp-content/uploads/2021/04/iPhone-11-64GB-BLACK-MHDA3VNA-2.jpg\"><p>64GB bộ nhớ trong được trang bị cho  iPhone 11 64G MHDA3VN/A không phải là con số cao nhất mà Apple dành cho iPhone 11. Tuy nhiên nó hoàn toàn đủ để bạn có thể lưu trữ những bức hình kỉ niệm, thông tin, tài liệu ở mức tương đối nhiều, đáp ứng đủ các nhu cầu công việc cùng như giải trí của bạn.</p><h4><strong>Camera trước 12MP, cụm camera sau 2 x 12MP đẳng cấp</strong></h4><p>Camera trước góc rộng, được trang bị thêm khả năng tạo ra những chiếc video với chất lượng 4K siêu đỉnh là một điểm cộng cực lớn của chiếc iPhone 11 64GB (BLACK) (MHDA3VN/A). Đặc biệt, đối với những ai là tín đồ của việc chụp ảnh Selfie thì ưu điểm này càng thu hút hơn cả.</p><img alt=\"iPhone 11 64GB BLACK MHDA3VNA  Cm camera sau ng cp \" src=\"https://tmp.phongvu.vn/wp-content/uploads/2021/04/iPhone-11-64GB-BLACK-MHDA3VNA-3.jpg\"><p>Cụm camera sau của iPhone 11 64G MHDA3VN/A với 2 camera 12MP mang đến trải nghiệm với góc chụp siêu rộng, độ phân giải cao. cộng thêm khả năng chụp tốt trong không gian hẹp cũng như vào ban đêm cho bạn thỏa sức sáng tạo ra những bức ảnh, thước phim siêu đỉnh, siêu chất lượng.</p><p>Ngoài ra khi thực hiện quay video trên chiếc iPhone 11 64GB (BLACK) bạn sẽ thấy những thước phim được tái hiện có độ ổn định cao, ít rung lắc. Đây là kết quả của việc áp dụng công nghệ chống rung trên chiếc điện thoại hiện đại này của Apple.</p><img alt=\"iPhone 11 64GB BLACK MHDA3VNA  To ra nhng thc phim lin mch \" src=\"https://tmp.phongvu.vn/wp-content/uploads/2021/04/iPhone-11-64GB-BLACK-MHDA3VNA-4.jpg\"><p>Điện Thoại Di Động iPhone 11 64GB (BLACK) (MHDA3VN/A) không có khác biệt lớn giữa chất lượng hình ảnh của camera trước và sau. Hơn thế nữa, việc chuyển qua lại giữa hai camera rất mượt mà và từ đó giúp cho ra những thước phim liền mạch với chất lượng cao và màu sắc thống nhất.</p><h4><strong>Pin lithium ‑ ion 3310 mAh, hỗ trợ công nghệ sạc nhanh</strong></h4><p>Pin luôn là một điểm trừ của dòng điện thoại iphone, người dùng đã phàn nàn rất nhiều về việc chiếc iPhone của mình rất nhanh tụt pin. Tuy nhiên với iPhone 11 thì khác. Viên pin lithium ‑ ion 3310 mAh, iPhone 11 64GB (BLACK) (MHDA3VN/A) được trang bị giúp nó nhận sự đánh giá tích cực hơn và trở thành một trong những chiếc iPhone có thời lượng pin khá dài.</p><img alt=\"iPhone 11 64GB BLACK MHDA3VNA  Dung lng pin cao \" src=\"https://tmp.phongvu.vn/wp-content/uploads/2021/04/iPhone-11-64GB-BLACK-MHDA3VNA-5.jpg\"><p>Với nhu cầu sử dụng thông thường như: xem video, nghe gọi, nhắn tin, lướt Facebook... bạn hoàn toàn có thể sử dụng iPhone 11 64GB (BLACK) (MHDA3VN/A) được khoảng 1 ngày. Ngoài ra Apple còn trang bị thêm tính năng sạc nhanh giúp những hoạt động trong cuộc sống của bạn luôn được liền mạch, tăng cường thêm tiện ích cho người sử dụng.</p><img alt=\"iPhone 11 64GB BLACK MHDA3VNA  Cng ngh sc nhanh\" src=\"https://tmp.phongvu.vn/wp-content/uploads/2021/04/iPhone-11-64GB-BLACK-MHDA3VNA-6.jpg\"><h4><strong>Mua iPhone 11 64GB (BLACK) (MHDA3VN/A) chính hãng, nguyên seal và trả góp 0% tại Phong Vũ PC</strong></h4>\r\n\r\n<br><p></p>', 21990000, 16690000, '201100347', 20, '/files/05_2021/products/d288e1848a7aa72d1c0abcd412fc58d4.jpg', 'a:6:{i:0;s:60:\"/files/05_2021/products/d288e1848a7aa72d1c0abcd412fc58d4.jpg\";i:1;s:60:\"/files/05_2021/products/8198fa947294dce44149ee652144ad0f.jpg\";i:2;s:60:\"/files/05_2021/products/5b9adb40aed60007f078076873ba8e45.jpg\";i:3;s:60:\"/files/05_2021/products/1f54682cee442358a6aee27fd7c70198.jpg\";i:4;s:60:\"/files/05_2021/products/f0045b780d8985e985e051963f9cc5e1.jpg\";i:5;s:60:\"/files/05_2021/products/f47d367cbc46fbec3857a8258d54a8b6.jpg\";}', 9, 1622033269, NULL, 16, 'active', '', '<p>&lt;div class=\"css-9zicy3\"&gt;&lt;div class=\"css-1bglpso\"&gt;&lt;div color=\"#333\" class=\"css-dcbhpa\"&gt;&lt;div class=\"css-1oycjaj\"&gt;&lt;div color=\"#333\" class=\"css-wsluue\"&gt;&lt;/div&gt;&lt;div color=\"#333\" class=\"title css-akoccx\"&gt;Thông số kỹ thuật&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class=\"css-9cg3h6\"&gt;&lt;div class=\"css-7j9rw7\"&gt;&lt;span class=\"css-6z2lgz\"&gt;Thương hiệu&lt;/span&gt;&lt;span class=\"css-tg3p86\"&gt;&lt;div class=\"css-111s35w\"&gt;APPLE&lt;/div&gt;&lt;/span&gt;&lt;/div&gt;&lt;div class=\"css-7j9rw7\"&gt;&lt;span class=\"css-6z2lgz\"&gt;Bảo hành&lt;/span&gt;&lt;span class=\"css-tg3p86\"&gt;&lt;div class=\"css-111s35w\"&gt;12&lt;/div&gt;&lt;/span&gt;&lt;/div&gt;&lt;div class=\"css-lrvw60\"&gt;Thông tin chung&lt;/div&gt;&lt;div class=\"css-7j9rw7\"&gt;&lt;span class=\"css-6z2lgz\"&gt;Nhóm sản phẩm&lt;/span&gt;&lt;span class=\"css-tg3p86\"&gt;&lt;div class=\"css-111s35w\"&gt;Điện thoại&lt;/div&gt;&lt;/span&gt;&lt;/div&gt;&lt;div class=\"css-7j9rw7\"&gt;&lt;span class=\"css-6z2lgz\"&gt;Tên&lt;/span&gt;&lt;span class=\"css-tg3p86\"&gt;&lt;div class=\"css-111s35w\"&gt;iPhone 11 MHDA3VN/A&lt;/div&gt;&lt;/span&gt;&lt;/div&gt;&lt;div class=\"css-7j9rw7\"&gt;&lt;span class=\"css-6z2lgz\"&gt;Màu sắc&lt;/span&gt;&lt;span class=\"css-tg3p86\"&gt;&lt;div class=\"css-111s35w\"&gt; Đen  Black &lt;/div&gt;&lt;/span&gt;&lt;/div&gt;&lt;div class=\"css-lrvw60\"&gt;Màn hình&lt;/div&gt;&lt;div class=\"css-7j9rw7\"&gt;&lt;span class=\"css-6z2lgz\"&gt;Loại màn hình&lt;/span&gt;&lt;span class=\"css-tg3p86\"&gt;&lt;div class=\"css-111s35w\"&gt;6.1\" Liquid Retina IPS LCD&lt;/div&gt;&lt;/span&gt;&lt;/div&gt;&lt;div class=\"css-7j9rw7\"&gt;&lt;span class=\"css-6z2lgz\"&gt;Độ phân giải&lt;/span&gt;&lt;span class=\"css-tg3p86\"&gt;&lt;div class=\"css-111s35w\"&gt;1792 ‑ x 828  pixel (326 ppi)&lt;/div&gt;&lt;/span&gt;&lt;/div&gt;&lt;div class=\"css-lrvw60\"&gt;Cấu hình&lt;/div&gt;&lt;div class=\"css-7j9rw7\"&gt;&lt;span class=\"css-6z2lgz\"&gt;Dung lượng (ROM)&lt;/span&gt;&lt;span class=\"css-tg3p86\"&gt;&lt;div class=\"css-111s35w\"&gt;64GB&lt;/div&gt;&lt;/span&gt;&lt;/div&gt;&lt;div class=\"css-7j9rw7\"&gt;&lt;span class=\"css-6z2lgz\"&gt;Hệ điều hành&lt;/span&gt;&lt;span class=\"css-tg3p86\"&gt;&lt;div class=\"css-111s35w\"&gt;IOS&lt;/div&gt;&lt;/span&gt;&lt;/div&gt;&lt;div class=\"css-7j9rw7\"&gt;&lt;span class=\"css-6z2lgz\"&gt;RAM&lt;/span&gt;&lt;span class=\"css-tg3p86\"&gt;&lt;div class=\"css-111s35w\"&gt;4GB&lt;/div&gt;&lt;/span&gt;&lt;/div&gt;&lt;div class=\"css-7j9rw7\"&gt;&lt;span class=\"css-6z2lgz\"&gt;Chip&lt;/span&gt;&lt;span class=\"css-tg3p86\"&gt;&lt;div class=\"css-111s35w\"&gt;A13 Bionic&lt;/div&gt;&lt;/span&gt;&lt;/div&gt;&lt;div class=\"css-7j9rw7\"&gt;&lt;span class=\"css-6z2lgz\"&gt;Pin&lt;/span&gt;&lt;span class=\"css-tg3p86\"&gt;&lt;div class=\"css-111s35w\"&gt;Pin lithium ‑ ion&lt;/div&gt;&lt;/span&gt;&lt;/div&gt;&lt;div class=\"css-7j9rw7\"&gt;&lt;span class=\"css-6z2lgz\"&gt;Cổng sạc&lt;/span&gt;&lt;span class=\"css-tg3p86\"&gt;&lt;div class=\"css-111s35w\"&gt;Lightning&lt;/div&gt;&lt;/span&gt;&lt;/div&gt;&lt;div class=\"css-7j9rw7\"&gt;&lt;span class=\"css-6z2lgz\"&gt;Loại sim&lt;/span&gt;&lt;span class=\"css-tg3p86\"&gt;&lt;div class=\"css-111s35w\"&gt;nano-SIM và eSIM&lt;/div&gt;&lt;/span&gt;&lt;/div&gt;&lt;div class=\"css-lrvw60\"&gt;Camera&lt;/div&gt;&lt;div class=\"css-7j9rw7\"&gt;&lt;span class=\"css-6z2lgz\"&gt;Camera sau&lt;/span&gt;&lt;span class=\"css-tg3p86\"&gt;&lt;div class=\"css-111s35w\"&gt;2x 12MP&lt;/div&gt;&lt;/span&gt;&lt;/div&gt;&lt;div class=\"css-7j9rw7\"&gt;&lt;span class=\"css-6z2lgz\"&gt;Camera trước&lt;/span&gt;&lt;span class=\"css-tg3p86\"&gt;&lt;div class=\"css-111s35w\"&gt;12MP&lt;/div&gt;&lt;/span&gt;&lt;/div&gt;&lt;div class=\"css-lrvw60\"&gt;Kết nối&lt;/div&gt;&lt;div class=\"css-lrvw60\"&gt;Thiết kế &amp;amp; trọng lượng&lt;/div&gt;&lt;/div&gt;&lt;button data-track-content=\"true\" data-content-region-name=\"specificationDetail\" data-content-name=\"viewMore\" class=\"css-h95iyj\"&gt;&lt;span class=\"css-1denlqa\"&gt;Xem thêm nội dung&lt;/span&gt;&lt;span direction=\"down\" size=\"12\" class=\"css-1kayoeg\"&gt;&lt;/span&gt;&lt;/button&gt;&lt;/div&gt;&lt;/div&gt;<br></p>');
INSERT INTO `products` VALUES (8, 'Màn hình LCD Gigabyte Full HD 165Hz Free Sync', 'man-hinh-lcd-gigabyte-full-hd-165hz-free-sync', 22, '<li>Kích thước 27inch</li>\r\n<li>Tấm nền VA, tỉ lệ 16:9</li>\r\n<li>Tần số quét 165Hz</li>', '<p>Đang cập nhật</p>', 6000000, 5590000, '210501811', 2, '/files/06_2021/products/3d96c74636e0b75e9f5db54fa9283dab.jpg', 'a:5:{i:0;s:60:\"/files/06_2021/products/3d96c74636e0b75e9f5db54fa9283dab.jpg\";i:1;s:60:\"/files/06_2021/products/e85b484171c7580b81a5a76e05a936c4.jpg\";i:2;s:60:\"/files/06_2021/products/ef21bd8aa9f6eb42f2138ea49b02c079.jpg\";i:3;s:60:\"/files/06_2021/products/3b9c5a751230203da284fd3b4ced2e13.jpg\";i:4;s:60:\"/files/06_2021/products/4f6e0a7123c50dc75dffa0d8bced774c.jpg\";}', 11, 1622508225, NULL, 19, 'active', '', '<p>Đang cập nhật</p>');
INSERT INTO `products` VALUES (9, 'PC PVP OMG V1 Intel Core i3-10100F/8GB/240GBSSD/GeForce GTX 1650 Super/Free DOS/', 'pc-pvp-omg-v1-intel-core-i3-10100f8gb240gbssdgeforce-gtx-1650-superfree-dos', 9, '- CPU Intel Comet Lake Core i3-10100F (4 Cores 8 Threads up to 4.30 GHz 10th Gen LGA 1200) (BX8070110100F)\r\n\r\n- Mainboard Asus H410M-E\r\n\r\n- SSD Kingston A400 240GB M.2 2280 (SA400M8/240G)\r\n\r\n- Ram DDR4 Kingston HyperX Fury Black 8GB (3000) (HX430C15FB3/8)\r\n\r\n- Card Asus TUF Gaming GeForce GTX 1650 Super 4GB GDDR6 (TUF-GTX1650S-4G-GAMING)\r\n\r\n- Power Golden Field Dragon 400W GTX480\r\n\r\n- Case Xigmatek OMG EN45244 (No Fan)', '<p>\r\n\r\n</p><p>- CPU Intel Comet Lake Core i3-10100F (4 Cores 8 Threads up to 4.30 GHz 10th Gen LGA 1200) (BX8070110100F)</p><p>- Mainboard Asus H410M-E</p><p>- SSD Kingston A400 240GB M.2 2280 (SA400M8/240G)</p><p>- Ram DDR4 Kingston HyperX Fury Black 8GB (3000) (HX430C15FB3/8)</p><p>- Card Asus TUF Gaming GeForce GTX 1650 Super 4GB GDDR6 (TUF-GTX1650S-4G-GAMING)</p><p>- Power Golden Field Dragon 400W GTX480</p><p>- Case Xigmatek OMG EN45244 (No Fan)</p>\r\n\r\n<br><p></p>', 11390000, 11390000, '201200460', 5, '/files/06_2021/products/9e94dda535a2a6b0a4a1fed09b9edf1f.jpg', 'a:2:{i:0;s:60:\"/files/06_2021/products/9e94dda535a2a6b0a4a1fed09b9edf1f.jpg\";i:1;s:60:\"/files/06_2021/products/3e188adccaebe0ef8f0d0592d27c04c1.jpg\";}', 11, 1622530356, NULL, 5, 'active', '', '<p>\r\n\r\n</p><p>- CPU Intel Comet Lake Core i3-10100F (4 Cores 8 Threads up to 4.30 GHz 10th Gen LGA 1200) (BX8070110100F)</p><p>- Mainboard Asus H410M-E</p><p>- SSD Kingston A400 240GB M.2 2280 (SA400M8/240G)</p><p>- Ram DDR4 Kingston HyperX Fury Black 8GB (3000) (HX430C15FB3/8)</p><p>- Card Asus TUF Gaming GeForce GTX 1650 Super 4GB GDDR6 (TUF-GTX1650S-4G-GAMING)</p><p>- Power Golden Field Dragon 400W GTX480</p><p>- Case Xigmatek OMG EN45244 (No Fan)</p>\r\n\r\n<br><p></p>');
INSERT INTO `products` VALUES (10, 'Laptop Asus X415MA-BV088T | Pentium N5030 | RAM 4GB | 256GB SSD | Intel® UHD | 14.0 inch | Win 10', 'laptop-asus-x415ma-bv088t-pentium-n5030-ram-4gb-256gb-ssd-intel-uhd-140-inch-win-10', 8, 'Laptop Asus X415MA-BV088T | Pentium N5030 | RAM 4GB | 256GB SSD | Intel® UHD | 14.0 inch | Win 10', '<p>\r\n\r\nThông Số Kỹ Thuật:\r\n\r\n•	Bộ vi xử lý:         Intel Pentium Silver N5030 \r\n•	Tốc độ:           1.10GHz upto 3.10GHz, 4 cores 4 threads\r\n•	Bộ nhớ đệm:      4MB Cache\r\n•	Bộ nhớ trong (RAM):        4GB DDR4 SO-DIMM\r\n•	Ổ cứng:            256GB M.2 NVMe™ PCIe® 3.0 SSD\r\n•	Ổ đĩa quang (ODD):             Không\r\n•	Màn hình:          14.0-inch, HD (1366 x 768) 16:9, Anti-glare display, LED Backlit, 200nits, NTSC: 45%\r\n•	Độ phân giải:         1366 x 768\r\n•	Card màn hình:            Intel® UHD Graphics 600\r\n•	Wireless:       Wi-Fi 5(802.11ac)\r\n•	Bluetooth:       Bluetooth 4.1 (Dual band) 1*1\r\n•	Kiểu bàn phím:           Bàn phím tiêu chuẩn\r\n•	Chuột:       Cảm ứng đa điểm\r\n•	Kết nối USB\r\n•	1x USB 3.2 Gen 1 Type-A\r\n•	1x USB 3.2 Gen 1 Type-C\r\n•	2x USB 2.0 Type-A\r\n•	Kết nối HDMI/VGA\r\n•	Camera:         VGA camera \r\n•	Card mở rộng:           Micro SD card reader\r\n•	LOA:     2 Loa\r\n•	Kiểu Pin:         2-cell, 37WHrs\r\n•	Hệ điều hành:       Windows 10 Home\r\n•	Kích thước (Dài x Rộng x Cao):      32.54 x 21.60 x 1.99 ~ 1.99 cm\r\n•	Trọng Lượng:       1.5kg\r\n\r\n<br></p>', 7850000, 7850000, 'X415MA-BV088T', 300, '/files/06_2021/products/dbb294deb88030f29ad3bca62a50bca1.jpg', 'a:3:{i:0;s:60:\"/files/06_2021/products/dbb294deb88030f29ad3bca62a50bca1.jpg\";i:1;s:60:\"/files/06_2021/products/541280ab1b1b751dbae9c2d789745379.jpg\";i:2;s:60:\"/files/06_2021/products/6fea16775b9bc4150a3c041dc55de2de.jpg\";}', 3, 1622876616, NULL, 21, 'active', '', '<p>\r\n\r\nThông Số Kỹ Thuật:\r\n\r\n•	Bộ vi xử lý:         Intel Pentium Silver N5030 \r\n•	Tốc độ:           1.10GHz upto 3.10GHz, 4 cores 4 threads\r\n•	Bộ nhớ đệm:      4MB Cache\r\n•	Bộ nhớ trong (RAM):        4GB DDR4 SO-DIMM\r\n•	Ổ cứng:            256GB M.2 NVMe™ PCIe® 3.0 SSD\r\n•	Ổ đĩa quang (ODD):             Không\r\n•	Màn hình:          14.0-inch, HD (1366 x 768) 16:9, Anti-glare display, LED Backlit, 200nits, NTSC: 45%\r\n•	Độ phân giải:         1366 x 768\r\n•	Card màn hình:            Intel® UHD Graphics 600\r\n•	Wireless:       Wi-Fi 5(802.11ac)\r\n•	Bluetooth:       Bluetooth 4.1 (Dual band) 1*1\r\n•	Kiểu bàn phím:           Bàn phím tiêu chuẩn\r\n•	Chuột:       Cảm ứng đa điểm\r\n•	Kết nối USB\r\n•	1x USB 3.2 Gen 1 Type-A\r\n•	1x USB 3.2 Gen 1 Type-C\r\n•	2x USB 2.0 Type-A\r\n•	Kết nối HDMI/VGA\r\n•	Camera:         VGA camera \r\n•	Card mở rộng:           Micro SD card reader\r\n•	LOA:     2 Loa\r\n•	Kiểu Pin:         2-cell, 37WHrs\r\n•	Hệ điều hành:       Windows 10 Home\r\n•	Kích thước (Dài x Rộng x Cao):      32.54 x 21.60 x 1.99 ~ 1.99 cm\r\n•	Trọng Lượng:       1.5kg\r\n\r\n<br></p>');
INSERT INTO `products` VALUES (11, 'Apple MacBook Pro (2020) M1 Chip, 13 inch, 8GB, 256GB SSD', 'apple-macbook-pro-2020-m1-chip-13-inch-8gb-256gb-ssd', 10, 'Apple MacBook Pro (2020) M1 Chip, 13 inch, 8GB, 256GB SSD', '<p>\r\n\r\nChip Apple M1 định nghĩa lại MacBook Pro 13 inch. Sở hữu CPU 8 lõi xử lý siêu tốc các luồng công việc phức tạp về hình ảnh, mã hóa, biên tập video cùng nhiều việc khác. GPU 8 lõi siêu mạnh xử lý gọn các tác vụ đồ họa khủng và chạy game siêu mượt. Neural Engine 16 lõi tiên tiến tăng cường sức mạnh công nghệ máy học tích hợp trong các ứng dụng yêu thích của bạn. Bộ nhớ thống nhất siêu nhanh cho mọi hoạt động mượt mà. Và thời lượng pin dài nhất từng có trên máy Mac, lên đến 20 giờ. (2) Đây chính là chiếc máy tính xách tay chuyên nghiệp thịnh hành nhất của Apple. Hiệu năng cao hơn hẳn, pro hơn hẳn. \r\n\r\nTính năng nổi bật \r\n•        Chip M1 do Apple thiết kế tạo ra một cú nhảy vọt về hiệu năng máy học, CPU và GPU \r\n•        Làm được nhiều việc hơn với thời lượng pin lên đến 20 giờ, thời lượng pin lâu nhất trong các dòng máy tính Mac từ trước đến nay (2) \r\n•        CPU 8 lõi cho hiệu năng nhanh hơn đến 2.8x, xử lý các luồng công việc nhanh hơn bao giờ hết (1) \r\n•        GPU 8 lõi với tốc độ xử lý đồ họa nhanh gấp 5x cho các ứng dụng và game có đồ họa khủng (1) \r\n•        Neural Engine 16 lõi cho công nghệ máy học hiện đại \r\n•        Bộ nhớ thống nhất 8GB giúp bạn làm việc gì cũng nhanh chóng và trôi chảy \r\n•        Ổ lưu trữ SSD siêu nhanh giúp mở các ứng dụng và tập tin chỉ trong tích tắc \r\n•        Hệ thống tản nhiệt chủ động mang lại hiệu năng tuyệt vời \r\n•        Màn hình Retina với độ sáng 500 nit cho màu sắc sống động và chi tiết ấn tượng (3) \r\n•        Camera FaceTime HD với bộ xử lý tín hiệu hình ảnh tiên tiến cho các cuộc gọi video đẹp hình, rõ tiếng hơn \r\n•        Ba micro phối hợp chuẩn studio thu giọng nói của bạn rõ hơn \r\n•        Wi-Fi 6 thế hệ mới giúp kết nối nhanh hơn \r\n•        Hai cổng Thunderbolt / USB 4 để sạc và kết nối phụ kiện \r\n•        Bàn phím Magic Keyboard có đèn nền và Touch ID giúp mở khóa và thanh toán an toàn hơn \r\n•        macOS Big Sur với thiết kế mới đầy táo bạo cùng nhiều cập nhật quan trọng cho các ứng dụng Safari, Messages và Maps \r\n•        Hiện có màu xám bạc và bạc  \r\n\r\nPháp lý \r\nHiện có sẵn các lựa chọn để nâng cấp. \r\n(1) So với thế hệ máy trước. \r\n(2) Thời lượng pin khác nhau tùy theo cách sử dụng và cấu hình. Truy cập apple.com/batteries để biết thêm thông tin. \r\n(3) Kích thước màn hình tính theo đường chéo.\r\n\r\nThông tin bảo hành:\r\nBảo hành: 12 tháng kể từ ngày kích hoạt sản phẩm.\r\nKích hoạt bảo hành tại: <a target=\"_blank\" rel=\"nofollow\" href=\"https://checkcoverage.apple.com/vn/en/\">https://checkcoverage.apple.com/vn/en/</a>\r\n\r\nHướng dẫn kiểm tra địa điểm bảo hành gần nhất:\r\nBước 1: Truy cập vào đường link <a target=\"_blank\" rel=\"nofollow\" href=\"https://getsupport.apple.com/?caller=grl&amp;locale=en_VN\">https://getsupport.apple.com/?caller=grl&amp;locale=en_VN</a> \r\nBước 2: Chọn sản phẩm.\r\nBước 3: Điền Apple ID, nhập mật khẩu.\r\nSau khi hoàn tất, hệ thống sẽ gợi ý những trung tâm bảo hành gần nhất.\r\n\r\n<br></p>', 31490000, 31490000, 'MACBOOKM1', 20, '/files/06_2021/products/5eaa166626300472585229ccff1c39a2.jpg', 'a:3:{i:0;s:60:\"/files/06_2021/products/5eaa166626300472585229ccff1c39a2.jpg\";i:1;s:60:\"/files/06_2021/products/3eb6ac60baa7b29fc14c5beedf114349.jpg\";i:2;s:60:\"/files/06_2021/products/fb21d39b46a6a4a5774402c540200824.jpg\";}', 9, 1622876838, NULL, 8, 'active', '', '<p>\r\n\r\nChip Apple M1 định nghĩa lại MacBook Pro 13 inch. Sở hữu CPU 8 lõi xử lý siêu tốc các luồng công việc phức tạp về hình ảnh, mã hóa, biên tập video cùng nhiều việc khác. GPU 8 lõi siêu mạnh xử lý gọn các tác vụ đồ họa khủng và chạy game siêu mượt. Neural Engine 16 lõi tiên tiến tăng cường sức mạnh công nghệ máy học tích hợp trong các ứng dụng yêu thích của bạn. Bộ nhớ thống nhất siêu nhanh cho mọi hoạt động mượt mà. Và thời lượng pin dài nhất từng có trên máy Mac, lên đến 20 giờ. (2) Đây chính là chiếc máy tính xách tay chuyên nghiệp thịnh hành nhất của Apple. Hiệu năng cao hơn hẳn, pro hơn hẳn. \r\n\r\nTính năng nổi bật \r\n•        Chip M1 do Apple thiết kế tạo ra một cú nhảy vọt về hiệu năng máy học, CPU và GPU \r\n•        Làm được nhiều việc hơn với thời lượng pin lên đến 20 giờ, thời lượng pin lâu nhất trong các dòng máy tính Mac từ trước đến nay (2) \r\n•        CPU 8 lõi cho hiệu năng nhanh hơn đến 2.8x, xử lý các luồng công việc nhanh hơn bao giờ hết (1) \r\n•        GPU 8 lõi với tốc độ xử lý đồ họa nhanh gấp 5x cho các ứng dụng và game có đồ họa khủng (1) \r\n•        Neural Engine 16 lõi cho công nghệ máy học hiện đại \r\n•        Bộ nhớ thống nhất 8GB giúp bạn làm việc gì cũng nhanh chóng và trôi chảy \r\n•        Ổ lưu trữ SSD siêu nhanh giúp mở các ứng dụng và tập tin chỉ trong tích tắc \r\n•        Hệ thống tản nhiệt chủ động mang lại hiệu năng tuyệt vời \r\n•        Màn hình Retina với độ sáng 500 nit cho màu sắc sống động và chi tiết ấn tượng (3) \r\n•        Camera FaceTime HD với bộ xử lý tín hiệu hình ảnh tiên tiến cho các cuộc gọi video đẹp hình, rõ tiếng hơn \r\n•        Ba micro phối hợp chuẩn studio thu giọng nói của bạn rõ hơn \r\n•        Wi-Fi 6 thế hệ mới giúp kết nối nhanh hơn \r\n•        Hai cổng Thunderbolt / USB 4 để sạc và kết nối phụ kiện \r\n•        Bàn phím Magic Keyboard có đèn nền và Touch ID giúp mở khóa và thanh toán an toàn hơn \r\n•        macOS Big Sur với thiết kế mới đầy táo bạo cùng nhiều cập nhật quan trọng cho các ứng dụng Safari, Messages và Maps \r\n•        Hiện có màu xám bạc và bạc  \r\n\r\nPháp lý \r\nHiện có sẵn các lựa chọn để nâng cấp. \r\n(1) So với thế hệ máy trước. \r\n(2) Thời lượng pin khác nhau tùy theo cách sử dụng và cấu hình. Truy cập apple.com/batteries để biết thêm thông tin. \r\n(3) Kích thước màn hình tính theo đường chéo.\r\n\r\nThông tin bảo hành:\r\nBảo hành: 12 tháng kể từ ngày kích hoạt sản phẩm.\r\nKích hoạt bảo hành tại: <a target=\"_blank\" rel=\"nofollow\" href=\"https://checkcoverage.apple.com/vn/en/\">https://checkcoverage.apple.com/vn/en/</a>\r\n\r\nHướng dẫn kiểm tra địa điểm bảo hành gần nhất:\r\nBước 1: Truy cập vào đường link <a target=\"_blank\" rel=\"nofollow\" href=\"https://getsupport.apple.com/?caller=grl&amp;locale=en_VN\">https://getsupport.apple.com/?caller=grl&amp;locale=en_VN</a> \r\nBước 2: Chọn sản phẩm.\r\nBước 3: Điền Apple ID, nhập mật khẩu.\r\nSau khi hoàn tất, hệ thống sẽ gợi ý những trung tâm bảo hành gần nhất.\r\n\r\n<br></p>');
INSERT INTO `products` VALUES (12, 'Loa Bluetooth JBL Boombox 40W - Hàng Chính Hãng', 'loa-bluetooth-jbl-boombox-40w---hang-chinh-hang', 13, 'Loa Bluetooth JBL Boombox 40W - Hàng Chính Hãng', '<p>\r\n\r\nTHÔNG TIN SẢN PHẨM\r\n- JBL Boombox được thiết kế để phù hợp với yêu cầu mang đến âm nhạc sôi động và mạnh mẽ, giàu năng lượng cho những buổi tiệc hay những buổi dã ngoại\r\n- Hỗ trợ kết nối Bluetooth v4.1 (A2DP v1.3, AVRCP V1.5, HFP V1.6, HSP V1.2) nhanh chóng và tiện lợi\r\n- Công nghệ JBL Connect + cho phép thiết lập hệ thống lên tới 100 loa di động liên kết với nhau để phát nhạc trong một không gian rộng lớn hoặc đa phòng\r\n- Âm thanh trung thực, sống động với chất lượng âm bass mạnh mẽ\r\n- Hỗ trợ cổng audio 3.5mm sử dụng trên các thiết bị không có bluetooth\r\n- Dùng pin sạc với dung lượng lên đến 20000 mAh, thời gian sử dụng liên tục lên đến 24 giờ cho chơi nhạc với sạc thiết bị\r\n- Có thể sử dụng sạc cho điện thoại di động thông qua cổng 2 USB trên loa\r\n- Đèn LED thông minh thông báo tình trạng pin và tình trạng kết nối Bluetooth\r\n- Thiết kế hầm hố, thời trang, có khả năng chống nước, thuận tiện khi đi du lịch, dã ngoại...\r\n- Pin: Lithium-ion Polymer (14.8V, 20,000mAh)\r\n- Trọng lượng: 5.25 kg\r\n- Sản phẩm chính hãng JBL (USA)\r\n\r\n<br></p>', 7990000, 7990000, 'JBLBOOMBOX', 20, '/files/06_2021/products/f720996c33287c861552db16a481b782.jpg', 'a:2:{i:0;s:60:\"/files/06_2021/products/f720996c33287c861552db16a481b782.jpg\";i:1;s:60:\"/files/06_2021/products/3e366320701e70bf13d897f0767808f2.jpg\";}', 10, 1622877075, NULL, 13, 'active', '', '');

-- ----------------------------
-- Table structure for shipings
-- ----------------------------
DROP TABLE IF EXISTS `shipings`;
CREATE TABLE `shipings`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code` varchar(129) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` double NOT NULL,
  `created_at` int(11) UNSIGNED NULL DEFAULT NULL,
  `updated_at` int(11) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shipings
-- ----------------------------
INSERT INTO `shipings` VALUES (1, 'standard', '1', 50000, 1622963665, NULL);
INSERT INTO `shipings` VALUES (2, 'express', '2', 125000, 1622963665, NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `firstname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lastname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `group_id` int(4) NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` enum('male','female','other') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `phone_number` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_login` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `previous_login` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `login_hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `profile_fields` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'users.png',
  `address` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `created_at` int(11) UNSIGNED NULL DEFAULT NULL,
  `updated_at` int(11) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id_group_id`(`user_id`, `group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'hoanghoa12@gmail.com', 'Xnn0kLWU9Qw+0lU7xH3rTPok+r6VFVpjiRjmuTRbhY8=', 'Hoang', 'Hoa', 1, 'hoanghoa12@gmail.com', 'male', '2000-01-12', '+8422216523', '1623647185', '1622907191', '9a73171b759cf822e8c6451208b31e4829e728df', 1, NULL, '/files/05_2021/avatars/7d2e7b367de733a78ba1b7509ca96053.jpg', 'HCM City', 1619927816, 1623647185);
INSERT INTO `users` VALUES (2, 'hoanghoa123456', 'Xnn0kLWU9Qw+0lU7xH3rTPok+r6VFVpjiRjmuTRbhY8=', 'Hòa', 'Hoàng', 1, 'hoadevap@hoadevapp.tk', 'male', '2000-05-01', '123456789', '1623657442', '1623571253', '97421cb15ae01b3ccdd3e8e4d3f9bb3b53aed217', 2, NULL, '/files/05_2021/avatars/ed3f9e23ee822ed34975db7cbd1f6f35.png', NULL, 1619928078, 1623657442);
INSERT INTO `users` VALUES (3, 'admin', 'Xnn0kLWU9Qw+0lU7xH3rTPok+r6VFVpjiRjmuTRbhY8=', NULL, NULL, 100, 'admin@admin.com', NULL, NULL, NULL, '1623658198', '1623649132', '1e2d2ffdec07cf9bfbf86a674de7901d1e9c8877', 3, NULL, 'users.png', NULL, 1620048793, 1623658198);
INSERT INTO `users` VALUES (4, 'hoanghoa123', 'Xnn0kLWU9Qw+0lU7xH3rTPok+r6VFVpjiRjmuTRbhY8=', NULL, NULL, 1, 'hoanghoa123@gmail.com', NULL, NULL, NULL, '1621064324', '0', '2a8692cde3289b4dad2e17b404059a7e571c8b1f', 4, NULL, 'users.png', NULL, 1621064271, 1621064324);
INSERT INTO `users` VALUES (5, 'hoanghoa1212', 'Xnn0kLWU9Qw+0lU7xH3rTPok+r6VFVpjiRjmuTRbhY8=', NULL, NULL, 1, 'user@gmail.com', NULL, NULL, NULL, '1622120534', '0', '3ba3fff9de370af372cad37407024c6183e4424a', 5, NULL, 'users.png', NULL, 1622120519, 1622120534);

-- ----------------------------
-- Table structure for users_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_groups`;
CREATE TABLE `users_groups`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` int(11) UNSIGNED NULL DEFAULT NULL,
  `updated_at` int(11) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_groups
-- ----------------------------
INSERT INTO `users_groups` VALUES (1, 'admin', 3, 1620048793, NULL);

-- ----------------------------
-- Table structure for users_metadata
-- ----------------------------
DROP TABLE IF EXISTS `users_metadata`;
CREATE TABLE `users_metadata`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) UNSIGNED NOT NULL,
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `created_at` int(11) UNSIGNED NULL DEFAULT NULL,
  `updated_at` int(11) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_metadata
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
