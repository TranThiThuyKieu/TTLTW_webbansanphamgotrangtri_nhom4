/*
 Navicat Premium Dump SQL

 Source Server         : abc
 Source Server Type    : MySQL
 Source Server Version : 100432 (10.4.32-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : webbansanphamgotrangtri_db

 Target Server Type    : MySQL
 Target Server Version : 100432 (10.4.32-MariaDB)
 File Encoding         : 65001

 Date: 13/04/2026 12:42:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for addresses
-- ----------------------------
DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `province_id` int NULL DEFAULT NULL,
  `province` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `district_id` int NULL DEFAULT NULL,
  `district` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ward_code` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ward` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `detail` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `isDefault` tinyint NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_address_user`(`user_id` ASC) USING BTREE,
  CONSTRAINT `fk_address_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of addresses
-- ----------------------------
INSERT INTO `addresses` VALUES (2, 2, NULL, 'thu duc', NULL, 'linh trung', NULL, 'virt nam', 'qe', NULL, NULL, 1);
INSERT INTO `addresses` VALUES (4, 10, NULL, '12', NULL, '121', NULL, '12', '12', 'Nguyễn Trường Giang', '0944459364', 0);
INSERT INTO `addresses` VALUES (5, 4, NULL, '3', NULL, '214', NULL, '124', '243', 'bao toan', '0974913047', 0);
INSERT INTO `addresses` VALUES (6, 4, NULL, '3', NULL, '214', NULL, '112345', '243', 'bao toan', '0974913047', 1);
INSERT INTO `addresses` VALUES (7, 118, NULL, '3', NULL, '214', NULL, '112345', '243', 'bao toan', '0974913047', 1);
INSERT INTO `addresses` VALUES (8, 118, NULL, '214', NULL, '3434', NULL, 'q4567', '1244', 'bao toan', '0974913047', 0);
INSERT INTO `addresses` VALUES (9, 121, NULL, 'Bình Định', NULL, 'Phù Mỹ', NULL, 'An Lạc Đông 1', 'số 1 hẻm 8', 'Trần Thị Thúy Kiều', '0974913047', 1);
INSERT INTO `addresses` VALUES (10, 121, NULL, 'Bình Dương', NULL, 'Dĩ An', NULL, 'Kha Vạn Cân', 'Số 8', 'Trần Thị Thúy Kiều', '0984335012', 0);
INSERT INTO `addresses` VALUES (11, 122, NULL, 'Bình Dương', NULL, 'Dĩ An', NULL, 'Kha Vạn Cân', 'Số 8', 'Trần Thị Thúy Kiều', '0984335012', 1);
INSERT INTO `addresses` VALUES (12, 122, NULL, 'Bình Định', NULL, 'Phù Mỹ', NULL, 'An Lạc Đông 1', 'Số 8', 'Trần Thị Thúy Kiều', '0984335012', 0);
INSERT INTO `addresses` VALUES (13, 123, 202, '', 1463, '', '21802', '', '123', 'Nguyễn Minh Hậu', '0962967942', 0);
INSERT INTO `addresses` VALUES (14, 123, 250, 'Hậu Giang', 2048, 'Huyện Vị Thuỷ', '640203', 'Xã Vị Đông', '1232131231', 'Nguyễn Minh Hậu', '0974913047', 1);
INSERT INTO `addresses` VALUES (28, 124, 253, 'Bạc Liêu', 1935, 'Thị Xã Giá Rai', '600404', 'Xã Phong Tân', '12321', 'Nguyễn Minh Hậu', '0974913047', 0);
INSERT INTO `addresses` VALUES (31, 124, 266, 'Sơn La', 2032, 'Huyện Thuận Châu', '140425', 'Xã Phổng Lập', 'ád', 'Nguyễn Minh Hậu', '0123456789', 0);

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'TRANG TRÍ PHÒNG KHÁCH');
INSERT INTO `categories` VALUES (2, 'TRANG TRÍ PHÒNG NGỦ');
INSERT INTO `categories` VALUES (3, 'TRANG TRÍ PHÒNG LÀM VIỆC');
INSERT INTO `categories` VALUES (4, 'TRANG TRÍ PHÒNG BẾP');
INSERT INTO `categories` VALUES (5, 'ĐỒ TRANG TRÍ MINI');
INSERT INTO `categories` VALUES (6, 'QÙA LƯU NIỆM');

-- ----------------------------
-- Table structure for colors
-- ----------------------------
DROP TABLE IF EXISTS `colors`;
CREATE TABLE `colors`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `colorname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `color_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of colors
-- ----------------------------
INSERT INTO `colors` VALUES (1, 'Nâu trầm', '#8B4513');
INSERT INTO `colors` VALUES (2, 'Màu Cánh gián', '#800000');
INSERT INTO `colors` VALUES (3, 'Màu Hạt dẻ', '#95452A');
INSERT INTO `colors` VALUES (4, 'Màu Óc chó', '#4E342E');
INSERT INTO `colors` VALUES (5, 'Đen', '#000000');
INSERT INTO `colors` VALUES (6, 'Xám Nhạt', '#D3D3D3');
INSERT INTO `colors` VALUES (7, 'Xám Chì', '#36454F');
INSERT INTO `colors` VALUES (8, 'Trắng Kem', '#F5F5DC');
INSERT INTO `colors` VALUES (9, 'Vân Gỗ Sồi', '#DEB887');
INSERT INTO `colors` VALUES (10, 'Vân Gỗ Thông ', '#F5DEB3');
INSERT INTO `colors` VALUES (11, 'Vân Gỗ Tần Bì ', '#E3DAC9');
INSERT INTO `colors` VALUES (12, 'Vân Gỗ Sồi Xám', '#B0ADA3');
INSERT INTO `colors` VALUES (13, 'Nâu Đen ', '#2F211F');
INSERT INTO `colors` VALUES (14, 'Xám phối gỗ sồi', '#808080');

-- ----------------------------
-- Table structure for contact_settings
-- ----------------------------
DROP TABLE IF EXISTS `contact_settings`;
CREATE TABLE `contact_settings`  (
  `id` int NOT NULL DEFAULT 1,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '+84 123 456 789',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'contact@company.com',
  `detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ward_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ward` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `district_id` int NULL DEFAULT NULL,
  `district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `province_id` int NULL DEFAULT NULL,
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `facebook_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'https://facebook.com/yourshop',
  `instagram_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'https://instagram.com/yourshop',
  `twitter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'https://twitter.com/yourshop',
  `google_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'https://google.com/search?q=yourshop',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of contact_settings
-- ----------------------------
INSERT INTO `contact_settings` VALUES (1, '0974913047', 'tranthithuykieupm12005@gmail.com', '123', '370406', 'Xã Hoài Hải', 1771, 'Thị xã Hoài Nhơn', 262, 'Bình Định', '', '', '', '', '2026-03-29 10:01:55');

-- ----------------------------
-- Table structure for contacts
-- ----------------------------
DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `fname` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `lname` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_contact_user`(`user_id` ASC) USING BTREE,
  CONSTRAINT `fk_contact_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of contacts
-- ----------------------------
INSERT INTO `contacts` VALUES (1, NULL, 'bao', 'toan', 'tranthithuykieupm12005@gmail.com', '0974913047', 'ẻtyu');

-- ----------------------------
-- Table structure for coupon_usages
-- ----------------------------
DROP TABLE IF EXISTS `coupon_usages`;
CREATE TABLE `coupon_usages`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `coupon_id` int NULL DEFAULT NULL,
  `order_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_coupon_usage_user`(`user_id` ASC) USING BTREE,
  INDEX `fk_coupon_usage_coupon`(`coupon_id` ASC) USING BTREE,
  INDEX `fk_coupon_usage_order`(`order_id` ASC) USING BTREE,
  CONSTRAINT `fk_coupon_usage_coupon` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_coupon_usage_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_coupon_usage_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of coupon_usages
-- ----------------------------

-- ----------------------------
-- Table structure for coupons
-- ----------------------------
DROP TABLE IF EXISTS `coupons`;
CREATE TABLE `coupons`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `discount` decimal(10, 2) NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `isActive` tinyint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of coupons
-- ----------------------------

-- ----------------------------
-- Table structure for descriptions
-- ----------------------------
DROP TABLE IF EXISTS `descriptions`;
CREATE TABLE `descriptions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `introduce` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `highlights` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `information_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_descriptions_information`(`information_id` ASC) USING BTREE,
  CONSTRAINT `fk_descriptions_information` FOREIGN KEY (`information_id`) REFERENCES `informations` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 213 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of descriptions
-- ----------------------------
INSERT INTO `descriptions` VALUES (1, 'Bộ bàn ăn bằng gỗ sồi tự nhiên đem đến cảm giác ấm cúng, gần gũi cho bữa ăn gia đình. Thiết kế hiện đại, nhỏ gọn phù hợp mọi không gian bếp', 'Gỗ tự nhiên kết hợp veneer bền bỉ; Chống cong vênh, mối mọt; Cạnh bàn bo tròn an toàn tuyệt đối', 1);
INSERT INTO `descriptions` VALUES (2, 'Bàn đảo bếp mặt gỗ thân tủ xám mang đến không gian hiện đại, sang trọng. Thiết kế chuẩn xu hướng, màu sắc trung tính thời thượng, phù hợp mọi phong cách nội thất.', 'Chất liệu gỗ sồi cao cấp; Gia công CNC tỉ mỉ; Xử lý cạnh và khoan cam chốt chính xác; Đảm bảo hoàn thiện cao nhất', 2);
INSERT INTO `descriptions` VALUES (3, 'Bàn ăn gỗ tự nhiên 100% gỗ sồi đã qua xử lý, mang phong cách hiện đại với những đường nét mộc mạc, làm tôn lên vẻ đẹp sang trọng cho phòng bếp.', '100% gỗ sồi chống cong vênh, mối mọt; Sử dụng phụ kiện ray bi, bản lề giảm chấn Caryny chính hãng; Thiết kế bo tròn cạnh an toàn.', 3);
INSERT INTO `descriptions` VALUES (4, 'Mẫu bàn ăn gỗ công nghiệp 4 ghế khung sắt sở hữu kiểu dáng đơn giản, nhỏ gọn, là lựa chọn lý tưởng cho nhiều không gian phòng ăn gia đình hiện đại với mức giá vô cùng hợp lý.', 'Gỗ MDF lõi xanh chống ẩm phủ Melamine cao cấp chống trầy xước; Khung sắt phun sơn tĩnh điện chắc chắn; Phụ kiện ray bi và bản lề giảm chấn chính hãng Caryny.', 4);
INSERT INTO `descriptions` VALUES (5, 'Bàn ăn hình tròn nhỏ gọn là lựa chọn thông minh cho không gian hạn chế, mang lại vẻ đẹp tinh tế và ấm cúng.', 'Thiết kế tròn tiết kiệm diện tích; Gỗ sồi tự nhiên bền bỉ; Phụ kiện Caryny cao cấp.', 5);
INSERT INTO `descriptions` VALUES (6, 'Mẫu bàn ăn phong cách thanh lịch, hiện đại, làm nổi bật vẻ đẹp tự nhiên của gỗ sồi cho không gian phòng bếp.', 'Thiết kế tròn tinh tế; Chất liệu gỗ sồi tự nhiên; Bộ gồm 1 bàn 4 ghế ngồi thoải mái.', 6);
INSERT INTO `descriptions` VALUES (7, 'Bộ bàn ăn hiện đại là giải pháp hoàn hảo giúp không gian phòng ăn thêm thẩm mỹ và ấm cúng cho mỗi bữa cơm gia đình.', 'Chất liệu gỗ sồi tự nhiên & veneer sồi; Phụ kiện Caryny chính hãng; Bộ gồm 1 bàn và 4 ghế.', 7);
INSERT INTO `descriptions` VALUES (8, 'Bộ bàn ăn Mango được sản xuất theo tiêu chuẩn xuất khẩu, là giải pháp nội thất tinh tế cho bàn ăn gia đình hoặc bàn tiếp khách.', 'Gỗ cao su tiêu chuẩn Mỹ, Nhật; Nệm simily cao cấp êm ái; Quy cách đóng gói 1 kiện/set tiện lợi.', 8);
INSERT INTO `descriptions` VALUES (9, 'Bộ bàn ăn gỗ tự nhiên thu hút bởi vẻ đẹp mộc mạc, giản dị, mang lại cảm giác ấm cúng và thoải mái cho phòng ăn.', 'Gỗ sồi tự nhiên thân thiện; Ghế nệm bọc da sang trọng; Phụ kiện Caryny giảm chấn cao cấp.', 9);
INSERT INTO `descriptions` VALUES (10, 'Sản phẩm là điểm nhấn tuyệt vời cho các cặp đôi, mang lại sự sang trọng và hiện đại cho không gian nhỏ.', 'MDF lõi xanh chống ẩm vượt trội; Xử lý cạnh tỉ mỉ; Màu sắc và kích thước linh hoạt.', 10);
INSERT INTO `descriptions` VALUES (11, 'Bộ bàn ăn hiện đại đóng vai trò quan trọng tạo nên sự đầm ấm và thẩm mỹ cho không gian phòng bếp gia đình.', 'Thiết kế độc đáo: 2 ghế tựa và 2 ghế đôn; Gỗ sồi bền bỉ; Chống co ngót hiệu quả.', 11);
INSERT INTO `descriptions` VALUES (12, 'Bộ bàn ăn 4 ghế bọc da hiện đại mang vẻ đẹp trang nhã, là điểm nhấn sang trọng giúp bữa cơm gia đình thêm ngon miệng.', 'Mặt bàn MDF chống ẩm phun sơn; Ghế nệm bọc da cao cấp; Ray bi và bản lề giảm chấn Caryny.', 12);
INSERT INTO `descriptions` VALUES (13, 'Sự kết hợp hoàn hảo giữa bàn bầu dục mềm mại và ghế vuông vững chãi, mang lại vẻ đẹp hiện đại và tinh tế cho phòng ăn.', 'Gỗ sồi tự nhiên bền bỉ; Đệm mút êm ái; Phụ kiện ray bi và bản lề giảm chấn Caryny chính hãng.', 13);
INSERT INTO `descriptions` VALUES (14, 'Bàn ăn chân trụ tròn nghệ thuật là sự kết hợp giữa nét đẹp điêu khắc và tính ứng dụng, mang lại sự sang trọng và khác biệt cho phòng ăn hiện đại.', 'Chân trụ tròn xếp tầng độc đáo; Gia công CNC tỉ mỉ; Mặt bàn bo góc an toàn; Lưu ý: Giá chưa bao gồm ghế.', 14);
INSERT INTO `descriptions` VALUES (15, 'Bàn phòng khách là giải pháp tối ưu cho không gian sống hiện đại, vừa có thể làm bàn trà Nhật ngồi bệt vừa kết hợp hoàn hảo với sofa.', 'Thiết kế gấp gọn thông minh; MDF lõi xanh chống ẩm vượt trội; Góc cạnh bo tròn an toàn cho trẻ nhỏ; Sơn phủ an toàn sức khỏe.', 15);
INSERT INTO `descriptions` VALUES (16, 'Mẫu bàn trà với thiết kế dáng thấp hiện đại là mảnh ghép hoàn hảo cho những bộ sofa sang trọng hoặc không gian ngồi bệt tối giản.', 'Ngăn kéo tiện dụng; Bề mặt phủ Melamine chống trầy; Chân sắt tĩnh điện bền bỉ; Phụ kiện Caryny đóng mở êm ái.', 16);
INSERT INTO `descriptions` VALUES (17, 'Bàn trang trí mang ngôn ngữ thiết kế mềm mại, thanh lịch, là điểm nhấn nghệ thuật hoàn hảo cho sảnh đón khách hoặc hành lang căn hộ.', 'Chất liệu gỗ sồi tự nhiên sang trọng; Thiết kế siêu mỏng tiết kiệm diện tích; Đường nét bo cong tinh tế; Đa dạng màu sắc tùy chọn.', 17);
INSERT INTO `descriptions` VALUES (18, 'Mẫu bàn console mang phong cách cổ điển, là sự lựa chọn hoàn hảo để tạo điểm nhấn ấm cúng và sang trọng ngay tại tiền sảnh hoặc lối vào phòng khách.', 'Chất liệu gỗ sồi tự nhiên bền bỉ; Màu sắc trầm ấm hoài cổ; Thiết kế nhỏ gọn đa năng; Đường nét chế tác tỉ mỉ và tinh xảo.', 18);
INSERT INTO `descriptions` VALUES (19, 'Bàn trà là mẫu bàn \"quốc dân\" được yêu thích nhờ vẻ ngoài trang nhã, màu sắc thanh lịch dễ dàng phối hợp với mọi phong cách nội thất từ tối giản đến hiện đại.', 'MDF lõi xanh chống ẩm vượt trội; Công nghệ phun sơn mịn không tì vết; Khả năng tùy biến kích thước và màu sắc linh hoạt.', 19);
INSERT INTO `descriptions` VALUES (20, 'Bàn trà sở hữu phong cách hiện đại với điểm nhấn chân gỗ tự nhiên cao ráo, giúp việc vệ sinh sàn nhà trở nên dễ dàng hơn.', 'Thiết kế ngăn kéo tiện dụng; Chân gỗ tự nhiên chắc chắn; Chất liệu MDF lõi xanh bền bỉ; Kiểu dáng nhỏ gọn tối ưu không gian.', 20);
INSERT INTO `descriptions` VALUES (21, 'Bàn trà là biểu tượng của sự sang trọng với chất liệu gỗ sồi tự nhiên, mang lại hơi thở ấm áp và đẳng cấp cho không gian tiếp khách.', 'Chất liệu gỗ sồi tự nhiên 100%; Kết cấu mộng gỗ chắc chắn; Tuổi thọ sản phẩm lâu dài; Giá thành hợp lý so với chất lượng phân khúc cao cấp.', 21);
INSERT INTO `descriptions` VALUES (22, 'Bàn trà thông minh là giải pháp đột phá cho căn hộ nhỏ, cho phép biến đổi kích thước linh hoạt và xoay chuyển góc độ theo nhu cầu sử dụng.', 'Chân bàn xoay 360 độ độc đáo; Thiết kế kéo gọn tiết kiệm diện tích; Tích hợp ngăn kéo và hộc tủ lưu trữ; Kiểu dáng hiện đại thanh mảnh.', 22);
INSERT INTO `descriptions` VALUES (23, 'Bàn trà bệt hình tam giác là món đồ decor không thể thiếu cho các tín đồ yêu thích sự tối giản và sáng tạo. Sản phẩm đa năng có thể dùng làm bàn sofa, bàn bệt cafe hoặc bàn trà đạo.', 'Mặt bàn bo cong an toàn; Chống nước, chống xước tuyệt đối; Tháo lắp cực dễ chỉ bằng tô vít; Chân gỗ sồi chịu lực cao.', 23);
INSERT INTO `descriptions` VALUES (24, 'Bàn trà đơn giản tin tế cho gia đình', 'Tinh tế dễ sử dụng lâu hư', 24);
INSERT INTO `descriptions` VALUES (25, 'Mẫu bàn trà sofa phong cách hiện đại được sản xuất từ gỗ sồi nguyên khối, mang lại chất lượng chắc chắn và vẻ đẹp vượt thời gian cho phòng khách.', 'Chất liệu gỗ sồi tự nhiên chịu lực tốt; Sản xuất bằng máy móc CNC công nghệ cao; Mặt bàn rộng rãi tiện dụng; Thiết kế tinh tế tạo điểm nhấn.', 25);
INSERT INTO `descriptions` VALUES (26, 'Bàn trà với thiết kế tối giản và chân trụ vững chãi là giải pháp hoàn hảo cho không gian sống hiện đại, mang lại vẻ đẹp thanh lịch và tiện nghi.', 'Thiết kế bàn đôi linh hoạt; Chân gỗ tự nhiên cao cấp chịu lực tốt; MDF lõi xanh chống ẩm mốc; Dễ dàng phối hợp nội thất.', 26);
INSERT INTO `descriptions` VALUES (27, 'Bàn trà là giải pháp lưu trữ thông minh cho phòng khách, giúp tối ưu không gian và sắp xếp đồ dùng lặt vặt một cách khoa học nhất.', 'Nhiều không gian lưu trữ đa dạng; Gỗ MDF lõi xanh chống ẩm cao cấp; Thiết kế hiện đại thổi hồn cho không gian sống; Bề mặt Melamine chống trầy xước.', 27);
INSERT INTO `descriptions` VALUES (28, 'Bàn trà là sự kết hợp hoàn hảo giữa nét đẹp mộc mạc của gỗ sồi tự nhiên và sự tiện nghi của phụ kiện cao cấp, mang lại không gian lưu trữ rộng rãi cho phòng khách.', 'Ngăn bàn 2 tầng lưu trữ thông minh; Phụ kiện Ray bi giảm chấn Cariny chính hãng; Bề mặt gỗ sồi phun sơn mịn đẹp; Thiết kế ngăn kéo tiện dụng.', 28);
INSERT INTO `descriptions` VALUES (29, 'Bàn trà là sự lựa chọn tinh tế với thiết kế đa năng gồm 2 ngăn kéo và khoang chứa đồ cánh mở đối xứng, giúp phòng khách trở nên gọn gàng và độc đáo hơn.', 'Thiết kế 2 ngăn kéo và 1 khoang đồ 2 cánh mở tiện dụng; Chân inox đế cao su chống trượt chắc chắn; Gỗ MDF lõi xanh chống ẩm phủ Melamine chống trầy; Cạnh dán nẹp nhựa không thấm nước.', 29);
INSERT INTO `descriptions` VALUES (30, 'Bàn trang điểm mang lại sự bền đẹp, tiện nghi và chuẩn phong cách hiện đại cho không gian phòng ngủ.', 'Chất liệu gỗ sồi phủ veneer óc chó bền đẹp; Thiết kế tích hợp gương LED hạt đậu hiện đại; Tặng kèm ghế đôn đồng bộ; Kết cấu ghép mộng chắc chắn.', 30);
INSERT INTO `descriptions` VALUES (31, 'Bàn trang điểm mang đến vẻ ngoài hiện đại và ấn tượng, được làm từ MDF lõi xanh chống ẩm cao cấp nhất thị trường hiện nay.', 'Chất liệu MDF lõi xanh chống ẩm vượt trội; Phụ kiện Ray bi giảm chấn Cariny chính hãng; Thiết kế tích hợp tủ đồ tiện lợi; Chân gỗ tự nhiên bền vững.', 31);
INSERT INTO `descriptions` VALUES (32, 'Bàn trang điểm với thiết kế đơn giản, tinh tế giúp phái đẹp sắp xếp mỹ phẩm gọn gàng và tạo cảm giác thoải mái tối đa khi sử dụng hàng giờ.', 'Thiết kế nhỏ gọn phù hợp nhiều không gian; Gỗ MDF lõi xanh chống ẩm bền bỉ; Chân gỗ tự nhiên chịu lực tốt; Hỗ trợ tùy chỉnh kích thước theo yêu cầu.', 32);
INSERT INTO `descriptions` VALUES (33, 'Bàn trang điểm sở hữu thiết kế sang trọng từ gỗ sồi tự nhiên, là điểm nhấn hoàn hảo cho không gian phòng ngủ hiện đại với độ bền vượt trội.', 'Chất liệu gỗ sồi tự nhiên phun sơn mịn; Thiết kế nhiều ngăn chứa đồ đa năng; Gương soi lớn 650mm sắc nét; Độ bền lên đến 20 năm.', 33);
INSERT INTO `descriptions` VALUES (34, 'Tủ phấn trang điểm là sự kết hợp hoàn hảo giữa bàn trang điểm hiện đại và tủ lưu trữ đa năng, mang lại điểm nhấn tinh tế cho không gian làm đẹp.', 'Thiết kế khung sắt sơn tĩnh điện sang trọng; Mặt kính hiện đại dễ vệ sinh; Tích hợp tủ lưu trữ đồ dùng cực tiện lợi; MDF lõi xanh chống ẩm bền bỉ.', 34);
INSERT INTO `descriptions` VALUES (35, 'Bàn trang điểm là sự kết hợp độc đáo giữa tính thực dụng và thẩm mỹ, một tác phẩm nghệ thuật thể hiện sự đẳng cấp cho không gian phòng ngủ.', 'Chân sắt phun sơn mạ đồng sang trọng; Gỗ MDF lõi xanh chống ẩm phun sơn mịn; Thiết kế kèm tủ ngăn kéo đa năng; Tùy chọn gương LED hiện đại.', 35);
INSERT INTO `descriptions` VALUES (36, 'Bàn trang điểm là giải pháp hoàn hảo cho phòng ngủ nhỏ, tối ưu diện tích nhưng vẫn đảm bảo tính thẩm mỹ và công năng sử dụng cao.', 'Chất liệu gỗ sồi tự nhiên bền bỉ; Phụ kiện Caryny giảm chấn chính hãng; Thiết kế tích hợp mặt kính trắng sang trọng; Kích thước siêu nhỏ gọn tiết kiệm không gian.', 36);
INSERT INTO `descriptions` VALUES (37, 'Bàn trang điểm thiết kế theo xu hướng mới nhất với phong cách phá cách, là món nội thất khẳng định vẻ đẹp và cá tính của người phụ nữ hiện đại.', 'Chất liệu MDF lõi xanh chống ẩm kết hợp chân gỗ tự nhiên; Phun sơn S8 cao cấp mịn bóng; Phụ kiện Ray bi bản lề Caryny chính hãng; Thiết kế phá cách độc đáo.', 37);
INSERT INTO `descriptions` VALUES (38, 'Nằm trong BST \"Nắng\" hiện đại, bàn trang điểm là lựa chọn không thể thiếu cho phái đẹp, mang đến không gian làm đẹp gọn gàng và đầy cảm hứng.', 'Sản phẩm trọn bộ gồm bàn và ghế ngồi đồng bộ; Chất liệu MDF lõi xanh chống ẩm đạt chuẩn; Chân gỗ tự nhiên thanh mảnh nhưng chắc chắn; Phụ kiện Caryny cao cấp.', 38);
INSERT INTO `descriptions` VALUES (39, 'Bàn trang điểm gỗ tự nhiên mang phong cách thanh lịch, cổ điển, là lựa chọn hoàn hảo cho những ai yêu thích vẻ đẹp bền vững và sang trọng.', 'Chất liệu gỗ sồi tự nhiên chất lượng cao; Kiểu dáng cổ điển tinh tế; Kết cấu chắc chắn, chịu lực tốt; Bề mặt phun sơn mịn bảo vệ gỗ tối ưu.', 39);
INSERT INTO `descriptions` VALUES (40, 'Bàn trang điểm mang đến cho phái đẹp một góc làm đẹp hoàn hảo với thiết kế tích hợp tủ lưu trữ và ghế ngồi đồng bộ, tối ưu hóa không gian phòng ngủ.', 'Trọn bộ sản phẩm gồm Bàn + Tủ + Ghế tiện lợi; MDF lõi xanh chống ẩm bền bỉ theo thời gian; Phụ kiện Ray bi giảm chấn Caryny chính hãng; Chân gỗ tự nhiên vững chãi.', 40);
INSERT INTO `descriptions` VALUES (41, 'Bàn trang điểm mang phong cách hiện đại với lối thiết kế tiện dụng, nhiều ngăn để đồ, mang đến chất lượng tuyệt vời với mức giá phải chăng.', 'Thiết kế thông minh với nhiều ngăn lưu trữ mỹ phẩm; Gỗ MDF lõi xanh chống ẩm phủ Melamine bền đẹp 7-10 năm; Phụ kiện giảm chấn Cariny hoạt động êm ái; Chân gỗ tự nhiên chắc chắn.', 41);
INSERT INTO `descriptions` VALUES (42, 'Bàn trang điểm là sự giao thoa hoàn hảo giữa vẻ đẹp hiện đại và nét quyến rũ Á Đông với chi tiết cánh mây đan tinh tế, tạo điểm nhấn độc bản cho phòng ngủ.', 'Chi tiết cánh mây đan thủ công tỉ mỉ; Thiết kế tích hợp tủ ngăn kéo lưu trữ cực lớn; Gia công CNC chuẩn xác, khoan cam chốt thẩm mỹ; Gỗ MDF lõi xanh chống ẩm cao cấp.', 42);
INSERT INTO `descriptions` VALUES (43, 'Bàn trang điểm mang tone màu nhẹ nhàng, sang trọng, là điểm nhấn nổi bật cho không gian cá nhân với độ bền vượt trội từ chất liệu gỗ tự nhiên.', 'Chất liệu gỗ sồi tự nhiên bền bỉ theo thời gian; Thiết kế hiện đại, tinh tế; Bề mặt phun sơn mịn bảo vệ gỗ tối ưu; Tùy chọn 12 màu sơn phong phú.', 43);
INSERT INTO `descriptions` VALUES (44, 'Bàn trang điểm là lựa chọn hoàn hảo cho không gian hiện đại, bộ sản phẩm đi kèm ghế nệm bọc nỉ và gương cỡ lớn, mang lại sự tiện nghi và vẻ đẹp sang trọng cho phòng ngủ.', 'Chất liệu gỗ sồi tự nhiên bền bỉ kết hợp Veneer cao cấp; Bộ sản phẩm đầy đủ bàn, ghế nệm và gương; Phụ kiện Ray bi bản lề Caryny chính hãng; Thiết kế hiện đại, tinh tế.', 44);
INSERT INTO `descriptions` VALUES (45, 'Bàn làm việc hiện đại với thiết kế đơn giản và thanh lịch, mang lại không gian làm việc rộng rãi và chuyên nghiệp, phù hợp từ phòng khách đến phòng làm việc riêng.', 'Chất liệu MDF lõi xanh cao cấp chống ẩm mốc; Chân gỗ tự nhiên tạo độ bền và tính thẩm mỹ cao; Mặt bàn rộng rãi, dày dặn chắc chắn; Đa dạng màu sắc lựa chọn.', 45);
INSERT INTO `descriptions` VALUES (46, 'Bàn làm việc decor phong cách Bắc Âu sang trọng là lựa chọn hoàn hảo cho không gian hiện đại, đề cao tính thẩm mỹ và công năng. Thiết kế thanh lịch, tinh tế phù hợp cho văn phòng tại nhà hoặc studio sáng tạo.', 'Thiết kế phong cách Scandinavian tối giản; Gỗ MDF lõi xanh chống ẩm phun sơn bền màu; Gia công CNC chuẩn xác; Hệ thống cam chốt liên kết thẩm mỹ cao.', 46);
INSERT INTO `descriptions` VALUES (47, 'Bàn làm việc thiết kế đơn giản với mặt bàn rộng rãi và hộc tủ chứa đồ tiện lợi, là lựa chọn phổ biến cho văn phòng, trường học và không gian làm việc tại nhà.', 'Thiết kế tối ưu diện tích; Hộc ngăn kéo chứa đồ cá nhân tiện dụng; Chất liệu MDF lõi xanh chống ẩm cao cấp; Phù hợp nhiều phong cách nội thất.', 47);
INSERT INTO `descriptions` VALUES (48, 'Bàn làm việc liền giá sách hiện đại gây ấn tượng nhờ thiết kế tích hợp thông minh, chia ngăn khoa học giúp tối ưu hóa góc làm việc và lưu trữ tài liệu hiệu quả.', 'Thiết kế liền giá sách đa năng tiết kiệm diện tích; Kệ sách chia ngăn khoa học, thẩm mỹ; Chất liệu MDF lõi xanh chống ẩm bền bỉ; Mức giá thành hợp lý so với công năng.', 48);
INSERT INTO `descriptions` VALUES (50, 'Bàn làm việc cá nhân hình chữ L là giải pháp hoàn hảo giúp tiết kiệm diện tích, tận dụng triệt để các góc chết trong nhà để tạo nên một không gian làm việc hiện đại, năng động và tiện nghi.', 'Thiết kế hình chữ L tối ưu góc phòng; Chất liệu MDF lõi xanh chống ẩm bền bỉ; Mặt bàn rộng rãi giúp tăng hiệu suất làm việc; Kiểu dáng hiện đại phù hợp nhiều không gian.', 50);
INSERT INTO `descriptions` VALUES (51, 'Bàn làm việc hiện đại kèm giá sách mang đến cho bạn không gian học tập và làm việc không chỉ tiện nghi mà còn đầy tính thẩm mỹ, giúp tối ưu hóa diện tích phòng.', 'Thiết kế tích hợp giá sách giúp lưu trữ tài liệu ngăn nắp; Gỗ MDF lõi xanh có độ bền cao, chống ẩm mốc; Kết cấu chắc chắn, chịu lực tốt; Bề mặt phủ Melamine mịn màng dễ vệ sinh.', 51);
INSERT INTO `descriptions` VALUES (52, 'Bàn văn phòng phong cách thanh lịch mang đến vẻ đẹp đẳng cấp và không gian làm việc chuyên nghiệp, đặc biệt phù hợp cho những văn phòng lãnh đạo hoặc phòng làm việc riêng có diện tích rộng rãi.', 'Thiết kế hiện đại, thanh lịch và đẳng cấp; Kích thước lớn giúp tối ưu không gian làm việc; Chất liệu MDF lõi xanh chống ẩm bền bỉ; Phụ kiện Caryny cao cấp đảm bảo độ bền lâu dài.', 52);
INSERT INTO `descriptions` VALUES (53, 'Bàn làm việc cá nhân bằng gỗ hiện đại mang đến không gian xử lý công việc rộng rãi và chuyên nghiệp. Với chất lượng vượt trội và tuổi thọ sử dụng lâu dài, đây là lựa chọn tuyệt vời cho mọi không gian sống hiện đại.', 'Chất liệu MDF lõi xanh chống ẩm phủ Melamine vân gỗ tinh tế; Phụ kiện giảm chấn Cariny hoạt động êm ái, bền bỉ; Thiết kế hiện đại, phù hợp nhiều diện tích phòng; Bề mặt rộng rãi tối ưu hiệu suất công việc.', 53);
INSERT INTO `descriptions` VALUES (54, 'Bàn làm việc bằng gỗ công nghiệp hiện đại sở hữu thiết kế sang trọng, thanh lịch, là lựa chọn ưu tiên cho không gian làm việc tại nhà hoặc văn phòng nhờ sự kết hợp hoàn hảo giữa gỗ và khung sắt chắc chắn.', 'Khung sắt phun sơn tĩnh điện bền bỉ, chịu lực cực tốt; Gỗ MDF lõi xanh chống ẩm, hạn chế tối đa cong vênh và mối mọt; Phụ kiện Caryny chính hãng đảm bảo vận hành êm ái; Thiết kế hiện đại, dễ dàng sắp xếp.', 54);
INSERT INTO `descriptions` VALUES (55, 'Bàn làm việc tại nhà phong cách hiện đại sở hữu thiết kế đơn giản nhưng vô cùng sang trọng. Với cấu tạo mặt bàn dày 36mm kết hợp chân sắt vững chãi, sản phẩm mang lại không gian làm việc chuyên nghiệp và đầy cảm hứng.', 'Mặt bàn gỗ MDF lõi xanh dày 36mm cực kỳ chắc chắn; Chân sắt phun sơn tĩnh điện bền bỉ theo thời gian; Tích hợp ngăn kéo tiện lợi lưu trữ tài liệu; Kích thước lớn tối ưu cho đa nhiệm công việc.', 55);
INSERT INTO `descriptions` VALUES (56, 'Bàn làm việc tiện dụng bằng gỗ công nghiệp là giải pháp hoàn hảo mang đến không gian làm việc đầy đủ tiện nghi ngay tại gia đình. Với giá sách đi kèm lớn, sản phẩm cung cấp khả năng lưu trữ cực cao, đáp ứng mọi nhu cầu học tập và làm việc chuyên nghiệp.', 'Thiết kế bàn làm việc kết hợp giá sách rời linh hoạt; Không gian lưu trữ cực lớn cho sách và hồ sơ; Chất liệu MDF lõi xanh chống ẩm bền bỉ; Phụ kiện giảm chấn Cariny cao cấp vận hành êm ái.', 56);
INSERT INTO `descriptions` VALUES (57, 'Bàn làm việc tại nhà gỗ sồi tự nhiên mang phong cách thanh lịch, là lựa chọn lý tưởng cho những không gian nhỏ. Thiết kế thông minh đáp ứng đầy đủ nhu cầu làm việc và lưu trữ trong một kiểu dáng nhỏ gọn, tiết kiệm diện tích.', 'Chất liệu gỗ sồi tự nhiên bền bỉ, vân gỗ sang trọng; Kiểu dáng đứng tích hợp không gian lưu trữ phía trên; Kích thước nhỏ gọn tối ưu góc phòng; Phụ kiện Caryny cao cấp đảm bảo sử dụng lâu dài.', 57);
INSERT INTO `descriptions` VALUES (58, 'Bàn làm việc tại nhà liền giá sách là sản phẩm chiếm được nhiều tình cảm của khách hàng trẻ nhờ thiết kế hiện đại, phù hợp với xu hướng nội thất mới. Sản phẩm không chỉ cung cấp góc làm việc hiệu quả mà còn mang lại không gian lưu trữ sách vở và đồ trang ', 'Thiết kế liền giá sách cao tối ưu không gian lưu trữ; Chất liệu MDF lõi xanh chống ẩm cao cấp, chịu lực tốt; Màu sắc đa dạng, hiện đại; Độ bền cao, phù hợp với không gian căn hộ chung cư hoặc phòng ngủ.', 58);
INSERT INTO `descriptions` VALUES (59, 'Bàn làm việc kèm tủ sách thiết kế thông minh nhằm tối đa hóa công năng sử dụng. Với kết cấu vững chãi và phong cách tối giản, sản phẩm mang lại vẻ đẹp hiện đại và chuyên nghiệp cho không gian phòng làm việc tại gia.', 'Thiết kế thông minh tối ưu diện tích lưu trữ; Khả năng chống cong vênh, mối mọt và ẩm mốc cực tốt; Quy trình sản xuất tự động cho độ hoàn thiện tinh tế; Màu sắc tươi sáng tạo cảm hứng làm việc.', 59);
INSERT INTO `descriptions` VALUES (60, 'Bàn làm việc màu trắng sang trọng không chỉ là một món nội thất mà còn là điểm nhấn nâng tầm thẩm mỹ không gian. Với thiết kế chân trụ bo rãnh mềm mại và mặt bàn bo tròn thanh thoát, sản phẩm mang lại cảm giác tinh tế, hiện đại cho phòng làm việc, showroo', 'Thiết kế chân trụ bo rãnh độc đáo và nghệ thuật; Mặt bàn bo tròn an toàn và thanh thoát; Công nghệ phun sơn cao cấp cho bề mặt mịn mượt; Đa năng: làm bàn làm việc, bàn decor hoặc quầy trưng bày.', 60);
INSERT INTO `descriptions` VALUES (61, 'Giường ngủ liền bàn làm việc là giải pháp nội thất thông minh lý tưởng cho những không gian phòng ngủ nhỏ. Việc tích hợp hai công năng trong một sản phẩm giúp tối ưu hóa diện tích hiệu quả mà vẫn đảm bảo tính thẩm mỹ và sự tiện nghi tối đa.', 'Thiết kế tích hợp giường và bàn làm việc tiết kiệm diện tích; Chất liệu MDF lõi xanh chống ẩm bền bỉ, chịu lực tốt; Gia công bằng công nghệ CNC hiện đại, đường nét tinh tế; Phong cách tối giản, hiện đại.', 61);
INSERT INTO `descriptions` VALUES (62, 'Giường ngủ gỗ sồi cho gia đình chất lượng cao đem đến không gian phòng ngủ cảm giác ấm cúng, dễ chịu. Với thiết kế phong cách hiện đại, mẫu giường này sở hữu vẻ ngoài thanh lịch, tinh tế, là lựa chọn hoàn hảo để nâng tầm chất lượng giấc ngủ cho gia đình b', 'Chất liệu gỗ sồi tự nhiên bền bỉ với đường vân gỗ đẹp mắt; Thiết kế hiện đại, thanh lịch không gây cảm giác nặng nề; Cấu trúc chắc chắn, khả năng chịu lực cực tốt; Gia công CNC và xử lý bề mặt tỉ mỉ.', 62);
INSERT INTO `descriptions` VALUES (63, 'Giường ngủ gỗ sồi phong cách cổ điển mang đến vẻ đẹp trầm ấm và sang trọng cho không gian nghỉ ngơi. Với thiết kế tối giản nhưng tinh tế, sản phẩm chắc chắn sẽ làm hài lòng những khách hàng yêu thích sự hoài cổ và chất lượng bền bỉ từ gỗ tự nhiên.', 'Chất liệu gỗ sồi tự nhiên cao cấp, bền đẹp theo thời gian; Tông màu trầm ấm tạo cảm giác thư giãn tuyệt đối; Phong cách cổ điển thanh lịch, phù hợp nhiều không gian nội thất; Gia công tỉ mỉ, xử lý cạnh gỗ mượt mà.', 63);
INSERT INTO `descriptions` VALUES (64, 'Giường ngủ hiện đại bằng gỗ công nghiệp là một trong những mẫu thiết kế được yêu thích nhất nhờ vẻ ngoài sang trọng và kiểu dáng độc đáo. Sản phẩm không chỉ là nơi nghỉ ngơi lý tưởng mà còn là điểm nhấn thẩm mỹ hiện đại cho không gian phòng ngủ của gia đì', 'Chất liệu MDF lõi xanh chống ẩm vượt trội, chịu lực tốt; Bề mặt phủ Melamine láng mịn, chống thấm nước và trầy xước; Thiết kế hiện đại, kiểu dáng độc đáo tạo điểm nhấn; Quy trình sản xuất tự động đảm bảo độ tinh xảo và bền bỉ.', 64);
INSERT INTO `descriptions` VALUES (65, 'Giường gỗ tự nhiên trang nhã sở hữu thiết kế đơn giản nhưng vô cùng tinh tế, tạo điểm nhấn bởi những phần nan đan xen độc đáo. Sản phẩm mang lại cảm giác ấm áp, thư giãn tuyệt đối, phù hợp với hầu hết mọi không gian phòng ngủ hiện đại và trang nhã.', 'Chất liệu gỗ sồi tự nhiên cao cấp kết hợp khung nan đan xen nghệ thuật; Kích thước đạt tiêu chuẩn chất lượng, phù hợp nhiều không gian; Tông màu gỗ tự nhiên ấm áp, phun PU bóng bảo vệ bề mặt; Thiết kế độc lạ, đón đầu xu hướng nội thất toàn cầu.', 65);
INSERT INTO `descriptions` VALUES (66, 'Giường ngủ thông minh kiểu dáng nhỏ gọn là lựa chọn hàng đầu cho các bé trong độ tuổi đến trường và những không gian phòng ngủ nhỏ. Bộ sản phẩm tích hợp giường ngủ và tủ quần áo đồng bộ, mang lại sự tiện nghi tối đa với mức giá cực kỳ hấp dẫn.', 'Thiết kế thông minh tích hợp giường ngủ và tủ áo tiết kiệm diện tích; Chất liệu MDF lõi xanh chống ẩm bền bỉ, an toàn cho sức khỏe; Màu sắc hiện đại, vân gỗ kết hợp màu tinh tế; Đa dạng kích thước phù hợp với nhu cầu sử dụng của mọi gia đình.', 66);
INSERT INTO `descriptions` VALUES (67, 'Giường ngủ gỗ tự nhiên phong cách Tân cổ điển là sự giao thoa hoàn hảo giữa nét hiện đại và cổ điển. Với tone màu hạt dẻ trầm ấm và chất liệu gỗ sồi 100%, sản phẩm mang đến cảm giác ấm áp, sang trọng, đặc biệt phù hợp cho những không gian phòng ngủ rộng r', 'Chất liệu gỗ sồi tự nhiên cao cấp, bền bỉ qua nhiều thập kỷ; Thiết kế Tân cổ điển sang trọng, không bao giờ lỗi mốt; Tone màu hạt dẻ tạo chiều sâu và sự ấm cúng cho căn phòng; Kỹ thuật xử lý gỗ hiện đại chống mối mọt tuyệt đối.', 67);
INSERT INTO `descriptions` VALUES (68, 'Mẫu giường ngủ gỗ tự nhiên cao cấp được thiết kế theo phong cách sang trọng và tinh tế, là mảnh ghép hoàn hảo cho không gian nội thất hiện đại, tối giản. Với sự kết hợp giữa gỗ sồi và veneer tự nhiên, sản phẩm không chỉ mang lại vẻ đẹp bền vững mà còn đảm', 'Chất liệu gỗ sồi tự nhiên mang vẻ đẹp bền vững và sang trọng; Thiết kế hiện đại, tối giản phù hợp nhiều không gian; Công nghệ gia công CNC cho đường nét sắc sảo, chính xác; Kết cấu khoan cam chốt cực kỳ chắc chắn và ổn định.', 68);
INSERT INTO `descriptions` VALUES (69, 'Bộ nội thất phòng ngủ đầy đủ là giải pháp hoàn hảo để kiến tạo không gian nghỉ ngơi đồng bộ, hiện đại và tiện nghi. Với thiết kế tinh giản nhưng sang trọng, bộ sản phẩm bao gồm giường ngủ, tủ quần áo kịch trần và tủ đầu giường, giúp tối ưu hóa diện tích v', 'Giải pháp trọn gói đồng bộ về màu sắc và phong cách; Tủ áo kịch trần tối ưu không gian lưu trữ cực lớn; Chất liệu MDF lõi xanh chống ẩm bền bỉ, bề mặt chống trầy xước; Thiết kế tinh tế, lắp đặt chuyên nghiệp, khoan cam chốt chắc chắn.', 69);
INSERT INTO `descriptions` VALUES (70, 'Giường ngủ gỗ hiện đại chân cao mang đến sự kết hợp tinh tế giữa nét đẹp mộc mạc của gỗ tự nhiên và phong cách thiết kế hiện đại. Điểm nhấn độc đáo nằm ở đầu giường bọc nệm êm ái kết hợp mây đan thủ công, tạo nên không gian nghỉ ngơi vừa mềm mại, vừa ấm á', 'Thiết kế chân cao thanh thoát giúp dễ dàng vệ sinh gầm giường; Đầu giường bọc nệm kết hợp mây đan thủ công tinh xảo; Chất liệu gỗ sồi tự nhiên bền bỉ, vân gỗ sang trọng; Phong cách giao thoa giữa hiện đại và truyền thống (Indochine).', 70);
INSERT INTO `descriptions` VALUES (71, 'Sở hữu thiết kế giường ngủ gỗ Tân cổ điển chính là lựa chọn lý tưởng để nâng tầm đẳng cấp không gian sống của bạn. Sản phẩm mang hơi thở phong cách Châu Âu sang trọng, kết hợp tinh tế giữa nét đẹp cổ điển và hiện đại, đem lại cảm giác thư giãn, quý phái c', 'Thiết kế Tân cổ điển phong cách Châu Âu sang trọng; Đầu giường bọc da hoặc nỉ tạo điểm nhấn êm ái và đẳng cấp; Chất liệu gỗ sồi tự nhiên bền bỉ, xử lý chống cong vênh; Phù hợp với các không gian phòng ngủ cao cấp, biệt thự, căn hộ hạng sang.', 71);
INSERT INTO `descriptions` VALUES (72, 'Giường đơn hộc kéo 1m2 là giải pháp hoàn hảo cho những phòng ngủ có diện tích hạn chế. Với thiết kế hiện đại, nhỏ gọn nhưng vô cùng tiện lợi, sản phẩm không chỉ mang lại giấc ngủ ngon mà còn giúp bạn tối ưu hóa không gian lưu trữ đồ dùng cá nhân một cách ', 'Thiết kế hộc kéo tích hợp dưới gầm giường giúp tăng không gian lưu trữ; Chất liệu MDF lõi xanh chống ẩm bền bỉ, không cong vênh; Kiểu dáng hiện đại, thanh lịch phù hợp với nhiều phong cách nội thất; Kích thước 1m2 lý tưởng cho người độc thân hoặc trẻ em.', 72);
INSERT INTO `descriptions` VALUES (73, 'Giường ngủ bọc nệm đầu giường là sản phẩm tiêu biểu cho xu hướng nội thất hiện đại, chú trọng vào trải nghiệm người dùng. Với thiết kế tinh tế, phần đầu giường được bọc nệm nỉ cao cấp mang lại sự êm ái tuyệt vời, giúp bạn có những giây phút thư giãn thực ', 'Đầu giường bọc nệm nỉ dày dặn, tạo điểm nhấn sang trọng và ấm áp; Chất liệu gỗ MDF lõi xanh chống ẩm bề mặt Melamine chống trầy xước, không thấm nước; Quy trình sản xuất tự động, khoan liên kết chính xác, kết cấu vững chãi; Đa dạng kích thước và màu sắc d', 73);
INSERT INTO `descriptions` VALUES (74, 'Mẫu giường gỗ hộp đơn giản, nhỏ gọn là sự lựa chọn hoàn hảo cho không gian phòng ngủ hiện đại. Với thiết kế dạng khối vững chãi, sản phẩm giúp tối ưu không gian hiệu quả, mang lại vẻ đẹp tinh tế và cảm giác ngăn nắp cho căn phòng của bạn.', 'Thiết kế dạng hộp đơn giản, hiện đại, tối ưu diện tích sử dụng; Chất liệu gỗ MDF lõi xanh chống ẩm vượt trội, không cong vênh; Bề mặt phủ Melamine láng mịn, chống trầy xước và dễ dàng vệ sinh; Đa dạng kích thước, phù hợp cho cả phòng ngủ đơn và đôi.', 74);
INSERT INTO `descriptions` VALUES (75, 'Mẫu giường ngủ gỗ tự nhiên thiết kế đẹp góp phần mang đến một không gian phòng ngủ yên bình, thư thái. Với kích thước nhỏ gọn, sản phẩm là lựa chọn lý tưởng dành cho trẻ em hoặc dùng cho mục đích cá nhân, mang lại vẻ đẹp mộc mạc và chất lượng bền bỉ từ gỗ', 'Chất liệu gỗ sồi tự nhiên cao cấp, bền đẹp theo thời gian; Thiết kế nhỏ gọn, tinh tế, phù hợp cho phòng ngủ đơn hoặc trẻ em; Tông màu gỗ tự nhiên mang lại cảm giác ấm áp và thư giãn; Kết cấu chắc chắn, chịu lực tốt, gia công bề mặt nhẵn mịn.', 75);
INSERT INTO `descriptions` VALUES (76, 'Mẫu giường ngủ phong cách Bohemian với họa tiết trẻ trung và hiện đại là lựa chọn hoàn hảo để kiến tạo không gian nghỉ ngơi đầy cảm hứng cho bé. Sản phẩm sử dụng công nghệ sơn Lacker tiên tiến từ Đức, không chỉ mang lại bề mặt hoàn thiện tuyệt mỹ mà còn đ', 'Chất liệu gỗ sồi tự nhiên bền bỉ kết hợp khung xương chắc chắn; Công nghệ sơn Lacker (Đức) cho bề mặt mịn màng, bền màu và an toàn; Thiết kế Bohemian trẻ trung với các họa tiết trang trí tinh tế; Bảng màu đa dạng (Trắng, Hồng, Xanh, Vàng) phù hợp với mọi ', 76);
INSERT INTO `descriptions` VALUES (77, 'Mẫu giường bọc nệm sang trọng gây ấn tượng bởi thiết kế tối giản nhưng vẫn đảm bảo sự đẳng cấp và tiện nghi cho phòng ngủ hiện đại. Với phần đầu giường bọc nệm chần nhẹ tạo điểm nhấn tinh tế kết hợp cùng chân kim loại thanh thoát, sản phẩm không chỉ là nơ', 'Chất liệu da Simili Hàn Quốc bền bỉ, dễ dàng vệ sinh và sang trọng; Đầu giường bọc nệm mút K35 dày dặn, tạo cảm giác êm ái khi tựa lưng; Chân kim loại chắc chắn, thiết kế cao giúp robot hút bụi dễ dàng vệ sinh; Khung gỗ MDF lõi xanh chống ẩm chống cong vê', 77);
INSERT INTO `descriptions` VALUES (78, 'Giường ngủ gỗ sồi tự nhiên thiết kế thanh lịch mang đến một không gian phòng ngủ yên bình và thư thái. Sản phẩm gây ấn tượng mạnh nhờ kiểu dáng nhỏ gọn, các đường nét thanh mảnh nhưng vô cùng tinh tế, là mảnh ghép hoàn hảo cho những ai tìm kiếm sự thuần k', 'Chất liệu gỗ sồi tự nhiên 100% với vân gỗ đều, đẹp và sang trọng; Thiết kế thanh mảnh hiện đại giúp không gian phòng ngủ trở nên thông thoáng hơn; Kết cấu chắc chắn, chịu lực tốt, gia công bề mặt nhẵn mịn tỉ mỉ; Kiểu dáng nhỏ gọn phù hợp với cả những căn ', 78);
INSERT INTO `descriptions` VALUES (79, 'Giường ngủ gỗ hiện đại kèm tủ đầu giường là sự kết hợp thông minh giữa công năng nghỉ ngơi và lưu trữ. Với thiết kế tối giản, vuông vức mang đậm phong cách Bắc Âu (Scandinavian), sản phẩm có độ cao vừa phải đặt sát sàn giúp không gian phòng ngủ trở nên th', 'Thiết kế phong cách Bắc Âu tối giản, sang trọng; Tích hợp tủ đầu giường đồng bộ tiện lợi cho việc để đèn ngủ, điện thoại; Chất liệu MDF lõi xanh chống ẩm, bề mặt Melamine chống trầy xước và thấm nước tuyệt đối; Quy trình sản xuất tự động cho độ chính xác ', 79);
INSERT INTO `descriptions` VALUES (80, 'Giường ngủ bay hiện đại là sự bứt phá trong thiết kế nội thất, mang lại cảm giác thanh thoát và cực kỳ sang trọng. Điểm nhấn độc đáo là phần chân giường được thiết kế ẩn sâu bên trong tạo hiệu ứng như chiếc giường đang lơ lửng, kết hợp cùng kệ đầu giường ', 'Thiết kế giường bay (floating bed) độc đáo, thời thượng; Tích hợp kệ đầu giường tiện lợi để sách, điện thoại hoặc đồ trang trí; Chất liệu MDF lõi xanh chống ẩm, bề mặt Melamine chống trầy xước; Độ cao 12cm lý tưởng cho phong cách tối giản, dễ dàng vệ sinh', 80);
INSERT INTO `descriptions` VALUES (81, 'Giường Tatami là một trong những mẫu giường ngủ được yêu thích nhất hiện nay, mang đậm hơi thở phong cách Nhật Bản. Với thiết kế hiện đại, kiểu dáng bệt vững chãi, sản phẩm không chỉ mang lại không gian nghỉ ngơi thoải mái mà còn cực kỳ dễ dàng kết hợp vớ', 'Thiết kế phong cách Nhật Bản tối giản và hiện đại; Kết cấu giường hộp MDF lõi xanh chắc chắn, chịu được tải trọng lớn; Bề mặt phủ Melamine cao cấp chống trầy xước, chống thấm nước và dễ vệ sinh; Kích thước đa dạng từ giường đơn 1m đến giường đôi 1m6, tối ', 81);
INSERT INTO `descriptions` VALUES (82, 'Giường bục gỗ nâng sàn là giải pháp nội thất hoàn hảo cho những ai tìm kiếm sự tối giản, gọn gàng mà vẫn đậm chất thiền tịnh. Với thiết kế nâng sàn tinh tế kết hợp cùng ánh sáng đèn LED hiện đại, sản phẩm biến phòng ngủ thành một không gian thư giãn, thưở', 'Thiết kế bục nâng sàn tạo cảm giác rộng rãi và chiều sâu cho căn phòng; Tích hợp đèn LED âm bục tạo hiệu ứng ánh sáng sang trọng, ấm cúng; Chất liệu MDF lõi xanh chống ẩm vượt trội, gia công CNC chính xác; Phù hợp làm giường ngủ kết hợp không gian thư giã', 82);
INSERT INTO `descriptions` VALUES (83, 'Giường ngủ bệt 2 ngăn kéo mang phong cách Bắc Âu là giải pháp tối ưu cho không gian sống hiện đại. Với thiết kế tối giản, sang trọng cùng độ cao tiêu chuẩn, sản phẩm tích hợp thêm 2 ngăn kéo rộng rãi dưới gầm giường, giúp bạn tận dụng triệt để diện tích đ', 'Thiết kế dạng bệt hiện đại phong cách Scandinavian sang trọng; Tích hợp 2 ngăn kéo thông minh giúp tiết kiệm không gian lưu trữ; Chất liệu MDF lõi xanh chống ẩm nhập khẩu, sản xuất trên dây chuyền công nghệ cao; Bề mặt phủ Melamine chống trầy xước, không ', 83);
INSERT INTO `descriptions` VALUES (84, 'Giường bệt Tatami kèm tab đầu giường là mẫu giường hiện đại đang ngày càng được nhiều gia đình lựa chọn nhờ xu hướng sử dụng nội thất thông minh tích hợp. Với thiết kế bệt kiểu Nhật thanh thoát, sản phẩm đi kèm 2 tab đầu giường tiện lợi tạo nên một hệ thố', 'Thiết kế đa năng tích hợp sẵn 2 tab đầu giường đối xứng tiện lợi; Kiểu dáng giường bệt Tatami hiện đại, tạo hiệu ứng không gian thông thoáng; Chất liệu gỗ MDF lõi xanh chống ẩm bền bỉ, không cong vênh hay mối mọt; Quy trình sản xuất tự động, khoan liên kế', 84);
INSERT INTO `descriptions` VALUES (85, 'Giường ngủ gỗ phong cách Bắc Âu là minh chứng cho lối thiết kế \"Less is More\" – đơn giản nhưng đầy tinh tế. Với các đường nét vuông vắn, thanh lịch, mẫu giường bệt này không chỉ mang lại vẻ ngoài hiện đại mà còn tạo cảm giác không gian phòng ngủ rộng rãi,', 'Phong cách Scandinavian đặc trưng với đường nét vuông vức, tinh tế; Thiết kế dạng bệt hiện đại, an toàn và tạo độ thoáng cho trần nhà; Chất liệu MDF lõi xanh chống ẩm bền bỉ, bề mặt Melamine chống thấm nước vượt trội; Quy cách đóng gói chuyên nghiệp, đầy ', 85);
INSERT INTO `descriptions` VALUES (86, 'Mẫu giường Tatami bằng gỗ công nghiệp cao cấp là thiết kế mới nhất vừa ra mắt, nhanh chóng chiếm được sự tin dùng của khách hàng nhờ sự tối giản và chắc chắn. Sản phẩm được chế tác từ ván gỗ MDF chất lượng cao với khả năng chịu lực vượt trội, kết hợp cùng', 'Chất liệu gỗ MDF lõi xanh chống ẩm, chịu lực tốt, không cong vênh; Bề mặt phủ Melamine tiên tiến tăng cường khả năng chống trầy xước và thấm nước; Xử lý cạnh gỗ và khoan liên kết bằng máy tự động cho độ hoàn thiện cực cao; Kiểu dáng Tatami bệt hiện đại, p', 86);
INSERT INTO `descriptions` VALUES (87, 'Mẫu giường ngủ hiện đại thiết kế đa năng là sự kết hợp hoàn hảo giữa tính thẩm mỹ và công năng sử dụng. Với tỷ lệ kích thước đạt chuẩn và kết cấu chắc chắn từ gỗ MDF lõi xanh, sản phẩm không chỉ mang lại nơi nghỉ ngơi lý tưởng mà còn cho phép người dùng t', 'Thiết kế đa năng, tùy chọn tích hợp hộc kéo lưu trữ thông minh; Chất liệu gỗ MDF cốt lõi xanh chống ẩm cao cấp, bền bỉ theo thời gian; Linh hoạt thay đổi chất liệu bọc (Da hoặc Nỉ) và màu sắc theo sở thích; Tỷ lệ kích thước chuẩn, dễ dàng phối hợp với các', 87);
INSERT INTO `descriptions` VALUES (88, 'Mẫu giường nệm bọc da đơn giản, hiện đại là biểu tượng của phong cách hiện đại tối giản (modern minimalist), mang đến sự hài hòa tuyệt đối giữa thẩm mỹ và tiện ích. Với thiết kế đầu giường bo tròn nhẹ nhàng cùng các đường rãnh trang trí tinh tế, sản phẩm ', 'Phong cách Modern Minimalist tối giản và đẳng cấp; Đầu giường bo tròn an toàn, tránh va chạm vào các thành cứng; Chất liệu da Simili Hàn Quốc bền bỉ, dễ vệ sinh, kết hợp mút K35 êm ái; Hệ khung gỗ MDF lõi xanh chống ẩm kết hợp chân kim loại chịu lực cực t', 88);
INSERT INTO `descriptions` VALUES (89, 'Tôn lên vẻ đẹp hiện đại và tinh tế cho phòng ngủ của bạn với mẫu giường gỗ công nghiệp bọc da cao cấp thiết kế ô vuông phồng. Điểm nhấn nổi bật của sản phẩm là tạo hình các khối ô vuông bo tròn mềm mại, trải dài từ đầu giường đến thân giường. Toàn bộ bề m', 'Thiết kế ô vuông phồng (quilted) độc đáo, tạo hiệu ứng thị giác sang trọng; Bọc da toàn bộ thân giường giúp bảo vệ an toàn, tránh va chạm vào cạnh cứng; Chất liệu Simili Hàn Quốc bền màu, chống bám bẩn và dễ dàng vệ sinh; Khung gỗ MDF lõi xanh chống ẩm ti', 89);
INSERT INTO `descriptions` VALUES (90, 'Giường gỗ bọc da hiện đại chinh phục người dùng ngay từ cái nhìn đầu tiên với thiết kế tối giản, mang đậm phong cách Modern Minimalism. Điểm nhấn đặc biệt của sản phẩm là phần đầu giường kết hợp mút xốp bọc da tạo hình các ô vuông đồng đều, vừa đảm bảo tí', 'Thiết kế Modern Minimalism thanh lịch, không bao giờ lỗi mốt; Đầu giường chần ô vuông tạo điểm nhấn sang trọng và cảm giác tựa lưng êm ái; Chất liệu da Simili Hàn Quốc cao cấp, chống nổ da và dễ dàng vệ sinh; Khung gỗ MDF lõi xanh chống ẩm kết hợp chân ki', 90);
INSERT INTO `descriptions` VALUES (91, 'Giường kéo 2 tầng là lựa chọn hoàn hảo cho những không gian phòng ngủ nhỏ hẹp, phòng của bé hoặc căn hộ chung cư hiện đại. Với thiết kế thông minh, tầng giường thứ hai có thể kéo ra linh hoạt khi cần và đẩy gọn xuống gầm giường chính khi không sử dụng, gi', 'Thiết kế 2 tầng kéo thông minh, giải pháp tiết kiệm diện tích tối ưu; Hệ thống bánh xe tầng dưới chắc chắn, giúp thao tác kéo/đẩy nhẹ nhàng; Chất liệu gỗ MDF lõi xanh chống ẩm bền bỉ, bề mặt Melamine chống trầy xước; Gia công CNC chính xác từng chi tiết, ', 91);
INSERT INTO `descriptions` VALUES (92, 'Giường tầng gỗ công nghiệp GHS-9244 là giải pháp hoàn hảo kiến tạo không gian sống hiện đại cho bé. Không chỉ đơn thuần là nơi nghỉ ngơi, sản phẩm còn là một hệ thống nội thất thông minh tích hợp sẵn tủ quần áo rộng rãi và ngăn kéo lưu trữ, giúp tối ưu hó', 'Thiết kế đa năng: Giường tầng kết hợp tủ quần áo và cầu thang tích hợp hộc kéo; Phong cách hiện đại, màu sắc tươi sáng phù hợp với sở thích của trẻ; Chất liệu gỗ MDF lõi xanh chống ẩm đạt chuẩn, an toàn cho sức khỏe; Kết cấu chắc chắn, chịu lực tốt, xử lý', 92);
INSERT INTO `descriptions` VALUES (93, 'Giường ngủ 2 tầng trẻ em GHS-9338 là sự kết hợp tuyệt vời giữa công năng và nghệ thuật sắp đặt không gian. Lấy cảm hứng từ thiên nhiên, các chi tiết cây cối được lồng ghép tinh tế vào khung giường, biến phòng ngủ thành một \"khu vườn nhỏ\" đầy thú vị. Đây l', 'Họa tiết thiên nhiên, cây cối sinh động giúp kích thích tư duy sáng tạo của trẻ; Thiết kế 2 tầng lệch (1m và 1m2) tạo sự thông thoáng và thoải mái khi sử dụng; Chất liệu MDF lõi xanh chống ẩm bền bỉ, an toàn tuyệt đối cho sức khỏe của bé; Tùy chọn thêm ng', 93);
INSERT INTO `descriptions` VALUES (94, 'Giường 2 tầng cho bé bằng gỗ công nghiệp GHS-9251 nhận được nhiều lời khen từ phía các bậc phụ huynh khi lựa chọn giường cho con mình. Sản phẩm cung cấp bởi gotrangtri.vn đáp ứng được mọi nhu cầu như sự tiện lợi, thẩm mỹ và tiết kiệm diện tích sử dụng.', 'Chất liệu gỗ MDF cốt lõi xanh chống ẩm giúp chống cong vênh, co ngót và mối mọt vượt trội; Khả năng chịu lực tốt, đảm bảo an toàn tuyệt đối cho bé trong quá trình sử dụng; Thiết kế thông minh tối ưu diện tích cho phòng ngủ nhỏ; Xử lý cạnh gỗ và khoan liên', 94);
INSERT INTO `descriptions` VALUES (95, 'Mẫu giường tầng cho bé được yêu thích nhất GHS-9238 không chỉ đáp ứng tính thẩm mỹ cao mà còn gây ấn tượng với khách hàng bởi chất lượng cao. Mẫu giường tầng cho bé được thiết kế theo phong cách hiện đại, thông minh tích hợp nhiều công năng trong một khối', 'Thiết kế thông minh tích hợp nhiều công năng trong một khối thống nhất; Chất liệu gỗ MDF lõi xanh chống ẩm phủ Melamine bền bỉ; Bề mặt chống trầy xước và không thấm nước hiệu quả; Xử lý cạnh gỗ và khoan liên kết bằng máy tự động cho độ chính xác cực cao.', 95);
INSERT INTO `descriptions` VALUES (96, 'Bạn đang tìm kiếm một giải pháp nội thất tiết kiệm diện tích mà vẫn đầy đủ công năng? Mẫu giường kết hợp tủ quần áo GHS-9383 là lựa chọn lý tưởng cho phòng ngủ hiện đại, đặc biệt phù hợp với căn hộ nhỏ, phòng trẻ em hoặc phòng ngủ phụ. Thiết kế thông minh', 'Thiết kế thông minh 2 trong 1 tối ưu không gian sống; Gia công CNC chính xác cao, xử lý cạnh gỗ và khoan cam chốt chắc chắn; Chất liệu gỗ MDF lõi xanh chống ẩm đạt chuẩn bền bỉ; Phù hợp đa dạng không gian từ căn hộ nhỏ đến phòng ngủ phụ.', 96);
INSERT INTO `descriptions` VALUES (97, 'Nếu anh/chị đang tìm kiếm một mẫu giường tầng gỗ công nghiệp cho bé vừa hiện đại, vừa tích hợp đầy đủ công năng thì GHS-9381 chính là giải pháp tối ưu. Thiết kế giường tầng thông minh tích hợp bàn học, tủ quần áo và ngăn kéo sẽ giúp không gian nhỏ trở nên', 'Thiết kế đa năng \"All-in-one\": Kết hợp giường ngủ, bàn học và tủ quần áo trong một hệ thống; Sử dụng gỗ MDF lõi xanh chống ẩm đạt chuẩn, an toàn và bền bỉ; Công nghệ sản xuất CNC hiện đại, xử lý cạnh và khoan cam chốt chính xác; Giải pháp tối ưu không gia', 97);
INSERT INTO `descriptions` VALUES (98, 'Sản phẩm giường tầng thiết kế đa năng GHS-9239 có chất lượng vượt trội, mang lại không gian nghỉ ngơi thoải mái và tiện ích nhất cho người dùng. Giường tầng gỗ công nghiệp này được làm bằng gỗ công nghiệp MDF cốt lõi xanh chống ẩm cao cấp, kết cấu chắc ch', 'Chất liệu MDF cốt lõi xanh chống ẩm cao cấp, chịu lực tốt; Bề mặt phủ Melamine chống trầy xước và không thấm nước; Thiết kế đa năng tối ưu không gian nghỉ ngơi và lưu trữ; Quy trình sản xuất hiện đại, khoan liên kết bằng máy tự động đảm bảo độ bền vững.', 98);
INSERT INTO `descriptions` VALUES (99, 'Giường tầng gỗ cho trẻ em ấn tượng GHS-9344 là một lựa chọn hoàn hảo cho không gian phòng ngủ của trẻ nhỏ. Sản phẩm này được thiết kế bắt mắt, ấn tượng với nhiều chi tiết như hình thù, cửa sổ... tạo nên điểm nhấn độc đáo cho không gian của bé.', 'Thiết kế bắt mắt với các chi tiết trang trí hình thù, cửa sổ sinh động; Trang bị cầu thang tiện lợi và giá đựng đồ thông minh giúp tối ưu diện tích; Chất liệu gỗ MDF lõi xanh chống ẩm bền bỉ, an toàn cho trẻ; Lựa chọn kích thước và màu sắc linh hoạt theo ', 99);
INSERT INTO `descriptions` VALUES (100, 'Mang vẻ đẹp tinh tế, sang trọng và bền bỉ, mẫu giường ngủ gỗ tự nhiên tân cổ điển GHS-9386 là lựa chọn lý tưởng cho những ai yêu thích phong cách nội thất cao cấp. Thiết kế mang đường nét mềm mại, uyển chuyển kết hợp cùng chất liệu gỗ sồi tự nhiên chắc ch', 'Phong cách tân cổ điển với đường nét mềm mại, uyển chuyển; Chất liệu gỗ sồi tự nhiên bền bỉ, chịu lực cực tốt; Kỹ thuật ghép mộng và bắt vít truyền thống đảm bảo kết cấu giường vững chãi; Bề mặt phủ Veneer sồi tạo độ bóng mịn và vân gỗ sang trọng.', 100);
INSERT INTO `descriptions` VALUES (101, 'Giường ngủ hiện đại bằng gỗ sồi tự nhiên GHS-9157 do Gỗ Trang Trí cung cấp sẽ là một lựa chọn tuyệt vời đáng để bạn cân nhắc cho gia đình. Mẫu giường ngủ hiện đại được thiết kế tinh tế, mang lại không gian nghỉ ngơi ấm cúng và sang trọng, phù hợp với nhiề', 'Chất liệu gỗ sồi tự nhiên kết hợp veneer sồi bền bỉ, chống cong vênh tốt; Bề mặt phun sơn cao cấp mịn màng, bảo vệ cốt gỗ và tăng tính thẩm mỹ; Thiết kế hiện đại, đơn giản nhưng vô cùng tinh tế; Có 2 kích thước lựa chọn linh hoạt, đáp ứng nhu cầu sử dụng ', 101);
INSERT INTO `descriptions` VALUES (102, 'Giường gỗ tự nhiên thiết kế độc đáo là một sản phẩm nội thất mang đến cho bạn không gian ngủ lạ mắt và thoải mái. Sản phẩm được thiết kế theo phong cách Bắc Âu hiện đại với những đường nét tinh tế, màu sắc trung tính dễ dàng kết hợp với các loại đồ nội th', 'Thiết kế theo phong cách Bắc Âu (Scandinavian) hiện đại và tinh tế; Chất liệu gỗ sồi tự nhiên bền bỉ kết hợp phủ veneer sồi sang trọng; Đường nét thiết kế độc đáo, tạo điểm nhấn lạ mắt cho phòng ngủ; Màu sắc trung tính, phù hợp với nhiều không gian sống đ', 102);
INSERT INTO `descriptions` VALUES (103, 'Không gian phòng ngủ của bạn sẽ trở nên đẳng cấp, tinh tế và tiện nghi với bộ nội thất phòng ngủ cao cấp được thiết kế đồng bộ. Sản phẩm sử dụng chất liệu gỗ MDF chống ẩm đạt chuẩn, kết hợp tủ áo cánh kính sang trọng và giường ngủ bọc da/nỉ theo yêu cầu, ', 'Combo đồng bộ gồm: Giường ngủ bọc da/nỉ, Tủ áo cánh kính (2m2) và Bàn trang điểm có gương LED; Chất liệu MDF lõi xanh chống ẩm phủ Melamine bền bỉ, dễ vệ sinh; Sản xuất bằng công nghệ CNC, xử lý cạnh và khoan cam chốt đạt độ chính xác cao; Thiết kế tối ưu', 103);
INSERT INTO `descriptions` VALUES (104, 'Mẫu giường đôi cho 2 bé được thiết kế tinh tế với hai giường đơn đặt cạnh nhau, kết hợp kệ sách và tủ áo tiện dụng. Đây là lựa chọn thông minh cho gia đình có hai con nhỏ hoặc phòng ngủ chung mà vẫn đảm bảo sự riêng tư, gọn gàng và mang lại giá trị thẩm m', 'Giải pháp thông minh \"3 trong 1\": Kết hợp 2 giường đơn, kệ sách ngăn phòng và tủ quần áo; Thiết kế đảm bảo sự riêng tư cho mỗi bé trong không gian chung; Chất liệu gỗ MDF lõi xanh chống ẩm đạt chuẩn, bề mặt bền màu, dễ vệ sinh; Công nghệ gia công CNC và k', 104);
INSERT INTO `descriptions` VALUES (105, 'Mẫu giường ngủ màu gỗ óc chó kết hợp tinh tế giữa khung gỗ sồi chắc chắn và lớp veneer óc chó tự nhiên sang trọng. Phần đầu giường bọc da hoặc nỉ mang đến sự êm ái, vừa hiện đại vừa ấm cúng. Đây là lựa chọn lý tưởng cho những ai yêu thích nội thất sang tr', 'Chất liệu khung gỗ sồi phủ Veneer óc chó tạo vẻ đẹp đẳng cấp và bền bỉ; Đầu giường bọc da/nỉ cao cấp tạo điểm tựa êm ái khi đọc sách, thư giãn; Công nghệ gia công CNC và khoan cam chốt đảm bảo độ chính xác và kết cấu vững chắc; Thiết kế hiện đại pha chút ', 105);
INSERT INTO `descriptions` VALUES (106, 'Mẫu giường ngủ thấp phong cách Zen Nhật Bản mang lại cảm giác bình yên và tối giản cho không gian nghỉ ngơi.', 'Thiết kế sát sàn vững chãi; Tông màu gỗ sáng tinh tế; Chống ẩm mốc vượt trội.', 106);
INSERT INTO `descriptions` VALUES (107, 'Sự kết hợp hoàn hảo giữa giường ngủ và kho lưu trữ đồ đạc phía dưới giàn nan giường nâng hạ.', 'Tiết kiệm diện tích; Đầu giường bọc nỉ êm ái; Ngăn chứa đồ rộng rãi.', 107);
INSERT INTO `descriptions` VALUES (108, 'Chiếc giường tầng hình lâu đài giúp hiện thực hóa giấc mơ của các bé ngay trong phòng ngủ.', 'Thiết kế bo tròn an toàn; Tích hợp cầu trượt và kệ đồ; Màu sắc sinh động.', 108);
INSERT INTO `descriptions` VALUES (109, 'Mang hơi thở Bắc Âu vào phòng ngủ với thiết kế chân cao thanh thoát, dễ dàng vệ sinh sàn nhà.', 'Chân gỗ tự nhiên chịu lực; Màu sắc tươi sáng; Thiết kế vượt thời gian.', 109);
INSERT INTO `descriptions` VALUES (110, 'Đỉnh cao của sự sang trọng với các đường nét chạm trổ thủ công và bọc da cao cấp.', 'Đầu giường bọc da trám tinh tế; Khung gỗ tự nhiên cực bền; Phong cách quý tộc.', 110);
INSERT INTO `descriptions` VALUES (111, 'Mẫu giường ngủ hiện đại tích hợp 2 ngăn kéo bên hông, giúp tối ưu hóa không gian lưu trữ chăn màn, quần áo.', 'Ngăn kéo ray bi giảm chấn êm ái; Thiết kế vuông vắn mạnh mẽ; Màu xám sang trọng.', 111);
INSERT INTO `descriptions` VALUES (112, 'Thiết kế khung hình ngôi nhà độc đáo, mang lại cảm giác an toàn và kích thích trí sáng tạo cho bé yêu.', 'Khung gỗ sồi chịu lực tốt; Sơn không mùi an toàn; Kiểu dáng bắt mắt.', 112);
INSERT INTO `descriptions` VALUES (113, 'Giường phản bệt không đầu giường, xu hướng mới cho các căn hộ studio hoặc phòng ngủ diện tích nhỏ.', 'Thiết kế tối giản hoàn toàn; Dễ dàng lắp đặt; Độ bền cao.', 113);
INSERT INTO `descriptions` VALUES (114, 'Mang nét hoài cổ với những đường tiện tròn và họa tiết pano đầu giường tinh tế.', 'Chất liệu gỗ tự nhiên ấm áp; Đường nét thủ công tỉ mỉ; Độ bền trên 20 năm.', 114);
INSERT INTO `descriptions` VALUES (115, 'Mẫu giường gấp tường (Murphy bed) giúp biến phòng làm việc thành phòng ngủ chỉ trong vài giây.', 'Piston trợ lực nâng hạ nhẹ nhàng; Tiết kiệm 80% diện tích; Thẩm mỹ như một chiếc tủ.', 115);
INSERT INTO `descriptions` VALUES (116, 'Đầu giường tích hợp kệ để đồ và dải đèn LED trang trí, có cổng sạc USB vô cùng tiện lợi.', 'Công nghệ LED hiện đại; Tích hợp ổ cắm điện; Kiểu dáng thời thượng.', 116);
INSERT INTO `descriptions` VALUES (117, 'Thiết kế đầu giường nan dọc thanh thoát, tạo sự thông thoáng và vẻ đẹp nhẹ nhàng cho căn phòng.', 'Kết cấu mộng gỗ chắc chắn; Gỗ sồi vân đẹp tự nhiên; Chống mối mọt tốt.', 117);
INSERT INTO `descriptions` VALUES (118, 'Đẳng cấp với lớp da Microfiber siêu bền, chống xước, mang lại cảm giác êm ái tuyệt đối.', 'Da dễ vệ sinh; Đệm mút chống xẹp lún; Kiểu dáng Luxury.', 118);
INSERT INTO `descriptions` VALUES (119, 'Giải pháp hoàn hảo cho 3 bé với 2 tầng cố định và 1 tầng kéo sát đất linh hoạt.', 'Tận dụng tối đa diện tích; Cầu thang hộc đồ tiện dụng; Chịu tải trọng lớn.', 119);
INSERT INTO `descriptions` VALUES (120, 'Vẻ đẹp thượng lưu từ vân gỗ óc chó tự nhiên, thiết kế chân khuỷu độc đáo và sang trọng.', 'Vân gỗ cuộn xoáy tự nhiên; Chân gỗ đặc vững chắc; Sơn phủ bóng mờ cao cấp.', 120);
INSERT INTO `descriptions` VALUES (121, 'Kệ tivi bo góc cao cấp với thiết kế hiện đại là điểm nhấn hoàn mỹ cho không gian phòng khách. Sản phẩm nổi bật với những đường cong mềm mại ở các góc cạnh, không chỉ mang lại vẻ đẹp tinh tế mà còn đảm bảo an toàn cho gia đình có trẻ nhỏ.', 'Chất liệu gỗ MDF lõi xanh chống ẩm vượt trội, bền bỉ với thời gian; Thiết kế bo tròn tinh tế, giảm thiểu va chạm sắc nhọn; Bề mặt phun sơn S8 cao cấp chống bám bẩn, dễ vệ sinh; 3 kích thước linh hoạt phù hợp với mọi diện tích phòng khách từ chung cư đến b', 121);
INSERT INTO `descriptions` VALUES (122, 'Kệ tivi đặt đất với thiết kế tối giản, sang trọng là giải pháp hoàn hảo cho những ai yêu thích vẻ đẹp tinh tế và tiện nghi. Với chiều cao 70cm, sản phẩm không chỉ là nơi đặt tivi lý tưởng mà còn cung cấp không gian lưu trữ rộng rãi, giúp phòng khách luôn ', 'Chất liệu gỗ MDF lõi xanh chống ẩm phun sơn S8 đảm bảo độ bền và vẻ đẹp thẩm mỹ lâu dài; Thiết kế chân bệt đặt đất vững chãi, chịu lực cực tốt; Phong cách đơn giản dễ dàng kết hợp với mọi không gian nội thất; Công nghệ gia công CNC sắc sảo trong từng đườn', 122);
INSERT INTO `descriptions` VALUES (123, 'Kệ tivi màu trắng với thiết kế độc đáo là lựa chọn hoàn hảo để mang lại sự tinh tế và tiện ích cho phòng khách. Không chỉ đơn thuần là món đồ nội thất, sản phẩm còn là một điểm nhấn nghệ thuật đầy sáng tạo, giúp không gian sống của bạn trở nên bừng sáng v', 'Tông màu trắng tinh khôi giúp mở rộng không gian và dễ dàng phối đồ; Thiết kế sáng tạo, phá cách so với các mẫu kệ truyền thống; Chất liệu gỗ MDF lõi xanh bền bỉ, chống ẩm và hạn chế tối đa cong vênh; Bề mặt hoàn thiện tỉ mỉ nhờ công nghệ gia công CNC hiệ', 123);
INSERT INTO `descriptions` VALUES (124, 'Hệ kệ tivi kết hợp tủ trang trí đa năng là giải pháp hoàn hảo để biến bức tường phòng khách thành một tác phẩm nghệ thuật tiện nghi. Với chiều cao tiêu chuẩn 2m2, sản phẩm tích hợp giữa kệ tivi, tủ trưng bày và hộc kéo lưu trữ, giúp tối ưu hóa không gian ', 'Hệ tủ cao 2m2 tối ưu không gian lưu trữ kịch trần hoặc sát trần; Cánh tủ phủ FILM PVC mang lại bề mặt hoàn thiện cực sang trọng và bền bỉ; Thiết kế module thông minh dễ dàng tùy chỉnh theo diện tích thực tế; Tích hợp đa dạng công năng: kệ tivi, tủ kính tr', 124);
INSERT INTO `descriptions` VALUES (125, 'Kệ tivi kiểu dáng thấp thiết kế sang trọng là sự kết hợp hoàn hảo giữa vẻ đẹp hiện đại và tính năng tiện ích. Với chiều cao 49.1cm độc đáo, sản phẩm không chỉ giúp không gian phòng khách trở nên thoáng đãng hơn mà còn là điểm nhấn ấn tượng, nâng tầm thẩm ', 'Thiết kế kiểu dáng thấp hiện đại, phù hợp với các dòng tivi màn hình lớn; Cánh tủ phủ FILM PVC tạo hiệu ứng bề mặt cao cấp, chống trầy xước và ẩm mốc hiệu quả; Tùy chọn lắp thêm hệ thống đèn LED (phụ phí) tạo hiệu ứng ánh sáng mờ ảo sang trọng vào ban đêm', 125);
INSERT INTO `descriptions` VALUES (126, 'Mẫu kệ tivi thiết kế tối giản, thanh lịch là giải pháp nội thất hoàn hảo cho không gian sống hiện đại. Sản phẩm tập trung vào sự tinh tế trong đường nét, mang lại vẻ đẹp thẩm mỹ bền vững và sự tiện nghi cho phòng khách của bạn.', 'Thiết kế tối giản giúp tối ưu không gian; Chất liệu MDF lõi xanh chống ẩm vượt trội; Cánh tủ phủ FILM PVC chống trầy xước và bám bẩn; Công nghệ gia công CNC sắc nét trong từng chi tiết.', 126);
INSERT INTO `descriptions` VALUES (127, 'Kệ tivi đứng thiết kế sang trọng, hiện đại là sự lựa chọn hoàn hảo để nâng tầm không gian sống. Sản phẩm là sự kết hợp tinh tế giữa đường nét hiện đại và chất liệu cao cấp, mang lại vẻ đẹp đẳng cấp và sự tiện nghi vượt trội cho phòng khách gia đình.', 'Thiết kế dáng đứng vững chãi, thanh lịch; Cánh tủ phủ FILM PVC tạo bề mặt mịn màng, chống trầy; Gỗ MDF lõi xanh độ bền cao, chống ẩm mốc; Tối ưu không gian lưu trữ với các ngăn tủ thông minh.', 127);
INSERT INTO `descriptions` VALUES (128, 'Mẫu kệ để tivi đẹp với kiểu dáng hiện đại là sự lựa chọn tối ưu mang lại sự tinh tế và tiện ích cho không gian sống. Với thiết kế chú trọng vào công năng đa dạng và thẩm mỹ thời thượng, sản phẩm không chỉ là món đồ nội thất mà còn là điểm nhấn nghệ thuật ', 'Chất liệu gỗ MDF lõi xanh bền bỉ, chống ẩm mốc; Bề mặt cánh phủ FILM PVC mịn màng, chống trầy xước; Thiết kế hiện đại dễ dàng phối hợp với nhiều phong cách nội thất; Công nghệ khoan cam chốt và gia công CNC đạt độ chính xác cao.', 128);
INSERT INTO `descriptions` VALUES (129, 'Kệ tivi gia đình gỗ công nghiệp GHS-3328 tạo điểm nhấn nổi bật cho phòng khách với tone màu trắng đen hiện đại. Sản phẩm mang lại không gian sống tinh tế, sang trọng nhờ sự kết hợp giữa gỗ MDF lõi xanh bền đẹp và chân gỗ tự nhiên vững chãi.', 'Sử dụng phụ kiện Ray bi và Bản lề giảm chấn chính hãng Caryny vận hành êm ái; Chất liệu gỗ MDF lõi xanh chống ẩm vượt trội so với gỗ thông thường; Thiết kế module tách rời (tủ lớn, tủ nhỏ) linh hoạt theo nhu cầu sử dụng; Tone màu đen trắng hiện đại, dễ ph', 129);
INSERT INTO `descriptions` VALUES (130, 'Mẫu kệ tivi hiện đại với thiết kế tối giản là lựa chọn ưu tiên của nhiều gia đình Việt. Sản phẩm không chỉ mang lại vẻ đẹp thanh lịch cho phòng khách mà còn đảm bảo độ bền vượt trội nhờ kết cấu gỗ công nghiệp MDF lõi xanh chắc chắn, phù hợp với nhiều phon', 'Chất liệu gỗ MDF lõi xanh chống ẩm cao cấp, đảm bảo an tâm khi sử dụng lâu dài; Kiểu dáng hiện đại, đa năng, tối ưu diện tích trưng bày; Bề mặt phủ Melamine vân gỗ sắc nét, chống trầy xước và dễ vệ sinh; Kết cấu vững chắc với độ hoàn thiện tinh xảo.', 130);
INSERT INTO `descriptions` VALUES (131, 'Mẫu kệ tivi phong cách Hàn Quốc tối giản là sự kết hợp hoàn hảo giữa thẩm mỹ và tiện ích. Với chất liệu gỗ sồi tự nhiên bền bỉ và thiết kế dáng cao (900mm) thanh lịch, sản phẩm không chỉ là nơi đặt tivi mà còn là một chiếc tủ trang trí sideboard sang trọn', 'Chất liệu gỗ sồi kết hợp Veneer sồi cho vân gỗ tự nhiên cực đẹp và sang trọng; Thiết kế dáng cao tối ưu không gian lưu trữ và phù hợp với tầm nhìn tivi hiện đại; Phong cách tối giản Hàn Quốc dễ dàng phối hợp với các không gian decor tinh tế; Bề mặt sơn PU', 131);
INSERT INTO `descriptions` VALUES (132, 'Mẫu kệ tivi tân cổ điển GHS-3653 là sự lựa chọn hoàn hảo cho những phòng khách đẳng cấp. Với sự kết hợp tinh tế giữa chất liệu gỗ sồi tự nhiên và cánh kính sọc mờ cao cấp, sản phẩm mang đến vẻ đẹp vừa hoài cổ vừa hiện đại, tạo điểm nhấn nghệ thuật độc đáo', 'Thiết kế tân cổ điển sang trọng với các đường nét tinh xảo; Điểm nhấn cánh kính sọc (fluted glass) tạo hiệu ứng thị giác mờ ảo và hiện đại; Chất liệu gỗ sồi bền bỉ, chống mối mọt và cong vênh; Công nghệ gia công CNC và khoan cam chốt đạt độ hoàn thiện cực', 132);
INSERT INTO `descriptions` VALUES (133, 'Kệ tivi GHS-3648 với thiết kế có chân thanh lịch là giải pháp hoàn hảo cho không gian sống hiện đại. Sự kết hợp giữa thân gỗ MDF lõi xanh bền bỉ và chân gỗ tự nhiên không chỉ đáp ứng nhu cầu lưu trữ mà còn tạo độ thoáng cho nền nhà, giúp phòng khách trở n', 'Thiết kế có chân gỗ tự nhiên giúp dễ dàng vệ sinh gầm kệ; Chất liệu gỗ MDF lõi xanh chống ẩm phủ Melamine chống trầy xước hiệu quả; Kiểu dáng tinh tế phù hợp với nhiều phong cách decor; Kết cấu chắc chắn nhờ công nghệ khoan cam chốt hiện đại.', 133);
INSERT INTO `descriptions` VALUES (134, 'Mẫu kệ tivi treo tường cho nhà chung cư là giải pháp tối ưu cho không gian nhỏ hẹp. Với thiết kế treo hiện đại, sản phẩm không chỉ là chiếc kệ tivi thông thường mà còn đóng vai trò là món đồ nội thất trang trí tinh tế, giúp giải phóng diện tích sàn và tạo', 'Thiết kế treo tường thông minh, tiết kiệm tối đa không gian sàn; Chất liệu MDF lõi xanh phun sơn S8 cho bề mặt mịn màng, chống ẩm tốt; Phù hợp với phong cách nội thất chung cư hiện đại; Kết cấu lắp đặt chắc chắn, an toàn cho người sử dụng.', 134);
INSERT INTO `descriptions` VALUES (135, 'Kệ tivi gỗ công nghiệp GHS-3467 là giải pháp hoàn hảo cho những gia đình sở hữu không gian phòng khách hạn chế. Với kiểu dáng nhỏ gọn, thiết kế tinh tế kết hợp giữa ngăn kéo lưu trữ tiện lợi và chân gỗ tự nhiên vững chãi, sản phẩm mang lại sự gọn gàng và ', 'Thiết kế nhỏ gọn (1m4) tối ưu cho nhà phố hoặc chung cư diện tích nhỏ; Sử dụng phụ kiện Ray bi và Bản lề giảm chấn Cariny chính hãng giúp đóng mở êm ái; Chất liệu MDF lõi xanh chống ẩm phủ Melamine bền màu, chống trầy; Chân gỗ tự nhiên tạo độ thoáng và dễ', 135);
INSERT INTO `descriptions` VALUES (136, 'Mẫu tủ gỗ nhỏ để đầu giường đẹp sang trọng là món đồ nội thất không thể thiếu để tạo nên sự hoàn hảo cho phòng ngủ hiện đại. Với thiết kế tinh tế, nhỏ gọn, sản phẩm vừa cung cấp không gian lưu trữ vật dụng cá nhân tiện lợi, vừa là điểm nhấn thẩm mỹ giúp c', 'Thiết kế tối giản sang trọng; Chất liệu MDF lõi xanh chống ẩm vượt trội; Bề mặt phun sơn cao cấp cho độ mịn và bền màu cực cao; Ngăn kéo trơn tru, tối ưu không gian.', 136);
INSERT INTO `descriptions` VALUES (137, 'Mẫu kệ tivi gỗ hiện đại chân cao là lựa chọn tinh tế cho không gian phòng ngủ, giúp tối ưu diện tích và tạo tầm nhìn thoải mái khi nghỉ ngơi. Với thiết kế thanh lịch và chất liệu chống ẩm vượt trội, sản phẩm mang đến sự tiện nghi và vẻ đẹp hiện đại cho că', 'Thiết kế chân cao giúp phòng ngủ thông thoáng và dễ vệ sinh; Chất liệu MDF lõi xanh chống ẩm bền bỉ; Màu sắc trung tính dễ dàng phối hợp với giường và tủ quần áo; Ngăn kéo tiện dụng cho việc lưu trữ đồ cá nhân.', 137);
INSERT INTO `descriptions` VALUES (138, 'Mẫu tủ trang trí gỗ MDF hiện đại giúp không gian phòng ngủ trở nên gọn gàng và hài hòa hơn. Với kích thước nhỏ gọn và kiểu dáng đơn giản, sản phẩm là lựa chọn tuyệt vời để lưu trữ sách báo, đồ trang trí hoặc làm tủ đầu giường tiện lợi, dễ dàng kết hợp với', 'Chất liệu MDF lõi xanh chống ẩm bền bỉ, không cong vênh; Bề mặt phủ Melamine cao cấp chống trầy xước và không thấm nước; Thiết kế đa năng, có thể dùng làm tủ trang trí hoặc tủ đầu giường; Chân gỗ tự nhiên vững chãi, tạo độ thông thoáng cho mặt sàn.', 138);
INSERT INTO `descriptions` VALUES (139, 'Mẫu kệ đầu giường cao cấp hiện đại mang đến vẻ đẹp tinh tế và sang trọng cho không gian nghỉ ngơi của bạn. Thiết kế thông minh giúp các vật dụng cá nhân như điện thoại, đèn ngủ hay điều khiển tivi luôn nằm trong tầm với thuận tiện, tạo nên sự tiện nghi tố', 'Chất liệu gỗ MDF lõi xanh cao cấp đảm bảo độ bền và khả năng chống ẩm vượt trội; Bề mặt phủ Melamine tinh xảo, chống trầy xước và dễ dàng vệ sinh; Kiểu dáng hiện đại phù hợp với nhiều không gian nội thất phòng ngủ sang trọng; Quy trình sản xuất tự động ch', 139);
INSERT INTO `descriptions` VALUES (140, 'Mẫu tủ đầu giường gỗ công nghiệp MDF phủ Melamine sở hữu thiết kế đa năng và kích thước nhỏ gọn, là giải pháp tối ưu cho những phòng ngủ có diện tích hạn chế. Sản phẩm được sản xuất trên dây chuyền công nghệ tiên tiến, đảm bảo độ chính xác cao về tỷ lệ và', 'Thiết kế nhỏ gọn, không chiếm nhiều diện tích sàn; Chất liệu MDF lõi xanh chống ẩm phủ Melamine cao cấp, bền bỉ theo thời gian; Quy trình sản xuất hiện đại giúp các chi tiết có độ hoàn thiện cực kỳ sắc sảo; Chân gỗ tự nhiên vững chãi, tạo điểm nhấn mộc mạ', 140);
INSERT INTO `descriptions` VALUES (141, 'Mẫu tủ đầu giường 1 ngăn kéo mang phong cách hiện đại, tối giản, phù hợp cho không gian phòng ngủ nhỏ.', 'Thiết kế tinh tế; Ngăn kéo trượt êm; Chống ẩm tốt.', 141);
INSERT INTO `descriptions` VALUES (142, 'Sự kết hợp hoàn hảo giữa gỗ công nghiệp và chân gỗ tự nhiên tạo nét mộc mạc cho phòng ngủ.', 'Chân cao dễ vệ sinh; Kết cấu chắc chắn; Màu sắc nhã nhặn.', 142);
INSERT INTO `descriptions` VALUES (143, 'Gấp đôi không gian lưu trữ với 2 ngăn kéo tiện lợi, thiết kế không tay nắm hiện đại.', 'Diện tích chứa đồ lớn; Ray bi giảm chấn; Kiểu dáng vuông vức.', 143);
INSERT INTO `descriptions` VALUES (144, 'Thiết kế theo phong cách Bắc Âu tối giản nhưng cực kỳ tinh tế và sang trọng.', 'Tone màu sáng; Chân gỗ thanh mảnh; Bề mặt mịn.', 144);
INSERT INTO `descriptions` VALUES (145, 'Kiểu dáng khối hộp vuông vức, tối ưu hóa diện tích cho các căn hộ Studio.', 'Tiết kiệm không gian; Đa năng; Chống trầy xước.', 145);
INSERT INTO `descriptions` VALUES (146, 'Sự kết hợp giữa ngăn kéo kín và kệ hở giúp bạn dễ dàng để sách hoặc vật dụng thường dùng.', 'Thiết kế thông minh; Tiện lợi; Thẩm mỹ cao.', 146);
INSERT INTO `descriptions` VALUES (147, 'Mẫu tủ cánh mở cổ điển mang lại cảm giác thân thuộc và sang trọng cho phòng ngủ.', 'Bản lề giảm chấn; Không gian rộng; Bền bỉ.', 147);
INSERT INTO `descriptions` VALUES (148, 'Kích thước siêu nhỏ gọn, là món đồ decor lý tưởng cho những góc nhỏ trong phòng ngủ.', 'Thiết kế trang nhã; Siêu nhỏ gọn; Dễ di chuyển.', 148);
INSERT INTO `descriptions` VALUES (149, 'Sản phẩm tập trung vào độ bền với cốt gỗ chống ẩm vượt trội, phù hợp với khí hậu Việt Nam.', 'Cốt gỗ xanh bền bỉ; Chống cong vênh; Vân gỗ sắc nét.', 149);
INSERT INTO `descriptions` VALUES (150, 'Mẫu tủ phối màu sáng tạo, mang hơi thở Bắc Âu hiện đại giúp căn phòng thêm tràn đầy sức sống.', 'Màu sắc trendy; Độ bền cao; Phụ kiện cao cấp.', 150);
INSERT INTO `descriptions` VALUES (151, 'Tủ sách phòng làm việc tối giản là giải pháp lưu trữ thông minh giúp không gian làm việc của bạn trở nên gọn gàng và chuyên nghiệp hơn. Với thiết kế tinh gọn kết hợp cánh kính sang trọng, sản phẩm không chỉ bảo vệ sách báo khỏi bụi bẩn mà còn là điểm nhấn', 'Thiết kế tinh tế với gam màu gỗ sáng trang nhã; Chất liệu MDF lõi xanh chống ẩm vượt trội, không lo mối mọt; Cánh kính cao cấp giúp dễ dàng quan sát và trưng bày đồ trang trí; Quy trình gia công CNC và khoan cam chốt tự động đảm bảo độ bền và tính thẩm mỹ', 151);
INSERT INTO `descriptions` VALUES (152, 'Mẫu giá sách nhỏ gọn hiện đại là lựa chọn tối ưu cho những không gian làm việc có diện tích hạn chế. Với thiết kế thông minh, sản phẩm vừa mang lại khả năng lưu trữ thuận tiện như các mẫu kệ treo tường, vừa giữ được tính linh hoạt khi có thể dễ dàng di ch', 'Kiểu dáng thanh lịch, phù hợp với nhiều phong cách nội thất; Chất liệu gỗ công nghiệp MDF bền bỉ, bề mặt phủ Melamine chống trầy xước hiệu quả; Kích thước mỏng nhẹ (sâu 250mm) giúp tiết kiệm diện tích tối đa; Kết cấu vững chắc, chia ngăn khoa học giúp tối', 152);
INSERT INTO `descriptions` VALUES (153, 'Mẫu giá sách gỗ công nghiệp hiện đại sở hữu thiết kế lớn và cân đối, tạo điểm nhấn ấn tượng cho không gian làm việc hoặc phòng khách. Với kết cấu chắc chắn từ chất liệu MDF lõi xanh chống ẩm, sản phẩm mang lại khả năng lưu trữ vượt trội, giúp bạn sắp xếp ', 'Chất liệu MDF cốt xanh chống ẩm vượt trội, đảm bảo không cong vênh; Kích thước lớn (1.6m) tối ưu hóa không gian trưng bày và lưu trữ; Thiết kế hiện đại, dễ dàng phối hợp với nhiều kiểu nội thất văn phòng; Bề mặt Melamine bền màu, chống trầy xước và dễ dàn', 153);
INSERT INTO `descriptions` VALUES (154, 'Kệ giá sách gỗ gia đình với thiết kế hình bậc thang độc đáo là giải pháp hoàn hảo để tạo điểm nhấn cho phòng làm việc mà không gây cảm giác bí bách, chật trội. Kết cấu phân tầng thông minh giúp bạn dễ dàng phân loại sách báo, tạp chí hoặc trưng bày các vậ', 'Thiết kế hình bậc thang sáng tạo, tạo độ thoáng cho không gian; Chất liệu MDF lõi xanh chống ẩm cao cấp, chịu lực tốt và bền bỉ; Bề mặt phủ Melamine chống trầy xước, dễ dàng vệ sinh; Các mối liên kết được khoan bằng máy tự động đảm bảo độ chính xác và chắ', 154);
INSERT INTO `descriptions` VALUES (155, 'Kệ sách 5 tầng phong cách Bắc Âu là đại diện tiêu biểu cho xu hướng sống tối giản hiện đại. Không cần những đường nét cầu kỳ hay màu sắc rực rỡ, sản phẩm vẫn tạo nên sức hút đặc biệt nhờ sự cân đối, tinh tế và vẻ đẹp mộc mạc của vân gỗ, giúp không gian là', 'Thiết kế 5 tầng rộng rãi với chiều cao gần 2m, tối ưu hóa không gian lưu trữ sách và tài liệu; Phong cách Bắc Âu (Scandinavian) thanh lịch, dễ dàng hòa hợp với mọi nội thất; Chất liệu MDF lõi xanh chống ẩm cao cấp, bề mặt phủ Melamine bền bỉ, chống trầy x', 155);
INSERT INTO `descriptions` VALUES (156, 'Mẫu giá sách gỗ công nghiệp với thiết kế chân sắt sơn tĩnh điện mang đến vẻ đẹp sang trọng và tiện nghi cho không gian làm việc hiện đại. Đây là giải pháp lưu trữ hoàn hảo, giúp bạn bài trí sách vở và đồ dùng cá nhân một cách khoa học. Nhờ sự kết hợp giữa', 'Thiết kế kết hợp giữa gỗ và kim loại tạo điểm nhấn công nghiệp hiện đại (Industrial Style); Chất liệu MDF cốt xanh chống ẩm vượt trội, không lo mối mọt; Chân sắt phun sơn tĩnh điện chịu lực cực tốt, đảm bảo độ ổn định; Phụ kiện cao cấp giúp việc đóng mở n', 156);
INSERT INTO `descriptions` VALUES (157, 'Tủ để tài liệu bằng gỗ công nghiệp hiện đại là giải pháp lưu trữ tối ưu không chỉ cho gia đình mà còn cho các văn phòng, công ty chuyên nghiệp. Với thiết kế thanh lịch và 3 lựa chọn kiểu dáng linh hoạt (có kính hoặc không kính), mẫu tủ này giúp bạn sắp xế', 'Chất liệu MDF cốt xanh chống ẩm phủ Melamine bền bỉ, dễ vệ sinh; Cửa kính cường lực sang trọng giúp bảo quản tài liệu khỏi bụi bẩn; Tích hợp ngăn kéo tiện dụng với ray bi Caryny vận hành êm ái; 3 kiểu dáng linh hoạt phù hợp với mọi diện tích và nhu cầu sử', 157);
INSERT INTO `descriptions` VALUES (158, 'Kệ gỗ để đồ kiểu dáng nhỏ gọn là một giải pháp nội thất đầy sáng tạo, cho phép bạn tự do thiết kế không gian sống theo ý thích. Với cấu trúc module thông minh, sản phẩm không chỉ đóng vai trò là kệ sách mini, kệ trưng bày mà còn có thể ghép nối nhiều đơn ', 'Chất liệu gỗ sồi tự nhiên cao cấp với vân gỗ đẹp mắt và độ bền vượt trội; Thiết kế module linh hoạt, dễ dàng thay đổi kiểu dáng và công năng sử dụng; Kích thước nhỏ gọn, tối ưu cho mọi góc nhỏ trong căn nhà; Phụ kiện ray bi Caryny cao cấp giúp các ngăn ké', 158);
INSERT INTO `descriptions` VALUES (159, 'Kệ để đồ hình robot bằng gỗ là sản phẩm đột phá về thiết kế, mang lại sự hào hứng cho các bạn nhỏ và tạo điểm nhấn phá cách cho không gian làm việc. Với hình dáng chú robot thông minh, kệ không chỉ là nơi lưu trữ sách vở, đồ chơi gọn gàng mà còn là một mó', 'Thiết kế hình Robot độc đáo, thu hút ngay từ cái nhìn đầu tiên; Chất liệu gỗ MDF phủ Melamine chống thấm nước và hạn chế trầy xước cực tốt; Kích thước nhỏ gọn (sâu 240mm) phù hợp với cả những góc phòng hẹp; Quy cách đóng gói 3 lớp chắc chắn, đi kèm bộ phụ', 159);
INSERT INTO `descriptions` VALUES (160, 'Kệ tạp chí bằng gỗ MDF lõi xanh là phụ kiện nội thất không thể thiếu để tạo nên sự ngăn nắp và chuyên nghiệp cho văn phòng, sảnh chờ hoặc góc làm việc tại gia. Với thiết kế đứng nhỏ gọn và các ngăn chia khoa học, sản phẩm giúp bạn dễ dàng sắp xếp, trưng b', 'Chất liệu MDF lõi xanh chống ẩm vượt trội, đảm bảo độ bền và kết cấu chắc chắn; Thiết kế đa năng, phù hợp với nhiều không gian từ sảnh văn phòng đến phòng làm việc cá nhân; Bề mặt Melamine láng mịn, chống trầy xước và dễ vệ sinh; Kích thước tối ưu giúp ti', 160);
INSERT INTO `descriptions` VALUES (161, 'Kệ góc để sách bằng gỗ hiện đại là món nội thất không thể thiếu cho những ai muốn tối ưu hóa diện tích phòng làm việc. Với thiết kế đứng bo gọn vào góc tường, sản phẩm biến những góc trống trải trở thành nơi lưu trữ khoa học và sinh động. Kiểu dáng nhã nh', 'Thiết kế góc thông minh, tận dụng triệt để không gian hẹp; Chất liệu MDF lõi xanh chống ẩm đạt chuẩn, đảm bảo độ bền và khả năng chịu lực; Bề mặt phủ vân gỗ tự nhiên mang lại vẻ đẹp ấm cúng, tinh tế; Phù hợp làm kệ sách, kệ trưng bày decor hoặc tủ hồ sơ p', 161);
INSERT INTO `descriptions` VALUES (162, 'Kệ sách góc tường hiện đại GHS-2659 là giải pháp hoàn hảo để biến những \"góc chết\" trong căn phòng trở thành một không gian lưu trữ đầy tinh tế. Với thiết kế chuyên biệt bo sát góc tường cùng các tầng kệ mở, sản phẩm không chỉ giúp bạn sắp xếp sách vở, tà', 'Thiết kế tối ưu cho góc tường, giúp tiết kiệm diện tích tối đa; Chất liệu gỗ MDF lõi xanh chống ẩm phủ Melamine cao cấp, bền đẹp theo thời gian; Công nghệ gia công CNC và khoan cam chốt tự động giúp kết cấu kệ cực kỳ vững chãi và thẩm mỹ; Màu sắc nhã nhặn', 162);
INSERT INTO `descriptions` VALUES (163, 'Giá để sách bằng gỗ thiết kế đa năng GHS-2302 là giải pháp lưu trữ hoàn hảo cho những ai yêu thích sự ngăn nắp và khoa học. Với hệ thống ngăn chứa được phân chia thông minh theo nhiều kích thước khác nhau, sản phẩm cho phép bạn thoải mái sắp xếp từ những ', 'Thiết kế đa ngăn sáng tạo, tối ưu hóa khả năng phân loại tài liệu; Chất liệu MDF cốt xanh chống ẩm cao cấp đảm bảo độ bền vượt trội và tính thẩm mỹ cao; Chiều sâu 240mm mỏng nhẹ, giúp tiết kiệm diện tích sàn mà vẫn đảm bảo sức chứa lớn; Quy trình sản xuất', 163);
INSERT INTO `descriptions` VALUES (164, 'Giá sách gia đình GHS-2244 là mẫu sản phẩm dẫn đầu xu hướng nhờ thiết kế hiện đại và sự kết hợp màu sắc đầy ấn tượng. Với 3 lựa chọn kích thước từ thấp đến cao, mẫu kệ này không chỉ đáp ứng nhu cầu lưu trữ sách báo, tài liệu mà còn là món đồ trang trí man', 'Thiết kế đa dạng với 3 mức chiều cao linh hoạt, phù hợp với mọi diện tích phòng; Chất liệu MDF cốt xanh chống ẩm vượt trội, đảm bảo độ bền lâu dài và khả năng chịu lực tốt; Bề mặt Melamine phối hợp tinh tế giữa màu sắc hiện đại và vân gỗ tự nhiên; Chiều s', 164);
INSERT INTO `descriptions` VALUES (165, 'Kệ sách góc tường phân tầng sáng tạo là giải pháp nội thất thông minh giúp bạn tận dụng triệt để những diện tích nhỏ hẹp trong nhà. Với thiết kế bo góc mềm mại và các tầng kệ được tính toán kỹ lưỡng, sản phẩm không chỉ mang lại không gian lưu trữ rộng rãi', 'Thiết kế tối ưu hóa không gian góc tường; Chất liệu gỗ MDF lõi xanh chống ẩm cao cấp với độ bền vượt trội; Gia công bằng công nghệ CNC cho đường nét sắc sảo, tinh tế; Dễ dàng lắp đặt và di chuyển, phù hợp cho cả phòng khách và phòng làm việc.', 165);
INSERT INTO `descriptions` VALUES (166, 'Tủ buffet gỗ cao cấp thiết kế sang trọng là giải pháp lưu trữ hoàn hảo, mang lại vẻ đẹp đẳng cấp cho không gian sống hiện đại. Với chiều cao kịch trần ấn tượng và bề mặt cánh phủ Film PVC mịn màng, sản phẩm không chỉ giúp bạn sắp xếp chén đĩa, đồ dùng ngă', 'Thiết kế kịch trần cao 2m3 tối ưu không gian lưu trữ; Chất liệu gỗ MDF lõi xanh chống ẩm kết hợp cánh phủ Film PVC bền bỉ, chống trầy xước; Gia công bằng công nghệ CNC cho đường nét sắc sảo; 5 mức kích thước linh hoạt phù hợp với mọi diện tích từ căn hộ đ', 166);
INSERT INTO `descriptions` VALUES (167, 'Tủ buffet gỗ MDF cao cấp mang đến sự kết hợp hoàn hảo giữa tính thẩm mỹ hiện đại và tiện ích lưu trữ vượt trội. Với phong cách thiết kế tối giản nhưng đầy tinh tế, mẫu tủ này không chỉ giúp không gian sống trở nên gọn gàng mà còn tạo điểm nhấn sang trọng ', 'Thiết kế phong cách tối giản, dễ dàng hòa hợp với nhiều không gian nội thất; Chất liệu MDF lõi xanh chống ẩm kết hợp cánh phủ Film PVC mang lại độ bền vượt trội; Hệ thống ngăn chứa đa năng giúp phân loại đồ dùng khoa học và ngăn nắp; Công nghệ sản xuất CN', 167);
INSERT INTO `descriptions` VALUES (168, 'Tủ búp phê hiện đại với kiểu dáng sang trọng là sự lựa chọn lý tưởng để nâng tầm không gian bếp và phòng ăn. Thiết kế kịch trần đầy ấn tượng không chỉ mang lại vẻ đẹp bề thế, uy nghi mà còn tối ưu hóa tối đa diện tích lưu trữ. Sự kết hợp giữa các khoang h', 'Thiết kế kịch trần cao 2m3 tạo không gian lưu trữ cực lớn và vẻ đẹp sang trọng; Chất liệu MDF lõi xanh chống ẩm đạt chuẩn kết hợp cánh phủ Film PVC bền bỉ; Chiều sâu 40cm rộng rãi, phù hợp cho nhiều loại vật dụng nhà bếp khổ lớn; Sản xuất bằng công nghệ C', 168);
INSERT INTO `descriptions` VALUES (169, 'Mẫu tủ búp phê đẹp với thiết kế đa năng là giải pháp nội thất lý tưởng cho những không gian sống hiện đại và tinh tế. Sở hữu các đường nét đơn giản nhưng đầy sang trọng, sản phẩm không chỉ giúp tối ưu hóa khả năng lưu trữ chén bát, đồ dùng gia đình mà còn', 'Thiết kế kịch trần hiện đại, tận dụng tối đa không gian lưu trữ theo chiều cao; Chất liệu gỗ MDF lõi xanh chống ẩm kết hợp cánh phủ Film PVC bền đẹp, dễ dàng vệ sinh; Chiều sâu 35cm nhỏ gọn, phù hợp cho cả những lối đi hoặc phòng ăn có diện tích khiêm tốn', 169);
INSERT INTO `descriptions` VALUES (170, 'Tủ búp phê cao cấp thiết kế hiện đại mang đến giải pháp lưu trữ đa năng và thẩm mỹ vượt trội cho không gian sống của bạn. Sự kết hợp tinh tế giữa cốt gỗ MDF lõi xanh chống ẩm và bề mặt cánh phủ Film PVC không chỉ đảm bảo độ bền dài lâu mà còn tạo nên vẻ đ', 'Chất liệu cao cấp chống ẩm, chống trầy xước và bền màu theo thời gian; Chiều cao 2m lý tưởng cho các không gian trần trung bình, tạo cảm giác thoáng đãng; Thiết kế hiện đại dễ dàng tích hợp đèn LED trang trí (tùy chọn); Quy trình sản xuất CNC hiện đại, kh', 170);
INSERT INTO `descriptions` VALUES (171, 'Tủ đựng đồ phòng bếp kiểu dáng sang trọng và hiện đại là giải pháp hoàn hảo để tối ưu hóa không gian lưu trữ cho căn bếp gia đình. Với thiết kế tinh tế và chiều cao 2m2 ấn tượng, mẫu tủ này mang đến sự kết hợp hài hòa giữa công năng sử dụng và giá trị thẩ', 'Thiết kế cao 2m2 giúp tận dụng không gian lưu trữ hiệu quả; Chất liệu gỗ MDF lõi xanh chống ẩm kết hợp cánh phủ Film PVC mang lại vẻ đẹp bóng mịn và bền bỉ; Hệ thống ngăn chứa đa năng, linh hoạt cho nhiều loại đồ dùng bếp; Công nghệ khoan cam chốt và xử l', 171);
INSERT INTO `descriptions` VALUES (172, 'Tủ đựng nồi chảo thiết kế đơn giản và tiện lợi là giải pháp lưu trữ lý tưởng giúp tối ưu hóa diện tích cho những không gian bếp nhỏ gọn. Với thiết kế chia ngăn khoa học, sản phẩm giúp bạn dễ dàng tổ chức, sắp xếp nồi niêu, xoong chảo và các dụng cụ nấu nư', 'Thiết kế tối giản, hiện đại, dễ dàng hòa hợp với nhiều phong cách nội thất; Chất liệu gỗ MDF lõi xanh chống ẩm phun sơn bền bỉ, bề mặt hoàn thiện cực mịn; Hệ thống ngăn tủ được tính toán kỹ lưỡng, phù hợp để lưu trữ các loại nồi chảo kích thước lớn; Gia c', 172);
INSERT INTO `descriptions` VALUES (173, 'Tủ để chén bằng gỗ thiết kế hiện đại và đa năng là giải pháp lưu trữ hoàn hảo, mang lại sự gọn gàng tuyệt đối cho không gian bếp của bạn. Với sự kết hợp thông minh giữa các ngăn kệ hở và hệ thống tủ kín, sản phẩm giúp bạn dễ dàng phân loại chén bát, đồ dù', 'Thiết kế đa năng với nhiều khoang chứa đồ thông minh; Chất liệu gỗ MDF lõi xanh chống ẩm phủ Melamine bền bỉ, chống trầy xước và dễ vệ sinh; Chiều sâu 42cm vượt trội, giúp lưu trữ được cả những loại đĩa và khay lớn; Sản xuất bằng công nghệ CNC hiện đại, đ', 173);
INSERT INTO `descriptions` VALUES (174, 'Tủ để bát đũa thiết kế sang trọng là giải pháp hoàn hảo để tổ chức căn bếp hiện đại thêm phần gọn gàng và tinh tế. Với chất liệu gỗ MDF lõi xanh phun sơn cao cấp, sản phẩm mang lại bề mặt mịn màng và độ bền vượt trội. Thiết kế đa năng với các ngăn chứa đư', 'Bề mặt phun sơn cao cấp chống bám bẩn và dễ dàng vệ sinh; Thiết kế đa năng phù hợp cho nhiều nhu cầu lưu trữ; Chất liệu MDF lõi xanh chống ẩm bền bỉ theo thời gian; Gia công CNC chính xác, đường nét thanh thoát và sang trọng.', 174);
INSERT INTO `descriptions` VALUES (175, 'Tủ bếp MDF chống ẩm chất lượng cao với thiết kế treo tường là giải pháp tối ưu cho những không gian bếp có diện tích hạn chế. Sở hữu phong cách hiện đại, đơn giản nhưng không kém phần tinh tế, mẫu tủ này giúp bạn sắp xếp bát đĩa và đồ dùng nhà bếp một các', 'Thiết kế treo tường thông minh giúp tiết kiệm tối đa diện tích sử dụng; Chất liệu MDF lõi xanh chống ẩm phủ Melamine bền bỉ, chống trầy xước và thấm nước; Quy trình sản xuất tự động đảm bảo độ chính xác và độ bền cao; Màu sắc và vân gỗ đa dạng, dễ dàng ph', 175);
INSERT INTO `descriptions` VALUES (176, 'Tủ để đồ nhà bếp thiết kế nhỏ gọn tiện dụng là giải pháp tuyệt vời dành cho những gia đình sở hữu gian bếp có diện tích hạn chế. Với phong cách thiết kế tối giản, lược bỏ các chi tiết rườm rà, sản phẩm toát lên vẻ đẹp tinh tế và nhã nhặn, giúp không gian ', 'Thiết kế nhỏ gọn, dễ dàng bố trí trong các không gian hẹp; Chất liệu MDF lõi xanh chống ẩm phủ Melamine bền bỉ, chống trầy xước; Kiểu dáng hiện đại với sự phối hợp màu sắc và vân gỗ tinh tế; Khả năng lưu trữ đa năng cho chén bát, gia vị hoặc đồ dùng cầm t', 176);
INSERT INTO `descriptions` VALUES (177, 'Tủ bếp đa năng thiết kế tối giản hiện đại là sự lựa chọn tuyệt vời để làm mới không gian nấu nướng của gia đình bạn. Với kiểu dáng thanh lịch và chiều cao vừa vặn, mẫu tủ này không chỉ cung cấp thêm không gian lưu trữ mà còn có thể tận dụng mặt tủ làm bàn', 'Thiết kế tối giản, dễ dàng phối hợp nội thất; Bề mặt Melamine chống trầy và dễ lau chùi; Cấu tạo ngăn kệ khoa học giúp tối ưu khả năng lưu trữ; Phụ kiện bản lề giảm chấn giúp đóng mở êm ái.', 177);
INSERT INTO `descriptions` VALUES (178, 'Nếu bạn đang tìm kiếm một giải pháp để sắp xếp hàng tá đồ dùng nhà bếp nhỏ lẻ thì tủ đựng đồ nhà bếp nhiều ngăn tiện lợi chính là câu trả lời. Hệ thống ngăn kéo và cánh mở được tính toán kích thước đa dạng, cho phép bạn phân loại từ hũ gia vị, chai lọ đến', 'Nhiều ngăn chứa đa năng cực kỳ tiện lợi; Kết cấu gỗ MDF lõi xanh chống ẩm bền bỉ; Màu sắc sang trọng, hiện đại; Kích thước vừa phải không gây tốn diện tích.', 178);
INSERT INTO `descriptions` VALUES (179, 'Tủ chén gỗ MDF thiết kế sang trọng mang phong cách nội thất Bắc Âu, đem lại sự ấm cúng và tinh tế cho khu vực ăn uống. Sản phẩm được gia công tỉ mỉ với bề mặt phủ Melamine giả vân gỗ sồi tự nhiên, không chỉ đẹp mắt mà còn chống trầy xước rất tốt. Đây là m', 'Kiểu dáng sang trọng theo phong cách Nordic; Chất liệu chống ẩm cao cấp, phù hợp khí hậu Việt Nam; Các góc cạnh được bo tròn tỉ mỉ, an toàn khi sử dụng; Chân tủ chắc chắn, dễ dàng vệ sinh gầm tủ.', 179);
INSERT INTO `descriptions` VALUES (180, 'Hệ tủ bếp lưu trữ thông minh là giải pháp thay thế tuyệt vời cho những hệ tủ bếp đóng sẵn cồng kềnh. Với chiều cao 1m8, tủ tận dụng tốt không gian theo chiều đứng, cung cấp sức chứa tương đương một kho đồ nhỏ trong bếp. Khoang hở ở giữa được thiết kế đặc ', 'Tối ưu diện tích theo chiều đứng; Khoang chứa đồ điện máy tiện dụng; Gia công liên kết cam chốt chắc chắn; Bề mặt Melamine mịn màng, dễ lau chùi dầu mỡ.', 180);
INSERT INTO `descriptions` VALUES (181, 'Hộp đựng bút xoay gỗ tự nhiên cao cấp là biểu tượng của sự tinh tế và đẳng cấp trên bàn làm việc. Được chế tác từ những dòng gỗ thượng hạng như Walnut và Maple, sản phẩm sở hữu những đường vân gỗ độc bản và khả năng xoay mượt mà, mang lại trải nghiệm sử d', 'Chất liệu gỗ tự nhiên 100% nhập khẩu; Thiết kế xoay thông minh, tiện lợi; Bề mặt xử lý thủ công tỉ mỉ, sơn chuyên nghiệp; Phù hợp làm quà tặng sự kiện cao cấp.', 181);
INSERT INTO `descriptions` VALUES (182, 'Hộp cắm bút gỗ để bàn được thiết kế chuyên biệt để làm quà tặng doanh nghiệp và sự kiện. Với kiểu dáng hiện đại, tính thẩm mỹ cao và diện tích bề mặt lý tưởng để khắc logo thương hiệu, sản phẩm giúp nâng tầm giá trị món quà. Quy trình sản xuất khép kín từ', 'Thiết kế đẹp, phù hợp phong thủy bàn làm việc; Chất liệu gỗ cao cấp, bền bỉ theo thời gian; Nhận khắc laser logo theo yêu cầu; Gia công tinh xảo, xử lý cạnh mịn màng.', 182);
INSERT INTO `descriptions` VALUES (183, 'Mẫu hộp đựng bút gỗ thiết kế tối giản mang vẻ đẹp mộc mạc nhưng nhã nhặn, phù hợp với mọi đối tượng sử dụng. Sản phẩm tập trung vào sự tiện dụng với ngăn chứa rộng rãi, giúp bàn làm việc luôn ngăn nắp. Chất liệu gỗ Beech với tone màu trung tính dễ dàng hò', 'Phong cách tối giản tinh tế; Gỗ tự nhiên nguyên khối chắc chắn; Giá thành cạnh tranh, phù hợp số lượng lớn; Bề mặt chống ẩm mốc và trầy xước.', 183);
INSERT INTO `descriptions` VALUES (184, 'Dành riêng cho những khách hàng tìm kiếm sự độc bản, hộp bút gỗ cao cấp thiết kế theo yêu cầu cho phép bạn hiện thực hóa những ý tưởng sáng tạo lên chất liệu gỗ tự nhiên. Chúng tôi kết hợp giữa tay nghề thợ thủ công lành nghề và công nghệ máy móc hiện đại', 'Tùy chỉnh kích thước và kiểu dáng linh hoạt; Kết hợp nhiều loại gỗ quý trên cùng một sản phẩm; Sơn phủ chuyên nghiệp, bảo vệ vân gỗ tự nhiên; Sản phẩm cao cấp mang tính nghệ thuật cao.', 184);
INSERT INTO `descriptions` VALUES (185, 'Đồng hồ gỗ mini để bàn là sự kết hợp hoàn hảo giữa nét mộc mạc của gỗ tự nhiên và phong cách decor hiện đại. Với kích thước nhỏ xinh và thiết kế tối giản, sản phẩm không chỉ là vật dụng xem giờ mà còn là món đồ trang trí tinh tế cho bàn làm việc, kệ sách ', 'Chế tác từ gỗ tự nhiên nguyên khối bền bỉ; Thiết kế nhỏ gọn, tiết kiệm diện tích; Máy kim trôi cao cấp không gây tiếng tích tắc; Bề mặt xử lý mịn, giữ trọn vẻ đẹp vân gỗ.', 185);
INSERT INTO `descriptions` VALUES (186, 'Mẫu đồng hồ gỗ treo tường hình chữ nhật mang đến hơi thở nghệ thuật cho mảng tường trống trong ngôi nhà của bạn. Sản phẩm nổi bật với các họa tiết được in hoặc chạm khắc tinh xảo trên nền gỗ, tạo nên chiều sâu và sự ấm cúng cho không gian. Với trọng lượng', 'Kiểu dáng hình chữ nhật độc đáo, hiện đại; Họa tiết trang trí đa dạng, mang tính nghệ thuật cao; Dễ dàng treo lắp và vệ sinh; Phù hợp trang trí phòng khách, văn phòng.', 186);
INSERT INTO `descriptions` VALUES (187, 'Đồng hồ gỗ để bàn khắc Laser là dòng quà tặng cá nhân hóa đỉnh cao dành cho các dịp lễ kỷ niệm hoặc vinh danh. Sản phẩm sở hữu thiết kế có chân đế gỗ chắc chắn, cho phép khắc laser tên, logo hoặc những lời chúc ý nghĩa lên bề mặt gỗ một cách sắc nét. Mỗi ', 'Khắc nội dung cá nhân hóa bằng công nghệ Laser hiện đại; Thiết kế có đế đứng sang trọng, vững chãi; Chất liệu gỗ tuyển chọn, màu sắc tinh tế; Món quà tặng doanh nghiệp lý tưởng.', 187);
INSERT INTO `descriptions` VALUES (188, 'Đồng hồ gỗ treo tường hình tròn khắc Laser là biểu tượng của sự trọn vẹn và bền vững. Thiết kế hình tròn cổ điển kết hợp cùng các con số được khắc laser chìm sâu vào thớ gỗ tạo nên sự tương phản đẹp mắt và dễ dàng quan sát. Sản phẩm sử dụng dòng máy kim t', 'Thiết kế tròn cổ điển, không lỗi mốt; Số hiển thị khắc laser rõ nét, bền màu; Máy đồng hồ ổn định, chính xác cao; Chất liệu gỗ tự nhiên thân thiện với môi trường.', 188);
INSERT INTO `descriptions` VALUES (189, 'Lịch Gỗ Mừng Năm Mới là món quà tặng ý nghĩa, mang lời chúc bình an và tài lộc đến cho người nhận trong dịp đầu xuân. Sản phẩm được chế tác từ gỗ tự nhiên với các họa tiết trang trí tết sinh động, sắc nét nhờ công nghệ in hiện đại. Đây không chỉ là công c', 'Thiết kế mang đậm không khí tết truyền thống; Chất liệu gỗ bền bỉ, không cong vênh; Hình ảnh in sắc nét, bền màu theo thời gian; Kích thước nhỏ gọn, phù hợp làm quà tặng số lượng lớn.', 189);
INSERT INTO `descriptions` VALUES (190, 'Lịch Gỗ Kèm Khung Ảnh là giải pháp trang trí \"2 trong 1\" hoàn hảo cho bàn làm việc. Sự kết hợp thông minh giữa bộ lịch gỗ tinh tế và khung ảnh cá nhân giúp bạn vừa quản lý thời gian hiệu quả, vừa lưu giữ những khoảnh khắc đáng nhớ của người thân và bạn bè', 'Tích hợp khung ảnh cá nhân hóa tiện lợi; Thiết kế ngăn chứa bút hoặc vật dụng nhỏ đi kèm; Chất liệu gỗ cao cấp xử lý mịn màng; Món quà tặng kỷ niệm lý tưởng cho đối tác và bạn bè.', 190);
INSERT INTO `descriptions` VALUES (191, 'Lịch Gỗ 12 Mặt là một tuyệt tác của sự sáng tạo và kỹ thuật gia công gỗ. Mỗi mặt của khối đa diện tương ứng với một tháng trong năm, được khắc laser tinh xảo và rõ nét. Với hình khối độc đáo, sản phẩm không chỉ là một bộ lịch để bàn mà còn là món đồ chơi ', 'Kiểu dáng hình học 12 mặt độc đáo, lạ mắt; Công nghệ khắc laser sắc nét, không phai màu; Kích thước vừa vặn trong lòng bàn tay; Sản phẩm trang trí bàn làm việc mang tính nghệ thuật cao.', 191);
INSERT INTO `descriptions` VALUES (192, 'Lịch Gỗ Trượt Để Bàn là dòng sản phẩm lịch vạn niên độc đáo, cho phép bạn sử dụng qua nhiều năm nhờ cơ chế trượt điều chỉnh ngày tháng linh hoạt. Đặc biệt, sản phẩm hỗ trợ khắc laser theo yêu cầu, giúp bạn gửi gắm những lời chúc, tên riêng hoặc logo thươn', 'Cơ chế lịch vạn niên trượt linh hoạt, sử dụng lâu dài; Khắc laser nội dung cá nhân hóa sắc nét; Thiết kế đế gỗ vững chãi, sang trọng; Chất liệu gỗ thân thiện với môi trường.', 192);
INSERT INTO `descriptions` VALUES (193, 'Móc khóa gỗ khắc họa tiết nghệ thuật là món phụ kiện nhỏ xinh nhưng mang đậm nét mộc mạc và cá tính. Sản phẩm được chế tác từ gỗ tự nhiên, bề mặt khắc các hình ảnh trang trí tinh xảo như lá phong, ngôi nhà, trái tim... tạo nên vẻ đẹp độc đáo. Đây là lựa c', 'Chất liệu gỗ tự nhiên bền đẹp, cầm chắc tay; Họa tiết khắc laser sắc nét, không bị phai mờ; Khoen móc chắc chắn, chống gỉ sét; Thiết kế đa dạng mẫu mã trang trí.', 193);
INSERT INTO `descriptions` VALUES (194, 'Móc khóa gỗ in hình Chibi mang phong cách trẻ trung, đáng yêu với các nhân vật hoạt hình và hình vẽ cách điệu sinh động. Công nghệ in màu tiên tiến giúp hình ảnh luôn sắc nét và rực rỡ trên nền gỗ. Sản phẩm rất được lòng các bạn trẻ và trẻ em, phù hợp để ', 'Hình ảnh Chibi đa dạng mẫu mã, màu sắc bắt mắt; Công nghệ in bền màu, không bong tróc; Chất liệu nhẹ, gọn gàng dễ mang theo; Phụ kiện thời trang phong cách trẻ trung.', 194);
INSERT INTO `descriptions` VALUES (195, 'Móc khóa gỗ thiết kế tinh tế mang lại vẻ đẹp mộc mạc nhưng không kém phần sang trọng. Với chất liệu gỗ tự nhiên cao cấp, sản phẩm sở hữu những đường vân gỗ độc đáo và độ bền vượt trội theo thời gian. Từng đường cắt CNC được xử lý mượt mà, tạo nên một phụ ', 'Chất liệu gỗ tự nhiên bền bỉ, tính thẩm mỹ cao; Công nghệ cắt CNC chính xác, cạnh gỗ được mài bóng mịn; Khả năng chịu lực tốt, càng dùng lâu vân gỗ càng đẹp; Thiết kế tinh giản, sang trọng và thanh lịch.', 195);
INSERT INTO `descriptions` VALUES (196, 'Móc khóa 12 con giáp bằng gỗ là bộ sản phẩm mang ý nghĩa phong thủy và may mắn cho người sử dụng. Mỗi mẫu móc khóa tương ứng với một linh vật trong năm, được tạo hình cách điệu dễ thương và in màu sinh động. Sản phẩm không chỉ là vật trang trí mà còn giúp', 'Bộ sưu tập đầy đủ 12 con giáp ý nghĩa; Tạo hình cách điệu, màu sắc vui tươi; Chất liệu gỗ thân thiện với môi trường; Món quà tặng ý nghĩa cho bạn bè và người thân.', 196);
INSERT INTO `descriptions` VALUES (197, 'Hộp đựng đũa muỗng 2 tầng là giải pháp tổ chức không gian bàn ăn sang trọng và chuyên nghiệp cho các nhà hàng hoặc gia đình. Với thiết kế hai tầng ngăn kéo tiện dụng, sản phẩm giúp phân loại đũa, muỗng và thìa một cách khoa học, giữ cho đồ dùng luôn sạch ', 'Thiết kế 2 tầng ngăn kéo tối ưu không gian; Chất liệu gỗ tự nhiên dày dặn, chịu lực tốt; Bề mặt mài nhẵn, sơn phủ an toàn cho sức khỏe; Phù hợp cho nhà hàng, quán ăn và bếp gia đình.', 197);
INSERT INTO `descriptions` VALUES (198, 'Khay đựng muỗng đũa kéo giãn thông minh là món đồ dùng nhà bếp không thể thiếu để giữ cho ngăn kéo tủ bếp luôn gọn gàng. Điểm đặc biệt của sản phẩm là khả năng điều chỉnh chiều rộng linh hoạt, giúp khay vừa vặn với nhiều kích thước ngăn kéo khác nhau. Các', 'Cơ chế kéo giãn thông minh phù hợp mọi ngăn kéo; Chia nhiều ngăn đa năng tiện lợi; Chất liệu gỗ tự nhiên kháng khuẩn, dễ vệ sinh; Giúp sắp xếp vật dụng bếp ngăn nắp, khoa học.', 198);
INSERT INTO `descriptions` VALUES (199, 'Hộp đựng đũa muỗng bằng gỗ có nắp mang phong cách tối giản nhưng vô cùng tinh tế, phù hợp cho những ai yêu thích sự gọn gàng và sạch sẽ. Thiết kế hộp kín với nắp đậy chắc chắn giúp bảo quản đũa muỗng khỏi bụi bẩn và côn trùng. Kích thước nhỏ gọn của hộp c', 'Nắp đậy kín đáo bảo đảm vệ sinh; Gia công thủ công mượt mà từng góc cạnh; Chất liệu gỗ tự nhiên thân thiện với môi trường; Màu sắc sang trọng, bền màu theo thời gian.', 199);
INSERT INTO `descriptions` VALUES (200, 'Hộp đựng đũa muỗng thìa tích hợp ngăn gia vị là sản phẩm đa năng hoàn hảo cho các nhà hàng và quán ăn hiện đại. Thiết kế thông minh kết hợp giữa khoang chứa dụng cụ ăn uống và khay để hũ gia vị, tăm hoặc khăn giấy, giúp tối ưu diện tích mặt bàn. Sản phẩm ', 'Tích hợp ngăn chứa gia vị và khăn giấy tiện dụng; Thiết kế gọn gàng, tiết kiệm không gian bàn ăn; Gỗ tự nhiên chịu nước tốt, dễ dàng lau chùi; Kiểu dáng hiện đại, chắc chắn.', 200);
INSERT INTO `descriptions` VALUES (201, '', '1234', 201);
INSERT INTO `descriptions` VALUES (202, '', '1234', 202);
INSERT INTO `descriptions` VALUES (204, '', '1234', 204);
INSERT INTO `descriptions` VALUES (205, '321w', '', 205);
INSERT INTO `descriptions` VALUES (206, '', '', 206);
INSERT INTO `descriptions` VALUES (209, '', '', 209);
INSERT INTO `descriptions` VALUES (211, '', '', 211);

-- ----------------------------
-- Table structure for favorites
-- ----------------------------
DROP TABLE IF EXISTS `favorites`;
CREATE TABLE `favorites`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `created_at` datetime NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_user_product`(`user_id` ASC, `product_id` ASC) USING BTREE,
  INDEX `fk_fav_product`(`product_id` ASC) USING BTREE,
  CONSTRAINT `fk_fav_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_fav_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of favorites
-- ----------------------------
INSERT INTO `favorites` VALUES (9, 124, 6, '2026-04-11 16:32:41');
INSERT INTO `favorites` VALUES (10, 124, 11, '2026-04-11 16:33:56');

-- ----------------------------
-- Table structure for flashsaledetails
-- ----------------------------
DROP TABLE IF EXISTS `flashsaledetails`;
CREATE TABLE `flashsaledetails`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `flashSaleId` int NOT NULL,
  `product_variant_id` int NOT NULL,
  `discountPercent` int NULL DEFAULT 0,
  `flashPrice` decimal(18, 2) NULL DEFAULT NULL,
  `saleStock` int NULL DEFAULT 0,
  `soldCount` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_FlashSale_Main`(`flashSaleId` ASC) USING BTREE,
  INDEX `FK_FlashSale_Variant`(`product_variant_id` ASC) USING BTREE,
  CONSTRAINT `FK_FlashSale_Main` FOREIGN KEY (`flashSaleId`) REFERENCES `flashsales` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_FlashSale_Variant` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flashsaledetails
-- ----------------------------
INSERT INTO `flashsaledetails` VALUES (2, 2, 228, 50, 0.00, 15, 0);
INSERT INTO `flashsaledetails` VALUES (3, 2, 12, 20, 0.00, 4, 0);
INSERT INTO `flashsaledetails` VALUES (11, 10, 14, 7, 0.00, 9, 0);
INSERT INTO `flashsaledetails` VALUES (12, 11, 14, 7, 0.00, 9, 0);

-- ----------------------------
-- Table structure for flashsales
-- ----------------------------
DROP TABLE IF EXISTS `flashsales`;
CREATE TABLE `flashsales`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `campaignName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `status` int NULL DEFAULT 1,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flashsales
-- ----------------------------
INSERT INTO `flashsales` VALUES (2, 'Flash Sale', 'câcscsacasc', '2026-03-29 10:24:00', '2026-04-30 10:24:00', 1, '2026-03-29 10:24:43');
INSERT INTO `flashsales` VALUES (10, 'SAle Tết', '123', '2026-04-09 18:06:00', '2026-06-30 18:06:00', 0, '2026-04-04 18:06:20');
INSERT INTO `flashsales` VALUES (11, '23432432432432', '234234', '2029-07-20 18:06:00', '2029-08-23 18:06:00', 1, '2026-04-04 18:06:53');

-- ----------------------------
-- Table structure for images
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `urlImage` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1164 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of images
-- ----------------------------
INSERT INTO `images` VALUES (1, 'img/products/ban_ghe_1.png');
INSERT INTO `images` VALUES (2, 'img/products/ban_ghe_2.png');
INSERT INTO `images` VALUES (3, 'img/products/ban_ghe_3.png');
INSERT INTO `images` VALUES (4, 'img/products/ban_ghe_4.png');
INSERT INTO `images` VALUES (5, 'img/products/ban_ghe_5.png');
INSERT INTO `images` VALUES (6, 'img/products/ban_ghe_6.png');
INSERT INTO `images` VALUES (7, 'img/products/ban_ghe_7.png');
INSERT INTO `images` VALUES (8, 'img/products/ban_ghe_8.png');
INSERT INTO `images` VALUES (9, 'img/products/ban_ghe_9.png');
INSERT INTO `images` VALUES (10, 'img/products/ban_ghe_10.png');
INSERT INTO `images` VALUES (11, 'img/products/ban_ghe_11.png');
INSERT INTO `images` VALUES (12, 'img/products/ban_ghe_12.png');
INSERT INTO `images` VALUES (13, 'img/products/ban_ghe_13.png');
INSERT INTO `images` VALUES (14, 'img/products/ban_ghe_14.png');
INSERT INTO `images` VALUES (15, 'img/products/ban_ghe_15.png');
INSERT INTO `images` VALUES (16, 'img/products/ban_ghe_16.png');
INSERT INTO `images` VALUES (17, 'img/products/ban_ghe_17.png');
INSERT INTO `images` VALUES (18, 'img/products/ban_ghe_18.png');
INSERT INTO `images` VALUES (19, 'img/products/ban_ghe_19.png');
INSERT INTO `images` VALUES (20, 'img/products/ban_ghe_20.png');
INSERT INTO `images` VALUES (21, 'img/products/ban_ghe_21.png');
INSERT INTO `images` VALUES (22, 'img/products/ban_ghe_22.png');
INSERT INTO `images` VALUES (23, 'img/products/ban_ghe_23.png');
INSERT INTO `images` VALUES (24, 'img/products/ban_ghe_24.png');
INSERT INTO `images` VALUES (25, 'img/products/ban_ghe_25.png');
INSERT INTO `images` VALUES (26, 'img/products/ban_ghe_26.png');
INSERT INTO `images` VALUES (27, 'img/products/ban_ghe_27.png');
INSERT INTO `images` VALUES (28, 'img/products/ban_ghe_28.png');
INSERT INTO `images` VALUES (29, 'img/products/ban_ghe_29.png');
INSERT INTO `images` VALUES (30, 'img/products/ban_ghe_30.png');
INSERT INTO `images` VALUES (31, 'img/products/ban_ghe_31.png');
INSERT INTO `images` VALUES (32, 'img/products/ban_ghe_32.png');
INSERT INTO `images` VALUES (33, 'img/products/ban_ghe_33.png');
INSERT INTO `images` VALUES (34, 'img/products/ban_ghe_34.png');
INSERT INTO `images` VALUES (35, 'img/products/ban_ghe_35.png');
INSERT INTO `images` VALUES (36, 'img/products/ban_ghe_36.png');
INSERT INTO `images` VALUES (37, 'img/products/ban_ghe_37.png');
INSERT INTO `images` VALUES (38, 'img/products/ban_ghe_38.png');
INSERT INTO `images` VALUES (39, 'img/products/ban_ghe_39.png');
INSERT INTO `images` VALUES (40, 'img/products/ban_ghe_40.png');
INSERT INTO `images` VALUES (41, 'img/products/ban_ghe_41.png');
INSERT INTO `images` VALUES (42, 'img/products/ban_ghe_42.png');
INSERT INTO `images` VALUES (43, 'img/products/ban_ghe_43.png');
INSERT INTO `images` VALUES (44, 'img/products/ban_ghe_44.png');
INSERT INTO `images` VALUES (45, 'img/products/ban_ghe_45.png');
INSERT INTO `images` VALUES (46, 'img/products/ban_ghe_46.png');
INSERT INTO `images` VALUES (47, 'img/products/ban_ghe_47.png');
INSERT INTO `images` VALUES (48, 'img/products/ban_ghe_48.png');
INSERT INTO `images` VALUES (49, 'img/products/ban_ghe_49.png');
INSERT INTO `images` VALUES (50, 'img/products/ban_ghe_50.png');
INSERT INTO `images` VALUES (51, 'img/products/ban_ghe_51.png');
INSERT INTO `images` VALUES (52, 'img/products/ban_ghe_52.png');
INSERT INTO `images` VALUES (53, 'img/products/ban_ghe_53.png');
INSERT INTO `images` VALUES (54, 'img/products/ban_ghe_54.png');
INSERT INTO `images` VALUES (55, 'img/products/ban_ghe_55.png');
INSERT INTO `images` VALUES (56, 'img/products/ban_ghe_56.png');
INSERT INTO `images` VALUES (57, 'img/products/ban_ghe_57.png');
INSERT INTO `images` VALUES (58, 'img/products/ban_ghe_58.png');
INSERT INTO `images` VALUES (59, 'img/products/ban_ghe_59.png');
INSERT INTO `images` VALUES (60, 'img/products/ban_ghe_60.png');
INSERT INTO `images` VALUES (61, 'img/products/ban_ghe_61.png');
INSERT INTO `images` VALUES (62, 'img/products/ban_ghe_62.png');
INSERT INTO `images` VALUES (63, 'img/products/ban_ghe_63.png');
INSERT INTO `images` VALUES (64, 'img/products/ban_ghe_64.png');
INSERT INTO `images` VALUES (65, 'img/products/ban_ghe_65.png');
INSERT INTO `images` VALUES (66, 'img/products/ban_ghe_66.png');
INSERT INTO `images` VALUES (67, 'img/products/ban_ghe_67.png');
INSERT INTO `images` VALUES (68, 'img/products/ban_ghe_68.png');
INSERT INTO `images` VALUES (69, 'img/products/ban_ghe_69.png');
INSERT INTO `images` VALUES (70, 'img/products/ban_ghe_70.png');
INSERT INTO `images` VALUES (71, 'img/products/ban_ghe_71.png');
INSERT INTO `images` VALUES (72, 'img/products/ban_ghe_72.png');
INSERT INTO `images` VALUES (73, 'img/products/ban_ghe_73.png');
INSERT INTO `images` VALUES (74, 'img/products/ban_ghe_74.png');
INSERT INTO `images` VALUES (75, 'img/products/ban_ghe_75.png');
INSERT INTO `images` VALUES (76, 'img/products/ban_ghe_76.png');
INSERT INTO `images` VALUES (77, 'img/products/ban_ghe_77.png');
INSERT INTO `images` VALUES (78, 'img/products/ban_ghe_78.png');
INSERT INTO `images` VALUES (79, 'img/products/ban_ghe_79.png');
INSERT INTO `images` VALUES (80, 'img/products/ban_ghe_80.png');
INSERT INTO `images` VALUES (81, 'img/products/ban_ghe_81.png');
INSERT INTO `images` VALUES (82, 'img/products/ban_ghe_82.png');
INSERT INTO `images` VALUES (83, 'img/products/ban_ghe_83.png');
INSERT INTO `images` VALUES (84, 'img/products/ban_ghe_84.png');
INSERT INTO `images` VALUES (85, 'img/products/ban_ghe_85.png');
INSERT INTO `images` VALUES (86, 'img/products/ban_ghe_86.png');
INSERT INTO `images` VALUES (87, 'img/products/ban_ghe_87.png');
INSERT INTO `images` VALUES (88, 'img/products/ban_ghe_88.png');
INSERT INTO `images` VALUES (89, 'img/products/ban_ghe_89.png');
INSERT INTO `images` VALUES (90, 'img/products/ban_ghe_90.png');
INSERT INTO `images` VALUES (91, 'img/products/ban_ghe_91.png');
INSERT INTO `images` VALUES (92, 'img/products/ban_ghe_92.png');
INSERT INTO `images` VALUES (93, 'img/products/ban_ghe_93.png');
INSERT INTO `images` VALUES (94, 'img/products/ban_ghe_94.png');
INSERT INTO `images` VALUES (95, 'img/products/ban_ghe_95.png');
INSERT INTO `images` VALUES (96, 'img/products/ban_ghe_96.png');
INSERT INTO `images` VALUES (97, 'img/products/ban_ghe_97.png');
INSERT INTO `images` VALUES (98, 'img/products/ban_ghe_98.png');
INSERT INTO `images` VALUES (99, 'img/products/ban_ghe_99.png');
INSERT INTO `images` VALUES (100, 'img/products/ban_ghe_100.png');
INSERT INTO `images` VALUES (101, 'img/products/ban_ghe_101.png');
INSERT INTO `images` VALUES (102, 'img/products/ban_ghe_102.png');
INSERT INTO `images` VALUES (103, 'img/products/ban_ghe_103.png');
INSERT INTO `images` VALUES (104, 'img/products/ban_ghe_104.png');
INSERT INTO `images` VALUES (105, 'img/products/ban_ghe_105.png');
INSERT INTO `images` VALUES (106, 'img/products/ban_ghe_106.png');
INSERT INTO `images` VALUES (107, 'img/products/ban_ghe_107.png');
INSERT INTO `images` VALUES (108, 'img/products/ban_ghe_108.png');
INSERT INTO `images` VALUES (109, 'img/products/ban_ghe_109.png');
INSERT INTO `images` VALUES (110, 'img/products/ban_ghe_110.png');
INSERT INTO `images` VALUES (111, 'img/products/ban_ghe_111.png');
INSERT INTO `images` VALUES (112, 'img/products/ban_ghe_112.png');
INSERT INTO `images` VALUES (113, 'img/products/ban_ghe_113.png');
INSERT INTO `images` VALUES (114, 'img/products/ban_ghe_114.png');
INSERT INTO `images` VALUES (115, 'img/products/ban_ghe_115.png');
INSERT INTO `images` VALUES (116, 'img/products/ban_ghe_116.png');
INSERT INTO `images` VALUES (117, 'img/products/ban_ghe_117.png');
INSERT INTO `images` VALUES (118, 'img/products/ban_ghe_118.png');
INSERT INTO `images` VALUES (119, 'img/products/ban_ghe_119.png');
INSERT INTO `images` VALUES (120, 'img/products/ban_ghe_120.png');
INSERT INTO `images` VALUES (121, 'img/products/ban_ghe_121.png');
INSERT INTO `images` VALUES (122, 'img/products/ban_ghe_122.png');
INSERT INTO `images` VALUES (123, 'img/products/ban_ghe_123.png');
INSERT INTO `images` VALUES (124, 'img/products/ban_ghe_124.png');
INSERT INTO `images` VALUES (125, 'img/products/ban_ghe_125.png');
INSERT INTO `images` VALUES (126, 'img/products/ban_ghe_126.png');
INSERT INTO `images` VALUES (127, 'img/products/ban_ghe_127.png');
INSERT INTO `images` VALUES (128, 'img/products/ban_ghe_128.png');
INSERT INTO `images` VALUES (129, 'img/products/ban_ghe_129.png');
INSERT INTO `images` VALUES (130, 'img/products/ban_ghe_130.png');
INSERT INTO `images` VALUES (131, 'img/products/ban_ghe_131.png');
INSERT INTO `images` VALUES (132, 'img/products/ban_ghe_132.png');
INSERT INTO `images` VALUES (133, 'img/products/ban_ghe_133.png');
INSERT INTO `images` VALUES (134, 'img/products/ban_ghe_134.png');
INSERT INTO `images` VALUES (135, 'img/products/ban_ghe_135.png');
INSERT INTO `images` VALUES (136, 'img/products/ban_ghe_136.png');
INSERT INTO `images` VALUES (137, 'img/products/ban_ghe_137.png');
INSERT INTO `images` VALUES (138, 'img/products/ban_ghe_138.png');
INSERT INTO `images` VALUES (139, 'img/products/ban_ghe_139.png');
INSERT INTO `images` VALUES (140, 'img/products/ban_ghe_140.png');
INSERT INTO `images` VALUES (141, 'img/products/ban_ghe_141.png');
INSERT INTO `images` VALUES (142, 'img/products/ban_ghe_142.png');
INSERT INTO `images` VALUES (143, 'img/products/ban_ghe_143.png');
INSERT INTO `images` VALUES (144, 'img/products/ban_ghe_144.png');
INSERT INTO `images` VALUES (145, 'img/products/ban_ghe_145.png');
INSERT INTO `images` VALUES (146, 'img/products/ban_ghe_146.png');
INSERT INTO `images` VALUES (147, 'img/products/ban_ghe_147.png');
INSERT INTO `images` VALUES (148, 'img/products/ban_ghe_148.png');
INSERT INTO `images` VALUES (149, 'img/products/ban_ghe_149.png');
INSERT INTO `images` VALUES (150, 'img/products/ban_ghe_150.png');
INSERT INTO `images` VALUES (151, 'img/products/ban_ghe_151.png');
INSERT INTO `images` VALUES (152, 'img/products/ban_ghe_152.png');
INSERT INTO `images` VALUES (153, 'img/products/ban_ghe_153.png');
INSERT INTO `images` VALUES (154, 'img/products/ban_ghe_154.png');
INSERT INTO `images` VALUES (155, 'img/products/ban_ghe_155.png');
INSERT INTO `images` VALUES (156, 'img/products/ban_ghe_156.png');
INSERT INTO `images` VALUES (157, 'img/products/ban_ghe_157.png');
INSERT INTO `images` VALUES (158, 'img/products/ban_ghe_158.png');
INSERT INTO `images` VALUES (159, 'img/products/ban_ghe_159.png');
INSERT INTO `images` VALUES (160, 'img/products/ban_ghe_160.png');
INSERT INTO `images` VALUES (161, 'img/products/ban_ghe_161.png');
INSERT INTO `images` VALUES (162, 'img/products/ban_ghe_162.png');
INSERT INTO `images` VALUES (163, 'img/products/ban_ghe_163.png');
INSERT INTO `images` VALUES (164, 'img/products/ban_ghe_164.png');
INSERT INTO `images` VALUES (165, 'img/products/ban_ghe_165.png');
INSERT INTO `images` VALUES (166, 'img/products/ban_ghe_166.png');
INSERT INTO `images` VALUES (167, 'img/products/ban_ghe_167.png');
INSERT INTO `images` VALUES (168, 'img/products/ban_ghe_168.png');
INSERT INTO `images` VALUES (169, 'img/products/ban_ghe_169.png');
INSERT INTO `images` VALUES (170, 'img/products/ban_ghe_170.png');
INSERT INTO `images` VALUES (171, 'img/products/ban_ghe_171.png');
INSERT INTO `images` VALUES (172, 'img/products/ban_ghe_172.png');
INSERT INTO `images` VALUES (173, 'img/products/ban_ghe_173.png');
INSERT INTO `images` VALUES (174, 'img/products/ban_ghe_174.png');
INSERT INTO `images` VALUES (175, 'img/products/ban_ghe_175.png');
INSERT INTO `images` VALUES (176, 'img/products/ban_ghe_176.png');
INSERT INTO `images` VALUES (177, 'img/products/ban_ghe_177.png');
INSERT INTO `images` VALUES (178, 'img/products/ban_ghe_178.png');
INSERT INTO `images` VALUES (179, 'img/products/ban_ghe_179.png');
INSERT INTO `images` VALUES (180, 'img/products/ban_ghe_180.png');
INSERT INTO `images` VALUES (181, 'img/products/ban_ghe_181.png');
INSERT INTO `images` VALUES (182, 'img/products/ban_ghe_182.png');
INSERT INTO `images` VALUES (183, 'img/products/ban_ghe_183.png');
INSERT INTO `images` VALUES (184, 'img/products/ban_ghe_184.png');
INSERT INTO `images` VALUES (185, 'img/products/ban_ghe_185.png');
INSERT INTO `images` VALUES (186, 'img/products/ban_ghe_186.png');
INSERT INTO `images` VALUES (187, 'img/products/ban_ghe_187.png');
INSERT INTO `images` VALUES (188, 'img/products/ban_ghe_188.png');
INSERT INTO `images` VALUES (189, 'img/products/ban_ghe_189.png');
INSERT INTO `images` VALUES (190, 'img/products/ban_ghe_190.png');
INSERT INTO `images` VALUES (191, 'img/products/ban_ghe_191.png');
INSERT INTO `images` VALUES (192, 'img/products/ban_ghe_192.png');
INSERT INTO `images` VALUES (193, 'img/products/ban_ghe_193.png');
INSERT INTO `images` VALUES (194, 'img/products/ban_ghe_194.png');
INSERT INTO `images` VALUES (195, 'img/products/ban_ghe_195.png');
INSERT INTO `images` VALUES (196, 'img/products/ban_ghe_196.png');
INSERT INTO `images` VALUES (197, 'img/products/ban_ghe_197.png');
INSERT INTO `images` VALUES (198, 'img/products/ban_ghe_198.png');
INSERT INTO `images` VALUES (199, 'img/products/ban_ghe_199.png');
INSERT INTO `images` VALUES (200, 'img/products/ban_ghe_200.png');
INSERT INTO `images` VALUES (201, 'img/products/ban_ghe_201.png');
INSERT INTO `images` VALUES (202, 'img/products/ban_ghe_202.png');
INSERT INTO `images` VALUES (203, 'img/products/ban_ghe_203.png');
INSERT INTO `images` VALUES (204, 'img/products/ban_ghe_204.png');
INSERT INTO `images` VALUES (205, 'img/products/ban_ghe_205.png');
INSERT INTO `images` VALUES (206, 'img/products/ban_ghe_206.png');
INSERT INTO `images` VALUES (207, 'img/products/ban_ghe_207.png');
INSERT INTO `images` VALUES (208, 'img/products/ban_ghe_208.png');
INSERT INTO `images` VALUES (209, 'img/products/ban_ghe_209.png');
INSERT INTO `images` VALUES (210, 'img/products/ban_ghe_210.png');
INSERT INTO `images` VALUES (211, 'img/products/ban_ghe_211.png');
INSERT INTO `images` VALUES (212, 'img/products/ban_ghe_212.png');
INSERT INTO `images` VALUES (213, 'img/products/ban_ghe_213.png');
INSERT INTO `images` VALUES (214, 'img/products/ban_ghe_214.png');
INSERT INTO `images` VALUES (215, 'img/products/ban_ghe_215.png');
INSERT INTO `images` VALUES (216, 'img/products/ban_ghe_216.png');
INSERT INTO `images` VALUES (217, 'img/products/ban_ghe_217.png');
INSERT INTO `images` VALUES (218, 'img/products/ban_ghe_218.png');
INSERT INTO `images` VALUES (219, 'img/products/ban_ghe_219.png');
INSERT INTO `images` VALUES (220, 'img/products/ban_ghe_220.png');
INSERT INTO `images` VALUES (221, 'img/products/ban_ghe_221.png');
INSERT INTO `images` VALUES (222, 'img/products/ban_ghe_222.png');
INSERT INTO `images` VALUES (223, 'img/products/ban_ghe_223.png');
INSERT INTO `images` VALUES (224, 'img/products/ban_ghe_224.png');
INSERT INTO `images` VALUES (225, 'img/products/ban_ghe_225.png');
INSERT INTO `images` VALUES (226, 'img/products/ban_ghe_226.png');
INSERT INTO `images` VALUES (227, 'img/products/ban_ghe_227.png');
INSERT INTO `images` VALUES (228, 'img/products/ban_ghe_228.png');
INSERT INTO `images` VALUES (229, 'img/products/ban_ghe_229.png');
INSERT INTO `images` VALUES (230, 'img/products/ban_ghe_230.png');
INSERT INTO `images` VALUES (231, 'img/products/ban_ghe_231.png');
INSERT INTO `images` VALUES (232, 'img/products/ban_ghe_232.png');
INSERT INTO `images` VALUES (233, 'img/products/ban_ghe_233.png');
INSERT INTO `images` VALUES (234, 'img/products/ban_ghe_234.png');
INSERT INTO `images` VALUES (235, 'img/products/ban_ghe_235.png');
INSERT INTO `images` VALUES (236, 'img/products/ban_ghe_236.png');
INSERT INTO `images` VALUES (237, 'img/products/ban_ghe_237.png');
INSERT INTO `images` VALUES (238, 'img/products/ban_ghe_238.png');
INSERT INTO `images` VALUES (239, 'img/products/ban_ghe_239.png');
INSERT INTO `images` VALUES (240, 'img/products/ban_ghe_240.png');
INSERT INTO `images` VALUES (241, 'img/products/ban_ghe_241.png');
INSERT INTO `images` VALUES (242, 'img/products/ban_ghe_242.png');
INSERT INTO `images` VALUES (243, 'img/products/ban_ghe_243.png');
INSERT INTO `images` VALUES (244, 'img/products/ban_ghe_244.png');
INSERT INTO `images` VALUES (245, 'img/products/ban_ghe_245.png');
INSERT INTO `images` VALUES (246, 'img/products/ban_ghe_246.png');
INSERT INTO `images` VALUES (247, 'img/products/ban_ghe_247.png');
INSERT INTO `images` VALUES (248, 'img/products/ban_ghe_248.png');
INSERT INTO `images` VALUES (249, 'img/products/ban_ghe_249.png');
INSERT INTO `images` VALUES (250, 'img/products/ban_ghe_250.png');
INSERT INTO `images` VALUES (251, 'img/products/ban_ghe_251.png');
INSERT INTO `images` VALUES (252, 'img/products/ban_ghe_252.png');
INSERT INTO `images` VALUES (253, 'img/products/ban_ghe_253.png');
INSERT INTO `images` VALUES (254, 'img/products/ban_ghe_254.png');
INSERT INTO `images` VALUES (255, 'img/products/ban_ghe_255.png');
INSERT INTO `images` VALUES (256, 'img/products/ban_ghe_256.png');
INSERT INTO `images` VALUES (257, 'img/products/ban_ghe_257.png');
INSERT INTO `images` VALUES (258, 'img/products/ban_ghe_258.png');
INSERT INTO `images` VALUES (259, 'img/products/ban_ghe_259.png');
INSERT INTO `images` VALUES (260, 'img/products/ban_ghe_260.png');
INSERT INTO `images` VALUES (261, 'img/products/ban_ghe_261.png');
INSERT INTO `images` VALUES (262, 'img/products/ban_ghe_262.png');
INSERT INTO `images` VALUES (263, 'img/products/ban_ghe_263.png');
INSERT INTO `images` VALUES (264, 'img/products/ban_ghe_264.png');
INSERT INTO `images` VALUES (265, 'img/products/ban_ghe_265.png');
INSERT INTO `images` VALUES (266, 'img/products/ban_ghe_266.png');
INSERT INTO `images` VALUES (267, 'img/products/ban_ghe_267.png');
INSERT INTO `images` VALUES (268, 'img/products/ban_ghe_268.png');
INSERT INTO `images` VALUES (269, 'img/products/ban_ghe_269.png');
INSERT INTO `images` VALUES (270, 'img/products/ban_ghe_270.png');
INSERT INTO `images` VALUES (271, 'img/products/ban_ghe_271.png');
INSERT INTO `images` VALUES (272, 'img/products/ban_ghe_272.png');
INSERT INTO `images` VALUES (273, 'img/products/ban_ghe_273.png');
INSERT INTO `images` VALUES (274, 'img/products/ban_ghe_274.png');
INSERT INTO `images` VALUES (275, 'img/products/ban_ghe_275.png');
INSERT INTO `images` VALUES (276, 'img/products/ban_ghe_276.png');
INSERT INTO `images` VALUES (277, 'img/products/ban_ghe_277.png');
INSERT INTO `images` VALUES (278, 'img/products/ban_ghe_278.png');
INSERT INTO `images` VALUES (279, 'img/products/ban_ghe_279.png');
INSERT INTO `images` VALUES (280, 'img/products/ban_ghe_280.png');
INSERT INTO `images` VALUES (281, 'img/products/ban_ghe_281.png');
INSERT INTO `images` VALUES (282, 'img/products/ban_ghe_282.png');
INSERT INTO `images` VALUES (283, 'img/products/ban_ghe_283.png');
INSERT INTO `images` VALUES (284, 'img/products/ban_ghe_284.png');
INSERT INTO `images` VALUES (285, 'img/products/ban_ghe_285.png');
INSERT INTO `images` VALUES (286, 'img/products/ban_ghe_286.png');
INSERT INTO `images` VALUES (287, 'img/products/ban_ghe_287.png');
INSERT INTO `images` VALUES (288, 'img/products/ban_ghe_288.png');
INSERT INTO `images` VALUES (289, 'img/products/ban_ghe_289.png');
INSERT INTO `images` VALUES (290, 'img/products/ban_ghe_290.png');
INSERT INTO `images` VALUES (291, 'img/products/ban_ghe_291.png');
INSERT INTO `images` VALUES (292, 'img/products/ban_ghe_292.png');
INSERT INTO `images` VALUES (293, 'img/products/ban_ghe_293.png');
INSERT INTO `images` VALUES (294, 'img/products/ban_ghe_294.png');
INSERT INTO `images` VALUES (295, 'img/products/ban_ghe_295.png');
INSERT INTO `images` VALUES (296, 'img/products/ban_ghe_296.png');
INSERT INTO `images` VALUES (297, 'img/products/ban_ghe_297.png');
INSERT INTO `images` VALUES (298, 'img/products/ban_ghe_298.png');
INSERT INTO `images` VALUES (299, 'img/products/ban_ghe_299.png');
INSERT INTO `images` VALUES (300, 'img/products/ban_ghe_300.png');
INSERT INTO `images` VALUES (301, 'img/products/giuong_301.jpg');
INSERT INTO `images` VALUES (302, 'img/products/giuong_302.jpg');
INSERT INTO `images` VALUES (303, 'img/products/giuong_303.jpg');
INSERT INTO `images` VALUES (304, 'img/products/giuong_304.jpg');
INSERT INTO `images` VALUES (305, 'img/products/giuong_305.jpg');
INSERT INTO `images` VALUES (306, 'img/products/giuong_306.jpg');
INSERT INTO `images` VALUES (307, 'img/products/giuong_307.jpg');
INSERT INTO `images` VALUES (308, 'img/products/giuong_308.jpg');
INSERT INTO `images` VALUES (309, 'img/products/giuong_309.jpg');
INSERT INTO `images` VALUES (310, 'img/products/giuong_310.jpg');
INSERT INTO `images` VALUES (311, 'img/products/giuong_311.jpg');
INSERT INTO `images` VALUES (312, 'img/products/giuong_312.jpg');
INSERT INTO `images` VALUES (313, 'img/products/giuong_313.jpg');
INSERT INTO `images` VALUES (314, 'img/products/giuong_314.jpg');
INSERT INTO `images` VALUES (315, 'img/products/giuong_315.jpg');
INSERT INTO `images` VALUES (316, 'img/products/giuong_316.jpg');
INSERT INTO `images` VALUES (317, 'img/products/giuong_317.jpg');
INSERT INTO `images` VALUES (318, 'img/products/giuong_318.jpg');
INSERT INTO `images` VALUES (319, 'img/products/giuong_319.jpg');
INSERT INTO `images` VALUES (320, 'img/products/giuong_320.jpg');
INSERT INTO `images` VALUES (321, 'img/products/giuong_321.jpg');
INSERT INTO `images` VALUES (322, 'img/products/giuong_322.jpg');
INSERT INTO `images` VALUES (323, 'img/products/giuong_323.jpg');
INSERT INTO `images` VALUES (324, 'img/products/giuong_324.jpg');
INSERT INTO `images` VALUES (325, 'img/products/giuong_325.jpg');
INSERT INTO `images` VALUES (326, 'img/products/giuong_326.jpg');
INSERT INTO `images` VALUES (327, 'img/products/giuong_327.jpg');
INSERT INTO `images` VALUES (328, 'img/products/giuong_328.jpg');
INSERT INTO `images` VALUES (329, 'img/products/giuong_329.jpg');
INSERT INTO `images` VALUES (330, 'img/products/giuong_330.jpg');
INSERT INTO `images` VALUES (331, 'img/products/giuong_331.jpg');
INSERT INTO `images` VALUES (332, 'img/products/giuong_332.jpg');
INSERT INTO `images` VALUES (333, 'img/products/giuong_333.jpg');
INSERT INTO `images` VALUES (334, 'img/products/giuong_334.jpg');
INSERT INTO `images` VALUES (335, 'img/products/giuong_335.jpg');
INSERT INTO `images` VALUES (336, 'img/products/giuong_336.jpg');
INSERT INTO `images` VALUES (337, 'img/products/giuong_337.jpg');
INSERT INTO `images` VALUES (338, 'img/products/giuong_338.jpg');
INSERT INTO `images` VALUES (339, 'img/products/giuong_339.jpg');
INSERT INTO `images` VALUES (340, 'img/products/giuong_340.jpg');
INSERT INTO `images` VALUES (341, 'img/products/giuong_341.jpg');
INSERT INTO `images` VALUES (342, 'img/products/giuong_342.jpg');
INSERT INTO `images` VALUES (343, 'img/products/giuong_343.jpg');
INSERT INTO `images` VALUES (344, 'img/products/giuong_344.jpg');
INSERT INTO `images` VALUES (345, 'img/products/giuong_345.jpg');
INSERT INTO `images` VALUES (346, 'img/products/giuong_346.jpg');
INSERT INTO `images` VALUES (347, 'img/products/giuong_347.jpg');
INSERT INTO `images` VALUES (348, 'img/products/giuong_348.jpg');
INSERT INTO `images` VALUES (349, 'img/products/giuong_349.jpg');
INSERT INTO `images` VALUES (350, 'img/products/giuong_350.jpg');
INSERT INTO `images` VALUES (351, 'img/products/giuong_351.jpg');
INSERT INTO `images` VALUES (352, 'img/products/giuong_352.jpg');
INSERT INTO `images` VALUES (353, 'img/products/giuong_353.jpg');
INSERT INTO `images` VALUES (354, 'img/products/giuong_354.jpg');
INSERT INTO `images` VALUES (355, 'img/products/giuong_355.jpg');
INSERT INTO `images` VALUES (356, 'img/products/giuong_356.jpg');
INSERT INTO `images` VALUES (357, 'img/products/giuong_357.jpg');
INSERT INTO `images` VALUES (358, 'img/products/giuong_358.jpg');
INSERT INTO `images` VALUES (359, 'img/products/giuong_359.jpg');
INSERT INTO `images` VALUES (360, 'img/products/giuong_360.jpg');
INSERT INTO `images` VALUES (361, 'img/products/giuong_361.jpg');
INSERT INTO `images` VALUES (362, 'img/products/giuong_362.jpg');
INSERT INTO `images` VALUES (363, 'img/products/giuong_363.jpg');
INSERT INTO `images` VALUES (364, 'img/products/giuong_364.jpg');
INSERT INTO `images` VALUES (365, 'img/products/giuong_365.jpg');
INSERT INTO `images` VALUES (366, 'img/products/giuong_366.jpg');
INSERT INTO `images` VALUES (367, 'img/products/giuong_367.jpg');
INSERT INTO `images` VALUES (368, 'img/products/giuong_368.jpg');
INSERT INTO `images` VALUES (369, 'img/products/giuong_369.jpg');
INSERT INTO `images` VALUES (370, 'img/products/giuong_370.jpg');
INSERT INTO `images` VALUES (371, 'img/products/giuong_371.jpg');
INSERT INTO `images` VALUES (372, 'img/products/giuong_372.jpg');
INSERT INTO `images` VALUES (373, 'img/products/giuong_373.jpg');
INSERT INTO `images` VALUES (374, 'img/products/giuong_374.jpg');
INSERT INTO `images` VALUES (375, 'img/products/giuong_375.jpg');
INSERT INTO `images` VALUES (376, 'img/products/giuong_376.jpg');
INSERT INTO `images` VALUES (377, 'img/products/giuong_377.jpg');
INSERT INTO `images` VALUES (378, 'img/products/giuong_378.jpg');
INSERT INTO `images` VALUES (379, 'img/products/giuong_379.jpg');
INSERT INTO `images` VALUES (380, 'img/products/giuong_380.jpg');
INSERT INTO `images` VALUES (381, 'img/products/giuong_381.jpg');
INSERT INTO `images` VALUES (382, 'img/products/giuong_382.jpg');
INSERT INTO `images` VALUES (383, 'img/products/giuong_383.jpg');
INSERT INTO `images` VALUES (384, 'img/products/giuong_384.jpg');
INSERT INTO `images` VALUES (385, 'img/products/giuong_385.jpg');
INSERT INTO `images` VALUES (386, 'img/products/giuong_386.jpg');
INSERT INTO `images` VALUES (387, 'img/products/giuong_387.jpg');
INSERT INTO `images` VALUES (388, 'img/products/giuong_388.jpg');
INSERT INTO `images` VALUES (389, 'img/products/giuong_389.jpg');
INSERT INTO `images` VALUES (390, 'img/products/giuong_390.jpg');
INSERT INTO `images` VALUES (391, 'img/products/giuong_391.jpg');
INSERT INTO `images` VALUES (392, 'img/products/giuong_392.jpg');
INSERT INTO `images` VALUES (393, 'img/products/giuong_393.jpg');
INSERT INTO `images` VALUES (394, 'img/products/giuong_394.jpg');
INSERT INTO `images` VALUES (395, 'img/products/giuong_395.jpg');
INSERT INTO `images` VALUES (396, 'img/products/giuong_396.jpg');
INSERT INTO `images` VALUES (397, 'img/products/giuong_397.jpg');
INSERT INTO `images` VALUES (398, 'img/products/giuong_398.jpg');
INSERT INTO `images` VALUES (399, 'img/products/giuong_399.jpg');
INSERT INTO `images` VALUES (400, 'img/products/giuong_400.jpg');
INSERT INTO `images` VALUES (401, 'img/products/giuong_401.jpg');
INSERT INTO `images` VALUES (402, 'img/products/giuong_402.jpg');
INSERT INTO `images` VALUES (403, 'img/products/giuong_403.jpg');
INSERT INTO `images` VALUES (404, 'img/products/giuong_404.jpg');
INSERT INTO `images` VALUES (405, 'img/products/giuong_405.jpg');
INSERT INTO `images` VALUES (406, 'img/products/giuong_406.jpg');
INSERT INTO `images` VALUES (407, 'img/products/giuong_407.jpg');
INSERT INTO `images` VALUES (408, 'img/products/giuong_408.jpg');
INSERT INTO `images` VALUES (409, 'img/products/giuong_409.jpg');
INSERT INTO `images` VALUES (410, 'img/products/giuong_410.jpg');
INSERT INTO `images` VALUES (411, 'img/products/giuong_411.jpg');
INSERT INTO `images` VALUES (412, 'img/products/giuong_412.jpg');
INSERT INTO `images` VALUES (413, 'img/products/giuong_413.jpg');
INSERT INTO `images` VALUES (414, 'img/products/giuong_414.jpg');
INSERT INTO `images` VALUES (415, 'img/products/giuong_415.jpg');
INSERT INTO `images` VALUES (416, 'img/products/giuong_416.jpg');
INSERT INTO `images` VALUES (417, 'img/products/giuong_417.jpg');
INSERT INTO `images` VALUES (418, 'img/products/giuong_418.jpg');
INSERT INTO `images` VALUES (419, 'img/products/giuong_419.jpg');
INSERT INTO `images` VALUES (420, 'img/products/giuong_420.jpg');
INSERT INTO `images` VALUES (421, 'img/products/giuong_421.jpg');
INSERT INTO `images` VALUES (422, 'img/products/giuong_422.jpg');
INSERT INTO `images` VALUES (423, 'img/products/giuong_423.jpg');
INSERT INTO `images` VALUES (424, 'img/products/giuong_424.jpg');
INSERT INTO `images` VALUES (425, 'img/products/giuong_425.jpg');
INSERT INTO `images` VALUES (426, 'img/products/giuong_426.jpg');
INSERT INTO `images` VALUES (427, 'img/products/giuong_427.jpg');
INSERT INTO `images` VALUES (428, 'img/products/giuong_428.jpg');
INSERT INTO `images` VALUES (429, 'img/products/giuong_429.jpg');
INSERT INTO `images` VALUES (430, 'img/products/giuong_430.jpg');
INSERT INTO `images` VALUES (431, 'img/products/giuong_431.jpg');
INSERT INTO `images` VALUES (432, 'img/products/giuong_432.jpg');
INSERT INTO `images` VALUES (433, 'img/products/giuong_433.jpg');
INSERT INTO `images` VALUES (434, 'img/products/giuong_434.jpg');
INSERT INTO `images` VALUES (435, 'img/products/giuong_435.jpg');
INSERT INTO `images` VALUES (436, 'img/products/giuong_436.jpg');
INSERT INTO `images` VALUES (437, 'img/products/giuong_437.jpg');
INSERT INTO `images` VALUES (438, 'img/products/giuong_438.jpg');
INSERT INTO `images` VALUES (439, 'img/products/giuong_439.jpg');
INSERT INTO `images` VALUES (440, 'img/products/giuong_440.jpg');
INSERT INTO `images` VALUES (441, 'img/products/giuong_441.jpg');
INSERT INTO `images` VALUES (442, 'img/products/giuong_442.jpg');
INSERT INTO `images` VALUES (443, 'img/products/giuong_443.jpg');
INSERT INTO `images` VALUES (444, 'img/products/giuong_444.jpg');
INSERT INTO `images` VALUES (445, 'img/products/giuong_445.jpg');
INSERT INTO `images` VALUES (446, 'img/products/giuong_446.jpg');
INSERT INTO `images` VALUES (447, 'img/products/giuong_447.jpg');
INSERT INTO `images` VALUES (448, 'img/products/giuong_448.jpg');
INSERT INTO `images` VALUES (449, 'img/products/giuong_449.jpg');
INSERT INTO `images` VALUES (450, 'img/products/giuong_450.jpg');
INSERT INTO `images` VALUES (451, 'img/products/giuong_451.jpg');
INSERT INTO `images` VALUES (452, 'img/products/giuong_452.jpg');
INSERT INTO `images` VALUES (453, 'img/products/giuong_453.jpg');
INSERT INTO `images` VALUES (454, 'img/products/giuong_454.jpg');
INSERT INTO `images` VALUES (455, 'img/products/giuong_455.jpg');
INSERT INTO `images` VALUES (456, 'img/products/giuong_456.jpg');
INSERT INTO `images` VALUES (457, 'img/products/giuong_457.jpg');
INSERT INTO `images` VALUES (458, 'img/products/giuong_458.jpg');
INSERT INTO `images` VALUES (459, 'img/products/giuong_459.jpg');
INSERT INTO `images` VALUES (460, 'img/products/giuong_460.jpg');
INSERT INTO `images` VALUES (461, 'img/products/giuong_461.jpg');
INSERT INTO `images` VALUES (462, 'img/products/giuong_462.jpg');
INSERT INTO `images` VALUES (463, 'img/products/giuong_463.jpg');
INSERT INTO `images` VALUES (464, 'img/products/giuong_464.jpg');
INSERT INTO `images` VALUES (465, 'img/products/giuong_465.jpg');
INSERT INTO `images` VALUES (466, 'img/products/giuong_466.jpg');
INSERT INTO `images` VALUES (467, 'img/products/giuong_467.jpg');
INSERT INTO `images` VALUES (468, 'img/products/giuong_468.jpg');
INSERT INTO `images` VALUES (469, 'img/products/giuong_469.jpg');
INSERT INTO `images` VALUES (470, 'img/products/giuong_470.jpg');
INSERT INTO `images` VALUES (471, 'img/products/giuong_471.jpg');
INSERT INTO `images` VALUES (472, 'img/products/giuong_472.jpg');
INSERT INTO `images` VALUES (473, 'img/products/giuong_473.jpg');
INSERT INTO `images` VALUES (474, 'img/products/giuong_474.jpg');
INSERT INTO `images` VALUES (475, 'img/products/giuong_475.jpg');
INSERT INTO `images` VALUES (476, 'img/products/giuong_476.jpg');
INSERT INTO `images` VALUES (477, 'img/products/giuong_477.jpg');
INSERT INTO `images` VALUES (478, 'img/products/giuong_478.jpg');
INSERT INTO `images` VALUES (479, 'img/products/giuong_479.jpg');
INSERT INTO `images` VALUES (480, 'img/products/giuong_480.jpg');
INSERT INTO `images` VALUES (481, 'img/products/giuong_481.jpg');
INSERT INTO `images` VALUES (482, 'img/products/giuong_482.jpg');
INSERT INTO `images` VALUES (483, 'img/products/giuong_483.jpg');
INSERT INTO `images` VALUES (484, 'img/products/giuong_484.jpg');
INSERT INTO `images` VALUES (485, 'img/products/giuong_485.jpg');
INSERT INTO `images` VALUES (486, 'img/products/giuong_486.jpg');
INSERT INTO `images` VALUES (487, 'img/products/giuong_487.jpg');
INSERT INTO `images` VALUES (488, 'img/products/giuong_488.jpg');
INSERT INTO `images` VALUES (489, 'img/products/giuong_489.jpg');
INSERT INTO `images` VALUES (490, 'img/products/giuong_490.jpg');
INSERT INTO `images` VALUES (491, 'img/products/giuong_491.jpg');
INSERT INTO `images` VALUES (492, 'img/products/giuong_492.jpg');
INSERT INTO `images` VALUES (493, 'img/products/giuong_493.jpg');
INSERT INTO `images` VALUES (494, 'img/products/giuong_494.jpg');
INSERT INTO `images` VALUES (495, 'img/products/giuong_495.jpg');
INSERT INTO `images` VALUES (496, 'img/products/giuong_496.jpg');
INSERT INTO `images` VALUES (497, 'img/products/giuong_497.jpg');
INSERT INTO `images` VALUES (498, 'img/products/giuong_498.jpg');
INSERT INTO `images` VALUES (499, 'img/products/giuong_499.jpg');
INSERT INTO `images` VALUES (500, 'img/products/giuong_500.jpg');
INSERT INTO `images` VALUES (501, 'img/products/giuong_501.jpg');
INSERT INTO `images` VALUES (502, 'img/products/giuong_502.jpg');
INSERT INTO `images` VALUES (503, 'img/products/giuong_503.jpg');
INSERT INTO `images` VALUES (504, 'img/products/giuong_504.jpg');
INSERT INTO `images` VALUES (505, 'img/products/giuong_505.jpg');
INSERT INTO `images` VALUES (506, 'img/products/giuong_506.jpg');
INSERT INTO `images` VALUES (507, 'img/products/giuong_507.jpg');
INSERT INTO `images` VALUES (508, 'img/products/giuong_508.jpg');
INSERT INTO `images` VALUES (509, 'img/products/giuong_509.jpg');
INSERT INTO `images` VALUES (510, 'img/products/giuong_510.jpg');
INSERT INTO `images` VALUES (511, 'img/products/giuong_511.jpg');
INSERT INTO `images` VALUES (512, 'img/products/giuong_512.jpg');
INSERT INTO `images` VALUES (513, 'img/products/giuong_513.jpg');
INSERT INTO `images` VALUES (514, 'img/products/giuong_514.jpg');
INSERT INTO `images` VALUES (515, 'img/products/giuong_515.jpg');
INSERT INTO `images` VALUES (516, 'img/products/giuong_516.jpg');
INSERT INTO `images` VALUES (517, 'img/products/giuong_517.jpg');
INSERT INTO `images` VALUES (518, 'img/products/giuong_518.jpg');
INSERT INTO `images` VALUES (519, 'img/products/giuong_519.jpg');
INSERT INTO `images` VALUES (520, 'img/products/giuong_520.jpg');
INSERT INTO `images` VALUES (521, 'img/products/giuong_521.jpg');
INSERT INTO `images` VALUES (522, 'img/products/giuong_522.jpg');
INSERT INTO `images` VALUES (523, 'img/products/giuong_523.jpg');
INSERT INTO `images` VALUES (524, 'img/products/giuong_524.jpg');
INSERT INTO `images` VALUES (525, 'img/products/giuong_525.jpg');
INSERT INTO `images` VALUES (526, 'img/products/giuong_526.jpg');
INSERT INTO `images` VALUES (527, 'img/products/giuong_527.jpg');
INSERT INTO `images` VALUES (528, 'img/products/giuong_528.jpg');
INSERT INTO `images` VALUES (529, 'img/products/giuong_529.jpg');
INSERT INTO `images` VALUES (530, 'img/products/giuong_530.jpg');
INSERT INTO `images` VALUES (531, 'img/products/giuong_531.jpg');
INSERT INTO `images` VALUES (532, 'img/products/giuong_532.jpg');
INSERT INTO `images` VALUES (533, 'img/products/giuong_533.jpg');
INSERT INTO `images` VALUES (534, 'img/products/giuong_534.jpg');
INSERT INTO `images` VALUES (535, 'img/products/giuong_535.jpg');
INSERT INTO `images` VALUES (536, 'img/products/giuong_536.jpg');
INSERT INTO `images` VALUES (537, 'img/products/giuong_537.jpg');
INSERT INTO `images` VALUES (538, 'img/products/giuong_538.jpg');
INSERT INTO `images` VALUES (539, 'img/products/giuong_539.jpg');
INSERT INTO `images` VALUES (540, 'img/products/giuong_540.jpg');
INSERT INTO `images` VALUES (541, 'img/products/giuong_541.jpg');
INSERT INTO `images` VALUES (542, 'img/products/giuong_542.jpg');
INSERT INTO `images` VALUES (543, 'img/products/giuong_543.jpg');
INSERT INTO `images` VALUES (544, 'img/products/giuong_544.jpg');
INSERT INTO `images` VALUES (545, 'img/products/giuong_545.jpg');
INSERT INTO `images` VALUES (546, 'img/products/giuong_546.jpg');
INSERT INTO `images` VALUES (547, 'img/products/giuong_547.jpg');
INSERT INTO `images` VALUES (548, 'img/products/giuong_548.jpg');
INSERT INTO `images` VALUES (549, 'img/products/giuong_549.jpg');
INSERT INTO `images` VALUES (550, 'img/products/giuong_550.jpg');
INSERT INTO `images` VALUES (551, 'img/products/giuong_551.jpg');
INSERT INTO `images` VALUES (552, 'img/products/giuong_552.jpg');
INSERT INTO `images` VALUES (553, 'img/products/giuong_553.jpg');
INSERT INTO `images` VALUES (554, 'img/products/giuong_554.jpg');
INSERT INTO `images` VALUES (555, 'img/products/giuong_555.jpg');
INSERT INTO `images` VALUES (556, 'img/products/giuong_556.jpg');
INSERT INTO `images` VALUES (557, 'img/products/giuong_557.jpg');
INSERT INTO `images` VALUES (558, 'img/products/giuong_558.jpg');
INSERT INTO `images` VALUES (559, 'img/products/giuong_559.jpg');
INSERT INTO `images` VALUES (560, 'img/products/giuong_560.jpg');
INSERT INTO `images` VALUES (561, 'img/products/giuong_561.jpg');
INSERT INTO `images` VALUES (562, 'img/products/giuong_562.jpg');
INSERT INTO `images` VALUES (563, 'img/products/giuong_563.jpg');
INSERT INTO `images` VALUES (564, 'img/products/giuong_564.jpg');
INSERT INTO `images` VALUES (565, 'img/products/giuong_565.jpg');
INSERT INTO `images` VALUES (566, 'img/products/giuong_566.jpg');
INSERT INTO `images` VALUES (567, 'img/products/giuong_567.jpg');
INSERT INTO `images` VALUES (568, 'img/products/giuong_568.jpg');
INSERT INTO `images` VALUES (569, 'img/products/giuong_569.jpg');
INSERT INTO `images` VALUES (570, 'img/products/giuong_570.jpg');
INSERT INTO `images` VALUES (571, 'img/products/giuong_571.jpg');
INSERT INTO `images` VALUES (572, 'img/products/giuong_572.jpg');
INSERT INTO `images` VALUES (573, 'img/products/giuong_573.jpg');
INSERT INTO `images` VALUES (574, 'img/products/giuong_574.jpg');
INSERT INTO `images` VALUES (575, 'img/products/giuong_575.jpg');
INSERT INTO `images` VALUES (576, 'img/products/giuong_576.jpg');
INSERT INTO `images` VALUES (577, 'img/products/giuong_577.jpg');
INSERT INTO `images` VALUES (578, 'img/products/giuong_578.jpg');
INSERT INTO `images` VALUES (579, 'img/products/giuong_579.jpg');
INSERT INTO `images` VALUES (580, 'img/products/giuong_580.jpg');
INSERT INTO `images` VALUES (581, 'img/products/giuong_581.jpg');
INSERT INTO `images` VALUES (582, 'img/products/giuong_582.jpg');
INSERT INTO `images` VALUES (583, 'img/products/giuong_583.jpg');
INSERT INTO `images` VALUES (584, 'img/products/giuong_584.jpg');
INSERT INTO `images` VALUES (585, 'img/products/giuong_585.jpg');
INSERT INTO `images` VALUES (586, 'img/products/giuong_586.jpg');
INSERT INTO `images` VALUES (587, 'img/products/giuong_587.jpg');
INSERT INTO `images` VALUES (588, 'img/products/giuong_588.jpg');
INSERT INTO `images` VALUES (589, 'img/products/giuong_589.jpg');
INSERT INTO `images` VALUES (590, 'img/products/giuong_590.jpg');
INSERT INTO `images` VALUES (591, 'img/products/giuong_591.jpg');
INSERT INTO `images` VALUES (592, 'img/products/giuong_592.jpg');
INSERT INTO `images` VALUES (593, 'img/products/giuong_593.jpg');
INSERT INTO `images` VALUES (594, 'img/products/giuong_594.jpg');
INSERT INTO `images` VALUES (595, 'img/products/giuong_595.jpg');
INSERT INTO `images` VALUES (596, 'img/products/giuong_596.jpg');
INSERT INTO `images` VALUES (597, 'img/products/giuong_597.jpg');
INSERT INTO `images` VALUES (598, 'img/products/giuong_598.jpg');
INSERT INTO `images` VALUES (599, 'img/products/giuong_599.jpg');
INSERT INTO `images` VALUES (600, 'img/products/giuong_600.jpg');
INSERT INTO `images` VALUES (601, 'img/products/tu_ke_601.jpg');
INSERT INTO `images` VALUES (602, 'img/products/tu_ke_602.jpg');
INSERT INTO `images` VALUES (603, 'img/products/tu_ke_603.jpg');
INSERT INTO `images` VALUES (604, 'img/products/tu_ke_604.jpg');
INSERT INTO `images` VALUES (605, 'img/products/tu_ke_605.jpg');
INSERT INTO `images` VALUES (606, 'img/products/tu_ke_606.jpg');
INSERT INTO `images` VALUES (607, 'img/products/tu_ke_607.jpg');
INSERT INTO `images` VALUES (608, 'img/products/tu_ke_608.jpg');
INSERT INTO `images` VALUES (609, 'img/products/tu_ke_609.jpg');
INSERT INTO `images` VALUES (610, 'img/products/tu_ke_610.jpg');
INSERT INTO `images` VALUES (611, 'img/products/tu_ke_611.jpg');
INSERT INTO `images` VALUES (612, 'img/products/tu_ke_612.jpg');
INSERT INTO `images` VALUES (613, 'img/products/tu_ke_613.jpg');
INSERT INTO `images` VALUES (614, 'img/products/tu_ke_614.jpg');
INSERT INTO `images` VALUES (615, 'img/products/tu_ke_615.jpg');
INSERT INTO `images` VALUES (616, 'img/products/tu_ke_616.jpg');
INSERT INTO `images` VALUES (617, 'img/products/tu_ke_617.jpg');
INSERT INTO `images` VALUES (618, 'img/products/tu_ke_618.jpg');
INSERT INTO `images` VALUES (619, 'img/products/tu_ke_619.jpg');
INSERT INTO `images` VALUES (620, 'img/products/tu_ke_620.jpg');
INSERT INTO `images` VALUES (621, 'img/products/tu_ke_621.jpg');
INSERT INTO `images` VALUES (622, 'img/products/tu_ke_622.jpg');
INSERT INTO `images` VALUES (623, 'img/products/tu_ke_623.jpg');
INSERT INTO `images` VALUES (624, 'img/products/tu_ke_624.jpg');
INSERT INTO `images` VALUES (625, 'img/products/tu_ke_625.jpg');
INSERT INTO `images` VALUES (626, 'img/products/tu_ke_626.jpg');
INSERT INTO `images` VALUES (627, 'img/products/tu_ke_627.jpg');
INSERT INTO `images` VALUES (628, 'img/products/tu_ke_628.jpg');
INSERT INTO `images` VALUES (629, 'img/products/tu_ke_629.jpg');
INSERT INTO `images` VALUES (630, 'img/products/tu_ke_630.jpg');
INSERT INTO `images` VALUES (631, 'img/products/tu_ke_631.jpg');
INSERT INTO `images` VALUES (632, 'img/products/tu_ke_632.jpg');
INSERT INTO `images` VALUES (633, 'img/products/tu_ke_633.jpg');
INSERT INTO `images` VALUES (634, 'img/products/tu_ke_634.jpg');
INSERT INTO `images` VALUES (635, 'img/products/tu_ke_635.jpg');
INSERT INTO `images` VALUES (636, 'img/products/tu_ke_636.jpg');
INSERT INTO `images` VALUES (637, 'img/products/tu_ke_637.jpg');
INSERT INTO `images` VALUES (638, 'img/products/tu_ke_638.jpg');
INSERT INTO `images` VALUES (639, 'img/products/tu_ke_639.jpg');
INSERT INTO `images` VALUES (640, 'img/products/tu_ke_640.jpg');
INSERT INTO `images` VALUES (641, 'img/products/tu_ke_641.jpg');
INSERT INTO `images` VALUES (642, 'img/products/tu_ke_642.jpg');
INSERT INTO `images` VALUES (643, 'img/products/tu_ke_643.jpg');
INSERT INTO `images` VALUES (644, 'img/products/tu_ke_644.jpg');
INSERT INTO `images` VALUES (645, 'img/products/tu_ke_645.jpg');
INSERT INTO `images` VALUES (646, 'img/products/tu_ke_646.jpg');
INSERT INTO `images` VALUES (647, 'img/products/tu_ke_647.jpg');
INSERT INTO `images` VALUES (648, 'img/products/tu_ke_648.jpg');
INSERT INTO `images` VALUES (649, 'img/products/tu_ke_649.jpg');
INSERT INTO `images` VALUES (650, 'img/products/tu_ke_650.jpg');
INSERT INTO `images` VALUES (651, 'img/products/tu_ke_651.jpg');
INSERT INTO `images` VALUES (652, 'img/products/tu_ke_652.jpg');
INSERT INTO `images` VALUES (653, 'img/products/tu_ke_653.jpg');
INSERT INTO `images` VALUES (654, 'img/products/tu_ke_654.jpg');
INSERT INTO `images` VALUES (655, 'img/products/tu_ke_655.jpg');
INSERT INTO `images` VALUES (656, 'img/products/tu_ke_656.jpg');
INSERT INTO `images` VALUES (657, 'img/products/tu_ke_657.jpg');
INSERT INTO `images` VALUES (658, 'img/products/tu_ke_658.jpg');
INSERT INTO `images` VALUES (659, 'img/products/tu_ke_659.jpg');
INSERT INTO `images` VALUES (660, 'img/products/tu_ke_660.jpg');
INSERT INTO `images` VALUES (661, 'img/products/tu_ke_661.jpg');
INSERT INTO `images` VALUES (662, 'img/products/tu_ke_662.jpg');
INSERT INTO `images` VALUES (663, 'img/products/tu_ke_663.jpg');
INSERT INTO `images` VALUES (664, 'img/products/tu_ke_664.jpg');
INSERT INTO `images` VALUES (665, 'img/products/tu_ke_665.jpg');
INSERT INTO `images` VALUES (666, 'img/products/tu_ke_666.jpg');
INSERT INTO `images` VALUES (667, 'img/products/tu_ke_667.jpg');
INSERT INTO `images` VALUES (668, 'img/products/tu_ke_668.jpg');
INSERT INTO `images` VALUES (669, 'img/products/tu_ke_669.jpg');
INSERT INTO `images` VALUES (670, 'img/products/tu_ke_670.jpg');
INSERT INTO `images` VALUES (671, 'img/products/tu_ke_671.jpg');
INSERT INTO `images` VALUES (672, 'img/products/tu_ke_672.jpg');
INSERT INTO `images` VALUES (673, 'img/products/tu_ke_673.jpg');
INSERT INTO `images` VALUES (674, 'img/products/tu_ke_674.jpg');
INSERT INTO `images` VALUES (675, 'img/products/tu_ke_675.jpg');
INSERT INTO `images` VALUES (676, 'img/products/tu_ke_676.jpg');
INSERT INTO `images` VALUES (677, 'img/products/tu_ke_677.jpg');
INSERT INTO `images` VALUES (678, 'img/products/tu_ke_678.jpg');
INSERT INTO `images` VALUES (679, 'img/products/tu_ke_679.jpg');
INSERT INTO `images` VALUES (680, 'img/products/tu_ke_680.jpg');
INSERT INTO `images` VALUES (681, 'img/products/tu_ke_681.jpg');
INSERT INTO `images` VALUES (682, 'img/products/tu_ke_682.jpg');
INSERT INTO `images` VALUES (683, 'img/products/tu_ke_683.jpg');
INSERT INTO `images` VALUES (684, 'img/products/tu_ke_684.jpg');
INSERT INTO `images` VALUES (685, 'img/products/tu_ke_685.jpg');
INSERT INTO `images` VALUES (686, 'img/products/tu_ke_686.jpg');
INSERT INTO `images` VALUES (687, 'img/products/tu_ke_687.jpg');
INSERT INTO `images` VALUES (688, 'img/products/tu_ke_688.jpg');
INSERT INTO `images` VALUES (689, 'img/products/tu_ke_689.jpg');
INSERT INTO `images` VALUES (690, 'img/products/tu_ke_690.jpg');
INSERT INTO `images` VALUES (691, 'img/products/tu_ke_691.jpg');
INSERT INTO `images` VALUES (692, 'img/products/tu_ke_692.jpg');
INSERT INTO `images` VALUES (693, 'img/products/tu_ke_693.jpg');
INSERT INTO `images` VALUES (694, 'img/products/tu_ke_694.jpg');
INSERT INTO `images` VALUES (695, 'img/products/tu_ke_695.jpg');
INSERT INTO `images` VALUES (696, 'img/products/tu_ke_696.jpg');
INSERT INTO `images` VALUES (697, 'img/products/tu_ke_697.jpg');
INSERT INTO `images` VALUES (698, 'img/products/tu_ke_698.jpg');
INSERT INTO `images` VALUES (699, 'img/products/tu_ke_699.jpg');
INSERT INTO `images` VALUES (700, 'img/products/tu_ke_700.jpg');
INSERT INTO `images` VALUES (701, 'img/products/tu_ke_701.jpg');
INSERT INTO `images` VALUES (702, 'img/products/tu_ke_702.jpg');
INSERT INTO `images` VALUES (703, 'img/products/tu_ke_703.jpg');
INSERT INTO `images` VALUES (704, 'img/products/tu_ke_704.jpg');
INSERT INTO `images` VALUES (705, 'img/products/tu_ke_705.jpg');
INSERT INTO `images` VALUES (706, 'img/products/tu_ke_706.jpg');
INSERT INTO `images` VALUES (707, 'img/products/tu_ke_707.jpg');
INSERT INTO `images` VALUES (708, 'img/products/tu_ke_708.jpg');
INSERT INTO `images` VALUES (709, 'img/products/tu_ke_709.jpg');
INSERT INTO `images` VALUES (710, 'img/products/tu_ke_710.jpg');
INSERT INTO `images` VALUES (711, 'img/products/tu_ke_711.jpg');
INSERT INTO `images` VALUES (712, 'img/products/tu_ke_712.jpg');
INSERT INTO `images` VALUES (713, 'img/products/tu_ke_713.jpg');
INSERT INTO `images` VALUES (714, 'img/products/tu_ke_714.jpg');
INSERT INTO `images` VALUES (715, 'img/products/tu_ke_715.jpg');
INSERT INTO `images` VALUES (716, 'img/products/tu_ke_716.jpg');
INSERT INTO `images` VALUES (717, 'img/products/tu_ke_717.jpg');
INSERT INTO `images` VALUES (718, 'img/products/tu_ke_718.jpg');
INSERT INTO `images` VALUES (719, 'img/products/tu_ke_719.jpg');
INSERT INTO `images` VALUES (720, 'img/products/tu_ke_720.jpg');
INSERT INTO `images` VALUES (721, 'img/products/tu_ke_721.jpg');
INSERT INTO `images` VALUES (722, 'img/products/tu_ke_722.jpg');
INSERT INTO `images` VALUES (723, 'img/products/tu_ke_723.jpg');
INSERT INTO `images` VALUES (724, 'img/products/tu_ke_724.jpg');
INSERT INTO `images` VALUES (725, 'img/products/tu_ke_725.jpg');
INSERT INTO `images` VALUES (726, 'img/products/tu_ke_726.jpg');
INSERT INTO `images` VALUES (727, 'img/products/tu_ke_727.jpg');
INSERT INTO `images` VALUES (728, 'img/products/tu_ke_728.jpg');
INSERT INTO `images` VALUES (729, 'img/products/tu_ke_729.jpg');
INSERT INTO `images` VALUES (730, 'img/products/tu_ke_730.jpg');
INSERT INTO `images` VALUES (731, 'img/products/tu_ke_731.jpg');
INSERT INTO `images` VALUES (732, 'img/products/tu_ke_732.jpg');
INSERT INTO `images` VALUES (733, 'img/products/tu_ke_733.jpg');
INSERT INTO `images` VALUES (734, 'img/products/tu_ke_734.jpg');
INSERT INTO `images` VALUES (735, 'img/products/tu_ke_735.jpg');
INSERT INTO `images` VALUES (736, 'img/products/tu_ke_736.jpg');
INSERT INTO `images` VALUES (737, 'img/products/tu_ke_737.jpg');
INSERT INTO `images` VALUES (738, 'img/products/tu_ke_738.jpg');
INSERT INTO `images` VALUES (739, 'img/products/tu_ke_739.jpg');
INSERT INTO `images` VALUES (740, 'img/products/tu_ke_740.jpg');
INSERT INTO `images` VALUES (741, 'img/products/tu_ke_741.jpg');
INSERT INTO `images` VALUES (742, 'img/products/tu_ke_742.jpg');
INSERT INTO `images` VALUES (743, 'img/products/tu_ke_743.jpg');
INSERT INTO `images` VALUES (744, 'img/products/tu_ke_744.jpg');
INSERT INTO `images` VALUES (745, 'img/products/tu_ke_745.jpg');
INSERT INTO `images` VALUES (746, 'img/products/tu_ke_746.jpg');
INSERT INTO `images` VALUES (747, 'img/products/tu_ke_747.jpg');
INSERT INTO `images` VALUES (748, 'img/products/tu_ke_748.jpg');
INSERT INTO `images` VALUES (749, 'img/products/tu_ke_749.jpg');
INSERT INTO `images` VALUES (750, 'img/products/tu_ke_750.jpg');
INSERT INTO `images` VALUES (751, 'img/products/tu_ke_751.jpg');
INSERT INTO `images` VALUES (752, 'img/products/tu_ke_752.jpg');
INSERT INTO `images` VALUES (753, 'img/products/tu_ke_753.jpg');
INSERT INTO `images` VALUES (754, 'img/products/tu_ke_754.jpg');
INSERT INTO `images` VALUES (755, 'img/products/tu_ke_755.jpg');
INSERT INTO `images` VALUES (756, 'img/products/tu_ke_756.jpg');
INSERT INTO `images` VALUES (757, 'img/products/tu_ke_757.jpg');
INSERT INTO `images` VALUES (758, 'img/products/tu_ke_758.jpg');
INSERT INTO `images` VALUES (759, 'img/products/tu_ke_759.jpg');
INSERT INTO `images` VALUES (760, 'img/products/tu_ke_760.jpg');
INSERT INTO `images` VALUES (761, 'img/products/tu_ke_761.jpg');
INSERT INTO `images` VALUES (762, 'img/products/tu_ke_762.jpg');
INSERT INTO `images` VALUES (763, 'img/products/tu_ke_763.jpg');
INSERT INTO `images` VALUES (764, 'img/products/tu_ke_764.jpg');
INSERT INTO `images` VALUES (765, 'img/products/tu_ke_765.jpg');
INSERT INTO `images` VALUES (766, 'img/products/tu_ke_766.jpg');
INSERT INTO `images` VALUES (767, 'img/products/tu_ke_767.jpg');
INSERT INTO `images` VALUES (768, 'img/products/tu_ke_768.jpg');
INSERT INTO `images` VALUES (769, 'img/products/tu_ke_769.jpg');
INSERT INTO `images` VALUES (770, 'img/products/tu_ke_770.jpg');
INSERT INTO `images` VALUES (771, 'img/products/tu_ke_771.jpg');
INSERT INTO `images` VALUES (772, 'img/products/tu_ke_772.jpg');
INSERT INTO `images` VALUES (773, 'img/products/tu_ke_773.jpg');
INSERT INTO `images` VALUES (774, 'img/products/tu_ke_774.jpg');
INSERT INTO `images` VALUES (775, 'img/products/tu_ke_775.jpg');
INSERT INTO `images` VALUES (776, 'img/products/tu_ke_776.jpg');
INSERT INTO `images` VALUES (777, 'img/products/tu_ke_777.jpg');
INSERT INTO `images` VALUES (778, 'img/products/tu_ke_778.jpg');
INSERT INTO `images` VALUES (779, 'img/products/tu_ke_779.jpg');
INSERT INTO `images` VALUES (780, 'img/products/tu_ke_780.jpg');
INSERT INTO `images` VALUES (781, 'img/products/tu_ke_781.jpg');
INSERT INTO `images` VALUES (782, 'img/products/tu_ke_782.jpg');
INSERT INTO `images` VALUES (783, 'img/products/tu_ke_783.jpg');
INSERT INTO `images` VALUES (784, 'img/products/tu_ke_784.jpg');
INSERT INTO `images` VALUES (785, 'img/products/tu_ke_785.jpg');
INSERT INTO `images` VALUES (786, 'img/products/tu_ke_786.jpg');
INSERT INTO `images` VALUES (787, 'img/products/tu_ke_787.jpg');
INSERT INTO `images` VALUES (788, 'img/products/tu_ke_788.jpg');
INSERT INTO `images` VALUES (789, 'img/products/tu_ke_789.jpg');
INSERT INTO `images` VALUES (790, 'img/products/tu_ke_790.jpg');
INSERT INTO `images` VALUES (791, 'img/products/tu_ke_791.jpg');
INSERT INTO `images` VALUES (792, 'img/products/tu_ke_792.jpg');
INSERT INTO `images` VALUES (793, 'img/products/tu_ke_793.jpg');
INSERT INTO `images` VALUES (794, 'img/products/tu_ke_794.jpg');
INSERT INTO `images` VALUES (795, 'img/products/tu_ke_795.jpg');
INSERT INTO `images` VALUES (796, 'img/products/tu_ke_796.jpg');
INSERT INTO `images` VALUES (797, 'img/products/tu_ke_797.jpg');
INSERT INTO `images` VALUES (798, 'img/products/tu_ke_798.jpg');
INSERT INTO `images` VALUES (799, 'img/products/tu_ke_799.jpg');
INSERT INTO `images` VALUES (800, 'img/products/tu_ke_800.jpg');
INSERT INTO `images` VALUES (801, 'img/products/tu_ke_801.jpg');
INSERT INTO `images` VALUES (802, 'img/products/tu_ke_802.jpg');
INSERT INTO `images` VALUES (803, 'img/products/tu_ke_803.jpg');
INSERT INTO `images` VALUES (804, 'img/products/tu_ke_804.jpg');
INSERT INTO `images` VALUES (805, 'img/products/tu_ke_805.jpg');
INSERT INTO `images` VALUES (806, 'img/products/tu_ke_806.jpg');
INSERT INTO `images` VALUES (807, 'img/products/tu_ke_807.jpg');
INSERT INTO `images` VALUES (808, 'img/products/tu_ke_808.jpg');
INSERT INTO `images` VALUES (809, 'img/products/tu_ke_809.jpg');
INSERT INTO `images` VALUES (810, 'img/products/tu_ke_810.jpg');
INSERT INTO `images` VALUES (811, 'img/products/tu_ke_811.jpg');
INSERT INTO `images` VALUES (812, 'img/products/tu_ke_812.jpg');
INSERT INTO `images` VALUES (813, 'img/products/tu_ke_813.jpg');
INSERT INTO `images` VALUES (814, 'img/products/tu_ke_814.jpg');
INSERT INTO `images` VALUES (815, 'img/products/tu_ke_815.jpg');
INSERT INTO `images` VALUES (816, 'img/products/tu_ke_816.jpg');
INSERT INTO `images` VALUES (817, 'img/products/tu_ke_817.jpg');
INSERT INTO `images` VALUES (818, 'img/products/tu_ke_818.jpg');
INSERT INTO `images` VALUES (819, 'img/products/tu_ke_819.jpg');
INSERT INTO `images` VALUES (820, 'img/products/tu_ke_820.jpg');
INSERT INTO `images` VALUES (821, 'img/products/tu_ke_821.jpg');
INSERT INTO `images` VALUES (822, 'img/products/tu_ke_822.jpg');
INSERT INTO `images` VALUES (823, 'img/products/tu_ke_823.jpg');
INSERT INTO `images` VALUES (824, 'img/products/tu_ke_824.jpg');
INSERT INTO `images` VALUES (825, 'img/products/tu_ke_825.jpg');
INSERT INTO `images` VALUES (826, 'img/products/tu_ke_826.jpg');
INSERT INTO `images` VALUES (827, 'img/products/tu_ke_827.jpg');
INSERT INTO `images` VALUES (828, 'img/products/tu_ke_828.jpg');
INSERT INTO `images` VALUES (829, 'img/products/tu_ke_829.jpg');
INSERT INTO `images` VALUES (830, 'img/products/tu_ke_830.jpg');
INSERT INTO `images` VALUES (831, 'img/products/tu_ke_831.jpg');
INSERT INTO `images` VALUES (832, 'img/products/tu_ke_832.jpg');
INSERT INTO `images` VALUES (833, 'img/products/tu_ke_833.jpg');
INSERT INTO `images` VALUES (834, 'img/products/tu_ke_834.jpg');
INSERT INTO `images` VALUES (835, 'img/products/tu_ke_835.jpg');
INSERT INTO `images` VALUES (836, 'img/products/tu_ke_836.jpg');
INSERT INTO `images` VALUES (837, 'img/products/tu_ke_837.jpg');
INSERT INTO `images` VALUES (838, 'img/products/tu_ke_838.jpg');
INSERT INTO `images` VALUES (839, 'img/products/tu_ke_839.jpg');
INSERT INTO `images` VALUES (840, 'img/products/tu_ke_840.jpg');
INSERT INTO `images` VALUES (841, 'img/products/tu_ke_841.jpg');
INSERT INTO `images` VALUES (842, 'img/products/tu_ke_842.jpg');
INSERT INTO `images` VALUES (843, 'img/products/tu_ke_843.jpg');
INSERT INTO `images` VALUES (844, 'img/products/tu_ke_844.jpg');
INSERT INTO `images` VALUES (845, 'img/products/tu_ke_845.jpg');
INSERT INTO `images` VALUES (846, 'img/products/tu_ke_846.jpg');
INSERT INTO `images` VALUES (847, 'img/products/tu_ke_847.jpg');
INSERT INTO `images` VALUES (848, 'img/products/tu_ke_848.jpg');
INSERT INTO `images` VALUES (849, 'img/products/tu_ke_849.jpg');
INSERT INTO `images` VALUES (850, 'img/products/tu_ke_850.jpg');
INSERT INTO `images` VALUES (851, 'img/products/tu_ke_851.jpg');
INSERT INTO `images` VALUES (852, 'img/products/tu_ke_852.jpg');
INSERT INTO `images` VALUES (853, 'img/products/tu_ke_853.jpg');
INSERT INTO `images` VALUES (854, 'img/products/tu_ke_854.jpg');
INSERT INTO `images` VALUES (855, 'img/products/tu_ke_855.jpg');
INSERT INTO `images` VALUES (856, 'img/products/tu_ke_856.jpg');
INSERT INTO `images` VALUES (857, 'img/products/tu_ke_857.jpg');
INSERT INTO `images` VALUES (858, 'img/products/tu_ke_858.jpg');
INSERT INTO `images` VALUES (859, 'img/products/tu_ke_859.jpg');
INSERT INTO `images` VALUES (860, 'img/products/tu_ke_860.jpg');
INSERT INTO `images` VALUES (861, 'img/products/tu_ke_861.jpg');
INSERT INTO `images` VALUES (862, 'img/products/tu_ke_862.jpg');
INSERT INTO `images` VALUES (863, 'img/products/tu_ke_863.jpg');
INSERT INTO `images` VALUES (864, 'img/products/tu_ke_864.jpg');
INSERT INTO `images` VALUES (865, 'img/products/tu_ke_865.jpg');
INSERT INTO `images` VALUES (866, 'img/products/tu_ke_866.jpg');
INSERT INTO `images` VALUES (867, 'img/products/tu_ke_867.jpg');
INSERT INTO `images` VALUES (868, 'img/products/tu_ke_868.jpg');
INSERT INTO `images` VALUES (869, 'img/products/tu_ke_869.jpg');
INSERT INTO `images` VALUES (870, 'img/products/tu_ke_870.jpg');
INSERT INTO `images` VALUES (871, 'img/products/tu_ke_871.jpg');
INSERT INTO `images` VALUES (872, 'img/products/tu_ke_872.jpg');
INSERT INTO `images` VALUES (873, 'img/products/tu_ke_873.jpg');
INSERT INTO `images` VALUES (874, 'img/products/tu_ke_874.jpg');
INSERT INTO `images` VALUES (875, 'img/products/tu_ke_875.jpg');
INSERT INTO `images` VALUES (876, 'img/products/tu_ke_876.jpg');
INSERT INTO `images` VALUES (877, 'img/products/tu_ke_877.jpg');
INSERT INTO `images` VALUES (878, 'img/products/tu_ke_878.jpg');
INSERT INTO `images` VALUES (879, 'img/products/tu_ke_879.jpg');
INSERT INTO `images` VALUES (880, 'img/products/tu_ke_880.jpg');
INSERT INTO `images` VALUES (881, 'img/products/tu_ke_881.jpg');
INSERT INTO `images` VALUES (882, 'img/products/tu_ke_882.jpg');
INSERT INTO `images` VALUES (883, 'img/products/tu_ke_883.jpg');
INSERT INTO `images` VALUES (884, 'img/products/tu_ke_884.jpg');
INSERT INTO `images` VALUES (885, 'img/products/tu_ke_885.jpg');
INSERT INTO `images` VALUES (886, 'img/products/tu_ke_886.jpg');
INSERT INTO `images` VALUES (887, 'img/products/tu_ke_887.jpg');
INSERT INTO `images` VALUES (888, 'img/products/tu_ke_888.jpg');
INSERT INTO `images` VALUES (889, 'img/products/tu_ke_889.jpg');
INSERT INTO `images` VALUES (890, 'img/products/tu_ke_890.jpg');
INSERT INTO `images` VALUES (891, 'img/products/tu_ke_891.jpg');
INSERT INTO `images` VALUES (892, 'img/products/tu_ke_892.jpg');
INSERT INTO `images` VALUES (893, 'img/products/tu_ke_893.jpg');
INSERT INTO `images` VALUES (894, 'img/products/tu_ke_894.jpg');
INSERT INTO `images` VALUES (895, 'img/products/tu_ke_895.jpg');
INSERT INTO `images` VALUES (896, 'img/products/tu_ke_896.jpg');
INSERT INTO `images` VALUES (897, 'img/products/tu_ke_897.jpg');
INSERT INTO `images` VALUES (898, 'img/products/tu_ke_898.jpg');
INSERT INTO `images` VALUES (899, 'img/products/tu_ke_899.jpg');
INSERT INTO `images` VALUES (900, 'img/products/tu_ke_900.jpg');
INSERT INTO `images` VALUES (901, 'img/products/qua_901.jpg');
INSERT INTO `images` VALUES (902, 'img/products/qua_902.jpg');
INSERT INTO `images` VALUES (903, 'img/products/qua_903.jpg');
INSERT INTO `images` VALUES (904, 'img/products/qua_904.jpg');
INSERT INTO `images` VALUES (905, 'img/products/qua_905.jpg');
INSERT INTO `images` VALUES (906, 'img/products/qua_906.jpg');
INSERT INTO `images` VALUES (907, 'img/products/qua_907.jpg');
INSERT INTO `images` VALUES (908, 'img/products/qua_908.jpg');
INSERT INTO `images` VALUES (909, 'img/products/qua_909.jpg');
INSERT INTO `images` VALUES (910, 'img/products/qua_910.jpg');
INSERT INTO `images` VALUES (911, 'img/products/qua_911.jpg');
INSERT INTO `images` VALUES (912, 'img/products/qua_912.jpg');
INSERT INTO `images` VALUES (913, 'img/products/qua_913.jpg');
INSERT INTO `images` VALUES (914, 'img/products/qua_914.jpg');
INSERT INTO `images` VALUES (915, 'img/products/qua_915.jpg');
INSERT INTO `images` VALUES (916, 'img/products/qua_916.jpg');
INSERT INTO `images` VALUES (917, 'img/products/qua_917.jpg');
INSERT INTO `images` VALUES (918, 'img/products/qua_918.jpg');
INSERT INTO `images` VALUES (919, 'img/products/qua_919.jpg');
INSERT INTO `images` VALUES (920, 'img/products/qua_920.jpg');
INSERT INTO `images` VALUES (921, 'img/products/qua_921.jpg');
INSERT INTO `images` VALUES (922, 'img/products/qua_922.jpg');
INSERT INTO `images` VALUES (923, 'img/products/qua_923.jpg');
INSERT INTO `images` VALUES (924, 'img/products/qua_924.jpg');
INSERT INTO `images` VALUES (925, 'img/products/qua_925.jpg');
INSERT INTO `images` VALUES (926, 'img/products/qua_926.jpg');
INSERT INTO `images` VALUES (927, 'img/products/qua_927.jpg');
INSERT INTO `images` VALUES (928, 'img/products/qua_928.jpg');
INSERT INTO `images` VALUES (929, 'img/products/qua_929.jpg');
INSERT INTO `images` VALUES (930, 'img/products/qua_930.jpg');
INSERT INTO `images` VALUES (931, 'img/products/qua_931.jpg');
INSERT INTO `images` VALUES (932, 'img/products/qua_932.jpg');
INSERT INTO `images` VALUES (933, 'img/products/qua_933.jpg');
INSERT INTO `images` VALUES (934, 'img/products/qua_934.jpg');
INSERT INTO `images` VALUES (935, 'img/products/qua_935.jpg');
INSERT INTO `images` VALUES (936, 'img/products/qua_936.jpg');
INSERT INTO `images` VALUES (937, 'img/products/qua_937.jpg');
INSERT INTO `images` VALUES (938, 'img/products/qua_938.jpg');
INSERT INTO `images` VALUES (939, 'img/products/qua_939.jpg');
INSERT INTO `images` VALUES (940, 'img/products/qua_940.jpg');
INSERT INTO `images` VALUES (941, 'img/products/qua_941.jpg');
INSERT INTO `images` VALUES (942, 'img/products/qua_942.jpg');
INSERT INTO `images` VALUES (943, 'img/products/qua_943.jpg');
INSERT INTO `images` VALUES (944, 'img/products/qua_944.jpg');
INSERT INTO `images` VALUES (945, 'img/products/qua_945.jpg');
INSERT INTO `images` VALUES (946, 'img/products/qua_946.jpg');
INSERT INTO `images` VALUES (947, 'img/products/qua_947.jpg');
INSERT INTO `images` VALUES (948, 'img/products/qua_948.jpg');
INSERT INTO `images` VALUES (949, 'img/products/qua_949.jpg');
INSERT INTO `images` VALUES (950, 'img/products/qua_950.jpg');
INSERT INTO `images` VALUES (951, 'img/products/qua_951.jpg');
INSERT INTO `images` VALUES (952, 'img/products/qua_952.jpg');
INSERT INTO `images` VALUES (953, 'img/products/qua_953.jpg');
INSERT INTO `images` VALUES (954, 'img/products/qua_954.jpg');
INSERT INTO `images` VALUES (955, 'img/products/qua_955.jpg');
INSERT INTO `images` VALUES (956, 'img/products/qua_956.jpg');
INSERT INTO `images` VALUES (957, 'img/products/qua_957.jpg');
INSERT INTO `images` VALUES (958, 'img/products/qua_958.jpg');
INSERT INTO `images` VALUES (959, 'img/products/qua_959.jpg');
INSERT INTO `images` VALUES (960, 'img/products/qua_960.jpg');
INSERT INTO `images` VALUES (961, 'img/products/qua_961.jpg');
INSERT INTO `images` VALUES (962, 'img/products/qua_962.jpg');
INSERT INTO `images` VALUES (963, 'img/products/qua_963.jpg');
INSERT INTO `images` VALUES (964, 'img/products/qua_964.jpg');
INSERT INTO `images` VALUES (965, 'img/products/qua_965.jpg');
INSERT INTO `images` VALUES (966, 'img/products/qua_966.jpg');
INSERT INTO `images` VALUES (967, 'img/products/qua_967.jpg');
INSERT INTO `images` VALUES (968, 'img/products/qua_968.jpg');
INSERT INTO `images` VALUES (969, 'img/products/qua_969.jpg');
INSERT INTO `images` VALUES (970, 'img/products/qua_970.jpg');
INSERT INTO `images` VALUES (971, 'img/products/qua_971.jpg');
INSERT INTO `images` VALUES (972, 'img/products/qua_972.jpg');
INSERT INTO `images` VALUES (973, 'img/products/qua_973.jpg');
INSERT INTO `images` VALUES (974, 'img/products/qua_974.jpg');
INSERT INTO `images` VALUES (975, 'img/products/qua_975.jpg');
INSERT INTO `images` VALUES (976, 'img/products/qua_976.jpg');
INSERT INTO `images` VALUES (977, 'img/products/qua_977.jpg');
INSERT INTO `images` VALUES (978, 'img/products/qua_978.jpg');
INSERT INTO `images` VALUES (979, 'img/products/qua_979.jpg');
INSERT INTO `images` VALUES (980, 'img/products/qua_980.jpg');
INSERT INTO `images` VALUES (981, 'img/products/qua_981.jpg');
INSERT INTO `images` VALUES (982, 'img/products/qua_982.jpg');
INSERT INTO `images` VALUES (983, 'img/products/qua_983.jpg');
INSERT INTO `images` VALUES (984, 'img/products/qua_984.jpg');
INSERT INTO `images` VALUES (985, 'img/products/qua_985.jpg');
INSERT INTO `images` VALUES (986, 'img/products/mini_986.jpg');
INSERT INTO `images` VALUES (987, 'img/products/mini_987.jpg');
INSERT INTO `images` VALUES (988, 'img/products/mini_988.jpg');
INSERT INTO `images` VALUES (989, 'img/products/mini_989.jpg');
INSERT INTO `images` VALUES (990, 'img/products/mini_990.jpg');
INSERT INTO `images` VALUES (991, 'img/products/mini_991.jpg');
INSERT INTO `images` VALUES (992, 'img/products/mini_992.jpg');
INSERT INTO `images` VALUES (993, 'img/products/mini_993.jpg');
INSERT INTO `images` VALUES (994, 'img/products/mini_994.jpg');
INSERT INTO `images` VALUES (995, 'img/products/mini_995.jpg');
INSERT INTO `images` VALUES (996, 'img/products/mini_996.jpg');
INSERT INTO `images` VALUES (997, 'img/products/mini_997.jpg');
INSERT INTO `images` VALUES (998, 'img/products/mini_998.jpg');
INSERT INTO `images` VALUES (999, 'img/products/mini_999.jpg');
INSERT INTO `images` VALUES (1000, 'img/products/mini_1000.jpg');
INSERT INTO `images` VALUES (1001, '/webBanSanPhamGoTrangTri_war_exploded/img/products/images/anhnen.jpg');
INSERT INTO `images` VALUES (1002, '/webBanSanPhamGoTrangTri_war_exploded/img/products/images/ll.png');
INSERT INTO `images` VALUES (1003, '/webBanSanPhamGoTrangTri_war_exploded/img/products/images/test(1).jpg');
INSERT INTO `images` VALUES (1004, '/webBanSanPhamGoTrangTri_war_exploded/img/products/images/test(2).jpg');
INSERT INTO `images` VALUES (1005, '/img/products/images/anhnen.jpg');
INSERT INTO `images` VALUES (1006, '/img/products/images/ll.png');
INSERT INTO `images` VALUES (1007, '/img/products/images/test(2).jpg');
INSERT INTO `images` VALUES (1008, '/img/products/images/test(3).jpg');
INSERT INTO `images` VALUES (1009, '/img/products/images/test(1).jpg');
INSERT INTO `images` VALUES (1010, '/webBanSanPhamGoTrangTri_war_exploded/img/products/images/products/test.jpg');
INSERT INTO `images` VALUES (1011, '/img/products/images/products/ll.png');
INSERT INTO `images` VALUES (1142, 'img/products/ban_ghe_1.png');
INSERT INTO `images` VALUES (1143, 'img/products/ban_ghe_2.png');
INSERT INTO `images` VALUES (1144, 'img/products/ban_ghe_3.png');
INSERT INTO `images` VALUES (1145, 'img/products/ban_ghe_4.png');
INSERT INTO `images` VALUES (1146, 'img/products/ban_ghe_5.png');
INSERT INTO `images` VALUES (1147, 'img/products/ban_ghe_1.png');
INSERT INTO `images` VALUES (1148, 'img/products/ban_ghe_2.png');
INSERT INTO `images` VALUES (1149, 'img/products/ban_ghe_3.png');
INSERT INTO `images` VALUES (1150, 'img/products/ban_ghe_4.png');
INSERT INTO `images` VALUES (1151, 'img/products/ban_ghe_5.png');
INSERT INTO `images` VALUES (1152, '/img/products/images/test.jpg');
INSERT INTO `images` VALUES (1153, 'll.png');
INSERT INTO `images` VALUES (1154, '/img/products/images/products/test.jpg');
INSERT INTO `images` VALUES (1155, '/img/products/images/products/ban_ghe_2.png');
INSERT INTO `images` VALUES (1156, '/img/products/images/ban_ghe_10.png');
INSERT INTO `images` VALUES (1157, '/img/products/images/ban_ghe_12.png');
INSERT INTO `images` VALUES (1158, 'ban_ghe_1.png');
INSERT INTO `images` VALUES (1159, 'ban_ghe_10.png');
INSERT INTO `images` VALUES (1160, 'ban_ghe_11.png');
INSERT INTO `images` VALUES (1161, 'ban_ghe_12.png');
INSERT INTO `images` VALUES (1162, 'ban_ghe_13.png');
INSERT INTO `images` VALUES (1163, '/img/products/images/ban_ghe_1.png');

-- ----------------------------
-- Table structure for informations
-- ----------------------------
DROP TABLE IF EXISTS `informations`;
CREATE TABLE `informations`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `material` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `guarantee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 213 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of informations
-- ----------------------------
INSERT INTO `informations` VALUES (1, 'Gỗ sồi tự nhiên + Veneer', 'Gỗ sồi tự nhiên, Màu Hạt dẻ', 'Bàn 1600x600x2000, Ghế 450x520x800 (kích thướt bàn có thể thay đổi)', '12 tháng');
INSERT INTO `informations` VALUES (2, 'Gỗ sồi tự nhiên phủ veneer sồi', 'Xám phối gỗ sồi, Nâu đen', '2200x2000x350 có thể tùy chình', '7 tháng');
INSERT INTO `informations` VALUES (3, '100% Gỗ sồi tự nhiên, phụ kiện Caryny', 'Màu Hạt dẻ, Vân gỗ Sồi', '1400x800x750 có thể tùy chỉnh kích thướt', '12 tháng');
INSERT INTO `informations` VALUES (4, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine, khung sắt sơn tĩnh điện, phụ kiện Caryny.', 'Tùy chọn màu sắc và vân gỗ theo sở thích cá nhân.', 'Mẫu 4 ghế (1200x700x750mm) hoặc mẫu 6 ghế (1300x800x750mm).', '12 tháng');
INSERT INTO `informations` VALUES (5, 'Gỗ sồi tự nhiên kết hợp veneer sồi, phụ kiện Caryny chính hãng', 'Tùy chọn màu sơn theo sở thích tại cửa hàng', 'Bàn: 1000x1000x753mm, Ghế: 485x430x820mm', '12 tháng');
INSERT INTO `informations` VALUES (6, 'Gỗ sồi tự nhiên kết hợp veneer sồi bền bỉ', 'Màu gỗ sồi tự nhiên ấm cúng', 'Bàn: 1100x1100x750mm / Ghế: 480x420x850mm', '12 tháng');
INSERT INTO `informations` VALUES (7, 'Gỗ sồi tự nhiên kết hợp veneer sồi, phụ kiện Caryny cao cấp', 'Tùy chọn màu sơn theo sở thích của khách hàng', '1300 x 800 x 740mm', '12 tháng');
INSERT INTO `informations` VALUES (8, 'Gỗ cao su tự nhiên, nệm ghế bọc simily cao cấp', 'Natural, Walnut, Mahogany', 'Bàn: 120x73x75cm, Ghế: 45x46x80cm', '12 tháng');
INSERT INTO `informations` VALUES (9, 'Gỗ sồi tự nhiên, veneer sồi, nệm bọc da, phụ kiện Caryny', 'Màu gỗ tự nhiên trang nhã', 'Bàn: 1400x800x760mm, Ghế: 480x520x850mm', '12 tháng');
INSERT INTO `informations` VALUES (10, 'Gỗ MDF lõi xanh chống ẩm, bề mặt phun sơn, gia công CNC', 'Đa dạng màu sắc tùy chọn (Trắng, Xám, Pastel...)', 'Tùy chỉnh theo yêu cầu (KT mẫu: 1200x700x750mm)', '12 tháng');
INSERT INTO `informations` VALUES (11, 'Gỗ sồi tự nhiên, veneer sồi xử lý chống co ngót, mối mọt', 'Tùy chỉnh tone màu theo sở thích tại cửa hàng', '1300 x 900 x 750mm', '12 tháng');
INSERT INTO `informations` VALUES (12, 'Gỗ sồi, veneer sồi, MDF lõi xanh chống ẩm, nệm bọc da, phụ kiện Caryny', 'Tùy chọn màu sắc đa dạng theo yêu cầu', '1500 x 900 x 740mm', '12 tháng');
INSERT INTO `informations` VALUES (13, 'Gỗ sồi tự nhiên, veneer sồi, nệm mút bọc nỉ/da cao cấp, phụ kiện Caryny', 'Màu sồi tự nhiên PU, màu hạt dẻ hoặc tùy chọn theo yêu cầu', 'Bàn: 1400x700x750mm; Ghế: 450x450x850mm', '12 tháng');
INSERT INTO `informations` VALUES (14, 'Gỗ sồi tự nhiên, veneer sồi cao cấp, phụ kiện cam chốt chính xác', 'Bảng màu đa dạng (Sồi tự nhiên, Óc chó, Hạt dẻ, hoặc theo yêu cầu)', '1200-1600 x 800 x 750mm (Có thể tùy chỉnh kích thước)', '12 tháng');
INSERT INTO `informations` VALUES (15, 'Gỗ MDF lõi xanh chống ẩm cao cấp, sơn công nghệ cao không mùi', 'Trắng, vân gỗ hoặc tùy chọn tông màu theo yêu cầu', '1200 x 600 x 420mm (Kích thước mở rộng linh hoạt)', '12 tháng');
INSERT INTO `informations` VALUES (16, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine, chân sắt phun sơn tĩnh điện, phụ kiện Caryny', '12 tùy chọn màu sắc và vân gỗ tự nhiên tại cửa hàng', '1200 x 600 x 420mm (Có thể đặt kích thước riêng)', '12 tháng');
INSERT INTO `informations` VALUES (17, 'Gỗ sồi tự nhiên, phủ veneer sồi bền bỉ', 'Màu sồi tự nhiên, màu óc chó, hạt dẻ hoặc tùy chọn theo bảng màu Gỗ Trang Trí', '1200 x 300 x 800mm (Có thể tùy chỉnh kích thước)', '12 tháng');
INSERT INTO `informations` VALUES (18, 'Gỗ sồi tự nhiên, phủ veneer sồi cao cấp', 'Màu trầm cổ điển, màu cánh gián, hoặc tùy chọn theo bảng màu Gỗ Trang Trí', '1200 x 300 x 750mm (Có thể tùy chỉnh theo không gian)', '12 tháng');
INSERT INTO `informations` VALUES (19, 'Gỗ MDF lõi xanh chống ẩm cao cấp, bề mặt phun sơn mịn đẹp', 'Trắng, Xám ghi, Xanh Mint, hoặc màu sắc tùy chọn theo sở thích', '1200 x 600 x 450mm (Có thể tùy chỉnh kích thước theo yêu cầu)', '12 tháng');
INSERT INTO `informations` VALUES (20, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine, chân gỗ tự nhiên, ngăn kéo ray bi', 'Vân gỗ Sồi, Óc chó, Trắng hoặc tùy chọn tại cửa hàng', '1000 x 500 x 400mm và 1200 x 600 x 400mm', '12 tháng');
INSERT INTO `informations` VALUES (21, 'Gỗ sồi tự nhiên cao cấp, xử lý chống cong vênh mối mọt', 'Màu sồi tự nhiên, màu cánh gián, màu óc chó hoặc sơn bệt theo yêu cầu', '1200 x 600 x 460mm (Có thể tùy chỉnh theo không gian)', '12 tháng');
INSERT INTO `informations` VALUES (22, 'Gỗ MDF lõi xanh chống ẩm, chân bàn xoay 360 độ, phụ kiện thông minh', 'Trắng phối gỗ, Xám ghi, hoặc tùy chọn màu sắc theo yêu cầu', '1000-1400 x 500 x 400mm (Chiều dài thay đổi linh hoạt)', '12 tháng');
INSERT INTO `informations` VALUES (23, 'Mặt bàn MDF nhập khẩu dày 1.7cm, chân gỗ sồi tự nhiên cao cấp', 'Trắng, Đen, Vân gỗ Sồi, Vàng chanh', 'Cạnh 50cm, 60cm, 70cm - Cao 30-40cm', '12 tháng');
INSERT INTO `informations` VALUES (24, 'gỗ tự nhiên', 'màu tùy chỉnh', 'tùy chỉnh', '07 tháng');
INSERT INTO `informations` VALUES (25, 'Gỗ sồi tự nhiên cao cấp, gia công công nghệ cao', 'Sồi tự nhiên, Màu Óc chó', '1000 x 500 x 450mm và 1200 x 600 x 450mm', '12 tháng');
INSERT INTO `informations` VALUES (26, 'Gỗ MDF lõi xanh phủ melamine kết hợp gỗ sồi tự nhiên', 'Trắng, Vân gỗ Sồi, hoặc tùy chọn theo yêu cầu', 'Mẫu A: 50 x 50cm; Mẫu B: 80 x 38cm (Có thể tùy chỉnh)', '12 tháng');
INSERT INTO `informations` VALUES (27, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine vân gỗ kết hợp màu', 'Trắng phối gỗ, Vân gỗ Sồi, hoặc màu sắc tùy chọn', '1150 x 590 x 420mm (Có thể tùy chỉnh theo yêu cầu)', '12 tháng');
INSERT INTO `informations` VALUES (28, 'Gỗ sồi tự nhiên kết hợp veneer sồi, phụ kiện Ray bi giảm chấn Cariny', 'Màu sồi tự nhiên, Màu Óc chó, hoặc tùy chọn màu sơn tại cửa hàng', '1200 x 600 x 460mm (Tiêu chuẩn) hoặc 1000 x 500 x 420mm', '12 tháng');
INSERT INTO `informations` VALUES (29, 'Gỗ MDF lõi xanh chống ẩm dày 18ly phủ Melamine, chân inox đế cao su', 'Trắng phối gỗ, Vân gỗ Sồi, hoặc tùy chọn màu sắc theo yêu cầu', '1000 x 500 x 420mm và 1200 x 600 x 400mm', '12 tháng');
INSERT INTO `informations` VALUES (30, 'Gỗ sồi tự nhiên phủ veneer sồi cao cấp, gương LED hạt đậu, ghế đôn đi kèm', 'Màu óc chó, Màu sồi tự nhiên', '900x400x725mm và 1000x500x725mm (Tùy chỉnh theo yêu cầu)', '12 tháng');
INSERT INTO `informations` VALUES (31, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine, chân gỗ tự nhiên, phụ kiện Cariny', 'Trắng phối vân gỗ, Màu Sồi tự nhiên', 'Bàn 800x400x750mm kèm tủ đồ 540x400x600mm (Có tùy chỉnh size 1m1)', '12 tháng');
INSERT INTO `informations` VALUES (32, 'Gỗ MDF lõi xanh chống ẩm, chân gỗ tự nhiên chắc chắn', 'Vân gỗ Sồi, Màu Trắng, hoặc tùy chọn màu tại Gotrangtri', '1000 x 400 x 850mm (Tiêu chuẩn) và 890 x 400 x 750mm', '12 tháng');
INSERT INTO `informations` VALUES (33, 'Gỗ sồi tự nhiên phun sơn cao cấp, gương kính 650x650mm', 'Màu Sồi tự nhiên, Màu Trắng (tùy chọn 12 màu sơn)', 'Bàn 1000x450x1550mm và 1200x600x1550mm', '12 tháng');
INSERT INTO `informations` VALUES (34, 'Gỗ MDF lõi xanh phủ Melamine, khung và chân sắt sơn tĩnh điện, mặt kính cao cấp', 'Trắng, Vân gỗ Sồi (tùy chọn màu sắc tại Gotrangtri)', 'Bàn A: 600x400x785mm; Bàn B: 700x400x785mm; Tủ: 400x400x785mm', '12 tháng');
INSERT INTO `informations` VALUES (35, 'Gỗ MDF lõi xanh chống ẩm phun sơn, chân sắt sơn tĩnh điện mạ đồng', 'Trắng, Vân gỗ Sồi (Khách hàng có thể tùy chọn màu sắc)', 'Bàn 1000x400x800mm kèm tủ 360x400x640mm (Hỗ trợ bản 1200mm)', '12 tháng');
INSERT INTO `informations` VALUES (36, 'Gỗ sồi tự nhiên kết hợp Veneer sồi, phụ kiện Caryny, mặt kính trắng', 'Màu Sồi tự nhiên, Màu Trắng (Khách hàng tùy chọn tại cửa hàng)', '500x360x1400mm và 800x300x1800mm (Thiết kế đứng nhỏ gọn)', '12 tháng');
INSERT INTO `informations` VALUES (37, 'Gỗ MDF lõi xanh chống ẩm, chân gỗ tự nhiên phun sơn S8, phụ kiện Caryny', 'Trắng, Vân gỗ Sồi (và nhiều màu sắc tùy chọn: Đen, Đỏ, Hồng, Xanh...)', '780 x 450 x 1445mm và 1000 x 500 x 1445mm', '12 tháng');
INSERT INTO `informations` VALUES (38, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine, chân gỗ tự nhiên, phụ kiện Caryny', 'Trắng, Vân gỗ Sồi (Màu sắc BST Nắng hiện đại)', 'Bàn: 1000x450x750mm (Không gồm gương) và bản 890x400x750mm. Có kèm ghế.', '12 tháng');
INSERT INTO `informations` VALUES (39, 'Gỗ sồi tự nhiên 100% phun sơn cao cấp, kết cấu chắc chắn', 'Màu Sồi tự nhiên, Màu Trắng, hoặc tùy chọn màu sơn tại cửa hàng', '1360 x 460 x 760mm (Tiêu chuẩn) và bản 1200 x 450 x 760mm', '12 tháng');
INSERT INTO `informations` VALUES (40, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine, chân gỗ tự nhiên, gương và phụ kiện Caryny', 'Trắng phối vân gỗ, Màu Sồi tự nhiên', 'Bàn: 1000x400x800mm; Tủ: 500x400x600mm; Ghế: 350x250x360mm', '12 tháng');
INSERT INTO `informations` VALUES (41, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine, chân gỗ tự nhiên, phụ kiện Cariny chính hãng', 'Trắng phối vân gỗ, Màu Sồi tự nhiên (Khách hàng tùy chọn màu sắc)', '1170 x 400 x 1560mm và 1000 x 400 x 1560mm', '12 tháng');
INSERT INTO `informations` VALUES (42, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine, cánh mây đan thủ công, gương thường đi kèm', 'Màu Sồi tự nhiên, Màu Óc chó (Xem bảng màu Gotrangtri)', 'Bàn: 1000x400x716mm; Tủ phụ: 800x400x700mm (Có bản 1200mm)', '12 tháng');
INSERT INTO `informations` VALUES (43, 'Gỗ sồi tự nhiên phun sơn cao cấp, kết cấu hiện đại chắc chắn', 'Màu Sồi tự nhiên, Màu Trắng (Khách hàng tùy chọn trong 12 màu sơn)', '800 x 450 x 1550mm và 1000 x 450 x 1550mm', '12 tháng');
INSERT INTO `informations` VALUES (44, 'Gỗ sồi tự nhiên kết hợp Veneer sồi, ghế nệm bọc nỉ, gương cỡ lớn, phụ kiện Caryny', 'Màu Sồi tự nhiên, Màu Trắng (Tùy chọn 12 mẫu mặt gỗ tại Go Home)', 'Bàn: 1000x440x750mm; Ghế: 460x300x450mm; Gương: 930x600mm', '12 tháng');
INSERT INTO `informations` VALUES (45, 'Gỗ MDF lõi xanh phủ Melamine cao cấp, bề mặt chống trầy xước, không thấm nước', 'Vân gỗ Sồi, Màu Trắng (Khách hàng tùy chọn màu sắc tại Gotrangtri)', 'Bàn A: 500x400x1300mm; Bàn B: 600x400x1300mm; Ghế: 400x220x460mm', '12 tháng');
INSERT INTO `informations` VALUES (46, 'Gỗ MDF lõi xanh chống ẩm phun sơn cao cấp, gia công CNC sắc nét', 'Tùy chọn màu sắc theo bảng màu tại Gotrangtri', '1200x600x750mm; 1400x800x750mm; 1600x800x750mm', '12 months');
INSERT INTO `informations` VALUES (47, 'Gỗ công nghiệp MDF lõi xanh chống ẩm phủ Melamine vân gỗ kết hợp màu', 'Màu Sồi tự nhiên, Màu Trắng (Khách hàng tùy ý lựa chọn tại Gotrangtri)', '1000x500x750mm và 1200x600x750mm (Có hộc tủ ngăn kéo)', '12 tháng');
INSERT INTO `informations` VALUES (48, 'Gỗ công nghiệp MDF lõi xanh chống ẩm phủ Melamine cao cấp', 'Màu Sồi tự nhiên, Màu Trắng (Khách hàng tùy ý lựa chọn màu sắc tại cửa hàng)', '1400x600x1775mm (Tiêu chuẩn) và 1200x600x1775mm (Nhỏ gọn)', '12 tháng');
INSERT INTO `informations` VALUES (50, 'Gỗ công nghiệp MDF lõi xanh chống ẩm phủ Melamine vân gỗ kết hợp màu', 'Màu Sồi tự nhiên, Màu Trắng (Khách hàng tùy ý lựa chọn màu sắc và vân gỗ)', '1200x1000x750mm; 1200x1200x750mm; 1400x1000x750mm; 1400x1200x750mm', '12 tháng');
INSERT INTO `informations` VALUES (51, 'Gỗ công nghiệp MDF lõi xanh chống ẩm phủ Melamine màu cao cấp', 'Màu Trắng, Màu Sồi (Khách hàng tùy ý lựa chọn màu cho sản phẩm)', 'Mẫu A: 1000x820x1500mm; Mẫu B: 1200x820x1500mm', '12 tháng');
INSERT INTO `informations` VALUES (52, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine, phụ kiện Ray bi bản lề Caryny chính hãng', 'Vân gỗ Sồi, Vân gỗ Óc chó (Khách hàng tùy ý lựa chọn màu sắc)', '2200x1600x750mm và 2000x1600x750mm', '12 tháng');
INSERT INTO `informations` VALUES (53, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine, phụ kiện Ray bi bản lề giảm chấn Cariny chính hãng', 'Vân gỗ Sồi, Màu Trắng (Khách hàng tùy ý lựa chọn màu sắc, kiểu vân)', 'Mẫu A: 1400x600x750mm; Mẫu B: 1600x600x750mm; Mẫu C: 1800x600x750mm', '12 tháng');
INSERT INTO `informations` VALUES (54, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine, khung sắt phun sơn tĩnh điện, phụ kiện Caryny chính hãng', 'Vân gỗ Sồi, Màu Trắng (Khách hàng tùy chọn trong 12 kiểu vân gỗ)', '1100x450x750mm và 1000x450x750mm', '12 tháng');
INSERT INTO `informations` VALUES (55, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine, mặt bàn dày 36mm, chân sắt phun sơn tĩnh điện', 'Vân gỗ Sồi, Vân gỗ Óc chó (Khách hàng tùy chọn 12 mẫu vân gỗ tại cửa hàng)', '2200x600x750mm và 1800x600x750mm', '12 tháng');
INSERT INTO `informations` VALUES (56, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine, phụ kiện Ray bi bản lề giảm chấn Cariny chính hãng', 'Vân gỗ Sồi, Màu Trắng (Khách hàng tùy ý lựa chọn màu sắc, kiểu vân gỗ)', 'Bàn: 1200x600x750mm; Giá sách: 1000x240x1750mm', '12 tháng');
INSERT INTO `informations` VALUES (57, 'Gỗ sồi tự nhiên kết hợp Veneer sồi cao cấp, phụ kiện Ray bi bản lề Caryny chính hãng', 'Màu Sồi tự nhiên (Nhận sơn màu theo yêu cầu khách hàng)', '870x560x1280mm và 1000x560x1280mm', '12 tháng');
INSERT INTO `informations` VALUES (58, 'Gỗ công nghiệp MDF lõi xanh chống ẩm phủ Melamine màu cao cấp', 'Màu Trắng, Màu Sồi (Khách hàng tùy ý lựa chọn 12 mẫu màu tại cửa hàng)', 'Bàn: 900x600x760mm; Giá sách: 600x500x1800mm', '12 tháng');
INSERT INTO `informations` VALUES (59, 'Gỗ công nghiệp MDF lõi xanh chống ẩm phủ Melamine, xử lý cạnh và khoan liên kết bằng máy tự động', 'Màu sắc tươi sáng, Vân gỗ Sồi, Màu Trắng (Khách hàng tùy ý lựa chọn màu sắc)', '1200x600x1350mm và 1400x600x1350mm', '12 tháng');
INSERT INTO `informations` VALUES (60, 'Gỗ MDF lõi xanh chống ẩm phun sơn cao cấp, gia công CNC, xử lý cạnh tỉ mỉ', 'Màu Trắng sứ, Màu Kem thanh lịch (Khách hàng có thể yêu cầu màu sắc riêng)', '1200x300x800mm và 1200x300x1000mm (Mặt bàn bo tròn, chân trụ bo rãnh)', '12 tháng');
INSERT INTO `informations` VALUES (61, 'Gỗ công nghiệp MDF lõi xanh chống ẩm phủ Melamine, gia công CNC sắc sảo', 'Màu Trắng, Màu Sồi (Khách hàng tùy ý lựa chọn theo bảng màu)', 'Giường 1200x2000mm & Bàn 1200x400x1400mm; Giường 1400x2000mm & Bàn 1400x400x1400mm', '12 tháng');
INSERT INTO `informations` VALUES (62, 'Gỗ sồi tự nhiên kết hợp Veneer sồi cao cấp, xử lý chống mối mọt', 'Vân Gỗ Sồi, Màu Hạt dẻ (Khách hàng tùy ý lựa chọn theo bảng màu)', '1600x2000mm và 1800x2000mm', '12 tháng');
INSERT INTO `informations` VALUES (63, 'Gỗ sồi tự nhiên kết hợp Veneer sồi cao cấp, sơn PU bóng chống trầy xước', 'Vân Gỗ Sồi, Màu Cánh gián (Khách hàng tùy ý lựa chọn tại cửa hàng)', '1800x2000x350mm và 2000x2200x350mm', '12 tháng');
INSERT INTO `informations` VALUES (64, 'Gỗ công nghiệp MDF lõi xanh chống ẩm phủ Melamine cao cấp, xử lý cạnh bằng máy tự động', 'Trắng Kem, Vân Gỗ Sồi (Khách hàng tùy ý lựa chọn màu sắc và kiểu vân gỗ)', '1600x2000x350mm và 1800x2000x350mm', '12 tháng');
INSERT INTO `informations` VALUES (65, 'Gỗ sồi tự nhiên kết hợp Veneer sồi cao cấp, khung nan đan xen tinh tế', 'Vân Gỗ Sồi, Trắng Kem (Khách hàng có thể yêu cầu phun màu tùy chọn)', '1600x2000x350mm và 1800x2000x350mm', '12 tháng');
INSERT INTO `informations` VALUES (66, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine vân gỗ kết hợp màu, phụ kiện cao cấp', 'Xám phối gỗ sồi, Trắng Kem (Khách hàng tùy chọn trong bảng màu quy chuẩn)', 'Set 1: Giường 1m2 + Tủ 1m2; Set 2: Giường 1m6 + Tủ 1m6; Set 3: Giường 1m8 + Tủ 1m8', '12 tháng');
INSERT INTO `informations` VALUES (67, 'Gỗ sồi tự nhiên 100% kết hợp Veneer sồi, xử lý chống cong vênh mối mọt', 'Màu Hạt dẻ trầm ấm, Vân Gỗ Sồi (Khách hàng tùy ý lựa chọn màu sắc)', '1600x2000mm và 1800x2000mm (Chiều cao đầu giường 880mm)', '12 tháng');
INSERT INTO `informations` VALUES (68, 'Gỗ sồi tự nhiên kết hợp Veneer sồi cao cấp, gia công CNC sắc sảo, khoan cam chốt chắc chắn', 'Vân Gỗ Sồi, Trắng Kem (Khách hàng có thể tùy chọn màu sắc theo bảng màu)', '1600x2000mm và 1800x2000mm (Hỗ trợ tùy chỉnh 1500x2000mm theo yêu cầu)', '12 tháng');
INSERT INTO `informations` VALUES (69, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine cao cấp, gia công CNC, phụ kiện bản lề giảm chấn', 'Trắng Kem, Vân Gỗ Sồi (Khách hàng tùy ý lựa chọn phối màu theo bảng màu)', 'Giường: 1600x2000mm; Tủ áo: 2100x580x2400mm; Tủ đầu giường: 400x340x450mm', '12 tháng');
INSERT INTO `informations` VALUES (70, 'Gỗ sồi kết hợp Veneer sồi tự nhiên, đầu giường bọc nệm kết hợp mây đan thủ công', 'Vân Gỗ Sồi, Màu Hạt dẻ (Khách hàng tùy ý lựa chọn màu sắc Veneer)', '1600x2000mm và 1800x2000mm (Thiết kế chân cao thanh thoát)', '12 tháng');
INSERT INTO `informations` VALUES (71, 'Gỗ sồi tự nhiên kết hợp Veneer sồi, đầu giường bọc da hoặc nỉ cao cấp theo yêu cầu', 'Trắng Kem, Vân Gỗ Sồi (Khách hàng tùy ý lựa chọn màu gỗ và chất liệu bọc)', '1600x2000mm và 1800x2000mm (Kích thước lọt nệm chuẩn hệ thống)', '12 tháng');
INSERT INTO `informations` VALUES (72, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine cao cấp, phụ kiện ray bi giảm chấn cho hộc kéo', 'Trắng Kem, Vân Gỗ Sồi (Khách hàng tùy ý lựa chọn màu sắc theo bảng màu)', '1200x2040x900mm (Kích thước phủ bì)', '12 tháng');
INSERT INTO `informations` VALUES (73, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine, đầu giường bọc nệm nỉ cao cấp, mút D40 êm ái', 'Trắng Kem, Vân Gỗ Sồi (Khách hàng tùy chọn màu nệm và màu gỗ theo yêu cầu)', '1200x2000mm; 1600x2000mm; 1800x2000mm', '12 tháng');
INSERT INTO `informations` VALUES (74, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine cao cấp, cấu trúc dạng hộp chịu lực cao', 'Trắng Kem, Vân Gỗ Sồi (Khách hàng tùy ý lựa chọn màu và vân gỗ)', '1200x2000mm; 1600x2000mm; 1800x2000mm', '12 tháng');
INSERT INTO `informations` VALUES (75, 'Gỗ sồi tự nhiên kết hợp Veneer sồi cao cấp, xử lý chống mối mọt và cong vênh', 'Vân Gỗ Sồi, Trắng Kem (Màu sắc tự nhiên, trang nhã)', '1200x2000x350mm (Kích thước phủ bì 2070x1260x890mm)', '12 tháng');
INSERT INTO `informations` VALUES (76, 'Gỗ sồi tự nhiên kết hợp Veneer sồi, sử dụng công nghệ sơn Lacker cao cấp của Đức', 'Trắng, Hồng phấn, Xanh dương, Vàng (Khách hàng tùy chọn màu sắc tại cửa hàng)', '1600x2000x1050mm (Có thể thay đổi kích thước theo nhu cầu)', '12 tháng');
INSERT INTO `informations` VALUES (77, 'Khung gỗ MDF lõi xanh bọc mút xốp K35, da Simili Hàn Quốc cao cấp, chân kim loại sơn tĩnh điện', 'Xám, Trắng Kem, Kem (Khách hàng linh hoạt lựa chọn theo bảng màu da)', '1200x2000mm; 1400x2000mm; 1600x2000mm; 1800x2000mm; 2000x2200mm', '12 tháng khung xương');
INSERT INTO `informations` VALUES (78, 'Gỗ sồi tự nhiên cao cấp, xử lý tẩm sấy chống cong vênh và mối mọt', 'Vân Gỗ Sồi, Trắng Kem (Màu sắc tự nhiên, trang nhã)', '1600x2000mm và 1800x2000mm (Chiều cao đầu giường tinh chỉnh thanh mảnh)', '12 tháng');
INSERT INTO `informations` VALUES (79, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine cao cấp, xử lý cạnh bằng máy tự động', 'Xám phối Đen (Màu sắc hiện đại, sang trọng)', '1600x2000mm; 1800x2000mm; 2000x2000mm (Chiều cao thấp sát sàn)', '12 tháng');
INSERT INTO `informations` VALUES (80, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine, thiết kế chân ẩn tạo hiệu ứng giường bay', 'Vân Gỗ Sồi, Nâu Cánh Gián, Trắng (Khách hàng tùy ý lựa chọn màu sắc)', '1200x2000mm; 1400x2000mm; 1600x2000mm; 1800x2000mm (Độ cao sàn 120mm)', '12 tháng');
INSERT INTO `informations` VALUES (81, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine cao cấp, kết cấu khung hộp chịu lực lớn', 'Vân Gỗ Sồi, Trắng Kem (Khách hàng tùy ý lựa chọn phối màu)', '1000x2187mm; 1200x2187mm; 1400x2187mm; 1600x2187mm (Chiều cao 467mm)', '12 tháng');
INSERT INTO `informations` VALUES (82, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine cao cấp, tích hợp hệ thống đèn LED âm bục', 'Vân Gỗ Sồi, Trắng Kem (Khách hàng tùy ý lựa chọn theo bảng màu nội thất)', '1800x2000mm và 2000x2000mm (Thiết kế bục nâng sàn, có thể tùy chỉnh kích thước)', '12 tháng');
INSERT INTO `informations` VALUES (83, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine cao cấp, phụ kiện ray bi giảm chấn cho ngăn kéo', 'Vân Gỗ Sồi, Trắng, Đen (Bảng màu hiện đại phối hợp linh hoạt)', '1200x2000mm; 1400x2000mm; 1600x2000mm; 1800x2000mm', '12 tháng');
INSERT INTO `informations` VALUES (84, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine cao cấp, phụ kiện cam chốt nhập khẩu', 'Vân Gỗ Sồi, Trắng, Ghi (Phối màu tinh tế theo phong cách tối giản)', '1600x2000mm và 1800x2000mm (Độ cao sàn 180mm, bao gồm 2 tab đầu giường)', '12 tháng');
INSERT INTO `informations` VALUES (85, 'Gỗ công nghiệp MDF lõi xanh chống ẩm phủ Melamine cao cấp, bề mặt chống trầy xước', 'Trắng, Đen, Vân Gỗ Sồi (Bảng màu cơ bản dễ phối nội thất)', '1200x2000mm; 1400x2000mm; 1600x2000mm; 1800x2000mm', '12 tháng');
INSERT INTO `informations` VALUES (86, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine cao cấp, kỹ thuật phủ bề mặt tiên tiến', 'Vân Gỗ Sồi, Trắng Kem (Tùy chọn theo phong cách thiết kế)', '1200x2117x550mm (Kích thước lọt nệm tiêu chuẩn 1m2)', '12 tháng');
INSERT INTO `informations` VALUES (87, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine, kết hợp bọc Da hoặc Nỉ tùy chọn theo sở thích', 'Tùy ý lựa chọn màu sắc da/nỉ và kiểu vân gỗ tại cửa hàng', '1200x2000mm; 1600x2000mm; 1800x2000mm', '12 tháng');
INSERT INTO `informations` VALUES (88, 'Gỗ MDF lõi xanh chống ẩm bọc mút xốp K35, da Simili Hàn Quốc cao cấp, chân kim loại chắc chắn', 'Xám, Trắng Kem, Kem, Ghi (Khách hàng tùy chọn màu sắc theo bảng màu da tại cửa hàng)', '1200x2000mm; 1400x2000mm; 1600x2000mm; 1800x2000mm; 2000x2200mm', '12 tháng khung xương');
INSERT INTO `informations` VALUES (89, 'Gỗ MDF lõi xanh chống ẩm, bọc da Simili Hàn Quốc cao cấp, đệm mút xốp K35 tạo hình khối', 'Xám đậm, Kem sữa, Trắng (Khách hàng tùy chọn màu sắc theo bảng màu da)', '1200x2000mm; 1400x2000mm; 1600x2000mm; 1800x2000mm; 2000x2200mm', '12 tháng khung xương');
INSERT INTO `informations` VALUES (90, 'Gỗ MDF lõi xanh chống ẩm bọc mút xốp K35, da Simili Hàn Quốc cao cấp, chân kim loại sơn tĩnh điện', 'Xám nhạt, Kem, Trắng, Ghi đậm (Khách hàng linh hoạt lựa chọn theo bảng màu)', '1200x2000mm; 1400x2000mm; 1600x2000mm; 1800x2000mm; 2000x2200mm', '12 tháng khung xương gỗ');
INSERT INTO `informations` VALUES (91, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine cao cấp, hệ thống bánh xe trượt chịu lực cho tầng kéo', 'Vân Gỗ Sồi, Trắng, Ghi (Khách hàng tùy chọn phối màu theo bảng màu)', 'Giường chính: 1400x2000mm | Giường kéo: 1000x1900mm (Kích thước phủ bì tối ưu)', '12 tháng');
INSERT INTO `informations` VALUES (92, 'Gỗ MDF lõi xanh chống ẩm cao cấp, phủ Melamine, phụ kiện liên kết máy tự động', 'Vân gỗ phối Trắng, Xanh hoặc Hồng (Khách hàng tùy ý lựa chọn màu sắc)', 'Tổng thể: 2455x1050x1915mm | Giường dưới: 2020x1237mm | Tủ áo: 750x600mm', '12 tháng');
INSERT INTO `informations` VALUES (93, 'Gỗ MDF lõi xanh chống ẩm cao cấp phủ Melamine, chi tiết trang trí cắt CNC nghệ thuật', 'Vàng gỗ phối Xanh lá/Trắng (Khách hàng tùy ý lựa chọn màu sắc theo sở thích của bé)', 'Tầng trên: 1000x2000mm | Tầng dưới: 1200x2000mm (Kích thước lọt nệm tiêu chuẩn)', '12 tháng');
INSERT INTO `informations` VALUES (94, 'Gỗ công nghiệp MDF cốt lõi xanh chống ẩm phủ Melamine cao cấp', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', '1960 x 1560 x 1800mm (Kích thước phủ bì tiêu chuẩn)', '12 tháng');
INSERT INTO `informations` VALUES (95, 'Gỗ MDF lõi xanh chống ẩm, phủ Melamine cao cấp', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', '274,8 x 126 x 182cm (Kích thước phủ bì tổng thể)', '12 tháng');
INSERT INTO `informations` VALUES (96, 'Gỗ MDF lõi xanh chống ẩm phủ melamine cao cấp', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', '1200x2000x300', '12 tháng');
INSERT INTO `informations` VALUES (97, 'Gỗ MDF lõi xanh chống ẩm phủ melamine cao cấp, phụ kiện bản lề giảm chấn', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', '1200x2000x300', '12 tháng');
INSERT INTO `informations` VALUES (98, 'Gỗ công nghiệp MDF cốt lõi xanh chống ẩm cao cấp, phủ Melamine', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', '1400x2000x300', '12 tháng');
INSERT INTO `informations` VALUES (99, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine cao cấp', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', '1200x2000x300', '12 tháng');
INSERT INTO `informations` VALUES (100, 'Gỗ sồi tự nhiên chắc chắn kết hợp phủ Veneer sồi cao cấp', 'Vân Gỗ Sồi (9), Trắng Kem (8), Xám phối gỗ sồi (14)', '1600x2000x350', '12 tháng');
INSERT INTO `informations` VALUES (101, 'Gỗ sồi tự nhiên kết hợp veneer sồi, phun sơn cao cấp', 'Vân Gỗ Sồi (Mã màu 9)', '1600x2000x350, 1800x2000x350', '12 tháng');
INSERT INTO `informations` VALUES (102, 'Gỗ sồi tự nhiên kết hợp veneer sồi cao cấp, phong cách Bắc Âu', 'Vân Gỗ Sồi (9), Trắng Kem (8), Xám phối gỗ sồi (14)', '1800x2000x350', '12 tháng');
INSERT INTO `informations` VALUES (103, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine, tủ áo cánh kính, đầu giường bọc da/nỉ cao cấp', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', '1600x2000x350', '12 tháng');
INSERT INTO `informations` VALUES (104, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine cao cấp', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', '1200x2000x300', '12 tháng');
INSERT INTO `informations` VALUES (105, 'Khung gỗ sồi tự nhiên chắc chắn phủ Veneer óc chó, đầu giường bọc da/nỉ cao cấp', 'Vân Gỗ (9), Trắng Kem (8), Xám phối gỗ (14)', '1600x2000x350, 1800x2000x350', '12 tháng');
INSERT INTO `informations` VALUES (106, 'Gỗ MDF lõi xanh phủ Melamine vân gỗ tự nhiên', 'Vân Gỗ Sồi (9)', '1600x2000x350', '12 tháng');
INSERT INTO `informations` VALUES (107, 'Khung gỗ MDF bọc nỉ Hàn Quốc, phụ kiện nâng hạ thông minh', 'Xám phối gỗ sồi (14)', '1800x2000x350', '12 tháng');
INSERT INTO `informations` VALUES (108, 'Gỗ MDF lõi xanh, sơn 2K an toàn cho trẻ', 'Trắng Kem (8)', '1200x2000x300', '12 tháng');
INSERT INTO `informations` VALUES (109, 'Gỗ sồi tự nhiên, chân gỗ tiện tròn', 'Trắng Kem (8)', '1600x2000x350', '12 tháng');
INSERT INTO `informations` VALUES (110, 'Gỗ sồi phủ Veneer óc chó, đầu giường bọc da thật', 'Vân Gỗ Sồi (9)', '1800x2000x350', '12 tháng');
INSERT INTO `informations` VALUES (111, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine', 'Xám phối gỗ sồi (14)', '1600x2000x350', '12 tháng');
INSERT INTO `informations` VALUES (112, 'Gỗ sồi tự nhiên kết hợp MDF sơn 2K', 'Trắng Kem (8)', '1200x2000x300', '12 tháng');
INSERT INTO `informations` VALUES (113, 'Gỗ MDF lõi xanh phủ Melamine dày 17mm', 'Vân Gỗ Sồi (9)', '1800x2000x350', '12 tháng');
INSERT INTO `informations` VALUES (114, 'Gỗ sồi tự nhiên, sơn bóng mờ', 'Vân Gỗ Sồi (9)', '1600x2000x350', '12 tháng');
INSERT INTO `informations` VALUES (115, 'Hệ khung thép kết hợp gỗ MDF lõi xanh', 'Trắng Kem (8)', '1200x2000x300', '12 tháng');
INSERT INTO `informations` VALUES (116, 'Gỗ MDF phủ Melamine, hệ thống LED cảm biến', 'Xám phối gỗ sồi (14)', '1800x2000x350', '12 tháng');
INSERT INTO `informations` VALUES (117, 'Gỗ sồi Mỹ nhập khẩu', 'Vân Gỗ Sồi (9)', '1600x2000x350', '12 tháng');
INSERT INTO `informations` VALUES (118, 'Khung gỗ tự nhiên, bọc da Microfiber cao cấp', 'Trắng Kem (8)', '1800x2000x350', '12 tháng');
INSERT INTO `informations` VALUES (119, 'Gỗ MDF lõi xanh phủ Melamine', 'Xám phối gỗ sồi (14)', '1200x2000x300', '12 tháng');
INSERT INTO `informations` VALUES (120, 'Gỗ MDF lõi xanh phủ Veneer óc chó Bắc Mỹ', 'Vân Gỗ Sồi (9)', '1800x2000x350', '12 tháng');
INSERT INTO `informations` VALUES (121, 'Gỗ MDF lõi xanh chống ẩm phun sơn S8 cao cấp, bề mặt mịn màng', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ (14)', '1600x40x45, 2000x40x45, 2400x40x45', '12 tháng');
INSERT INTO `informations` VALUES (122, 'Gỗ MDF lõi xanh chống ẩm cao cấp, phun sơn S8 bền màu', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ (14)', '1200x350x700, 1600x350x700, 2000x350x700, 2400x350x700', '12 tháng');
INSERT INTO `informations` VALUES (123, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine hoặc phun sơn S8 cao cấp', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ (14)', '1800x350x400, 2000x350x400, 2400x350x400', '12 tháng');
INSERT INTO `informations` VALUES (124, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine kết hợp cánh phủ FILM PVC cao cấp', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ (14)', '1800x400x2200, 2000x400x2200, 2200x400x2200, 2400x400x2200, 3000x400x2200', '12 tháng');
INSERT INTO `informations` VALUES (125, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine kết hợp cánh phủ FILM PVC cao cấp', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ (14)', '1400x400x491, 1600x400x491, 2000x400x491, 2400x400x491', '12 tháng');
INSERT INTO `informations` VALUES (126, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine kết hợp cánh phủ FILM PVC cao cấp', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', '1200x550x450, 1800x400x450, 2200x450x500, 2400x600x2500', '12 tháng');
INSERT INTO `informations` VALUES (127, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine kết hợp cánh phủ FILM PVC cao cấp', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', '1600x800x750, 2200x450x500, 2400x600x2500', '12 tháng');
INSERT INTO `informations` VALUES (128, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine kết hợp cánh phủ FILM PVC cao cấp', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', '1200x550x450, 1800x400x450, 2200x450x500, 2400x600x2500', '12 tháng');
INSERT INTO `informations` VALUES (129, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine, chân gỗ tự nhiên, phụ kiện Caryny', 'Trắng đen phối hợp hoặc tùy chọn: Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ (14)', '1800x400x450, 890x400x610, 600x300x1200', '12 tháng');
INSERT INTO `informations` VALUES (130, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine vân gỗ kết hợp màu hiện đại', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', '1800x400x450', '12 tháng');
INSERT INTO `informations` VALUES (131, 'Gỗ sồi tự nhiên kết hợp Veneer sồi cao cấp, sơn PU hoàn thiện', 'Vân Gỗ Sồi tự nhiên (9), Trắng Kem (8), Xám phối gỗ (14)', '1800x400x900', '12 tháng');
INSERT INTO `informations` VALUES (132, 'Gỗ sồi tự nhiên phối Veneer sồi cao cấp, kết hợp cánh kính sọc (fluted glass) sang trọng', 'Vân Gỗ Sồi (9), Trắng Kem (8), Xám phối gỗ (14)', '1800x400x530', '12 tháng');
INSERT INTO `informations` VALUES (133, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine cao cấp, chân gỗ tự nhiên vững chãi', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', '1600x800x750, 1800x400x450, 2200x450x500', '12 tháng');
INSERT INTO `informations` VALUES (134, 'Gỗ MDF lõi xanh chống ẩm phun sơn S8 cao cấp, bền màu', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', '1600x250x230, 1800x250x230, 2200x250x230', '12 tháng');
INSERT INTO `informations` VALUES (135, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine, chân gỗ tự nhiên, phụ kiện Cariny chính hãng', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', '1400x400x600', '12 tháng');
INSERT INTO `informations` VALUES (136, 'Gỗ MDF lõi xanh chống ẩm phun sơn cao cấp, bề mặt mịn bền màu', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', '400x400x520', '12 tháng');
INSERT INTO `informations` VALUES (137, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine cao cấp, chân gỗ tự nhiên', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', '1600x800x750, 1800x400x450, 2200x450x500', '12 tháng');
INSERT INTO `informations` VALUES (138, 'Gỗ MDF lõi xanh phủ Melamine cao cấp, chân gỗ tự nhiên, bề mặt chống trầy xước và thấm nước', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', '500 x 340 x 460mm', '12 tháng');
INSERT INTO `informations` VALUES (139, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine cao cấp, bề mặt chống trầy xước và không thấm nước', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', '500 x 400 x 500mm', '12 tháng');
INSERT INTO `informations` VALUES (140, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine vân gỗ, chân gỗ tự nhiên', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', '430 x 300 x 530mm', '12 tháng');
INSERT INTO `informations` VALUES (141, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', '450x400x500', '12 tháng');
INSERT INTO `informations` VALUES (142, 'Gỗ MDF lõi xanh, chân gỗ sồi tự nhiên', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', '400x350x550', '12 tháng');
INSERT INTO `informations` VALUES (143, 'Gỗ MDF lõi xanh phủ Melamine vân gỗ', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', '500x400x480', '12 tháng');
INSERT INTO `informations` VALUES (144, 'Gỗ MDF lõi xanh, chân gỗ tự nhiên', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', '450x380x520', '12 tháng');
INSERT INTO `informations` VALUES (145, 'Gỗ MDF lõi xanh phủ Melamine', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', '400x400x400', '12 tháng');
INSERT INTO `informations` VALUES (146, 'Gỗ MDF lõi xanh cao cấp', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', '480x400x530', '12 tháng');
INSERT INTO `informations` VALUES (147, 'Gỗ MDF lõi xanh phủ Melamine', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', '450x420x500', '12 tháng');
INSERT INTO `informations` VALUES (148, 'Gỗ MDF lõi xanh phối màu decor', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', '350x300x450', '12 tháng');
INSERT INTO `informations` VALUES (149, 'Gỗ MDF lõi xanh phủ Melamine cao cấp', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', '420x380x510', '12 tháng');
INSERT INTO `informations` VALUES (150, 'Gỗ MDF lõi xanh phun sơn S8', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', '480x380x520', '12 tháng');
INSERT INTO `informations` VALUES (151, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine, cánh kính thường, khung gỗ, gia công CNC chính xác', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', '600x320x2000mm, 830x320x2000mm', '12 tháng');
INSERT INTO `informations` VALUES (152, 'Gỗ MDF phủ Melamine cao cấp, chống trầy xước và dễ vệ sinh', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', '1000 x 250 x 1200mm', '12 tháng');
INSERT INTO `informations` VALUES (153, 'Gỗ MDF lõi xanh chống ẩm cao cấp phủ Melamine vân gỗ, xử lý chống cong vênh mối mọt', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', '1600 x 400 x 1600mm', '12 tháng');
INSERT INTO `informations` VALUES (154, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine, xử lý cạnh và khoan liên kết bằng máy tự động', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', '800 x 350 x 1700mm', '12 tháng');
INSERT INTO `informations` VALUES (155, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine vân gỗ, thiết kế 5 tầng tối ưu lưu trữ', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', '1190 x 365 x 1968mm', '12 tháng');
INSERT INTO `informations` VALUES (156, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine, chân sắt phun sơn tĩnh điện, phụ kiện ray bi bản lề Caryny chính hãng', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', '1000 x 350 x 1850mm', '12 tháng');
INSERT INTO `informations` VALUES (157, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine, kính cường lực cao cấp, phụ kiện Caryny chính hãng', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', '600x350x2000mm (Loại 1), 800x350x2000mm (Loại 2 & 3)', '12 tháng');
INSERT INTO `informations` VALUES (158, 'Gỗ sồi tự nhiên đã qua xử lý tẩm sấy, chống cong vênh mối mọt, phụ kiện ray bi Caryny chính hãng', 'Màu gỗ sồi tự nhiên, Trắng (8), Vân gỗ phối màu', '380x300x380mm | 380x300x760mm | 380x300x1140mm', '12 tháng');
INSERT INTO `informations` VALUES (159, 'Gỗ MDF cao cấp phủ Melamine láng mịn, xử lý cạnh và khoan liên kết bằng máy tự động', 'Xanh phối gỗ (8), Hồng phối gỗ (9), Trắng phối gỗ (14)', '600 x 240 x 1400mm', '12 tháng');
INSERT INTO `informations` VALUES (160, 'Gỗ công nghiệp MDF lõi xanh chống ẩm phủ Melamine vân gỗ cao cấp', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', '600 x 280 x 1250mm', '12 tháng');
INSERT INTO `informations` VALUES (161, 'Gỗ công nghiệp MDF cốt lõi xanh chống ẩm phủ Melamine vân gỗ cao cấp', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', 'Mẫu A: 240x400x1480mm | Mẫu B: 300x400x1480mm', '12 tháng');
INSERT INTO `informations` VALUES (162, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine, gia công CNC chính xác, khoan cam chốt tự động', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', 'A: 600x600x1200mm | B: 1000x600x1500mm', '12 tháng');
INSERT INTO `informations` VALUES (163, 'Gỗ công nghiệp MDF cốt lõi xanh chống ẩm phủ Melamine vân gỗ kết hợp màu hiện đại', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', '1200 x 240 x 1000mm', '12 tháng');
INSERT INTO `informations` VALUES (164, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine vân gỗ kết hợp màu hiện đại', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', 'A: 700x240x950mm | B: 700x240x1290mm | C: 700x240x1610mm', '12 tháng');
INSERT INTO `informations` VALUES (165, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine màu, gia công CNC, khoan cam chốt tự động', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ sồi (14)', 'Mẫu 1: 600x600x1200mm | Mẫu 2: 1000x600x1500mm', '12 tháng');
INSERT INTO `informations` VALUES (166, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine, cánh phủ Film PVC cao cấp, gia công CNC chính xác', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ (14)', 'Dài 120/160/200/240cm x Rộng 36cm x Cao 230cm', '12 tháng');
INSERT INTO `informations` VALUES (167, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine, cánh phủ Film PVC cao cấp, gia công CNC chính xác', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ (14)', 'Dài 120/160/200/240cm x Rộng 40cm x Cao 200cm', '12 tháng');
INSERT INTO `informations` VALUES (168, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine, cánh phủ Film PVC cao cấp, gia công CNC chính xác', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ (14)', 'Dài 120/160/200/240cm x Rộng 40cm x Cao 230cm', '12 tháng');
INSERT INTO `informations` VALUES (169, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine, cánh phủ Film PVC cao cấp, gia công CNC chính xác', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ (14)', 'Dài 120/160/200cm x Rộng 35cm x Cao 230cm', '12 tháng');
INSERT INTO `informations` VALUES (170, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine, cánh phủ Film PVC cao cấp, gia công CNC chính xác', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ (14)', 'Dài 120/160/200/240cm x Rộng 40cm x Cao 200cm', '12 tháng');
INSERT INTO `informations` VALUES (171, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine, cánh phủ Film PVC cao cấp, gia công CNC chính xác', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ (14)', 'Dài 120/140/160/200/280cm x Rộng 36-40cm x Cao 220cm', '12 tháng');
INSERT INTO `informations` VALUES (172, 'Gỗ MDF lõi xanh chống ẩm phun sơn cao cấp, gia công CNC, bề mặt mịn màng', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ (14)', 'Mẫu A: 120x40x200cm | Mẫu B: 160x40x200cm', '12 tháng');
INSERT INTO `informations` VALUES (173, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine cao cấp, gia công CNC chính xác', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ (14)', 'Dài 120/160/180/200cm x Rộng 42cm x Cao 220cm', '12 tháng');
INSERT INTO `informations` VALUES (174, 'Gỗ MDF lõi xanh chống ẩm phun sơn cao cấp, bề mặt mịn màng, gia công CNC', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ (14)', 'Dài 120/140/160cm x Rộng 40cm x Cao 200cm', '12 tháng');
INSERT INTO `informations` VALUES (175, 'Gỗ công nghiệp MDF lõi xanh chống ẩm phủ Melamine cao cấp, xử lý cạnh tự động', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ (14)', 'Dài 60/90/120cm x Rộng 30cm x Cao 80cm', '12 tháng');
INSERT INTO `informations` VALUES (176, 'Gỗ công nghiệp MDF lõi xanh chống ẩm phủ Melamine vân gỗ kết hợp màu', 'Trắng Kem (8), Vân Gỗ Sồi (9), Xám phối gỗ (14)', '900 x 400 x 900mm', '12 tháng');
INSERT INTO `informations` VALUES (177, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine vân gỗ', 'Trắng Kem (8), Vân Gỗ Sồi (9)', 'Dài 100/120cm x Rộng 40cm x Cao 90cm', '12 tháng');
INSERT INTO `informations` VALUES (178, 'Gỗ MDF lõi xanh chống ẩm phủ Melamine', 'Xám phối gỗ (14), Trắng Kem (8)', 'Dài 120/140cm x Rộng 40cm x Cao 120cm', '12 tháng');
INSERT INTO `informations` VALUES (179, 'Gỗ MDF lõi xanh phủ Melamine vân gỗ sồi', 'Vân Gỗ Sồi (9), Trắng Kem (8)', 'Dài 100/120cm x Rộng 40cm x Cao 100cm', '12 tháng');
INSERT INTO `informations` VALUES (180, 'Gỗ MDF lõi xanh phủ Melamine cao cấp', 'Trắng Kem (8), Xám phối gỗ (14)', 'Dài 120/150cm x Rộng 40cm x Cao 180cm', '12 tháng');
INSERT INTO `informations` VALUES (181, 'Gỗ Walnut (Óc chó), Maple (Gỗ phong), Beech (Dẻ gai)', 'Màu gỗ tự nhiên, sơn phủ bóng mờ', 'Tiêu chuẩn: 10x10x12 cm', '06 tháng');
INSERT INTO `informations` VALUES (182, 'Gỗ Tần bì (Ash), Gỗ Maple cao cấp', 'Màu gỗ sáng tự nhiên', 'Tiêu chuẩn: 15x8x10 cm', '06 tháng');
INSERT INTO `informations` VALUES (183, 'Gỗ Beech (Dẻ gai) nhập khẩu', 'Màu gỗ Beech tự nhiên', 'Tiêu chuẩn: 8x8x11 cm', '06 tháng');
INSERT INTO `informations` VALUES (184, 'Gỗ Walnut cao cấp phối hợp gỗ Maple', 'Màu nâu Socola phối trắng kem', 'Tùy chỉnh theo thiết kế', '06 tháng');
INSERT INTO `informations` VALUES (185, 'Gỗ tự nhiên nguyên khối, máy đồng hồ kim trôi êm ái', 'Vàng gỗ tự nhiên (9)', 'Đường kính 10cm x Dày 4cm', '06 tháng');
INSERT INTO `informations` VALUES (186, 'Gỗ công nghiệp phủ Veneer hoặc in họa tiết nghệ thuật', 'Vân gỗ sáng phối họa tiết (8)', '25cm x 30cm', '06 tháng');
INSERT INTO `informations` VALUES (187, 'Gỗ tự nhiên cao cấp kết hợp đế gỗ vững chắc', 'Màu gỗ Walnut/Beech (14)', 'Đường kính 15cm x Cao 18cm (cả đế)', '06 tháng');
INSERT INTO `informations` VALUES (188, 'Gỗ tự nhiên nguyên tấm, gia công CNC chính xác', 'Vàng gỗ sáng (9)', 'Đường kính 25cm - 30cm', '06 tháng');
INSERT INTO `informations` VALUES (189, 'Gỗ tự nhiên kết hợp in màu công nghệ cao', 'Màu gỗ sáng phối đỏ/vàng may mắn (9)', 'Tiêu chuẩn để bàn: 15x20 cm', '06 tháng');
INSERT INTO `informations` VALUES (190, 'Gỗ tự nhiên cao cấp, bề mặt phủ bóng bảo vệ', 'Màu gỗ nâu trầm (14)', 'Tiêu chuẩn: 22x12x15 cm', '06 tháng');
INSERT INTO `informations` VALUES (191, 'Gỗ tự nhiên gia công CNC hình khối đa diện', 'Màu gỗ sồi sáng (8)', 'Đường kính khối: 12 cm', '06 tháng');
INSERT INTO `informations` VALUES (192, 'Gỗ tự nhiên nguyên tấm, cơ chế trượt linh hoạt', 'Màu gỗ phối hợp (9)', 'Dài 25cm x Rộng 10cm', '06 tháng');
INSERT INTO `informations` VALUES (193, 'Gỗ tự nhiên, khoen móc kim loại không gỉ', 'Màu gỗ sáng (9)', 'Đường kính 4-5cm', '01 tháng');
INSERT INTO `informations` VALUES (194, 'Gỗ công nghiệp in màu cao cấp, phủ lớp bảo vệ', 'Màu gỗ phối màu in (8)', 'Cao 5-6cm', '01 tháng');
INSERT INTO `informations` VALUES (195, 'Gỗ tự nhiên cao cấp, gia công CNC tỉ mỉ', 'Vàng gỗ tự nhiên (9)', 'Dài 6cm x Rộng 3cm', '01 tháng');
INSERT INTO `informations` VALUES (196, 'Gỗ tự nhiên in màu thủ công', 'Đa dạng màu theo con giáp (9)', 'Cao 4-5cm', '01 tháng');
INSERT INTO `informations` VALUES (197, 'Gỗ tự nhiên cao cấp, sơn phủ bóng bảo vệ', 'Màu gỗ nâu trầm (14)', 'Dài 28cm x Rộng 12cm x Cao 15cm', '06 tháng');
INSERT INTO `informations` VALUES (198, 'Gỗ tự nhiên nguyên khối, cơ chế kéo giãn linh hoạt', 'Vàng gỗ tự nhiên (9)', 'Dài 30-45cm x Rộng 30cm', '06 tháng');
INSERT INTO `informations` VALUES (199, 'Gỗ tự nhiên gia công tinh xảo', 'Màu gỗ nâu trầm (14)', '27 x 11.6 x 6.5 cm', '06 tháng');
INSERT INTO `informations` VALUES (200, 'Gỗ tự nhiên cao cấp, thiết kế đa năng', 'Vàng gỗ phối nâu (9)', 'Dài 32cm x Rộng 15cm x Cao 10cm', '06 tháng');
INSERT INTO `informations` VALUES (201, '1234', '13', '31', '321');
INSERT INTO `informations` VALUES (202, '1234', '13', '31', '321');
INSERT INTO `informations` VALUES (204, '1234', '13', '31', '321');
INSERT INTO `informations` VALUES (205, '2w', '', '', '');
INSERT INTO `informations` VALUES (206, '2w', '', '', '');
INSERT INTO `informations` VALUES (209, '2w', '', '', '');
INSERT INTO `informations` VALUES (211, '2w', '', '', '');

-- ----------------------------
-- Table structure for notifications
-- ----------------------------
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `admin_id` int NOT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `related_id` int NULL DEFAULT NULL,
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createAt` datetime NULL DEFAULT NULL,
  `isRead` tinyint NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_notification_recipient`(`admin_id` ASC) USING BTREE,
  CONSTRAINT `fk_notification_recipient` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notifications
-- ----------------------------
INSERT INTO `notifications` VALUES (1, 2, 'CONTACT', 1, 'Liên hệ mới từ bao toan', '2026-01-27 10:31:13', 0);

-- ----------------------------
-- Table structure for order_details
-- ----------------------------
DROP TABLE IF EXISTS `order_details`;
CREATE TABLE `order_details`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NULL DEFAULT NULL,
  `product_variant_id` int NULL DEFAULT NULL,
  `quantity` int NULL DEFAULT NULL,
  `total` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_order_detail_order`(`order_id` ASC) USING BTREE,
  INDEX `fk_order_detail_variant`(`product_variant_id` ASC) USING BTREE,
  CONSTRAINT `fk_order_detail_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_order_detail_variant` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_details
-- ----------------------------
INSERT INTO `order_details` VALUES (37, 29, 3, 1, 1260000.00);
INSERT INTO `order_details` VALUES (38, 30, 794, 1, 220000.00);
INSERT INTO `order_details` VALUES (39, 31, 805, 1, 550000.00);
INSERT INTO `order_details` VALUES (40, 32, 49, 1, 7200000.00);
INSERT INTO `order_details` VALUES (41, 33, 1, 1, 1200000.00);
INSERT INTO `order_details` VALUES (42, 34, 15, 1, 1200000.00);
INSERT INTO `order_details` VALUES (43, 34, 14, 1, 1550000.00);
INSERT INTO `order_details` VALUES (44, 34, 35, 1, 7100000.00);
INSERT INTO `order_details` VALUES (45, 34, 34, 1, 6800000.00);
INSERT INTO `order_details` VALUES (46, 35, 7, 2, 16000000.00);
INSERT INTO `order_details` VALUES (47, 36, 7, 1, 8000000.00);
INSERT INTO `order_details` VALUES (48, 37, 7, 3, 24000000.00);
INSERT INTO `order_details` VALUES (49, 38, 3, 1, 1260000.00);
INSERT INTO `order_details` VALUES (50, 38, 5, 3, 22500000.00);
INSERT INTO `order_details` VALUES (51, 39, 3, 1, 1260000.00);
INSERT INTO `order_details` VALUES (52, 40, 3, 1, 1260000.00);
INSERT INTO `order_details` VALUES (53, 41, 21, 1, 5350000.00);
INSERT INTO `order_details` VALUES (54, 41, 24, 1, 6500000.00);
INSERT INTO `order_details` VALUES (56, 43, 2, 2, 2500000.00);
INSERT INTO `order_details` VALUES (57, 44, 7, 1, 8000000.00);
INSERT INTO `order_details` VALUES (58, 45, 3, 2, 2520.00);
INSERT INTO `order_details` VALUES (59, 46, 21, 1, 5350000.00);
INSERT INTO `order_details` VALUES (60, 46, 20, 1, 5200000.00);
INSERT INTO `order_details` VALUES (61, 46, 24, 1, 6500000.00);
INSERT INTO `order_details` VALUES (62, 47, 35, 1, 7100000.00);
INSERT INTO `order_details` VALUES (63, 48, 20, 2, 10400000.00);
INSERT INTO `order_details` VALUES (64, 49, 3, 2, 2520.00);
INSERT INTO `order_details` VALUES (65, 50, 49, 1, 7200000.00);
INSERT INTO `order_details` VALUES (66, 50, 48, 1, 6900000.00);
INSERT INTO `order_details` VALUES (67, 51, 7, 2, 16000000.00);
INSERT INTO `order_details` VALUES (68, 52, 4, 3, 3840000.00);
INSERT INTO `order_details` VALUES (69, 53, 21, 9, 48150000.00);
INSERT INTO `order_details` VALUES (70, 54, 4, 1, 1280000.00);
INSERT INTO `order_details` VALUES (71, 55, 1, 5, 6000000.00);
INSERT INTO `order_details` VALUES (72, 55, 7, 1, 8000000.00);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `address_id` int NULL DEFAULT NULL,
  `cart_id` int NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `createAt` datetime NULL DEFAULT NULL,
  `payment_id` int NULL DEFAULT NULL,
  `payment_status` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fullName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `totalOrder` decimal(15, 2) NULL DEFAULT NULL,
  `subTotal` decimal(15, 2) NULL DEFAULT NULL,
  `taxAmount` decimal(15, 2) NULL DEFAULT NULL,
  `shippingFee` decimal(15, 2) NULL DEFAULT NULL,
  `update_at` datetime NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_order_user`(`user_id` ASC) USING BTREE,
  INDEX `fk_order_address`(`address_id` ASC) USING BTREE,
  INDEX `fk_order_cart`(`cart_id` ASC) USING BTREE,
  INDEX `fk_payment`(`payment_id` ASC) USING BTREE,
  CONSTRAINT `fk_order_address` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_order_cart` FOREIGN KEY (`cart_id`) REFERENCES `shopping_carts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_order_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_payment` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (29, 4, 6, NULL, '', '2026-01-23 20:27:37', NULL, 'Chưa thanh toán', 'Đã giao', 'Kiều', '098765489', 1460800.00, 1260000.00, 100800.00, 100000.00, '2026-03-26 20:18:58');
INSERT INTO `orders` VALUES (30, 4, 6, NULL, '', '2026-01-23 20:28:08', NULL, 'Chưa thanh toán', 'Chờ xác nhận', 'Kiều', '098765489', 287600.00, 220000.00, 17600.00, 50000.00, '2026-03-26 20:18:58');
INSERT INTO `orders` VALUES (31, 4, 6, NULL, '', '2026-01-23 20:28:37', NULL, 'Đã thanh toán', 'Hoàn hàng', 'Kiều', '098765489', 644000.00, 550000.00, 44000.00, 50000.00, '2026-03-26 20:18:58');
INSERT INTO `orders` VALUES (32, 4, 6, NULL, '', '2026-01-23 20:29:07', 15, 'Đã thanh toán', 'Đã hủy', 'Kiều', '098765489', 8276000.00, 7200000.00, 576000.00, 500000.00, '2026-03-26 20:18:58');
INSERT INTO `orders` VALUES (33, 4, 6, NULL, '', '2026-01-23 20:40:05', NULL, 'Đã thanh toán', 'Đã giao', 'Kiều', '098765489', 1396000.00, 1200000.00, 96000.00, 100000.00, '2026-03-26 20:18:58');
INSERT INTO `orders` VALUES (34, 4, 6, NULL, '', '2026-01-24 00:44:32', NULL, 'Chưa thanh toán', 'Yêu cầu hoàn hàng', 'Kiều', '098765489', 18982000.00, 16650000.00, 1332000.00, 1000000.00, '2026-03-26 20:18:58');
INSERT INTO `orders` VALUES (35, 4, 6, NULL, '', '2026-01-24 17:28:26', NULL, 'Chưa thanh toán', 'Đã hủy', 'Kiều', '098765489', 18280000.00, 16000000.00, 1280000.00, 1000000.00, '2026-03-26 20:18:58');
INSERT INTO `orders` VALUES (36, 4, 6, NULL, '', '2026-01-24 17:28:52', NULL, 'Chưa thanh toán', 'Đã hủy', 'Kiều', '098765489', 9140000.00, 8000000.00, 640000.00, 500000.00, '2026-03-26 20:18:58');
INSERT INTO `orders` VALUES (37, 4, 6, NULL, '', '2026-01-24 18:10:05', NULL, 'Chưa thanh toán', 'Chờ xác nhận', 'Kiều', '098765489', 26920000.00, 24000000.00, 1920000.00, 1000000.00, '2026-03-26 20:18:58');
INSERT INTO `orders` VALUES (38, 4, 6, NULL, '', '2026-01-24 22:48:39', 15, NULL, 'Đã hủy', 'Kiều', '098765489', 26660800.00, 23760000.00, 1900800.00, 1000000.00, '2026-03-26 20:18:58');
INSERT INTO `orders` VALUES (39, 118, 7, NULL, '', '2026-01-26 12:54:45', NULL, 'Đã thanh toán', 'Đã giao', 'Kiều', '0974913047', 1460800.00, 1260000.00, 100800.00, 100000.00, '2026-03-26 20:18:58');
INSERT INTO `orders` VALUES (40, 118, 7, NULL, '123456', '2026-01-26 17:51:28', NULL, 'Đã thanh toán', 'Đã giao', 'Kiều', '12345', 1460800.00, 1260000.00, 100800.00, 100000.00, '2026-03-26 20:18:58');
INSERT INTO `orders` VALUES (41, 118, 7, NULL, '', '2026-01-26 21:24:08', NULL, 'Đã thanh toán', 'Đã giao', 'Kiều', '12345', 13798000.00, 11850000.00, 948000.00, 1000000.00, '2026-03-26 20:18:58');
INSERT INTO `orders` VALUES (43, 118, 7, NULL, '', '2026-01-27 21:25:34', NULL, 'Đã thanh toán', 'Đã giao', 'Kiều', '12345', 2800000.00, 2500000.00, 200000.00, 100000.00, '2026-03-26 20:18:58');
INSERT INTO `orders` VALUES (44, 118, 7, NULL, '', '2026-01-27 23:45:25', NULL, 'Đã thanh toán', 'Đã giao', 'Kiều', '1234521321', 9140000.00, 8000000.00, 640000.00, 500000.00, '2026-03-26 20:18:58');
INSERT INTO `orders` VALUES (45, 121, 9, NULL, '', '2026-01-28 03:41:36', 17, 'Đã thanh toán', 'Đã hủy', 'Trần Thị Thúy Kiều', '0984335012', 2721.60, 2520.00, 201.60, 0.00, '2026-03-26 20:18:58');
INSERT INTO `orders` VALUES (46, 121, 9, NULL, '', '2026-01-28 03:42:02', NULL, 'Chưa thanh toán', 'Đã hủy', 'Trần Thị Thúy Kiều', '0984335012', 19414000.00, 17050000.00, 1364000.00, 1000000.00, '2026-03-26 20:18:58');
INSERT INTO `orders` VALUES (47, 121, 9, NULL, '', '2026-01-28 03:42:16', NULL, 'Đã thanh toán', 'Đã giao', 'Trần Thị Thúy Kiều', '0984335012', 8168000.00, 7100000.00, 568000.00, 500000.00, '2026-03-26 20:18:58');
INSERT INTO `orders` VALUES (48, 122, 11, NULL, '', '2026-01-28 08:28:33', NULL, 'Chưa thanh toán', 'Đã hủy', 'G T N', '0984335012', 12232000.00, 10400000.00, 832000.00, 1000000.00, '2026-03-26 20:18:58');
INSERT INTO `orders` VALUES (49, 122, 11, NULL, '', '2026-01-28 08:33:13', NULL, 'Chưa thanh toán', 'Đã giao', 'G T N', '0984335012', 2721.60, 2520.00, 201.60, 0.00, '2026-03-26 20:18:58');
INSERT INTO `orders` VALUES (50, 122, 11, NULL, '', '2026-01-28 08:33:37', 18, 'Đã thanh toán', 'Đã giao', 'G T N', '0984335012', 16228000.00, 14100000.00, 1128000.00, 1000000.00, '2026-03-26 20:18:58');
INSERT INTO `orders` VALUES (51, 122, 11, NULL, '', '2026-01-28 08:33:58', 18, 'Đã thanh toán', 'Chờ xác nhận', 'G T N', '0984335012', 18280000.00, 16000000.00, 1280000.00, 1000000.00, '2026-03-26 20:18:58');
INSERT INTO `orders` VALUES (52, 122, 11, NULL, '', '2026-01-28 09:55:37', NULL, 'Chưa thanh toán', 'Chờ xác nhận', 'G T N', '0984335012', 4347200.00, 3840000.00, 307200.00, 200000.00, '2026-03-26 20:18:58');
INSERT INTO `orders` VALUES (53, 121, 9, NULL, '', '2026-03-03 12:01:42', 17, 'Đã thanh toán', 'Chờ xác nhận', 'Trần Thị Thúy Kiều', '0984335012', 53002000.00, 48150000.00, 3852000.00, 1000000.00, '2026-03-26 20:18:58');
INSERT INTO `orders` VALUES (54, 2, 2, NULL, '', '2026-03-10 15:15:59', NULL, 'Chưa thanh toán', 'Đã hủy', 'Quản Trị Viên 2', '0974913047', 1482400.00, 1280000.00, 102400.00, 100000.00, '2026-03-26 20:18:58');
INSERT INTO `orders` VALUES (55, 121, 10, NULL, '', '2026-03-11 21:16:22', NULL, 'Đã thanh toán', 'Đang giao', 'Trần Thị Thúy Kiều', '0984335012', 15320000.00, 14000000.00, 1120000.00, 200000.00, '2026-03-26 20:18:58');

-- ----------------------------
-- Table structure for payments
-- ----------------------------
DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `card_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `duration` date NULL DEFAULT NULL,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payments
-- ----------------------------
INSERT INTO `payments` VALUES (8, 10, '1234', '2026-01-05', 'MasterCard');
INSERT INTO `payments` VALUES (9, 10, '12', '2026-01-05', 'MasterCard');
INSERT INTO `payments` VALUES (10, 10, '12', '2026-01-06', 'Visa');
INSERT INTO `payments` VALUES (11, 10, '1234', '2026-01-05', 'MasterCard');
INSERT INTO `payments` VALUES (12, 10, '1234', '2026-01-05', 'Visa');
INSERT INTO `payments` VALUES (15, 4, '213456', '2000-12-21', 'JCB');
INSERT INTO `payments` VALUES (16, 118, '1234567', '2026-01-30', 'Visa');
INSERT INTO `payments` VALUES (17, 121, '0974913047', '2026-04-01', 'MasterCard');
INSERT INTO `payments` VALUES (18, 122, '0984335012', '2026-02-06', 'MasterCard');
INSERT INTO `payments` VALUES (19, 124, '123456789', '2026-03-29', 'MasterCard');

-- ----------------------------
-- Table structure for product_images
-- ----------------------------
DROP TABLE IF EXISTS `product_images`;
CREATE TABLE `product_images`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `image_id` int NULL DEFAULT NULL,
  `product_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_product_image_image`(`image_id` ASC) USING BTREE,
  INDEX `fk_product_image_product`(`product_id` ASC) USING BTREE,
  CONSTRAINT `fk_product_image_image` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_product_image_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1151 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_images
-- ----------------------------
INSERT INTO `product_images` VALUES (6, 6, 2);
INSERT INTO `product_images` VALUES (7, 7, 2);
INSERT INTO `product_images` VALUES (8, 8, 2);
INSERT INTO `product_images` VALUES (9, 9, 2);
INSERT INTO `product_images` VALUES (10, 10, 2);
INSERT INTO `product_images` VALUES (11, 11, 3);
INSERT INTO `product_images` VALUES (12, 12, 3);
INSERT INTO `product_images` VALUES (13, 13, 3);
INSERT INTO `product_images` VALUES (14, 14, 3);
INSERT INTO `product_images` VALUES (15, 15, 3);
INSERT INTO `product_images` VALUES (16, 16, 4);
INSERT INTO `product_images` VALUES (17, 17, 4);
INSERT INTO `product_images` VALUES (18, 18, 4);
INSERT INTO `product_images` VALUES (19, 19, 4);
INSERT INTO `product_images` VALUES (20, 20, 4);
INSERT INTO `product_images` VALUES (21, 21, 5);
INSERT INTO `product_images` VALUES (22, 22, 5);
INSERT INTO `product_images` VALUES (23, 23, 5);
INSERT INTO `product_images` VALUES (24, 24, 5);
INSERT INTO `product_images` VALUES (25, 25, 5);
INSERT INTO `product_images` VALUES (26, 26, 6);
INSERT INTO `product_images` VALUES (27, 27, 6);
INSERT INTO `product_images` VALUES (28, 28, 6);
INSERT INTO `product_images` VALUES (29, 29, 6);
INSERT INTO `product_images` VALUES (30, 30, 6);
INSERT INTO `product_images` VALUES (31, 31, 7);
INSERT INTO `product_images` VALUES (32, 32, 7);
INSERT INTO `product_images` VALUES (33, 33, 7);
INSERT INTO `product_images` VALUES (34, 34, 7);
INSERT INTO `product_images` VALUES (35, 35, 7);
INSERT INTO `product_images` VALUES (36, 36, 8);
INSERT INTO `product_images` VALUES (37, 37, 8);
INSERT INTO `product_images` VALUES (38, 38, 8);
INSERT INTO `product_images` VALUES (39, 39, 8);
INSERT INTO `product_images` VALUES (40, 40, 8);
INSERT INTO `product_images` VALUES (41, 41, 9);
INSERT INTO `product_images` VALUES (42, 42, 9);
INSERT INTO `product_images` VALUES (43, 43, 9);
INSERT INTO `product_images` VALUES (44, 44, 9);
INSERT INTO `product_images` VALUES (45, 45, 9);
INSERT INTO `product_images` VALUES (46, 46, 10);
INSERT INTO `product_images` VALUES (47, 47, 10);
INSERT INTO `product_images` VALUES (48, 48, 10);
INSERT INTO `product_images` VALUES (49, 49, 10);
INSERT INTO `product_images` VALUES (50, 50, 10);
INSERT INTO `product_images` VALUES (51, 51, 11);
INSERT INTO `product_images` VALUES (52, 52, 11);
INSERT INTO `product_images` VALUES (53, 53, 11);
INSERT INTO `product_images` VALUES (54, 54, 11);
INSERT INTO `product_images` VALUES (55, 55, 11);
INSERT INTO `product_images` VALUES (56, 56, 12);
INSERT INTO `product_images` VALUES (57, 57, 12);
INSERT INTO `product_images` VALUES (58, 58, 12);
INSERT INTO `product_images` VALUES (59, 59, 12);
INSERT INTO `product_images` VALUES (60, 60, 12);
INSERT INTO `product_images` VALUES (61, 61, 13);
INSERT INTO `product_images` VALUES (62, 62, 13);
INSERT INTO `product_images` VALUES (63, 63, 13);
INSERT INTO `product_images` VALUES (64, 64, 13);
INSERT INTO `product_images` VALUES (65, 65, 13);
INSERT INTO `product_images` VALUES (66, 66, 14);
INSERT INTO `product_images` VALUES (67, 67, 14);
INSERT INTO `product_images` VALUES (68, 68, 14);
INSERT INTO `product_images` VALUES (69, 69, 14);
INSERT INTO `product_images` VALUES (70, 70, 14);
INSERT INTO `product_images` VALUES (71, 71, 15);
INSERT INTO `product_images` VALUES (72, 72, 15);
INSERT INTO `product_images` VALUES (73, 73, 15);
INSERT INTO `product_images` VALUES (74, 74, 15);
INSERT INTO `product_images` VALUES (75, 75, 15);
INSERT INTO `product_images` VALUES (76, 76, 16);
INSERT INTO `product_images` VALUES (77, 77, 16);
INSERT INTO `product_images` VALUES (78, 78, 16);
INSERT INTO `product_images` VALUES (79, 79, 16);
INSERT INTO `product_images` VALUES (80, 80, 16);
INSERT INTO `product_images` VALUES (81, 81, 17);
INSERT INTO `product_images` VALUES (82, 82, 17);
INSERT INTO `product_images` VALUES (83, 83, 17);
INSERT INTO `product_images` VALUES (84, 84, 17);
INSERT INTO `product_images` VALUES (85, 85, 17);
INSERT INTO `product_images` VALUES (86, 86, 18);
INSERT INTO `product_images` VALUES (87, 87, 18);
INSERT INTO `product_images` VALUES (88, 88, 18);
INSERT INTO `product_images` VALUES (89, 89, 18);
INSERT INTO `product_images` VALUES (90, 90, 18);
INSERT INTO `product_images` VALUES (91, 91, 19);
INSERT INTO `product_images` VALUES (92, 92, 19);
INSERT INTO `product_images` VALUES (93, 93, 19);
INSERT INTO `product_images` VALUES (94, 94, 19);
INSERT INTO `product_images` VALUES (95, 95, 19);
INSERT INTO `product_images` VALUES (96, 96, 20);
INSERT INTO `product_images` VALUES (97, 97, 20);
INSERT INTO `product_images` VALUES (98, 98, 20);
INSERT INTO `product_images` VALUES (99, 99, 20);
INSERT INTO `product_images` VALUES (100, 100, 20);
INSERT INTO `product_images` VALUES (101, 101, 21);
INSERT INTO `product_images` VALUES (102, 102, 21);
INSERT INTO `product_images` VALUES (103, 103, 21);
INSERT INTO `product_images` VALUES (104, 104, 21);
INSERT INTO `product_images` VALUES (105, 105, 21);
INSERT INTO `product_images` VALUES (106, 106, 22);
INSERT INTO `product_images` VALUES (107, 107, 22);
INSERT INTO `product_images` VALUES (108, 108, 22);
INSERT INTO `product_images` VALUES (109, 109, 22);
INSERT INTO `product_images` VALUES (110, 110, 22);
INSERT INTO `product_images` VALUES (111, 111, 23);
INSERT INTO `product_images` VALUES (112, 112, 23);
INSERT INTO `product_images` VALUES (113, 113, 23);
INSERT INTO `product_images` VALUES (114, 114, 23);
INSERT INTO `product_images` VALUES (115, 115, 23);
INSERT INTO `product_images` VALUES (116, 116, 24);
INSERT INTO `product_images` VALUES (117, 117, 24);
INSERT INTO `product_images` VALUES (118, 118, 24);
INSERT INTO `product_images` VALUES (119, 119, 24);
INSERT INTO `product_images` VALUES (120, 120, 24);
INSERT INTO `product_images` VALUES (121, 121, 25);
INSERT INTO `product_images` VALUES (122, 122, 25);
INSERT INTO `product_images` VALUES (123, 123, 25);
INSERT INTO `product_images` VALUES (124, 124, 25);
INSERT INTO `product_images` VALUES (125, 125, 25);
INSERT INTO `product_images` VALUES (126, 126, 26);
INSERT INTO `product_images` VALUES (127, 127, 26);
INSERT INTO `product_images` VALUES (128, 128, 26);
INSERT INTO `product_images` VALUES (129, 129, 26);
INSERT INTO `product_images` VALUES (130, 130, 26);
INSERT INTO `product_images` VALUES (131, 131, 27);
INSERT INTO `product_images` VALUES (132, 132, 27);
INSERT INTO `product_images` VALUES (133, 133, 27);
INSERT INTO `product_images` VALUES (134, 134, 27);
INSERT INTO `product_images` VALUES (135, 135, 27);
INSERT INTO `product_images` VALUES (136, 136, 28);
INSERT INTO `product_images` VALUES (137, 137, 28);
INSERT INTO `product_images` VALUES (138, 138, 28);
INSERT INTO `product_images` VALUES (139, 139, 28);
INSERT INTO `product_images` VALUES (140, 140, 28);
INSERT INTO `product_images` VALUES (141, 141, 29);
INSERT INTO `product_images` VALUES (142, 142, 29);
INSERT INTO `product_images` VALUES (143, 143, 29);
INSERT INTO `product_images` VALUES (144, 144, 29);
INSERT INTO `product_images` VALUES (145, 145, 29);
INSERT INTO `product_images` VALUES (146, 146, 30);
INSERT INTO `product_images` VALUES (147, 147, 30);
INSERT INTO `product_images` VALUES (148, 148, 30);
INSERT INTO `product_images` VALUES (149, 149, 30);
INSERT INTO `product_images` VALUES (150, 150, 30);
INSERT INTO `product_images` VALUES (151, 151, 31);
INSERT INTO `product_images` VALUES (152, 152, 31);
INSERT INTO `product_images` VALUES (153, 153, 31);
INSERT INTO `product_images` VALUES (154, 154, 31);
INSERT INTO `product_images` VALUES (155, 155, 31);
INSERT INTO `product_images` VALUES (156, 156, 32);
INSERT INTO `product_images` VALUES (157, 157, 32);
INSERT INTO `product_images` VALUES (158, 158, 32);
INSERT INTO `product_images` VALUES (159, 159, 32);
INSERT INTO `product_images` VALUES (160, 160, 32);
INSERT INTO `product_images` VALUES (161, 161, 33);
INSERT INTO `product_images` VALUES (162, 162, 33);
INSERT INTO `product_images` VALUES (163, 163, 33);
INSERT INTO `product_images` VALUES (164, 164, 33);
INSERT INTO `product_images` VALUES (165, 165, 33);
INSERT INTO `product_images` VALUES (166, 166, 34);
INSERT INTO `product_images` VALUES (167, 167, 34);
INSERT INTO `product_images` VALUES (168, 168, 34);
INSERT INTO `product_images` VALUES (169, 169, 34);
INSERT INTO `product_images` VALUES (170, 170, 34);
INSERT INTO `product_images` VALUES (171, 171, 35);
INSERT INTO `product_images` VALUES (172, 172, 35);
INSERT INTO `product_images` VALUES (173, 173, 35);
INSERT INTO `product_images` VALUES (174, 174, 35);
INSERT INTO `product_images` VALUES (175, 175, 35);
INSERT INTO `product_images` VALUES (176, 176, 36);
INSERT INTO `product_images` VALUES (177, 177, 36);
INSERT INTO `product_images` VALUES (178, 178, 36);
INSERT INTO `product_images` VALUES (179, 179, 36);
INSERT INTO `product_images` VALUES (180, 180, 36);
INSERT INTO `product_images` VALUES (181, 181, 37);
INSERT INTO `product_images` VALUES (182, 182, 37);
INSERT INTO `product_images` VALUES (183, 183, 37);
INSERT INTO `product_images` VALUES (184, 184, 37);
INSERT INTO `product_images` VALUES (185, 185, 37);
INSERT INTO `product_images` VALUES (186, 186, 38);
INSERT INTO `product_images` VALUES (187, 187, 38);
INSERT INTO `product_images` VALUES (188, 188, 38);
INSERT INTO `product_images` VALUES (189, 189, 38);
INSERT INTO `product_images` VALUES (190, 190, 38);
INSERT INTO `product_images` VALUES (191, 191, 39);
INSERT INTO `product_images` VALUES (192, 192, 39);
INSERT INTO `product_images` VALUES (193, 193, 39);
INSERT INTO `product_images` VALUES (194, 194, 39);
INSERT INTO `product_images` VALUES (195, 195, 39);
INSERT INTO `product_images` VALUES (196, 196, 40);
INSERT INTO `product_images` VALUES (197, 197, 40);
INSERT INTO `product_images` VALUES (198, 198, 40);
INSERT INTO `product_images` VALUES (199, 199, 40);
INSERT INTO `product_images` VALUES (200, 200, 40);
INSERT INTO `product_images` VALUES (201, 201, 41);
INSERT INTO `product_images` VALUES (202, 202, 41);
INSERT INTO `product_images` VALUES (203, 203, 41);
INSERT INTO `product_images` VALUES (204, 204, 41);
INSERT INTO `product_images` VALUES (205, 205, 41);
INSERT INTO `product_images` VALUES (206, 206, 42);
INSERT INTO `product_images` VALUES (207, 207, 42);
INSERT INTO `product_images` VALUES (208, 208, 42);
INSERT INTO `product_images` VALUES (209, 209, 42);
INSERT INTO `product_images` VALUES (210, 210, 42);
INSERT INTO `product_images` VALUES (211, 211, 43);
INSERT INTO `product_images` VALUES (212, 212, 43);
INSERT INTO `product_images` VALUES (213, 213, 43);
INSERT INTO `product_images` VALUES (214, 214, 43);
INSERT INTO `product_images` VALUES (215, 215, 43);
INSERT INTO `product_images` VALUES (216, 216, 44);
INSERT INTO `product_images` VALUES (217, 217, 44);
INSERT INTO `product_images` VALUES (218, 218, 44);
INSERT INTO `product_images` VALUES (219, 219, 44);
INSERT INTO `product_images` VALUES (220, 220, 44);
INSERT INTO `product_images` VALUES (221, 221, 45);
INSERT INTO `product_images` VALUES (222, 222, 45);
INSERT INTO `product_images` VALUES (223, 223, 45);
INSERT INTO `product_images` VALUES (224, 224, 45);
INSERT INTO `product_images` VALUES (225, 225, 45);
INSERT INTO `product_images` VALUES (226, 226, 46);
INSERT INTO `product_images` VALUES (227, 227, 46);
INSERT INTO `product_images` VALUES (228, 228, 46);
INSERT INTO `product_images` VALUES (229, 229, 46);
INSERT INTO `product_images` VALUES (230, 230, 46);
INSERT INTO `product_images` VALUES (231, 231, 47);
INSERT INTO `product_images` VALUES (232, 232, 47);
INSERT INTO `product_images` VALUES (233, 233, 47);
INSERT INTO `product_images` VALUES (234, 234, 47);
INSERT INTO `product_images` VALUES (235, 235, 47);
INSERT INTO `product_images` VALUES (236, 236, 48);
INSERT INTO `product_images` VALUES (237, 237, 48);
INSERT INTO `product_images` VALUES (238, 238, 48);
INSERT INTO `product_images` VALUES (239, 239, 48);
INSERT INTO `product_images` VALUES (240, 240, 48);
INSERT INTO `product_images` VALUES (241, 241, 49);
INSERT INTO `product_images` VALUES (242, 242, 49);
INSERT INTO `product_images` VALUES (243, 243, 49);
INSERT INTO `product_images` VALUES (244, 244, 49);
INSERT INTO `product_images` VALUES (245, 245, 49);
INSERT INTO `product_images` VALUES (246, 246, 50);
INSERT INTO `product_images` VALUES (247, 247, 50);
INSERT INTO `product_images` VALUES (248, 248, 50);
INSERT INTO `product_images` VALUES (249, 249, 50);
INSERT INTO `product_images` VALUES (250, 250, 50);
INSERT INTO `product_images` VALUES (251, 251, 51);
INSERT INTO `product_images` VALUES (252, 252, 51);
INSERT INTO `product_images` VALUES (253, 253, 51);
INSERT INTO `product_images` VALUES (254, 254, 51);
INSERT INTO `product_images` VALUES (255, 255, 51);
INSERT INTO `product_images` VALUES (256, 256, 52);
INSERT INTO `product_images` VALUES (257, 257, 52);
INSERT INTO `product_images` VALUES (258, 258, 52);
INSERT INTO `product_images` VALUES (259, 259, 52);
INSERT INTO `product_images` VALUES (260, 260, 52);
INSERT INTO `product_images` VALUES (261, 261, 53);
INSERT INTO `product_images` VALUES (262, 262, 53);
INSERT INTO `product_images` VALUES (263, 263, 53);
INSERT INTO `product_images` VALUES (264, 264, 53);
INSERT INTO `product_images` VALUES (265, 265, 53);
INSERT INTO `product_images` VALUES (266, 266, 54);
INSERT INTO `product_images` VALUES (267, 267, 54);
INSERT INTO `product_images` VALUES (268, 268, 54);
INSERT INTO `product_images` VALUES (269, 269, 54);
INSERT INTO `product_images` VALUES (270, 270, 54);
INSERT INTO `product_images` VALUES (271, 271, 55);
INSERT INTO `product_images` VALUES (272, 272, 55);
INSERT INTO `product_images` VALUES (273, 273, 55);
INSERT INTO `product_images` VALUES (274, 274, 55);
INSERT INTO `product_images` VALUES (275, 275, 55);
INSERT INTO `product_images` VALUES (276, 276, 56);
INSERT INTO `product_images` VALUES (277, 277, 56);
INSERT INTO `product_images` VALUES (278, 278, 56);
INSERT INTO `product_images` VALUES (279, 279, 56);
INSERT INTO `product_images` VALUES (280, 280, 56);
INSERT INTO `product_images` VALUES (281, 281, 57);
INSERT INTO `product_images` VALUES (282, 282, 57);
INSERT INTO `product_images` VALUES (283, 283, 57);
INSERT INTO `product_images` VALUES (284, 284, 57);
INSERT INTO `product_images` VALUES (285, 285, 57);
INSERT INTO `product_images` VALUES (286, 286, 58);
INSERT INTO `product_images` VALUES (287, 287, 58);
INSERT INTO `product_images` VALUES (288, 288, 58);
INSERT INTO `product_images` VALUES (289, 289, 58);
INSERT INTO `product_images` VALUES (290, 290, 58);
INSERT INTO `product_images` VALUES (291, 291, 59);
INSERT INTO `product_images` VALUES (292, 292, 59);
INSERT INTO `product_images` VALUES (293, 293, 59);
INSERT INTO `product_images` VALUES (294, 294, 59);
INSERT INTO `product_images` VALUES (295, 295, 59);
INSERT INTO `product_images` VALUES (296, 296, 60);
INSERT INTO `product_images` VALUES (297, 297, 60);
INSERT INTO `product_images` VALUES (298, 298, 60);
INSERT INTO `product_images` VALUES (299, 299, 60);
INSERT INTO `product_images` VALUES (300, 300, 60);
INSERT INTO `product_images` VALUES (301, 301, 61);
INSERT INTO `product_images` VALUES (302, 302, 61);
INSERT INTO `product_images` VALUES (303, 303, 61);
INSERT INTO `product_images` VALUES (304, 304, 61);
INSERT INTO `product_images` VALUES (305, 305, 61);
INSERT INTO `product_images` VALUES (306, 306, 62);
INSERT INTO `product_images` VALUES (307, 307, 62);
INSERT INTO `product_images` VALUES (308, 308, 62);
INSERT INTO `product_images` VALUES (309, 309, 62);
INSERT INTO `product_images` VALUES (310, 310, 62);
INSERT INTO `product_images` VALUES (311, 311, 63);
INSERT INTO `product_images` VALUES (312, 312, 63);
INSERT INTO `product_images` VALUES (313, 313, 63);
INSERT INTO `product_images` VALUES (314, 314, 63);
INSERT INTO `product_images` VALUES (315, 315, 63);
INSERT INTO `product_images` VALUES (316, 316, 64);
INSERT INTO `product_images` VALUES (317, 317, 64);
INSERT INTO `product_images` VALUES (318, 318, 64);
INSERT INTO `product_images` VALUES (319, 319, 64);
INSERT INTO `product_images` VALUES (320, 320, 64);
INSERT INTO `product_images` VALUES (321, 321, 65);
INSERT INTO `product_images` VALUES (322, 322, 65);
INSERT INTO `product_images` VALUES (323, 323, 65);
INSERT INTO `product_images` VALUES (324, 324, 65);
INSERT INTO `product_images` VALUES (325, 325, 65);
INSERT INTO `product_images` VALUES (326, 326, 66);
INSERT INTO `product_images` VALUES (327, 327, 66);
INSERT INTO `product_images` VALUES (328, 328, 66);
INSERT INTO `product_images` VALUES (329, 329, 66);
INSERT INTO `product_images` VALUES (330, 330, 66);
INSERT INTO `product_images` VALUES (331, 331, 67);
INSERT INTO `product_images` VALUES (332, 332, 67);
INSERT INTO `product_images` VALUES (333, 333, 67);
INSERT INTO `product_images` VALUES (334, 334, 67);
INSERT INTO `product_images` VALUES (335, 335, 67);
INSERT INTO `product_images` VALUES (336, 336, 68);
INSERT INTO `product_images` VALUES (337, 337, 68);
INSERT INTO `product_images` VALUES (338, 338, 68);
INSERT INTO `product_images` VALUES (339, 339, 68);
INSERT INTO `product_images` VALUES (340, 340, 68);
INSERT INTO `product_images` VALUES (341, 341, 69);
INSERT INTO `product_images` VALUES (342, 342, 69);
INSERT INTO `product_images` VALUES (343, 343, 69);
INSERT INTO `product_images` VALUES (344, 344, 69);
INSERT INTO `product_images` VALUES (345, 345, 69);
INSERT INTO `product_images` VALUES (346, 346, 70);
INSERT INTO `product_images` VALUES (347, 347, 70);
INSERT INTO `product_images` VALUES (348, 348, 70);
INSERT INTO `product_images` VALUES (349, 349, 70);
INSERT INTO `product_images` VALUES (350, 350, 70);
INSERT INTO `product_images` VALUES (351, 351, 71);
INSERT INTO `product_images` VALUES (352, 352, 71);
INSERT INTO `product_images` VALUES (353, 353, 71);
INSERT INTO `product_images` VALUES (354, 354, 71);
INSERT INTO `product_images` VALUES (355, 355, 71);
INSERT INTO `product_images` VALUES (356, 356, 72);
INSERT INTO `product_images` VALUES (357, 357, 72);
INSERT INTO `product_images` VALUES (358, 358, 72);
INSERT INTO `product_images` VALUES (359, 359, 72);
INSERT INTO `product_images` VALUES (360, 360, 72);
INSERT INTO `product_images` VALUES (361, 361, 73);
INSERT INTO `product_images` VALUES (362, 362, 73);
INSERT INTO `product_images` VALUES (363, 363, 73);
INSERT INTO `product_images` VALUES (364, 364, 73);
INSERT INTO `product_images` VALUES (365, 365, 73);
INSERT INTO `product_images` VALUES (366, 366, 74);
INSERT INTO `product_images` VALUES (367, 367, 74);
INSERT INTO `product_images` VALUES (368, 368, 74);
INSERT INTO `product_images` VALUES (369, 369, 74);
INSERT INTO `product_images` VALUES (370, 370, 74);
INSERT INTO `product_images` VALUES (371, 371, 75);
INSERT INTO `product_images` VALUES (372, 372, 75);
INSERT INTO `product_images` VALUES (373, 373, 75);
INSERT INTO `product_images` VALUES (374, 374, 75);
INSERT INTO `product_images` VALUES (375, 375, 75);
INSERT INTO `product_images` VALUES (376, 376, 76);
INSERT INTO `product_images` VALUES (377, 377, 76);
INSERT INTO `product_images` VALUES (378, 378, 76);
INSERT INTO `product_images` VALUES (379, 379, 76);
INSERT INTO `product_images` VALUES (380, 380, 76);
INSERT INTO `product_images` VALUES (381, 381, 77);
INSERT INTO `product_images` VALUES (382, 382, 77);
INSERT INTO `product_images` VALUES (383, 383, 77);
INSERT INTO `product_images` VALUES (384, 384, 77);
INSERT INTO `product_images` VALUES (385, 385, 77);
INSERT INTO `product_images` VALUES (386, 386, 78);
INSERT INTO `product_images` VALUES (387, 387, 78);
INSERT INTO `product_images` VALUES (388, 388, 78);
INSERT INTO `product_images` VALUES (389, 389, 78);
INSERT INTO `product_images` VALUES (390, 390, 78);
INSERT INTO `product_images` VALUES (391, 391, 79);
INSERT INTO `product_images` VALUES (392, 392, 79);
INSERT INTO `product_images` VALUES (393, 393, 79);
INSERT INTO `product_images` VALUES (394, 394, 79);
INSERT INTO `product_images` VALUES (395, 395, 79);
INSERT INTO `product_images` VALUES (396, 396, 80);
INSERT INTO `product_images` VALUES (397, 397, 80);
INSERT INTO `product_images` VALUES (398, 398, 80);
INSERT INTO `product_images` VALUES (399, 399, 80);
INSERT INTO `product_images` VALUES (400, 400, 80);
INSERT INTO `product_images` VALUES (401, 401, 81);
INSERT INTO `product_images` VALUES (402, 402, 81);
INSERT INTO `product_images` VALUES (403, 403, 81);
INSERT INTO `product_images` VALUES (404, 404, 81);
INSERT INTO `product_images` VALUES (405, 405, 81);
INSERT INTO `product_images` VALUES (406, 406, 82);
INSERT INTO `product_images` VALUES (407, 407, 82);
INSERT INTO `product_images` VALUES (408, 408, 82);
INSERT INTO `product_images` VALUES (409, 409, 82);
INSERT INTO `product_images` VALUES (410, 410, 82);
INSERT INTO `product_images` VALUES (411, 411, 83);
INSERT INTO `product_images` VALUES (412, 412, 83);
INSERT INTO `product_images` VALUES (413, 413, 83);
INSERT INTO `product_images` VALUES (414, 414, 83);
INSERT INTO `product_images` VALUES (415, 415, 83);
INSERT INTO `product_images` VALUES (416, 416, 84);
INSERT INTO `product_images` VALUES (417, 417, 84);
INSERT INTO `product_images` VALUES (418, 418, 84);
INSERT INTO `product_images` VALUES (419, 419, 84);
INSERT INTO `product_images` VALUES (420, 420, 84);
INSERT INTO `product_images` VALUES (421, 421, 85);
INSERT INTO `product_images` VALUES (422, 422, 85);
INSERT INTO `product_images` VALUES (423, 423, 85);
INSERT INTO `product_images` VALUES (424, 424, 85);
INSERT INTO `product_images` VALUES (425, 425, 85);
INSERT INTO `product_images` VALUES (426, 426, 86);
INSERT INTO `product_images` VALUES (427, 427, 86);
INSERT INTO `product_images` VALUES (428, 428, 86);
INSERT INTO `product_images` VALUES (429, 429, 86);
INSERT INTO `product_images` VALUES (430, 430, 86);
INSERT INTO `product_images` VALUES (431, 431, 87);
INSERT INTO `product_images` VALUES (432, 432, 87);
INSERT INTO `product_images` VALUES (433, 433, 87);
INSERT INTO `product_images` VALUES (434, 434, 87);
INSERT INTO `product_images` VALUES (435, 435, 87);
INSERT INTO `product_images` VALUES (436, 436, 88);
INSERT INTO `product_images` VALUES (437, 437, 88);
INSERT INTO `product_images` VALUES (438, 438, 88);
INSERT INTO `product_images` VALUES (439, 439, 88);
INSERT INTO `product_images` VALUES (440, 440, 88);
INSERT INTO `product_images` VALUES (441, 441, 89);
INSERT INTO `product_images` VALUES (442, 442, 89);
INSERT INTO `product_images` VALUES (443, 443, 89);
INSERT INTO `product_images` VALUES (444, 444, 89);
INSERT INTO `product_images` VALUES (445, 445, 89);
INSERT INTO `product_images` VALUES (446, 446, 90);
INSERT INTO `product_images` VALUES (447, 447, 90);
INSERT INTO `product_images` VALUES (448, 448, 90);
INSERT INTO `product_images` VALUES (449, 449, 90);
INSERT INTO `product_images` VALUES (450, 450, 90);
INSERT INTO `product_images` VALUES (451, 451, 91);
INSERT INTO `product_images` VALUES (452, 452, 91);
INSERT INTO `product_images` VALUES (453, 453, 91);
INSERT INTO `product_images` VALUES (454, 454, 91);
INSERT INTO `product_images` VALUES (455, 455, 91);
INSERT INTO `product_images` VALUES (456, 456, 92);
INSERT INTO `product_images` VALUES (457, 457, 92);
INSERT INTO `product_images` VALUES (458, 458, 92);
INSERT INTO `product_images` VALUES (459, 459, 92);
INSERT INTO `product_images` VALUES (460, 460, 92);
INSERT INTO `product_images` VALUES (461, 461, 93);
INSERT INTO `product_images` VALUES (462, 462, 93);
INSERT INTO `product_images` VALUES (463, 463, 93);
INSERT INTO `product_images` VALUES (464, 464, 93);
INSERT INTO `product_images` VALUES (465, 465, 93);
INSERT INTO `product_images` VALUES (466, 466, 94);
INSERT INTO `product_images` VALUES (467, 467, 94);
INSERT INTO `product_images` VALUES (468, 468, 94);
INSERT INTO `product_images` VALUES (469, 469, 94);
INSERT INTO `product_images` VALUES (470, 470, 94);
INSERT INTO `product_images` VALUES (471, 471, 95);
INSERT INTO `product_images` VALUES (472, 472, 95);
INSERT INTO `product_images` VALUES (473, 473, 95);
INSERT INTO `product_images` VALUES (474, 474, 95);
INSERT INTO `product_images` VALUES (475, 475, 95);
INSERT INTO `product_images` VALUES (476, 476, 96);
INSERT INTO `product_images` VALUES (477, 477, 96);
INSERT INTO `product_images` VALUES (478, 478, 96);
INSERT INTO `product_images` VALUES (479, 479, 96);
INSERT INTO `product_images` VALUES (480, 480, 96);
INSERT INTO `product_images` VALUES (481, 481, 97);
INSERT INTO `product_images` VALUES (482, 482, 97);
INSERT INTO `product_images` VALUES (483, 483, 97);
INSERT INTO `product_images` VALUES (484, 484, 97);
INSERT INTO `product_images` VALUES (485, 485, 97);
INSERT INTO `product_images` VALUES (486, 486, 98);
INSERT INTO `product_images` VALUES (487, 487, 98);
INSERT INTO `product_images` VALUES (488, 488, 98);
INSERT INTO `product_images` VALUES (489, 489, 98);
INSERT INTO `product_images` VALUES (490, 490, 98);
INSERT INTO `product_images` VALUES (491, 491, 99);
INSERT INTO `product_images` VALUES (492, 492, 99);
INSERT INTO `product_images` VALUES (493, 493, 99);
INSERT INTO `product_images` VALUES (494, 494, 99);
INSERT INTO `product_images` VALUES (495, 495, 99);
INSERT INTO `product_images` VALUES (496, 496, 100);
INSERT INTO `product_images` VALUES (497, 497, 100);
INSERT INTO `product_images` VALUES (498, 498, 100);
INSERT INTO `product_images` VALUES (499, 499, 100);
INSERT INTO `product_images` VALUES (500, 500, 100);
INSERT INTO `product_images` VALUES (501, 501, 101);
INSERT INTO `product_images` VALUES (502, 502, 101);
INSERT INTO `product_images` VALUES (503, 503, 101);
INSERT INTO `product_images` VALUES (504, 504, 101);
INSERT INTO `product_images` VALUES (505, 505, 101);
INSERT INTO `product_images` VALUES (506, 506, 102);
INSERT INTO `product_images` VALUES (507, 507, 102);
INSERT INTO `product_images` VALUES (508, 508, 102);
INSERT INTO `product_images` VALUES (509, 509, 102);
INSERT INTO `product_images` VALUES (510, 510, 102);
INSERT INTO `product_images` VALUES (511, 511, 103);
INSERT INTO `product_images` VALUES (512, 512, 103);
INSERT INTO `product_images` VALUES (513, 513, 103);
INSERT INTO `product_images` VALUES (514, 514, 103);
INSERT INTO `product_images` VALUES (515, 515, 103);
INSERT INTO `product_images` VALUES (516, 516, 104);
INSERT INTO `product_images` VALUES (517, 517, 104);
INSERT INTO `product_images` VALUES (518, 518, 104);
INSERT INTO `product_images` VALUES (519, 519, 104);
INSERT INTO `product_images` VALUES (520, 520, 104);
INSERT INTO `product_images` VALUES (521, 521, 105);
INSERT INTO `product_images` VALUES (522, 522, 105);
INSERT INTO `product_images` VALUES (523, 523, 105);
INSERT INTO `product_images` VALUES (524, 524, 105);
INSERT INTO `product_images` VALUES (525, 525, 105);
INSERT INTO `product_images` VALUES (526, 526, 106);
INSERT INTO `product_images` VALUES (527, 527, 106);
INSERT INTO `product_images` VALUES (528, 528, 106);
INSERT INTO `product_images` VALUES (529, 529, 106);
INSERT INTO `product_images` VALUES (530, 530, 106);
INSERT INTO `product_images` VALUES (531, 531, 107);
INSERT INTO `product_images` VALUES (532, 532, 107);
INSERT INTO `product_images` VALUES (533, 533, 107);
INSERT INTO `product_images` VALUES (534, 534, 107);
INSERT INTO `product_images` VALUES (535, 535, 107);
INSERT INTO `product_images` VALUES (536, 536, 108);
INSERT INTO `product_images` VALUES (537, 537, 108);
INSERT INTO `product_images` VALUES (538, 538, 108);
INSERT INTO `product_images` VALUES (539, 539, 108);
INSERT INTO `product_images` VALUES (540, 540, 108);
INSERT INTO `product_images` VALUES (541, 541, 109);
INSERT INTO `product_images` VALUES (542, 542, 109);
INSERT INTO `product_images` VALUES (543, 543, 109);
INSERT INTO `product_images` VALUES (544, 544, 109);
INSERT INTO `product_images` VALUES (545, 545, 109);
INSERT INTO `product_images` VALUES (546, 546, 110);
INSERT INTO `product_images` VALUES (547, 547, 110);
INSERT INTO `product_images` VALUES (548, 548, 110);
INSERT INTO `product_images` VALUES (549, 549, 110);
INSERT INTO `product_images` VALUES (550, 550, 110);
INSERT INTO `product_images` VALUES (551, 551, 111);
INSERT INTO `product_images` VALUES (552, 552, 111);
INSERT INTO `product_images` VALUES (553, 553, 111);
INSERT INTO `product_images` VALUES (554, 554, 111);
INSERT INTO `product_images` VALUES (555, 555, 111);
INSERT INTO `product_images` VALUES (556, 556, 112);
INSERT INTO `product_images` VALUES (557, 557, 112);
INSERT INTO `product_images` VALUES (558, 558, 112);
INSERT INTO `product_images` VALUES (559, 559, 112);
INSERT INTO `product_images` VALUES (560, 560, 112);
INSERT INTO `product_images` VALUES (561, 561, 113);
INSERT INTO `product_images` VALUES (562, 562, 113);
INSERT INTO `product_images` VALUES (563, 563, 113);
INSERT INTO `product_images` VALUES (564, 564, 113);
INSERT INTO `product_images` VALUES (565, 565, 113);
INSERT INTO `product_images` VALUES (566, 566, 114);
INSERT INTO `product_images` VALUES (567, 567, 114);
INSERT INTO `product_images` VALUES (568, 568, 114);
INSERT INTO `product_images` VALUES (569, 569, 114);
INSERT INTO `product_images` VALUES (570, 570, 114);
INSERT INTO `product_images` VALUES (571, 571, 115);
INSERT INTO `product_images` VALUES (572, 572, 115);
INSERT INTO `product_images` VALUES (573, 573, 115);
INSERT INTO `product_images` VALUES (574, 574, 115);
INSERT INTO `product_images` VALUES (575, 575, 115);
INSERT INTO `product_images` VALUES (576, 576, 116);
INSERT INTO `product_images` VALUES (577, 577, 116);
INSERT INTO `product_images` VALUES (578, 578, 116);
INSERT INTO `product_images` VALUES (579, 579, 116);
INSERT INTO `product_images` VALUES (580, 580, 116);
INSERT INTO `product_images` VALUES (581, 581, 117);
INSERT INTO `product_images` VALUES (582, 582, 117);
INSERT INTO `product_images` VALUES (583, 583, 117);
INSERT INTO `product_images` VALUES (584, 584, 117);
INSERT INTO `product_images` VALUES (585, 585, 117);
INSERT INTO `product_images` VALUES (586, 586, 118);
INSERT INTO `product_images` VALUES (587, 587, 118);
INSERT INTO `product_images` VALUES (588, 588, 118);
INSERT INTO `product_images` VALUES (589, 589, 118);
INSERT INTO `product_images` VALUES (590, 590, 118);
INSERT INTO `product_images` VALUES (591, 591, 119);
INSERT INTO `product_images` VALUES (592, 592, 119);
INSERT INTO `product_images` VALUES (593, 593, 119);
INSERT INTO `product_images` VALUES (594, 594, 119);
INSERT INTO `product_images` VALUES (595, 595, 119);
INSERT INTO `product_images` VALUES (596, 596, 120);
INSERT INTO `product_images` VALUES (597, 597, 120);
INSERT INTO `product_images` VALUES (598, 598, 120);
INSERT INTO `product_images` VALUES (599, 599, 120);
INSERT INTO `product_images` VALUES (600, 600, 120);
INSERT INTO `product_images` VALUES (601, 601, 121);
INSERT INTO `product_images` VALUES (602, 602, 121);
INSERT INTO `product_images` VALUES (603, 603, 121);
INSERT INTO `product_images` VALUES (604, 604, 121);
INSERT INTO `product_images` VALUES (605, 605, 121);
INSERT INTO `product_images` VALUES (606, 606, 122);
INSERT INTO `product_images` VALUES (607, 607, 122);
INSERT INTO `product_images` VALUES (608, 608, 122);
INSERT INTO `product_images` VALUES (609, 609, 122);
INSERT INTO `product_images` VALUES (610, 610, 122);
INSERT INTO `product_images` VALUES (611, 611, 123);
INSERT INTO `product_images` VALUES (612, 612, 123);
INSERT INTO `product_images` VALUES (613, 613, 123);
INSERT INTO `product_images` VALUES (614, 614, 123);
INSERT INTO `product_images` VALUES (615, 615, 123);
INSERT INTO `product_images` VALUES (616, 616, 124);
INSERT INTO `product_images` VALUES (617, 617, 124);
INSERT INTO `product_images` VALUES (618, 618, 124);
INSERT INTO `product_images` VALUES (619, 619, 124);
INSERT INTO `product_images` VALUES (620, 620, 124);
INSERT INTO `product_images` VALUES (621, 621, 125);
INSERT INTO `product_images` VALUES (622, 622, 125);
INSERT INTO `product_images` VALUES (623, 623, 125);
INSERT INTO `product_images` VALUES (624, 624, 125);
INSERT INTO `product_images` VALUES (625, 625, 125);
INSERT INTO `product_images` VALUES (626, 626, 126);
INSERT INTO `product_images` VALUES (627, 627, 126);
INSERT INTO `product_images` VALUES (628, 628, 126);
INSERT INTO `product_images` VALUES (629, 629, 126);
INSERT INTO `product_images` VALUES (630, 630, 126);
INSERT INTO `product_images` VALUES (631, 631, 127);
INSERT INTO `product_images` VALUES (632, 632, 127);
INSERT INTO `product_images` VALUES (633, 633, 127);
INSERT INTO `product_images` VALUES (634, 634, 127);
INSERT INTO `product_images` VALUES (635, 635, 127);
INSERT INTO `product_images` VALUES (636, 636, 128);
INSERT INTO `product_images` VALUES (637, 637, 128);
INSERT INTO `product_images` VALUES (638, 638, 128);
INSERT INTO `product_images` VALUES (639, 639, 128);
INSERT INTO `product_images` VALUES (640, 640, 128);
INSERT INTO `product_images` VALUES (641, 641, 129);
INSERT INTO `product_images` VALUES (642, 642, 129);
INSERT INTO `product_images` VALUES (643, 643, 129);
INSERT INTO `product_images` VALUES (644, 644, 129);
INSERT INTO `product_images` VALUES (645, 645, 129);
INSERT INTO `product_images` VALUES (646, 646, 130);
INSERT INTO `product_images` VALUES (647, 647, 130);
INSERT INTO `product_images` VALUES (648, 648, 130);
INSERT INTO `product_images` VALUES (649, 649, 130);
INSERT INTO `product_images` VALUES (650, 650, 130);
INSERT INTO `product_images` VALUES (651, 651, 131);
INSERT INTO `product_images` VALUES (652, 652, 131);
INSERT INTO `product_images` VALUES (653, 653, 131);
INSERT INTO `product_images` VALUES (654, 654, 131);
INSERT INTO `product_images` VALUES (655, 655, 131);
INSERT INTO `product_images` VALUES (656, 656, 132);
INSERT INTO `product_images` VALUES (657, 657, 132);
INSERT INTO `product_images` VALUES (658, 658, 132);
INSERT INTO `product_images` VALUES (659, 659, 132);
INSERT INTO `product_images` VALUES (660, 660, 132);
INSERT INTO `product_images` VALUES (661, 661, 133);
INSERT INTO `product_images` VALUES (662, 662, 133);
INSERT INTO `product_images` VALUES (663, 663, 133);
INSERT INTO `product_images` VALUES (664, 664, 133);
INSERT INTO `product_images` VALUES (665, 665, 133);
INSERT INTO `product_images` VALUES (666, 666, 134);
INSERT INTO `product_images` VALUES (667, 667, 134);
INSERT INTO `product_images` VALUES (668, 668, 134);
INSERT INTO `product_images` VALUES (669, 669, 134);
INSERT INTO `product_images` VALUES (670, 670, 134);
INSERT INTO `product_images` VALUES (671, 671, 135);
INSERT INTO `product_images` VALUES (672, 672, 135);
INSERT INTO `product_images` VALUES (673, 673, 135);
INSERT INTO `product_images` VALUES (674, 674, 135);
INSERT INTO `product_images` VALUES (675, 675, 135);
INSERT INTO `product_images` VALUES (676, 676, 136);
INSERT INTO `product_images` VALUES (677, 677, 136);
INSERT INTO `product_images` VALUES (678, 678, 136);
INSERT INTO `product_images` VALUES (679, 679, 136);
INSERT INTO `product_images` VALUES (680, 680, 136);
INSERT INTO `product_images` VALUES (681, 681, 137);
INSERT INTO `product_images` VALUES (682, 682, 137);
INSERT INTO `product_images` VALUES (683, 683, 137);
INSERT INTO `product_images` VALUES (684, 684, 137);
INSERT INTO `product_images` VALUES (685, 685, 137);
INSERT INTO `product_images` VALUES (686, 686, 138);
INSERT INTO `product_images` VALUES (687, 687, 138);
INSERT INTO `product_images` VALUES (688, 688, 138);
INSERT INTO `product_images` VALUES (689, 689, 138);
INSERT INTO `product_images` VALUES (690, 690, 138);
INSERT INTO `product_images` VALUES (691, 691, 139);
INSERT INTO `product_images` VALUES (692, 692, 139);
INSERT INTO `product_images` VALUES (693, 693, 139);
INSERT INTO `product_images` VALUES (694, 694, 139);
INSERT INTO `product_images` VALUES (695, 695, 139);
INSERT INTO `product_images` VALUES (696, 696, 140);
INSERT INTO `product_images` VALUES (697, 697, 140);
INSERT INTO `product_images` VALUES (698, 698, 140);
INSERT INTO `product_images` VALUES (699, 699, 140);
INSERT INTO `product_images` VALUES (700, 700, 140);
INSERT INTO `product_images` VALUES (701, 701, 141);
INSERT INTO `product_images` VALUES (702, 702, 141);
INSERT INTO `product_images` VALUES (703, 703, 141);
INSERT INTO `product_images` VALUES (704, 704, 141);
INSERT INTO `product_images` VALUES (705, 705, 141);
INSERT INTO `product_images` VALUES (706, 706, 142);
INSERT INTO `product_images` VALUES (707, 707, 142);
INSERT INTO `product_images` VALUES (708, 708, 142);
INSERT INTO `product_images` VALUES (709, 709, 142);
INSERT INTO `product_images` VALUES (710, 710, 142);
INSERT INTO `product_images` VALUES (711, 711, 143);
INSERT INTO `product_images` VALUES (712, 712, 143);
INSERT INTO `product_images` VALUES (713, 713, 143);
INSERT INTO `product_images` VALUES (714, 714, 143);
INSERT INTO `product_images` VALUES (715, 715, 143);
INSERT INTO `product_images` VALUES (716, 716, 144);
INSERT INTO `product_images` VALUES (717, 717, 144);
INSERT INTO `product_images` VALUES (718, 718, 144);
INSERT INTO `product_images` VALUES (719, 719, 144);
INSERT INTO `product_images` VALUES (720, 720, 144);
INSERT INTO `product_images` VALUES (721, 721, 145);
INSERT INTO `product_images` VALUES (722, 722, 145);
INSERT INTO `product_images` VALUES (723, 723, 145);
INSERT INTO `product_images` VALUES (724, 724, 145);
INSERT INTO `product_images` VALUES (725, 725, 145);
INSERT INTO `product_images` VALUES (726, 726, 146);
INSERT INTO `product_images` VALUES (727, 727, 146);
INSERT INTO `product_images` VALUES (728, 728, 146);
INSERT INTO `product_images` VALUES (729, 729, 146);
INSERT INTO `product_images` VALUES (730, 730, 146);
INSERT INTO `product_images` VALUES (731, 731, 147);
INSERT INTO `product_images` VALUES (732, 732, 147);
INSERT INTO `product_images` VALUES (733, 733, 147);
INSERT INTO `product_images` VALUES (734, 734, 147);
INSERT INTO `product_images` VALUES (735, 735, 147);
INSERT INTO `product_images` VALUES (736, 736, 148);
INSERT INTO `product_images` VALUES (737, 737, 148);
INSERT INTO `product_images` VALUES (738, 738, 148);
INSERT INTO `product_images` VALUES (739, 739, 148);
INSERT INTO `product_images` VALUES (740, 740, 148);
INSERT INTO `product_images` VALUES (741, 741, 149);
INSERT INTO `product_images` VALUES (742, 742, 149);
INSERT INTO `product_images` VALUES (743, 743, 149);
INSERT INTO `product_images` VALUES (744, 744, 149);
INSERT INTO `product_images` VALUES (745, 745, 149);
INSERT INTO `product_images` VALUES (746, 746, 150);
INSERT INTO `product_images` VALUES (747, 747, 150);
INSERT INTO `product_images` VALUES (748, 748, 150);
INSERT INTO `product_images` VALUES (749, 749, 150);
INSERT INTO `product_images` VALUES (750, 750, 150);
INSERT INTO `product_images` VALUES (751, 751, 151);
INSERT INTO `product_images` VALUES (752, 752, 151);
INSERT INTO `product_images` VALUES (753, 753, 151);
INSERT INTO `product_images` VALUES (754, 754, 151);
INSERT INTO `product_images` VALUES (755, 755, 151);
INSERT INTO `product_images` VALUES (756, 756, 152);
INSERT INTO `product_images` VALUES (757, 757, 152);
INSERT INTO `product_images` VALUES (758, 758, 152);
INSERT INTO `product_images` VALUES (759, 759, 152);
INSERT INTO `product_images` VALUES (760, 760, 152);
INSERT INTO `product_images` VALUES (761, 761, 153);
INSERT INTO `product_images` VALUES (762, 762, 153);
INSERT INTO `product_images` VALUES (763, 763, 153);
INSERT INTO `product_images` VALUES (764, 764, 153);
INSERT INTO `product_images` VALUES (765, 765, 153);
INSERT INTO `product_images` VALUES (766, 766, 154);
INSERT INTO `product_images` VALUES (767, 767, 154);
INSERT INTO `product_images` VALUES (768, 768, 154);
INSERT INTO `product_images` VALUES (769, 769, 154);
INSERT INTO `product_images` VALUES (770, 770, 154);
INSERT INTO `product_images` VALUES (771, 771, 155);
INSERT INTO `product_images` VALUES (772, 772, 155);
INSERT INTO `product_images` VALUES (773, 773, 155);
INSERT INTO `product_images` VALUES (774, 774, 155);
INSERT INTO `product_images` VALUES (775, 775, 155);
INSERT INTO `product_images` VALUES (776, 776, 156);
INSERT INTO `product_images` VALUES (777, 777, 156);
INSERT INTO `product_images` VALUES (778, 778, 156);
INSERT INTO `product_images` VALUES (779, 779, 156);
INSERT INTO `product_images` VALUES (780, 780, 156);
INSERT INTO `product_images` VALUES (781, 781, 157);
INSERT INTO `product_images` VALUES (782, 782, 157);
INSERT INTO `product_images` VALUES (783, 783, 157);
INSERT INTO `product_images` VALUES (784, 784, 157);
INSERT INTO `product_images` VALUES (785, 785, 157);
INSERT INTO `product_images` VALUES (786, 786, 158);
INSERT INTO `product_images` VALUES (787, 787, 158);
INSERT INTO `product_images` VALUES (788, 788, 158);
INSERT INTO `product_images` VALUES (789, 789, 158);
INSERT INTO `product_images` VALUES (790, 790, 158);
INSERT INTO `product_images` VALUES (791, 791, 159);
INSERT INTO `product_images` VALUES (792, 792, 159);
INSERT INTO `product_images` VALUES (793, 793, 159);
INSERT INTO `product_images` VALUES (794, 794, 159);
INSERT INTO `product_images` VALUES (795, 795, 159);
INSERT INTO `product_images` VALUES (796, 796, 160);
INSERT INTO `product_images` VALUES (797, 797, 160);
INSERT INTO `product_images` VALUES (798, 798, 160);
INSERT INTO `product_images` VALUES (799, 799, 160);
INSERT INTO `product_images` VALUES (800, 800, 160);
INSERT INTO `product_images` VALUES (801, 801, 161);
INSERT INTO `product_images` VALUES (802, 802, 161);
INSERT INTO `product_images` VALUES (803, 803, 161);
INSERT INTO `product_images` VALUES (804, 804, 161);
INSERT INTO `product_images` VALUES (805, 805, 161);
INSERT INTO `product_images` VALUES (806, 806, 162);
INSERT INTO `product_images` VALUES (807, 807, 162);
INSERT INTO `product_images` VALUES (808, 808, 162);
INSERT INTO `product_images` VALUES (809, 809, 162);
INSERT INTO `product_images` VALUES (810, 810, 162);
INSERT INTO `product_images` VALUES (811, 811, 163);
INSERT INTO `product_images` VALUES (812, 812, 163);
INSERT INTO `product_images` VALUES (813, 813, 163);
INSERT INTO `product_images` VALUES (814, 814, 163);
INSERT INTO `product_images` VALUES (815, 815, 163);
INSERT INTO `product_images` VALUES (816, 816, 164);
INSERT INTO `product_images` VALUES (817, 817, 164);
INSERT INTO `product_images` VALUES (818, 818, 164);
INSERT INTO `product_images` VALUES (819, 819, 164);
INSERT INTO `product_images` VALUES (820, 820, 164);
INSERT INTO `product_images` VALUES (821, 821, 165);
INSERT INTO `product_images` VALUES (822, 822, 165);
INSERT INTO `product_images` VALUES (823, 823, 165);
INSERT INTO `product_images` VALUES (824, 824, 165);
INSERT INTO `product_images` VALUES (825, 825, 165);
INSERT INTO `product_images` VALUES (826, 826, 166);
INSERT INTO `product_images` VALUES (827, 827, 166);
INSERT INTO `product_images` VALUES (828, 828, 166);
INSERT INTO `product_images` VALUES (829, 829, 166);
INSERT INTO `product_images` VALUES (830, 830, 166);
INSERT INTO `product_images` VALUES (831, 831, 167);
INSERT INTO `product_images` VALUES (832, 832, 167);
INSERT INTO `product_images` VALUES (833, 833, 167);
INSERT INTO `product_images` VALUES (834, 834, 167);
INSERT INTO `product_images` VALUES (835, 835, 167);
INSERT INTO `product_images` VALUES (836, 836, 168);
INSERT INTO `product_images` VALUES (837, 837, 168);
INSERT INTO `product_images` VALUES (838, 838, 168);
INSERT INTO `product_images` VALUES (839, 839, 168);
INSERT INTO `product_images` VALUES (840, 840, 168);
INSERT INTO `product_images` VALUES (841, 841, 169);
INSERT INTO `product_images` VALUES (842, 842, 169);
INSERT INTO `product_images` VALUES (843, 843, 169);
INSERT INTO `product_images` VALUES (844, 844, 169);
INSERT INTO `product_images` VALUES (845, 845, 169);
INSERT INTO `product_images` VALUES (846, 846, 170);
INSERT INTO `product_images` VALUES (847, 847, 170);
INSERT INTO `product_images` VALUES (848, 848, 170);
INSERT INTO `product_images` VALUES (849, 849, 170);
INSERT INTO `product_images` VALUES (850, 850, 170);
INSERT INTO `product_images` VALUES (851, 851, 171);
INSERT INTO `product_images` VALUES (852, 852, 171);
INSERT INTO `product_images` VALUES (853, 853, 171);
INSERT INTO `product_images` VALUES (854, 854, 171);
INSERT INTO `product_images` VALUES (855, 855, 171);
INSERT INTO `product_images` VALUES (856, 856, 172);
INSERT INTO `product_images` VALUES (857, 857, 172);
INSERT INTO `product_images` VALUES (858, 858, 172);
INSERT INTO `product_images` VALUES (859, 859, 172);
INSERT INTO `product_images` VALUES (860, 860, 172);
INSERT INTO `product_images` VALUES (861, 861, 173);
INSERT INTO `product_images` VALUES (862, 862, 173);
INSERT INTO `product_images` VALUES (863, 863, 173);
INSERT INTO `product_images` VALUES (864, 864, 173);
INSERT INTO `product_images` VALUES (865, 865, 173);
INSERT INTO `product_images` VALUES (866, 866, 174);
INSERT INTO `product_images` VALUES (867, 867, 174);
INSERT INTO `product_images` VALUES (868, 868, 174);
INSERT INTO `product_images` VALUES (869, 869, 174);
INSERT INTO `product_images` VALUES (870, 870, 174);
INSERT INTO `product_images` VALUES (871, 871, 175);
INSERT INTO `product_images` VALUES (872, 872, 175);
INSERT INTO `product_images` VALUES (873, 873, 175);
INSERT INTO `product_images` VALUES (874, 874, 175);
INSERT INTO `product_images` VALUES (875, 875, 175);
INSERT INTO `product_images` VALUES (876, 876, 176);
INSERT INTO `product_images` VALUES (877, 877, 176);
INSERT INTO `product_images` VALUES (878, 878, 176);
INSERT INTO `product_images` VALUES (879, 879, 176);
INSERT INTO `product_images` VALUES (880, 880, 176);
INSERT INTO `product_images` VALUES (881, 881, 177);
INSERT INTO `product_images` VALUES (882, 882, 177);
INSERT INTO `product_images` VALUES (883, 883, 177);
INSERT INTO `product_images` VALUES (884, 884, 177);
INSERT INTO `product_images` VALUES (885, 885, 177);
INSERT INTO `product_images` VALUES (886, 886, 178);
INSERT INTO `product_images` VALUES (887, 887, 178);
INSERT INTO `product_images` VALUES (888, 888, 178);
INSERT INTO `product_images` VALUES (889, 889, 178);
INSERT INTO `product_images` VALUES (890, 890, 178);
INSERT INTO `product_images` VALUES (891, 891, 179);
INSERT INTO `product_images` VALUES (892, 892, 179);
INSERT INTO `product_images` VALUES (893, 893, 179);
INSERT INTO `product_images` VALUES (894, 894, 179);
INSERT INTO `product_images` VALUES (895, 895, 179);
INSERT INTO `product_images` VALUES (896, 896, 180);
INSERT INTO `product_images` VALUES (897, 897, 180);
INSERT INTO `product_images` VALUES (898, 898, 180);
INSERT INTO `product_images` VALUES (899, 899, 180);
INSERT INTO `product_images` VALUES (900, 900, 180);
INSERT INTO `product_images` VALUES (901, 901, 181);
INSERT INTO `product_images` VALUES (902, 902, 181);
INSERT INTO `product_images` VALUES (903, 903, 181);
INSERT INTO `product_images` VALUES (904, 904, 181);
INSERT INTO `product_images` VALUES (905, 905, 181);
INSERT INTO `product_images` VALUES (906, 906, 182);
INSERT INTO `product_images` VALUES (907, 907, 182);
INSERT INTO `product_images` VALUES (908, 908, 182);
INSERT INTO `product_images` VALUES (909, 909, 182);
INSERT INTO `product_images` VALUES (910, 910, 182);
INSERT INTO `product_images` VALUES (911, 911, 183);
INSERT INTO `product_images` VALUES (912, 912, 183);
INSERT INTO `product_images` VALUES (913, 913, 183);
INSERT INTO `product_images` VALUES (914, 914, 183);
INSERT INTO `product_images` VALUES (915, 915, 183);
INSERT INTO `product_images` VALUES (916, 916, 184);
INSERT INTO `product_images` VALUES (917, 917, 184);
INSERT INTO `product_images` VALUES (918, 918, 184);
INSERT INTO `product_images` VALUES (919, 919, 184);
INSERT INTO `product_images` VALUES (920, 920, 184);
INSERT INTO `product_images` VALUES (921, 921, 185);
INSERT INTO `product_images` VALUES (922, 922, 185);
INSERT INTO `product_images` VALUES (923, 923, 185);
INSERT INTO `product_images` VALUES (924, 924, 185);
INSERT INTO `product_images` VALUES (925, 925, 185);
INSERT INTO `product_images` VALUES (926, 926, 186);
INSERT INTO `product_images` VALUES (927, 927, 186);
INSERT INTO `product_images` VALUES (928, 928, 186);
INSERT INTO `product_images` VALUES (929, 929, 186);
INSERT INTO `product_images` VALUES (930, 930, 186);
INSERT INTO `product_images` VALUES (931, 931, 187);
INSERT INTO `product_images` VALUES (932, 932, 187);
INSERT INTO `product_images` VALUES (933, 933, 187);
INSERT INTO `product_images` VALUES (934, 934, 187);
INSERT INTO `product_images` VALUES (935, 935, 187);
INSERT INTO `product_images` VALUES (936, 936, 188);
INSERT INTO `product_images` VALUES (937, 937, 188);
INSERT INTO `product_images` VALUES (938, 938, 188);
INSERT INTO `product_images` VALUES (939, 939, 188);
INSERT INTO `product_images` VALUES (940, 940, 188);
INSERT INTO `product_images` VALUES (941, 941, 189);
INSERT INTO `product_images` VALUES (942, 942, 189);
INSERT INTO `product_images` VALUES (943, 943, 189);
INSERT INTO `product_images` VALUES (944, 944, 189);
INSERT INTO `product_images` VALUES (945, 945, 189);
INSERT INTO `product_images` VALUES (946, 946, 190);
INSERT INTO `product_images` VALUES (947, 947, 190);
INSERT INTO `product_images` VALUES (948, 948, 190);
INSERT INTO `product_images` VALUES (949, 949, 190);
INSERT INTO `product_images` VALUES (950, 950, 190);
INSERT INTO `product_images` VALUES (951, 951, 191);
INSERT INTO `product_images` VALUES (952, 952, 191);
INSERT INTO `product_images` VALUES (953, 953, 191);
INSERT INTO `product_images` VALUES (954, 954, 191);
INSERT INTO `product_images` VALUES (955, 955, 191);
INSERT INTO `product_images` VALUES (956, 956, 192);
INSERT INTO `product_images` VALUES (957, 957, 192);
INSERT INTO `product_images` VALUES (958, 958, 192);
INSERT INTO `product_images` VALUES (959, 959, 192);
INSERT INTO `product_images` VALUES (960, 960, 192);
INSERT INTO `product_images` VALUES (961, 961, 193);
INSERT INTO `product_images` VALUES (962, 962, 193);
INSERT INTO `product_images` VALUES (963, 963, 193);
INSERT INTO `product_images` VALUES (964, 964, 193);
INSERT INTO `product_images` VALUES (965, 965, 193);
INSERT INTO `product_images` VALUES (966, 966, 194);
INSERT INTO `product_images` VALUES (967, 967, 194);
INSERT INTO `product_images` VALUES (968, 968, 194);
INSERT INTO `product_images` VALUES (969, 969, 194);
INSERT INTO `product_images` VALUES (970, 970, 194);
INSERT INTO `product_images` VALUES (971, 971, 195);
INSERT INTO `product_images` VALUES (972, 972, 195);
INSERT INTO `product_images` VALUES (973, 973, 195);
INSERT INTO `product_images` VALUES (974, 974, 195);
INSERT INTO `product_images` VALUES (975, 975, 195);
INSERT INTO `product_images` VALUES (976, 976, 196);
INSERT INTO `product_images` VALUES (977, 977, 196);
INSERT INTO `product_images` VALUES (978, 978, 196);
INSERT INTO `product_images` VALUES (979, 979, 196);
INSERT INTO `product_images` VALUES (980, 980, 196);
INSERT INTO `product_images` VALUES (981, 981, 197);
INSERT INTO `product_images` VALUES (982, 982, 197);
INSERT INTO `product_images` VALUES (983, 983, 197);
INSERT INTO `product_images` VALUES (984, 984, 197);
INSERT INTO `product_images` VALUES (985, 985, 197);
INSERT INTO `product_images` VALUES (986, 986, 198);
INSERT INTO `product_images` VALUES (987, 987, 198);
INSERT INTO `product_images` VALUES (988, 988, 198);
INSERT INTO `product_images` VALUES (989, 989, 198);
INSERT INTO `product_images` VALUES (990, 990, 198);
INSERT INTO `product_images` VALUES (991, 991, 199);
INSERT INTO `product_images` VALUES (992, 992, 199);
INSERT INTO `product_images` VALUES (993, 993, 199);
INSERT INTO `product_images` VALUES (994, 994, 199);
INSERT INTO `product_images` VALUES (995, 995, 199);
INSERT INTO `product_images` VALUES (996, 996, 200);
INSERT INTO `product_images` VALUES (997, 997, 200);
INSERT INTO `product_images` VALUES (998, 998, 200);
INSERT INTO `product_images` VALUES (999, 999, 200);
INSERT INTO `product_images` VALUES (1000, 1000, 200);

-- ----------------------------
-- Table structure for product_types
-- ----------------------------
DROP TABLE IF EXISTS `product_types`;
CREATE TABLE `product_types`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_type_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_types
-- ----------------------------
INSERT INTO `product_types` VALUES (1, 'Bàn ghế');
INSERT INTO `product_types` VALUES (2, 'Giường');
INSERT INTO `product_types` VALUES (3, 'Tủ, kệ');

-- ----------------------------
-- Table structure for product_variants
-- ----------------------------
DROP TABLE IF EXISTS `product_variants`;
CREATE TABLE `product_variants`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `color_id` int NULL DEFAULT NULL,
  `size_id` int NULL DEFAULT NULL,
  `sku` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `inventory_quantity` int NOT NULL DEFAULT 0,
  `variant_price` decimal(10, 2) NOT NULL,
  `price_sale` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `discount_end_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sku`(`sku` ASC) USING BTREE,
  UNIQUE INDEX `uq_product_variant`(`product_id` ASC, `color_id` ASC, `size_id` ASC) USING BTREE,
  INDEX `fk_variant_color`(`color_id` ASC) USING BTREE,
  INDEX `fk_variant_size`(`size_id` ASC) USING BTREE,
  CONSTRAINT `fk_variant_color` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_variant_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_variant_size` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 859 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_variants
-- ----------------------------
INSERT INTO `product_variants` VALUES (1, 1, 9, 6, 'BG-PB-1', 1, 1200000.00, 12.00, '2026-01-29');
INSERT INTO `product_variants` VALUES (2, 1, 9, 7, 'BG-PB-2', 5, 1250000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (3, 1, 1, 6, 'BG-PB-3', 0, 1260.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (4, 1, 3, 7, 'BG-PB-4', 2, 1280000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (5, 2, 14, 26, 'BG-PB-5', 6, 7500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (6, 2, 14, 27, 'BG-PB-6', 5, 8500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (7, 2, 13, 26, 'BG-PB-7', 26, 8000000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (8, 2, 13, 27, 'BG-PB-8', 44, 7800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (9, 3, 3, 19, 'BG-PB-9', 10, 950000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (10, 3, 3, 18, 'BG-PB-10', 2, 850000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (11, 3, 9, 19, 'BG-PB-11', 10, 800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (12, 3, 9, 18, 'BG-PB-12', 4, 750000.00, 500000.00, NULL);
INSERT INTO `product_variants` VALUES (13, 4, 9, 18, 'BG-PB-13', 15, 1250000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (14, 4, 9, 19, 'BG-PB-14', 9, 1550000.00, 500000.00, NULL);
INSERT INTO `product_variants` VALUES (15, 4, 6, 18, 'BG-PB-15', 19, 1200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (16, 4, 6, 19, 'BG-PB-16', 8, 1500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (17, 5, 2, 22, 'BG-PB-17', 10, 4500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (18, 5, 3, 22, 'BG-PB-18', 8, 4500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (19, 5, 4, 22, 'BG-PB-19', 12, 4700000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (20, 6, 9, 18, 'BG-PB-20', 15, 5200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (21, 6, 3, 18, 'BG-PB-26', 0, 5350000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (22, 7, 9, 19, 'BG-PB-27', 15, 6500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (23, 7, 4, 19, 'BG-PB-28', 10, 6800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (24, 7, 1, 19, 'BG-PB-29', 12, 6500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (25, 8, 9, 18, 'BG-PB-30', 20, 3850000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (26, 8, 4, 18, 'BG-PB-31', 15, 3950000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (27, 8, 13, 18, 'BG-PB-32', 10, 3950000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (28, 9, 9, 19, 'BG-PB-33', 15, 7500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (29, 9, 6, 19, 'BG-PB-34', 10, 8200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (30, 9, 3, 19, 'BG-PB-35', 8, 8350000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (31, 10, 5, 18, 'BG-PB-36', 9, 2850000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (32, 10, 6, 18, 'BG-PB-37', 8, 2850000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (33, 10, 7, 18, 'BG-PB-38', 5, 2950000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (34, 11, 9, 19, 'BG-PB-39', 11, 6800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (35, 11, 4, 19, 'BG-PB-40', 7, 7100000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (36, 12, 9, 23, 'BG-PB-41', 10, 8900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (37, 12, 4, 23, 'BG-PB-42', 5, 9300000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (38, 13, 9, 20, 'BA-BD-01', 15, 8500000.00, 30.00, '2026-01-30');
INSERT INTO `product_variants` VALUES (39, 13, 5, 20, 'BA-BD-02', 10, 8800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (40, 14, 9, 21, 'BA-CT-12', 12, 7500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (41, 14, 4, 23, 'BA-CT-16', 8, 8500000.00, 14.00, '2026-01-30');
INSERT INTO `product_variants` VALUES (42, 15, 1, 21, 'BG-PK-33', 19, 5000000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (43, 15, 9, 21, 'BG-PK-34', 14, 5000000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (44, 15, 9, 22, 'BG-PK-35', 10, 5800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (45, 16, 9, 21, 'BG-PK-36', 25, 4700000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (46, 16, 4, 21, 'BG-PK-37', 18, 4700000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (47, 16, 1, 22, 'BG-PK-38', 11, 5400000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (48, 17, 9, 21, 'BG-PK-39', 9, 6900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (49, 17, 4, 21, 'BG-PK-40', 5, 7200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (50, 17, 9, 22, 'BG-PK-41', 5, 7800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (51, 18, 4, 21, 'BG-PK-42', 15, 6700000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (52, 18, 5, 21, 'BG-PK-43', 10, 6700000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (53, 18, 4, 22, 'BG-PK-44', 5, 7600000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (54, 19, 1, 21, 'BG-PK-45', 30, 5100000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (55, 19, 6, 21, 'BG-PK-46', 20, 5100000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (56, 19, 6, 22, 'BG-PK-47', 15, 5300000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (57, 19, 1, 22, 'BG-PK-48', 10, 5950000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (58, 20, 9, 21, 'BG-PK-49', 25, 4100000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (59, 20, 1, 21, 'BG-PK-50', 8, 4100000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (60, 20, 4, 22, 'BG-PK-51', 12, 4400000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (61, 20, 9, 22, 'BG-PK-52', 5, 4400000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (62, 21, 9, 21, 'BG-PK-53', 20, 6500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (63, 21, 4, 23, 'BG-PK-54', 5, 8200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (64, 21, 5, 22, 'BG-PK-55', 8, 7400000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (65, 21, 1, 20, 'BG-PK-56', 12, 6200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (66, 22, 1, 21, 'BG-PK-57', 15, 3800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (67, 22, 6, 22, 'BG-PK-58', 7, 4600000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (68, 22, 9, 20, 'BG-PK-59', 20, 3500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (69, 24, 1, 22, 'BG-PK-60', 5, 4800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (70, 24, 1, 23, 'BG-PK-61', 50, 950000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (71, 23, 1, 21, 'BG-PK-62', 100, 1200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (72, 23, 2, 23, 'BG-PK-63', 20, 1450000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (73, 23, 2, 21, 'BG-PK-64', 15, 1250000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (74, 25, 9, 20, 'BG-PK-69', 20, 5800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (75, 25, 9, 21, 'BG-PK-70', 15, 6800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (76, 25, 4, 20, 'BG-PK-71', 12, 5800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (77, 25, 4, 21, 'BG-PK-72', 10, 6800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (78, 26, 1, 24, 'BG-PK-73', 20, 2900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (79, 26, 1, 21, 'BG-PK-74', 15, 3500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (80, 26, 9, 24, 'BG-PK-75', 18, 2900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (81, 26, 9, 21, 'BG-PK-76', 12, 3500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (82, 27, 1, 22, 'BG-PK-77', 15, 4400000.00, 30.00, '2026-02-06');
INSERT INTO `product_variants` VALUES (83, 27, 1, 9, 'BG-PK-78', 10, 4700000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (84, 27, 9, 22, 'BG-PK-79', 12, 4400000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (85, 27, 9, 9, 'BG-PK-80', 8, 4700000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (86, 28, 9, 22, 'BG-PK-81', 10, 5900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (87, 28, 9, 9, 'BG-PK-82', 15, 6500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (88, 28, 4, 22, 'BG-PK-83', 8, 5900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (89, 28, 4, 9, 'BG-PK-84', 12, 6500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (90, 29, 1, 22, 'BG-PK-85', 20, 4000000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (145, 29, 1, 9, 'BG-PK-86', 15, 4300000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (146, 29, 9, 22, 'BG-PK-87', 18, 4000000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (147, 29, 9, 9, 'BG-PK-88', 12, 4300000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (148, 30, 4, 11, 'BG-PN-89', 10, 6800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (149, 30, 4, 22, 'BG-PN-90', 5, 7500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (150, 30, 9, 11, 'BG-PN-91', 12, 6800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (151, 30, 9, 22, 'BG-PN-92', 7, 7500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (152, 31, 1, 11, 'BG-PN-93', 15, 5500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (153, 31, 1, 34, 'BG-PN-94', 10, 6200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (154, 31, 9, 11, 'BG-PN-95', 12, 5500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (155, 31, 9, 34, 'BG-PN-96', 8, 6200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (156, 32, 9, 22, 'BG-PN-97', 20, 4800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (157, 32, 9, 11, 'BG-PN-98', 15, 4200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (158, 32, 1, 22, 'BG-PN-99', 20, 4800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (159, 32, 1, 11, 'BG-PN-100', 15, 4200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (160, 33, 9, 22, 'BG-PN-101', 10, 7500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (161, 33, 9, 9, 'BG-PN-102', 8, 8500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (162, 33, 1, 22, 'BG-PN-103', 12, 7500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (163, 33, 1, 9, 'BG-PN-104', 6, 8500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (164, 34, 1, 37, 'BG-PN-105', 15, 5000000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (165, 34, 1, 11, 'BG-PN-106', 10, 5300000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (166, 34, 9, 37, 'BG-PN-107', 12, 5000000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (167, 34, 9, 11, 'BG-PN-108', 8, 5300000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (168, 35, 1, 22, 'BG-PN-109', 10, 6500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (169, 35, 1, 9, 'BG-PN-110', 5, 7200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (170, 35, 9, 22, 'BG-PN-111', 10, 6500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (171, 35, 9, 9, 'BG-PN-112', 5, 7200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (172, 36, 9, 37, 'BG-PN-113', 20, 4200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (173, 36, 9, 35, 'BG-PN-114', 15, 4900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (174, 36, 1, 37, 'BG-PN-115', 20, 4200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (175, 36, 1, 35, 'BG-PN-116', 15, 4900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (176, 37, 1, 11, 'BG-PN-117', 20, 4500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (177, 37, 1, 22, 'BG-PN-118', 15, 5200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (178, 37, 9, 11, 'BG-PN-119', 20, 4500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (179, 37, 9, 22, 'BG-PN-120', 15, 5200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (180, 38, 1, 22, 'BG-PN-121', 25, 3800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (181, 38, 1, 11, 'BG-PN-122', 20, 3500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (182, 38, 9, 22, 'BG-PN-123', 25, 3800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (183, 38, 9, 11, 'BG-PN-124', 20, 3500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (184, 39, 9, 26, 'BG-PN-125', 10, 8500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (185, 39, 9, 9, 'BG-PN-126', 8, 7800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (186, 39, 1, 26, 'BG-PN-127', 10, 8500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (187, 39, 1, 9, 'BG-PN-128', 8, 7800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (188, 40, 1, 22, 'BG-PN-129', 15, 5800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (189, 40, 1, 11, 'BG-PN-130', 10, 5200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (190, 40, 9, 22, 'BG-PN-131', 15, 5800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (191, 40, 9, 11, 'BG-PN-132', 10, 5200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (192, 41, 1, 9, 'BG-PN-133', 20, 4500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (193, 41, 1, 22, 'BG-PN-134', 15, 3900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (194, 41, 9, 9, 'BG-PN-135', 20, 4500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (195, 41, 9, 22, 'BG-PN-136', 15, 3900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (196, 42, 9, 22, 'BG-PN-137', 15, 6200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (197, 42, 9, 9, 'BG-PN-138', 10, 6900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (198, 42, 4, 22, 'BG-PN-139', 15, 6200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (199, 42, 4, 9, 'BG-PN-140', 10, 6900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (200, 43, 9, 11, 'BG-PN-141', 12, 6500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (201, 43, 9, 22, 'BG-PN-142', 8, 7200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (202, 43, 1, 11, 'BG-PN-143', 12, 6500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (203, 43, 1, 22, 'BG-PN-144', 8, 7200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (204, 44, 9, 22, 'BG-PN-145', 15, 7500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (205, 44, 9, 11, 'BG-PN-146', 10, 6800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (206, 44, 1, 22, 'BG-PN-147', 15, 7500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (207, 44, 1, 11, 'BG-PN-148', 10, 6800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (216, 45, 1, 36, 'BG-PLV-149', 20, 3600000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (217, 45, 1, 37, 'BG-PLV-150', 20, 3900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (218, 45, 9, 36, 'BG-PLV-151', 15, 3600000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (219, 45, 9, 37, 'BG-PLV-152', 15, 3900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (220, 46, 1, 9, 'BG-PLV-153', 19, 5000000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (221, 46, 1, 27, 'BG-PLV-154', 15, 5600000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (222, 46, 9, 9, 'BG-PLV-155', 20, 5000000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (223, 46, 9, 27, 'BG-PLV-156', 15, 5600000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (224, 47, 1, 22, 'BG-PLV-157', 30, 3200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (225, 47, 1, 9, 'BG-PLV-158', 25, 3800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (226, 47, 9, 22, 'BG-PLV-159', 30, 3200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (227, 47, 9, 9, 'BG-PLV-160', 25, 3800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (228, 48, 1, 27, 'BG-PLV-161', 15, 5900000.00, 4500000.00, NULL);
INSERT INTO `product_variants` VALUES (229, 48, 1, 9, 'BG-PLV-162', 15, 5200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (230, 48, 9, 27, 'BG-PLV-163', 15, 5900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (231, 48, 9, 9, 'BG-PLV-164', 15, 5200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (240, 49, 12, 10, 'BG-PLV-165', 20, 3500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (241, 49, 12, 22, 'BG-PLV-166', 20, 2900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (242, 49, 10, 10, 'BG-PLV-167', 20, 3500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (243, 49, 10, 22, 'BG-PLV-168', 20, 2900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (248, 50, 1, 23, 'BG-PLV-169', 15, 3500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (249, 50, 1, 22, 'BG-PLV-170', 10, 4100000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (250, 50, 9, 23, 'BG-PLV-171', 15, 3500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (251, 50, 9, 22, 'BG-PLV-172', 10, 4100000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (252, 51, 1, 22, 'BG-PLV-173', 15, 5100000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (253, 51, 1, 9, 'BG-PLV-174', 12, 5400000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (254, 51, 9, 22, 'BG-PLV-175', 15, 5100000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (255, 51, 9, 9, 'BG-PLV-176', 12, 5400000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (256, 52, 9, 2, 'BG-PLV-177', 10, 8500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (257, 52, 9, 3, 'BG-PLV-178', 10, 7900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (258, 52, 4, 2, 'BG-PLV-179', 10, 8500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (259, 52, 4, 3, 'BG-PLV-180', 10, 7900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (260, 53, 9, 27, 'BG-PLV-181', 20, 5000000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (261, 53, 9, 28, 'BG-PLV-182', 15, 5800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (262, 53, 1, 27, 'BG-PLV-183', 20, 5000000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (263, 53, 1, 28, 'BG-PLV-184', 15, 5800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (264, 54, 9, 24, 'BG-PLV-185', 25, 3200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (265, 54, 9, 22, 'BG-PLV-186', 20, 2800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (266, 54, 1, 24, 'BG-PLV-187', 25, 3200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (267, 54, 1, 22, 'BG-PLV-188', 20, 2800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (268, 55, 9, 25, 'BG-PLV-189', 10, 7800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (269, 55, 9, 29, 'BG-PLV-190', 10, 6900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (270, 55, 4, 25, 'BG-PLV-191', 10, 7800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (271, 55, 4, 29, 'BG-PLV-192', 10, 6900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (272, 56, 9, 9, 'BG-PLV-193', 12, 7200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (273, 56, 9, 27, 'BG-PLV-194', 8, 7900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (274, 56, 1, 9, 'BG-PLV-195', 12, 7200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (275, 56, 1, 27, 'BG-PLV-196', 8, 7900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (280, 57, 9, 6, 'BG-PLV-197', 15, 5500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (281, 57, 9, 22, 'BG-PLV-198', 10, 6200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (282, 57, 1, 6, 'BG-PLV-199', 15, 5500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (283, 57, 1, 22, 'BG-PLV-200', 10, 6200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (284, 58, 1, 7, 'BG-PLV-201', 15, 5200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (285, 58, 1, 9, 'BG-PLV-202', 10, 5900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (286, 58, 9, 7, 'BG-PLV-203', 15, 5200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (287, 58, 9, 9, 'BG-PLV-204', 10, 5900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (292, 59, 1, 9, 'BG-PLV-205', 20, 4500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (293, 59, 1, 27, 'BG-PLV-206', 15, 5200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (294, 59, 9, 9, 'BG-PLV-207', 20, 4500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (295, 59, 9, 27, 'BG-PLV-208', 15, 5200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (300, 60, 1, 8, 'BG-PLV-209', 10, 4700000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (301, 60, 1, 9, 'BG-PLV-210', 10, 5200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (302, 60, 2, 8, 'BG-PLV-211', 10, 4700000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (303, 60, 2, 9, 'BG-PLV-212', 10, 5200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (308, 61, 8, 24, 'G-PN-213', 10, 12500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (309, 61, 8, 25, 'G-PN-214', 10, 13800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (310, 61, 9, 24, 'G-PN-215', 10, 12500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (311, 61, 9, 25, 'G-PN-216', 10, 13800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (312, 62, 9, 12, 'G-PN-217', 15, 12800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (313, 62, 9, 13, 'G-PN-218', 10, 13400000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (314, 62, 3, 12, 'G-PN-219', 15, 12800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (315, 62, 3, 13, 'G-PN-220', 10, 13400000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (316, 63, 9, 13, 'G-PN-221', 10, 13500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (317, 63, 9, 14, 'G-PN-222', 10, 14200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (318, 63, 2, 13, 'G-PN-223', 10, 13500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (319, 63, 2, 14, 'G-PN-224', 10, 14200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (320, 64, 8, 12, 'G-PN-225', 20, 8200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (321, 64, 8, 13, 'G-PN-226', 15, 9000000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (322, 64, 9, 12, 'G-PN-227', 20, 8200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (323, 64, 9, 13, 'G-PN-228', 15, 9000000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (324, 65, 9, 12, 'G-PN-229', 12, 13200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (325, 65, 9, 13, 'G-PN-230', 10, 13900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (326, 65, 8, 12, 'G-PN-231', 12, 13200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (327, 65, 8, 13, 'G-PN-232', 10, 13900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (328, 66, 14, 24, 'G-PN-233', 10, 13000000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (329, 66, 14, 12, 'G-PN-234', 10, 16900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (330, 66, 14, 13, 'G-PN-235', 10, 18700000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (331, 66, 8, 24, 'G-PN-236', 10, 13000000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (332, 66, 8, 12, 'G-PN-237', 10, 16900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (333, 66, 8, 13, 'G-PN-238', 10, 18700000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (334, 67, 3, 12, 'G-PN-239', 10, 13800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (335, 67, 3, 13, 'G-PN-240', 8, 14500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (336, 67, 9, 12, 'G-PN-241', 10, 13800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (337, 67, 9, 13, 'G-PN-242', 8, 14500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (338, 68, 9, 12, 'G-PN-243', 15, 12800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (339, 68, 9, 13, 'G-PN-244', 10, 13400000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (340, 68, 8, 12, 'G-PN-245', 15, 12800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (341, 68, 8, 13, 'G-PN-246', 10, 13400000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (342, 69, 8, 12, 'G-PN-247', 5, 22500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (343, 69, 8, 13, 'G-PN-248', 5, 23800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (344, 69, 9, 12, 'G-PN-249', 5, 22500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (345, 69, 9, 13, 'G-PN-250', 5, 23800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (346, 70, 9, 12, 'G-PN-251', 10, 14500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (347, 70, 9, 13, 'G-PN-252', 10, 15200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (348, 70, 3, 12, 'G-PN-253', 10, 14500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (349, 70, 3, 13, 'G-PN-254', 10, 15200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (350, 71, 8, 12, 'G-PN-255', 10, 15500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (351, 71, 8, 13, 'G-PN-256', 10, 16200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (352, 71, 9, 12, 'G-PN-257', 10, 15500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (353, 71, 9, 13, 'G-PN-258', 10, 16200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (354, 72, 8, 24, 'G-PN-259', 15, 5800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (355, 72, 9, 24, 'G-PN-260', 15, 5800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (356, 73, 8, 24, 'G-PN-261', 10, 6500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (357, 73, 8, 12, 'G-PN-262', 10, 8200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (358, 73, 8, 13, 'G-PN-263', 10, 9000000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (359, 73, 9, 24, 'G-PN-264', 10, 6500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (360, 73, 9, 12, 'G-PN-265', 10, 8200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (361, 73, 9, 13, 'G-PN-266', 10, 9000000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (362, 74, 8, 24, 'G-PN-267', 20, 6500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (363, 74, 8, 12, 'G-PN-268', 15, 8200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (364, 74, 8, 13, 'G-PN-269', 15, 9000000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (365, 74, 9, 24, 'G-PN-270', 20, 6500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (366, 74, 9, 12, 'G-PN-271', 15, 8200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (367, 74, 9, 13, 'G-PN-272', 15, 9000000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (368, 75, 9, 24, 'G-PN-273', 10, 10500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (369, 75, 8, 24, 'G-PN-274', 10, 10500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (370, 76, 8, 12, 'G-PN-275', 10, 12500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (371, 76, 9, 12, 'G-PN-276', 10, 12500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (372, 77, 14, 24, 'G-PN-277', 10, 7200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (373, 77, 14, 18, 'G-PN-278', 10, 7900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (374, 77, 14, 12, 'G-PN-279', 10, 8900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (375, 77, 14, 13, 'G-PN-280', 10, 9800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (376, 77, 14, 17, 'G-PN-281', 10, 11500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (377, 77, 8, 24, 'G-PN-282', 10, 7200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (378, 77, 8, 12, 'G-PN-283', 10, 8900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (379, 77, 8, 13, 'G-PN-284', 10, 9800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (380, 78, 9, 12, 'G-PN-285', 10, 11100000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (381, 78, 9, 13, 'G-PN-286', 10, 11800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (382, 78, 8, 12, 'G-PN-287', 10, 11100000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (383, 78, 8, 13, 'G-PN-288', 10, 11800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (384, 79, 14, 12, 'G-PN-289', 20, 6800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (385, 79, 14, 13, 'G-PN-290', 15, 7500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (386, 79, 14, 17, 'G-PN-291', 10, 8500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (387, 80, 9, 24, 'G-PN-292', 15, 2600000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (388, 80, 9, 18, 'G-PN-293', 15, 3200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (389, 80, 9, 12, 'G-PN-294', 15, 3500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (390, 80, 9, 13, 'G-PN-295', 15, 3800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (391, 80, 8, 24, 'G-PN-296', 15, 2600000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (392, 80, 8, 12, 'G-PN-297', 15, 3500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (393, 80, 3, 12, 'G-PN-298', 15, 3500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (394, 80, 3, 13, 'G-PN-299', 15, 3800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (395, 81, 9, 23, 'G-PN-300', 10, 4200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (396, 81, 9, 24, 'G-PN-301', 10, 4800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (397, 81, 9, 18, 'G-PN-302', 10, 5500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (398, 81, 9, 12, 'G-PN-303', 10, 6200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (399, 81, 8, 23, 'G-PN-304', 10, 4200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (400, 81, 8, 24, 'G-PN-305', 10, 4800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (401, 81, 8, 18, 'G-PN-306', 10, 5500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (402, 81, 8, 12, 'G-PN-307', 10, 6200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (403, 82, 9, 13, 'G-PN-308', 5, 10500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (404, 82, 9, 17, 'G-PN-309', 5, 11800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (405, 82, 8, 13, 'G-PN-310', 5, 10500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (406, 82, 8, 17, 'G-PN-311', 5, 11800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (407, 83, 9, 24, 'G-PN-312', 20, 5500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (408, 83, 9, 18, 'G-PN-313', 15, 6200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (409, 83, 9, 12, 'G-PN-314', 15, 6800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (410, 83, 9, 13, 'G-PN-315', 10, 7500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (411, 83, 8, 12, 'G-PN-316', 15, 6800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (412, 83, 8, 13, 'G-PN-317', 10, 7500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (413, 83, 11, 12, 'G-PN-318', 15, 6800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (414, 83, 11, 13, 'G-PN-319', 10, 7500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (415, 84, 9, 12, 'G-PN-320', 10, 6300000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (416, 84, 9, 13, 'G-PN-321', 10, 6800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (417, 84, 8, 12, 'G-PN-322', 10, 6300000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (418, 84, 8, 13, 'G-PN-323', 10, 6800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (419, 84, 14, 12, 'G-PN-324', 10, 6300000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (420, 84, 14, 13, 'G-PN-325', 10, 6800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (421, 85, 9, 24, 'G-PN-326', 15, 4500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (422, 85, 9, 18, 'G-PN-327', 15, 5200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (423, 85, 9, 12, 'G-PN-328', 15, 5800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (424, 85, 9, 13, 'G-PN-329', 15, 6500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (425, 85, 8, 12, 'G-PN-330', 10, 5800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (426, 85, 8, 13, 'G-PN-331', 10, 6500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (427, 85, 11, 12, 'G-PN-332', 10, 5800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (428, 85, 11, 13, 'G-PN-333', 10, 6500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (429, 86, 9, 24, 'G-PN-334', 15, 4800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (430, 86, 8, 24, 'G-PN-335', 15, 4800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (431, 87, 9, 24, 'G-PN-336', 15, 6500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (432, 87, 9, 12, 'G-PN-337', 15, 7800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (433, 87, 8, 12, 'G-PN-338', 10, 9000000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (434, 87, 9, 13, 'G-PN-339', 10, 9900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (435, 88, 14, 24, 'G-PN-340', 10, 7500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (436, 88, 14, 18, 'G-PN-341', 10, 8200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (437, 88, 14, 12, 'G-PN-342', 10, 9200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (438, 88, 14, 13, 'G-PN-343', 10, 10100000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (439, 88, 14, 17, 'G-PN-344', 10, 11800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (440, 88, 8, 12, 'G-PN-345', 10, 9200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (441, 88, 8, 13, 'G-PN-346', 10, 10100000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (442, 89, 14, 24, 'G-PN-347', 10, 7800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (443, 84, 14, 18, 'G-PN-348', 10, 8500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (444, 89, 14, 12, 'G-PN-349', 10, 9500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (445, 89, 14, 13, 'G-PN-350', 10, 10500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (446, 89, 14, 17, 'G-PN-351', 10, 12200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (447, 89, 8, 12, 'G-PN-352', 10, 9500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (448, 89, 8, 13, 'G-PN-353', 10, 10500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (449, 90, 14, 24, 'G-PN-354', 10, 7600000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (450, 90, 14, 18, 'G-PN-355', 10, 8300000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (451, 90, 14, 12, 'G-PN-356', 10, 9300000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (452, 90, 14, 13, 'G-PN-357', 10, 10200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (453, 90, 14, 17, 'G-PN-358', 10, 11900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (454, 90, 8, 12, 'G-PN-359', 10, 9300000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (455, 90, 8, 13, 'G-PN-360', 10, 10200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (456, 91, 9, 18, 'G-PN-361', 10, 8500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (457, 91, 8, 18, 'G-PN-362', 10, 8500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (458, 91, 14, 18, 'G-PN-363', 10, 8500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (467, 92, 9, 21, 'G-PN-364', 5, 18500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (468, 92, 8, 21, 'G-PN-365', 5, 18500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (469, 92, 14, 21, 'G-PN-366', 5, 18500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (473, 93, 10, 21, 'G-PN-367', 10, 10500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (474, 93, 13, 21, 'G-PN-368', 10, 11500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (475, 93, 9, 21, 'G-PN-369', 10, 10500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (476, 94, 8, 12, 'G-PN-370', 10, 11500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (477, 94, 9, 12, 'G-PN-371', 10, 11500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (478, 94, 14, 12, 'G-PN-372', 10, 11500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (479, 95, 8, 24, 'G-PN-373', 10, 16500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (480, 95, 9, 24, 'G-PN-374', 10, 16500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (481, 95, 14, 24, 'G-PN-375', 10, 16500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (482, 96, 8, 24, 'G-PN-376', 10, 13500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (483, 96, 9, 24, 'G-PN-377', 10, 13500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (484, 96, 14, 24, 'G-PN-378', 10, 13500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (485, 97, 8, 24, 'G-PN-379', 10, 17500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (486, 97, 9, 24, 'G-PN-380', 10, 17500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (487, 97, 14, 24, 'G-PN-381', 10, 17500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (488, 98, 8, 25, 'G-PN-382', 10, 16800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (489, 98, 9, 25, 'G-PN-383', 10, 16800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (490, 98, 14, 25, 'G-PN-384', 10, 16800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (491, 99, 8, 24, 'G-PN-385', 10, 12500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (492, 99, 9, 24, 'G-PN-386', 10, 12500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (493, 99, 14, 24, 'G-PN-387', 10, 12500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (494, 100, 9, 12, 'G-PN-388', 5, 14500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (495, 100, 8, 12, 'G-PN-389', 5, 14500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (496, 100, 14, 12, 'G-PN-390', 5, 14500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (497, 101, 9, 12, 'G-PN-391', 10, 13100000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (498, 101, 9, 13, 'G-PN-392', 10, 13800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (499, 102, 9, 13, 'G-PN-393', 10, 14500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (500, 102, 8, 13, 'G-PN-394', 10, 14500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (501, 102, 14, 13, 'G-PN-395', 10, 14500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (502, 103, 8, 12, 'G-PN-396', 5, 35000000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (503, 103, 9, 12, 'G-PN-397', 5, 35000000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (504, 103, 14, 12, 'G-PN-398', 5, 35000000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (505, 104, 8, 24, 'G-PN-399', 5, 18500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (506, 104, 9, 24, 'G-PN-400', 5, 18500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (507, 104, 14, 24, 'G-PN-401', 5, 18500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (508, 105, 9, 12, 'G-PN-402', 10, 13500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (509, 105, 8, 12, 'G-PN-403', 10, 13500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (510, 105, 9, 13, 'G-PN-404', 10, 14200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (511, 105, 14, 13, 'G-PN-405', 10, 14200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (512, 106, 9, 12, 'G-PN-406', 15, 8500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (513, 107, 14, 13, 'G-PN-407', 10, 12800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (514, 109, 8, 12, 'G-PN-408', 20, 9200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (515, 108, 8, 24, 'G-PN-409', 8, 15500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (516, 110, 9, 13, 'G-PN-410', 5, 22500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (517, 111, 14, 12, 'G-PN-411', 12, 9500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (518, 112, 8, 24, 'G-PN-412', 10, 10800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (519, 113, 9, 13, 'G-PN-413', 20, 6500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (520, 114, 9, 12, 'G-PN-414', 15, 11500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (521, 115, 8, 24, 'G-PN-415', 5, 14200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (522, 116, 14, 13, 'G-PN-416', 15, 10500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (523, 117, 9, 12, 'G-PN-417', 10, 12000000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (524, 118, 8, 13, 'G-PN-418', 8, 18500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (525, 119, 14, 24, 'G-PN-419', 6, 16800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (526, 120, 9, 13, 'G-PN-420', 7, 15500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (527, 121, 8, 30, 'TK-PK-421', 10, 4500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (528, 121, 9, 31, 'TK-PK-422', 10, 5500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (529, 121, 14, 32, 'TK-PK-423', 10, 6500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (530, 122, 8, 33, 'TK-PK-424', 10, 3800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (531, 122, 9, 30, 'TK-PK-425', 15, 4800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (532, 122, 14, 31, 'TK-PK-426', 15, 5800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (533, 122, 9, 32, 'TK-PK-427', 10, 6800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (534, 123, 8, 34, 'TK-PK-428', 12, 5200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (535, 123, 8, 31, 'TK-PK-429', 12, 6200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (536, 123, 8, 32, 'TK-PK-430', 10, 7200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (537, 124, 8, 35, 'TK-PK-431', 5, 12500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (538, 124, 9, 31, 'TK-PK-432', 5, 13800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (539, 124, 14, 36, 'TK-PK-433', 5, 15200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (540, 124, 8, 32, 'TK-PK-434', 5, 16500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (541, 124, 9, 37, 'TK-PK-435', 3, 19800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (542, 125, 8, 35, 'TK-PK-436', 15, 4200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (543, 125, 9, 35, 'TK-PK-437', 15, 4900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (544, 125, 9, 31, 'TK-PK-438', 10, 5900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (545, 125, 8, 31, 'TK-PK-439', 10, 6900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (546, 126, 8, 10, 'TK-PK-440', 15, 3600000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (547, 126, 9, 21, 'TK-PK-441', 12, 4800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (548, 126, 14, 23, 'TK-PK-442', 10, 5800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (549, 126, 9, 30, 'TK-PK-443', 10, 6800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (550, 127, 8, 20, 'TK-PK-452', 10, 4500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (551, 127, 9, 20, 'TK-PK-453', 10, 4500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (552, 127, 14, 20, 'TK-PK-454', 10, 4500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (553, 127, 8, 23, 'TK-PK-455', 10, 5500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (554, 127, 9, 23, 'TK-PK-456', 10, 5500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (555, 127, 14, 23, 'TK-PK-457', 10, 5500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (556, 127, 8, 30, 'TK-PK-458', 10, 6500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (557, 127, 9, 30, 'TK-PK-459', 10, 6500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (558, 127, 14, 30, 'TK-PK-460', 10, 6500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (559, 128, 8, 10, 'TK-PK-461', 10, 3600000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (560, 128, 9, 10, 'TK-PK-462', 10, 3600000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (561, 128, 14, 10, 'TK-PK-463', 10, 3600000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (562, 128, 8, 21, 'TK-PK-464', 10, 4800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (563, 128, 9, 21, 'TK-PK-465', 10, 4800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (564, 128, 14, 21, 'TK-PK-466', 10, 4800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (565, 128, 8, 23, 'TK-PK-467', 10, 5800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (566, 128, 9, 23, 'TK-PK-468', 10, 5800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (567, 128, 14, 23, 'TK-PK-469', 10, 5800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (568, 128, 8, 30, 'TK-PK-470', 10, 6800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (569, 128, 9, 30, 'TK-PK-471', 10, 6800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (570, 128, 14, 30, 'TK-PK-472', 10, 6800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (571, 129, 8, 21, 'TK-PK-473', 10, 4400000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (572, 129, 9, 21, 'TK-PK-474', 10, 4400000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (573, 129, 14, 21, 'TK-PK-475', 10, 4400000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (574, 129, 8, 11, 'TK-PK-476', 15, 1600000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (575, 129, 9, 11, 'TK-PK-477', 15, 1600000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (576, 129, 14, 11, 'TK-PK-478', 15, 1600000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (577, 129, 8, 37, 'TK-PK-479', 15, 2700000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (578, 129, 9, 37, 'TK-PK-480', 15, 2700000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (579, 129, 14, 37, 'TK-PK-481', 15, 2700000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (580, 130, 8, 21, 'TK-PK-482', 15, 3900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (581, 130, 9, 21, 'TK-PK-483', 15, 3900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (582, 130, 14, 21, 'TK-PK-484', 15, 3900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (583, 131, 9, 21, 'TK-PK-485', 8, 7500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (584, 131, 8, 21, 'TK-PK-486', 5, 7500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (585, 131, 14, 21, 'TK-PK-487', 5, 7500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (586, 132, 9, 21, 'TK-PK-488', 5, 8200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (587, 132, 8, 21, 'TK-PK-489', 5, 8200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (588, 132, 14, 21, 'TK-PK-490', 5, 8200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (589, 133, 8, 20, 'TK-PK-491', 10, 4200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (590, 133, 9, 20, 'TK-PK-492', 10, 4200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (591, 133, 14, 20, 'TK-PK-493', 10, 4200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (592, 133, 8, 21, 'TK-PK-494', 10, 4800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (593, 133, 9, 21, 'TK-PK-495', 10, 4800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (594, 133, 14, 21, 'TK-PK-496', 10, 4800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (595, 133, 8, 23, 'TK-PK-497', 10, 5800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (596, 133, 9, 23, 'TK-PK-498', 10, 5800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (597, 133, 14, 23, 'TK-PK-499', 10, 5800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (598, 134, 8, 20, 'TK-PK-500', 10, 4700000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (599, 134, 9, 20, 'TK-PK-501', 10, 4700000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (600, 134, 14, 20, 'TK-PK-502', 10, 4700000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (601, 134, 8, 21, 'TK-PK-503', 10, 5300000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (602, 134, 9, 21, 'TK-PK-504', 10, 5300000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (603, 134, 14, 21, 'TK-PK-505', 10, 5300000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (604, 134, 8, 23, 'TK-PK-506', 10, 5800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (605, 134, 9, 23, 'TK-PK-507', 10, 5800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (606, 134, 14, 23, 'TK-PK-508', 10, 5800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (607, 135, 8, 13, 'TK-PK-509', 15, 3200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (608, 135, 9, 13, 'TK-PK-510', 15, 3200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (609, 135, 14, 13, 'TK-PK-511', 15, 3200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (610, 136, 8, 4, 'TK-PN-512', 20, 1200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (611, 136, 9, 4, 'TK-PN-513', 20, 1200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (612, 136, 14, 4, 'TK-PN-514', 20, 1200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (613, 137, 8, 20, 'TK-PN-515', 10, 4500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (614, 137, 9, 20, 'TK-PN-516', 10, 4500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (615, 137, 14, 20, 'TK-PN-517', 10, 4500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (616, 137, 8, 21, 'TK-PN-518', 10, 5200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (617, 137, 9, 21, 'TK-PN-519', 10, 5200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (618, 137, 14, 21, 'TK-PN-520', 10, 5200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (619, 137, 8, 23, 'TK-PN-521', 10, 6200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (620, 137, 9, 23, 'TK-PN-522', 10, 6200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (621, 137, 14, 23, 'TK-PN-523', 10, 6200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (622, 138, 8, 1, 'TK-PN-524', 25, 1350000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (623, 138, 9, 1, 'TK-PN-525', 25, 1350000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (624, 138, 14, 1, 'TK-PN-526', 25, 1350000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (628, 139, 8, 4, 'TK-PN-527', 20, 1450000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (629, 139, 9, 4, 'TK-PN-528', 20, 1450000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (630, 139, 14, 4, 'TK-PN-529', 20, 1450000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (634, 140, 8, 23, 'TK-PN-530', 20, 1100000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (635, 140, 9, 23, 'TK-PN-531', 20, 1100000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (636, 140, 14, 23, 'TK-PN-532', 20, 1100000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (637, 141, 8, 25, 'TK-PN-533', 20, 950000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (638, 141, 9, 25, 'TK-PN-534', 20, 950000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (639, 141, 14, 25, 'TK-PN-535', 20, 950000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (640, 142, 8, 26, 'TK-PN-536', 20, 1150000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (641, 142, 9, 26, 'TK-PN-537', 20, 1150000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (642, 142, 14, 26, 'TK-PN-538', 20, 1150000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (643, 143, 8, 27, 'TK-PN-539', 20, 1250000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (644, 143, 9, 27, 'TK-PN-540', 20, 1250000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (645, 143, 14, 27, 'TK-PN-541', 20, 1250000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (646, 144, 8, 28, 'TK-PN-542', 20, 1300000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (647, 144, 9, 28, 'TK-PN-543', 20, 1300000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (648, 144, 14, 28, 'TK-PN-544', 20, 1300000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (649, 145, 8, 29, 'TK-PN-545', 20, 850000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (650, 145, 9, 29, 'TK-PN-546', 20, 850000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (651, 145, 14, 29, 'TK-PN-547', 20, 850000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (652, 146, 8, 30, 'TK-PN-548', 20, 1400000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (653, 146, 9, 30, 'TK-PN-549', 20, 1400000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (654, 146, 14, 30, 'TK-PN-550', 20, 1400000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (655, 147, 8, 31, 'TK-PN-551', 20, 1180000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (656, 147, 9, 31, 'TK-PN-552', 20, 1180000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (657, 147, 14, 31, 'TK-PN-553', 20, 1180000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (658, 148, 8, 32, 'TK-PN-554', 20, 790000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (659, 148, 9, 32, 'TK-PN-555', 20, 790000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (660, 148, 14, 32, 'TK-PN-556', 20, 790000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (661, 149, 8, 33, 'TK-PN-557', 20, 1050000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (662, 149, 9, 33, 'TK-PN-558', 20, 1050000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (663, 149, 14, 33, 'TK-PN-559', 20, 1050000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (664, 150, 8, 34, 'TK-PN-560', 15, 1380000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (665, 150, 9, 34, 'TK-PN-561', 15, 1380000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (666, 150, 14, 34, 'TK-PN-562', 15, 1380000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (667, 151, 8, 10, 'TK-PLV-561', 10, 4850000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (668, 151, 9, 10, 'TK-PLV-562', 10, 4850000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (669, 151, 14, 10, 'TK-PLV-563', 10, 4850000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (670, 151, 8, 12, 'TK-PLV-564', 10, 5650000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (671, 151, 9, 12, 'TK-PLV-565', 10, 5650000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (672, 151, 14, 12, 'TK-PLV-566', 10, 5650000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (673, 152, 8, 35, 'TK-PLV-567', 30, 1850000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (674, 152, 9, 35, 'TK-PLV-568', 30, 1850000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (675, 152, 14, 35, 'TK-PLV-569', 30, 1850000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (676, 153, 8, 36, 'TK-PLV-570', 15, 4200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (677, 153, 13, 36, 'TK-PLV-571', 15, 4200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (678, 153, 14, 36, 'TK-PLV-572', 15, 4200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (679, 154, 8, 37, 'TK-PLV-573', 20, 2450000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (680, 154, 9, 37, 'TK-PLV-574', 20, 2450000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (681, 154, 14, 37, 'TK-PLV-575', 20, 2450000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (682, 155, 8, 11, 'TK-PLV-576', 15, 3250000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (683, 155, 9, 11, 'TK-PLV-577', 15, 3250000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (684, 155, 14, 11, 'TK-PLV-578', 15, 3250000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (685, 156, 8, 20, 'TK-PLV-579', 12, 3850000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (686, 156, 9, 20, 'TK-PLV-580', 12, 3850000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (687, 156, 14, 20, 'TK-PLV-581', 12, 3850000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (688, 157, 8, 21, 'TK-PLV-582', 10, 3800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (689, 157, 9, 21, 'TK-PLV-583', 10, 3800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (690, 157, 14, 21, 'TK-PLV-584', 10, 3800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (691, 157, 8, 22, 'TK-PLV-585', 10, 5800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (692, 157, 9, 22, 'TK-PLV-586', 10, 5800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (693, 157, 14, 22, 'TK-PLV-587', 10, 5800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (694, 157, 8, 23, 'TK-PLV-588', 10, 5700000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (695, 157, 9, 23, 'TK-PLV-589', 10, 5700000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (696, 157, 14, 23, 'TK-PLV-590', 10, 5700000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (697, 158, 9, 15, 'TK-PLV-591', 15, 1100000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (698, 158, 9, 16, 'TK-PLV-592', 15, 1700000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (699, 158, 9, 17, 'TK-PLV-593', 15, 2100000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (700, 158, 9, 18, 'TK-PLV-594', 15, 2400000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (701, 158, 9, 19, 'TK-PLV-595', 15, 3000000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (702, 159, 8, 24, 'TK-PLV-596', 50, 1650000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (703, 159, 9, 24, 'TK-PLV-597', 50, 1650000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (704, 159, 14, 24, 'TK-PLV-598', 50, 1650000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (705, 160, 8, 3, 'TK-PLV-599', 25, 1450000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (706, 160, 9, 3, 'TK-PLV-600', 25, 1450000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (707, 160, 14, 3, 'TK-PLV-601', 25, 1450000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (708, 161, 8, 4, 'TK-PLV-602', 20, 3300000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (709, 161, 9, 4, 'TK-PLV-603', 20, 3300000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (710, 161, 14, 4, 'TK-PLV-604', 20, 3300000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (711, 161, 8, 5, 'TK-PLV-605', 20, 3400000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (712, 161, 9, 5, 'TK-PLV-606', 20, 3400000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (713, 161, 14, 5, 'TK-PLV-607', 20, 3400000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (714, 162, 8, 6, 'TK-PLV-608', 15, 3650000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (715, 162, 9, 6, 'TK-PLV-609', 15, 3650000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (716, 162, 14, 6, 'TK-PLV-610', 15, 3650000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (717, 162, 8, 7, 'TK-PLV-611', 15, 4550000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (718, 162, 9, 7, 'TK-PLV-612', 15, 4550000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (719, 162, 14, 7, 'TK-PLV-613', 15, 4550000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (720, 163, 8, 25, 'TK-PLV-614', 25, 2550000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (721, 163, 9, 25, 'TK-PLV-615', 25, 2550000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (722, 163, 14, 25, 'TK-PLV-616', 25, 2550000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (723, 164, 8, 26, 'TK-PLV-617', 20, 1500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (724, 164, 9, 26, 'TK-PLV-618', 20, 1500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (725, 164, 14, 26, 'TK-PLV-619', 20, 1500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (726, 164, 8, 27, 'TK-PLV-620', 20, 1900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (727, 164, 9, 27, 'TK-PLV-621', 20, 1900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (728, 164, 14, 27, 'TK-PLV-622', 20, 1900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (729, 164, 8, 28, 'TK-PLV-623', 20, 2300000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (730, 164, 9, 28, 'TK-PLV-624', 20, 2300000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (731, 164, 14, 28, 'TK-PLV-625', 20, 2300000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (732, 165, 8, 29, 'TK-PLV-626', 15, 3650000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (733, 165, 9, 29, 'TK-PLV-627', 15, 3650000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (734, 165, 14, 29, 'TK-PLV-628', 15, 3650000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (735, 165, 8, 30, 'TK-PLV-629', 15, 4550000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (736, 165, 9, 30, 'TK-PLV-630', 15, 4550000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (737, 165, 14, 30, 'TK-PLV-631', 15, 4550000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (738, 166, 8, 31, 'TK-PB-632', 10, 8500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (739, 166, 9, 32, 'TK-PB-633', 10, 11500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (740, 166, 14, 32, 'TK-PB-634', 10, 11500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (741, 166, 8, 33, 'TK-PB-635', 10, 14500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (742, 166, 9, 34, 'TK-PB-636', 10, 17500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (743, 167, 8, 35, 'TK-PB-638', 10, 7800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (744, 167, 9, 36, 'TK-PB-639', 10, 10800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (745, 167, 14, 37, 'TK-PB-640', 10, 13800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (746, 167, 8, 37, 'TK-PB-641', 10, 16800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (747, 168, 8, 31, 'TK-PB-642', 10, 8900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (748, 168, 9, 32, 'TK-PB-643', 10, 11900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (749, 168, 14, 33, 'TK-PB-644', 10, 14900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (750, 168, 8, 34, 'TK-PB-645', 10, 17900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (751, 169, 8, 31, 'TK-PB-646', 12, 8700000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (752, 169, 9, 32, 'TK-PB-647', 12, 11700000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (753, 169, 14, 32, 'TK-PB-648', 12, 11700000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (754, 169, 8, 33, 'TK-PB-649', 12, 14700000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (755, 170, 8, 35, 'TK-PB-650', 10, 7900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (756, 170, 9, 36, 'TK-PB-651', 10, 10900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (757, 170, 14, 37, 'TK-PB-652', 10, 13900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (758, 170, 8, 37, 'TK-PB-653', 10, 16900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (760, 172, 8, 35, 'TK-PB-659', 15, 7500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (761, 172, 14, 35, 'TK-PB-660', 15, 7500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (762, 172, 8, 36, 'TK-PB-661', 15, 10500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (763, 172, 9, 36, 'TK-PB-662', 15, 10500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (765, 173, 8, 5, 'TK-PB-663', 10, 7800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (766, 173, 9, 5, 'TK-PB-664', 10, 10800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (767, 173, 14, 5, 'TK-PB-665', 10, 12300000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (769, 171, 8, 8, 'TK-PB-654', 10, 8200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (770, 171, 9, 9, 'TK-PB-655', 10, 9700000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (771, 174, 8, 35, 'TK-PB-667', 10, 8000000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (772, 174, 9, 36, 'TK-PB-668', 10, 9500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (773, 174, 14, 37, 'TK-PB-669', 10, 11000000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (774, 175, 8, 35, 'TK-PB-670', 20, 2500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (775, 175, 9, 36, 'TK-PB-671', 20, 3200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (776, 175, 14, 37, 'TK-PB-672', 20, 3900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (777, 176, 8, 36, 'TK-PB-673', 20, 3200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (778, 176, 9, 36, 'TK-PB-674', 20, 3200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (779, 176, 14, 36, 'TK-PB-675', 20, 3200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (780, 177, 8, 35, 'TK-PB-676', 15, 3500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (781, 177, 9, 36, 'TK-PB-677', 15, 4200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (782, 178, 14, 36, 'TK-PB-678', 12, 4800000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (783, 178, 8, 37, 'TK-PB-679', 12, 5500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (784, 179, 9, 35, 'TK-PB-680', 10, 3900000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (785, 179, 8, 36, 'TK-PB-681', 10, 4600000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (786, 180, 8, 36, 'TK-PB-682', 8, 6200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (787, 180, 14, 37, 'TK-PB-683', 8, 7500000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (788, 185, 9, 35, 'QT-1-005', 50, 280000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (789, 186, 8, 36, 'QT-1-006', 100, 200000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (790, 187, 14, 37, 'QT-1-007', 40, 370000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (791, 188, 9, 35, 'QT-1-008', 80, 205000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (792, 181, 9, 35, 'QT-1-001', 50, 450000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (793, 182, 8, 36, 'QT-1-002', 100, 350000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (794, 183, 9, 37, 'QT-1-003', 199, 220000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (795, 184, 14, 35, 'QT-1-004', 30, 550000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (796, 189, 9, 35, 'QT-1-009', 100, 250000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (797, 190, 14, 36, 'QT-1-010', 50, 280000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (798, 191, 8, 37, 'QT-1-011', 150, 150000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (799, 192, 9, 35, 'QT-1-012', 60, 250000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (800, 193, 9, 35, 'QT-1-013', 500, 12000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (801, 194, 8, 36, 'QT-1-014', 300, 17000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (802, 195, 9, 37, 'QT-1-015', 400, 12000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (803, 196, 9, 35, 'QT-1-016', 200, 30000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (804, 197, 14, 35, 'MN-1-001', 50, 650000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (805, 198, 9, 36, 'MN-1-002', 38, 550000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (806, 199, 14, 37, 'MN-1-003', 100, 320000.00, 0.00, NULL);
INSERT INTO `product_variants` VALUES (807, 200, 9, 35, 'MN-1-004', 60, 480000.00, 0.00, NULL);

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_product` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description_id` int NULL DEFAULT NULL,
  `category_id` int NULL DEFAULT NULL,
  `source_id` int NULL DEFAULT NULL,
  `product_type_id` int NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `primary_image_id` int NULL DEFAULT NULL,
  `isActive` tinyint NULL DEFAULT 1,
  `mfg_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_product_category`(`category_id` ASC) USING BTREE,
  INDEX `fk_product_source`(`source_id` ASC) USING BTREE,
  INDEX `fk_product_type`(`product_type_id` ASC) USING BTREE,
  INDEX `fk_product_primary_image`(`primary_image_id` ASC) USING BTREE,
  CONSTRAINT `fk_product_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_product_primary_image` FOREIGN KEY (`primary_image_id`) REFERENCES `images` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_product_source` FOREIGN KEY (`source_id`) REFERENCES `sources` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_product_type` FOREIGN KEY (`product_type_id`) REFERENCES `product_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 213 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'Bàn ăn bằng gỗ đẹp cho gia đình', 1, 4, 1, 1, 8500000.00, 1147, 0, '2025-05-12');
INSERT INTO `products` VALUES (2, 'Bàn đảo bếp mặt gỗ thân tủ xám hiện đại', 2, 4, 1, 1, 8500000.00, 6, 1, '2025-12-12');
INSERT INTO `products` VALUES (3, 'Bàn ăn gỗ sồi, Bàn ăn gỗ tự nhiên ', 3, 4, 1, 1, 8500000.00, 11, 1, '2025-12-12');
INSERT INTO `products` VALUES (4, 'Bàn ăn gỗ công nghiệp 4 ghế khung sắt ', 4, 4, 2, 1, 5000000.00, 16, 1, '2025-12-29');
INSERT INTO `products` VALUES (5, 'Bàn ăn gia đình hình tròn nhỏ gọn gỗ sồi', 5, 4, 3, 1, 6500000.00, 21, 1, '2026-01-01');
INSERT INTO `products` VALUES (6, 'Bàn ăn gia đình gỗ sồi đẹp hiện đại', 6, 4, 1, 1, 3800000.00, 26, 1, '2026-01-01');
INSERT INTO `products` VALUES (7, 'Bộ bàn ăn hiện đại gỗ tự nhiên', 7, 4, 1, 1, 3800000.00, 31, 1, '2026-01-01');
INSERT INTO `products` VALUES (8, 'Bộ bàn ăn Mango White-Brown gỗ cao su', 8, 4, 1, 1, 4100000.00, 36, 1, '2026-01-01');
INSERT INTO `products` VALUES (9, 'Bộ bàn ăn gia đình gỗ tự nhiên mộc mạc', 9, 4, 1, 1, 4100000.00, 41, 1, '2026-01-01');
INSERT INTO `products` VALUES (10, 'Bàn ăn hiện đại cho cặp đôi gỗ MDF', 10, 4, 1, 1, 3800000.00, 46, 1, '2026-01-01');
INSERT INTO `products` VALUES (11, 'Bộ bàn ăn gỗ sồi hiện đại (2 ghế tựa, 2 ghế đôn)', 11, 4, 6, 1, 4100000.00, 51, 1, '2026-01-01');
INSERT INTO `products` VALUES (12, 'Bộ bàn ăn 4 ghế bọc da hiện đại gỗ sồi', 12, 4, 1, 1, 3800000.00, 56, 1, '2026-01-01');
INSERT INTO `products` VALUES (13, 'Bộ bàn ăn gỗ sồi tự nhiên bầu dục 4 ghế nệm', 13, 4, 1, 1, 8500000.00, 61, 1, '2026-01-01');
INSERT INTO `products` VALUES (14, 'Bàn ăn gỗ sồi chân trụ tròn nghệ thuật', 14, 4, 1, 1, 7500000.00, 66, 1, '2026-01-01');
INSERT INTO `products` VALUES (15, 'Bàn phòng khách nhỏ gọn gấp được ', 15, 1, 1, 1, 5000000.00, 71, 1, '2026-01-01');
INSERT INTO `products` VALUES (16, 'Bàn trà phòng khách hiện đại dáng thấp ', 16, 1, 5, 1, 4700000.00, 76, 1, '2026-01-01');
INSERT INTO `products` VALUES (17, 'Bàn trang trí phòng khách mềm mại nhẹ nhàng', 17, 1, 1, 1, 6900000.00, 81, 1, '2026-01-01');
INSERT INTO `products` VALUES (18, 'Bàn gỗ trang trí phòng khách, tiền sảnh ', 18, 1, 1, 1, 6700000.00, 86, 1, '2026-01-01');
INSERT INTO `products` VALUES (19, 'Bàn trà phòng khách màu sắc thanh lịch', 19, 1, 1, 1, 5100000.00, 91, 1, '2026-01-01');
INSERT INTO `products` VALUES (20, 'Bàn trà gỗ phòng khách thiết kế tiện dụng ', 20, 1, 1, 1, 4100000.00, 96, 1, '2026-01-01');
INSERT INTO `products` VALUES (21, 'Bàn trà gỗ sồi cao cấp cho phòng khách ', 21, 1, 8, 1, 6500000.00, 101, 1, '2026-01-01');
INSERT INTO `products` VALUES (22, 'Bàn trà gỗ phòng khách kéo gọn', 22, 1, 1, 1, 3800000.00, 106, 1, '2026-01-01');
INSERT INTO `products` VALUES (23, 'Bàn trà bệt hình tam giác decor hiện đại', 23, 1, 9, 1, 1200000.00, 111, 1, '2026-01-01');
INSERT INTO `products` VALUES (24, 'Bàn trang trí', 24, NULL, NULL, NULL, NULL, 116, 1, '2026-01-03');
INSERT INTO `products` VALUES (25, 'Bàn trà gỗ sồi hiện đại sang trọng ', 25, 1, 1, 1, 5800000.00, 121, 1, '2026-01-01');
INSERT INTO `products` VALUES (26, 'Bàn trà phòng khách thiết kế hiện đại ', 26, 1, 1, 1, 2900000.00, 126, 1, '2026-01-01');
INSERT INTO `products` VALUES (27, 'Bàn trà đẹp cho phòng khách hiện đại ', 27, 1, 1, 1, 4400000.00, 131, 1, '2026-01-01');
INSERT INTO `products` VALUES (28, 'Bàn trà gỗ sồi đơn giản tinh tế ', 28, 1, 1, 1, 6500000.00, 136, 1, '2026-01-01');
INSERT INTO `products` VALUES (29, 'Bàn trà gỗ công nghiệp ', 29, 1, 1, 1, 4000000.00, 141, 1, '2026-01-01');
INSERT INTO `products` VALUES (30, 'Bàn trang điểm gỗ màu óc chó hiện đại ', 30, 2, 2, 1, 6800000.00, 146, 1, '2026-01-01');
INSERT INTO `products` VALUES (31, 'Bàn trang điểm gỗ thiết kế đẹp ', 31, 2, 2, 1, 5500000.00, 151, 1, '2026-01-01');
INSERT INTO `products` VALUES (32, 'Bàn trang điểm phòng ngủ đẹp đơn giản ', 32, 2, 1, 1, 4800000.00, 156, 1, '2026-01-01');
INSERT INTO `products` VALUES (33, 'Bàn trang điểm gỗ sồi thiết kế sang trọng ', 33, 2, 3, 1, 7500000.00, 161, 1, '2026-01-01');
INSERT INTO `products` VALUES (34, 'Tủ phấn trang điểm đẹp sang trọng ', 34, 2, 4, 1, 5000000.00, 166, 1, '2026-01-01');
INSERT INTO `products` VALUES (35, 'Bàn trang điểm chân sắt phun mạ đồng ', 35, 2, 1, 1, 6500000.00, 171, 1, '2026-01-01');
INSERT INTO `products` VALUES (36, 'Bàn trang điểm hiện đại thiết kế nhỏ gọn', 36, 2, 4, 1, 4200000.00, 176, 1, '2026-01-01');
INSERT INTO `products` VALUES (37, 'Bàn trang điểm phong cách hiện đại phá cách ', 37, 2, 6, 1, 4500000.00, 181, 1, '2026-01-01');
INSERT INTO `products` VALUES (38, 'Bàn trang điểm đẹp kiểu dáng nhỏ gọn ', 38, 2, 1, 1, 3800000.00, 186, 1, '2026-01-01');
INSERT INTO `products` VALUES (39, 'Bàn trang điểm gỗ tự nhiên chất lượng cao', 39, 2, 1, 1, 8500000.00, 191, 1, '2026-01-01');
INSERT INTO `products` VALUES (40, 'Bàn trang điểm hiện đại thiết kế tiện dụng ', 40, 2, 7, 1, 5800000.00, 196, 1, '2026-01-01');
INSERT INTO `products` VALUES (41, 'Bàn trang điểm đẹp tiện dụng ', 41, 2, 8, 1, 4500000.00, 201, 1, '2026-01-01');
INSERT INTO `products` VALUES (42, 'Bàn trang điểm kết hợp tủ ngăn kéo ', 42, 2, 1, 1, 6200000.00, 206, 1, '2026-01-01');
INSERT INTO `products` VALUES (43, 'Bàn trang điểm cá nhân thiết kế hiện đại ', 43, 2, 1, 1, 6500000.00, 211, 1, '2026-01-01');
INSERT INTO `products` VALUES (44, 'Bàn trang điểm gỗ sồi tự nhiên ', 44, 2, 9, 1, 7500000.00, 216, 1, '2026-01-01');
INSERT INTO `products` VALUES (45, 'Bàn làm việc tại nhà', 45, 3, 5, 1, NULL, 221, 1, '2026-01-02');
INSERT INTO `products` VALUES (46, 'Bàn làm việc decor phong cách Bắc Âu sang trọng', 46, 3, 10, 1, 5000000.00, 226, 1, '2026-01-01');
INSERT INTO `products` VALUES (47, 'Bàn làm việc có hộc tủ thiết kế hiện đại', 47, 3, 4, 1, 3200000.00, 231, 1, '2026-01-01');
INSERT INTO `products` VALUES (48, 'Bàn làm việc liền giá sách hiện đại đa năng', 48, 3, 5, 1, 5900000.00, 236, 1, '2026-01-01');
INSERT INTO `products` VALUES (49, 'Bàn làm việc đẹp hiện đại chân gỗ tự nhiên', 49, 3, 10, 1, 3500000.00, 241, 1, '2026-01-01');
INSERT INTO `products` VALUES (50, 'Bàn làm việc cá nhân hình chữ L hiện đại tiết kiệm diện tích', 50, 3, 2, 1, 3500000.00, 246, 1, '2026-01-01');
INSERT INTO `products` VALUES (51, 'Bàn làm việc hiện đại kèm giá sách tích hợp', 51, 3, 3, 1, 5100000.00, 251, 1, '2026-01-01');
INSERT INTO `products` VALUES (52, 'Bàn văn phòng phong cách thanh lịch đẳng cấp', 52, 3, 4, 1, 8500000.00, 256, 1, '2026-01-01');
INSERT INTO `products` VALUES (53, 'Bàn làm việc cá nhân bằng gỗ hiện đại chất lượng cao', 53, 3, 1, 1, 5000000.00, 261, 1, '2026-01-01');
INSERT INTO `products` VALUES (54, 'Bàn làm việc chân sắt mặt gỗ hiện đại thiết kế tối giản', 54, 3, 1, 1, 3200000.00, 266, 1, '2026-01-01');
INSERT INTO `products` VALUES (55, 'Bàn làm việc tại nhà chân sắt mặt gỗ dày chuyên nghiệp', 55, 3, 1, 1, 7800000.00, 271, 1, '2026-01-01');
INSERT INTO `products` VALUES (56, 'Bàn làm việc tiện dụng tích hợp giá sách lưu trữ lớn', 56, 3, 8, 1, 7200000.00, 276, 1, '2026-01-01');
INSERT INTO `products` VALUES (57, 'Bàn làm việc gỗ sồi tự nhiên nhỏ gọn thanh lịch', 57, 3, 1, 1, 5500000.00, 281, 1, '2026-01-01');
INSERT INTO `products` VALUES (58, 'Bàn làm việc tại nhà liền giá sách hiện đại cho người trẻ', 58, 3, 1, 1, 5200000.00, 286, 1, '2026-01-01');
INSERT INTO `products` VALUES (59, 'Bàn làm việc kèm tủ sách gỗ MDF thiết kế thông minh', 59, 3, 1, 1, 4500000.00, 291, 1, '2026-01-01');
INSERT INTO `products` VALUES (60, 'Bàn làm việc màu trắng sang trọng chân trụ bo rãnh', 60, 3, 1, 1, 4700000.00, 296, 1, '2026-01-01');
INSERT INTO `products` VALUES (61, 'Giường ngủ liền bàn làm việc thông minh tiết kiệm không gian', 61, 2, 1, 2, 12500000.00, 301, 1, '2026-01-01');
INSERT INTO `products` VALUES (62, 'Giường ngủ gỗ sồi tự nhiên hiện đại cao cấp', 62, 2, 1, 2, 12800000.00, 306, 1, '2026-01-01');
INSERT INTO `products` VALUES (63, 'Giường ngủ gỗ sồi phong cách cổ điển sang trọng', 63, 2, 1, 2, 13500000.00, 311, 1, '2026-01-01');
INSERT INTO `products` VALUES (64, 'Giường ngủ gỗ công nghiệp MDF lõi xanh hiện đại sang trọng', 64, 2, 1, 2, 8200000.00, 316, 1, '2026-01-01');
INSERT INTO `products` VALUES (65, 'Giường ngủ gỗ sồi tự nhiên thiết kế nan đan trang nhã', 65, 2, 1, 2, 13200000.00, 321, 1, '2026-01-01');
INSERT INTO `products` VALUES (66, 'Bộ giường ngủ thông minh liền tủ áo nhỏ gọn cho bé', 66, 2, 1, 2, 13000000.00, 326, 1, '2026-01-01');
INSERT INTO `products` VALUES (67, 'Giường ngủ gỗ sồi tự nhiên phong cách Tân cổ điển sang trọng', 67, 2, 1, 2, 13800000.00, 331, 1, '2026-01-01');
INSERT INTO `products` VALUES (68, 'Giường ngủ gỗ sồi tự nhiên cao cấp phong cách tối giản', 68, 2, 1, 2, 12800000.00, 336, 1, '2026-01-01');
INSERT INTO `products` VALUES (69, 'Bộ nội thất phòng ngủ đồng bộ hiện đại (Giường + Tủ áo + Tủ đầu giường)', 69, 2, 1, 2, 22500000.00, 341, 1, '2026-01-02');
INSERT INTO `products` VALUES (70, 'Giường ngủ gỗ sồi hiện đại chân cao đầu giường mây đan', 70, 2, 1, 2, 14500000.00, 346, 1, '2026-01-02');
INSERT INTO `products` VALUES (71, 'Giường ngủ gỗ sồi phong cách Tân cổ điển bọc da sang trọng', 71, 2, 1, 2, 15500000.00, 351, 1, '2026-01-02');
INSERT INTO `products` VALUES (72, 'Giường đơn hộc kéo 1m2 gỗ công nghiệp MDF lõi xanh hiện đại', 72, 2, 1, 2, 5800000.00, 356, 1, '2026-01-02');
INSERT INTO `products` VALUES (73, 'Giường ngủ gỗ công nghiệp đầu giường bọc nệm hiện đại', 73, 2, 1, 2, 6500000.00, 361, 1, '2026-01-02');
INSERT INTO `products` VALUES (74, 'Giường ngủ gỗ hộp hiện đại thiết kế tối giản', 74, 2, 1, 2, 6500000.00, 366, 1, '2026-01-02');
INSERT INTO `products` VALUES (75, 'Giường ngủ gỗ sồi tự nhiên thiết kế nhỏ gọn tinh tế', 75, 2, 1, 2, 10500000.00, 371, 1, '2026-01-02');
INSERT INTO `products` VALUES (76, 'Giường ngủ gỗ sồi phong cách Bohemian sơn Lacker an toàn cho bé', 76, 2, 1, 2, 12500000.00, 376, 1, '2026-01-02');
INSERT INTO `products` VALUES (77, 'Giường ngủ bọc da Simili Hàn Quốc hiện đại sang trọng', 77, 2, 1, 2, 7200000.00, 381, 1, '2026-01-02');
INSERT INTO `products` VALUES (78, 'Giường ngủ gỗ sồi tự nhiên thiết kế thanh lịch hiện đại', 78, 2, 1, 2, 11100000.00, 386, 1, '2026-01-02');
INSERT INTO `products` VALUES (79, 'Giường ngủ gỗ hiện đại kèm tủ đầu giường phong cách Bắc Âu', 79, 2, 1, 2, 6800000.00, 391, 1, '2026-01-02');
INSERT INTO `products` VALUES (80, 'Giường bay hiện đại kèm kệ đầu giường đa năng', 80, 2, 1, 2, 2600000.00, 396, 1, '2026-01-02');
INSERT INTO `products` VALUES (81, 'Giường ngủ Tatami gỗ công nghiệp phong cách Nhật Bản', 81, 2, 1, 2, 4200000.00, 401, 1, '2026-01-02');
INSERT INTO `products` VALUES (82, 'Giường bục gỗ nâng sàn hiện đại tích hợp đèn LED', 82, 2, 1, 2, 10500000.00, 406, 1, '2026-01-02');
INSERT INTO `products` VALUES (83, 'Giường ngủ bệt gỗ công nghiệp 2 ngăn kéo phong cách Bắc Âu', 83, 2, 1, 2, 5500000.00, 411, 1, '2026-01-02');
INSERT INTO `products` VALUES (84, 'Giường bệt Tatami gỗ công nghiệp kèm 2 tab đầu giường hiện đại', 84, 2, 1, 2, 6300000.00, 416, 1, '2026-01-02');
INSERT INTO `products` VALUES (85, 'Giường ngủ gỗ bệt phong cách Bắc Âu tối giản hiện đại', 85, 2, 1, 2, 4500000.00, 421, 1, '2026-01-02');
INSERT INTO `products` VALUES (86, 'Giường ngủ bệt Tatami gỗ công nghiệp MDF cao cấp đơn giản', 86, 2, 1, 2, 4800000.00, 426, 1, '2026-01-02');
INSERT INTO `products` VALUES (87, 'Giường ngủ hiện đại đa năng tùy chọn bọc da hoặc nỉ', 87, 2, 1, 2, 6500000.00, 431, 1, '2026-01-02');
INSERT INTO `products` VALUES (88, 'Giường nệm bọc da Simili Hàn Quốc thiết kế bo tròn hiện đại', 88, 2, 1, 2, 7500000.00, 436, 1, '2026-01-02');
INSERT INTO `products` VALUES (89, 'Giường ngủ bọc da Simili Hàn Quốc thiết kế ô vuông phồng hiện đại', 89, 2, 1, 2, 7800000.00, 441, 1, '2026-01-02');
INSERT INTO `products` VALUES (90, 'Giường gỗ bọc da Simili Hàn Quốc phong cách Modern Minimalism', 90, 2, 1, 2, 7600000.00, 446, 1, '2026-01-02');
INSERT INTO `products` VALUES (91, 'Giường kéo 2 tầng thông minh tiết kiệm diện tích GHS-9412', 91, 2, 1, 2, 8500000.00, 451, 1, '2026-01-02');
INSERT INTO `products` VALUES (92, 'Giường tầng trẻ em thông minh tích hợp tủ quần áo GHS-9244', 92, 2, 1, 2, 18500000.00, 456, 1, '2026-01-02');
INSERT INTO `products` VALUES (93, 'Giường ngủ 2 tầng trẻ em họa tiết thiên nhiên GHS-9338', 93, 2, 1, 2, 10500000.00, 461, 1, '2026-01-02');
INSERT INTO `products` VALUES (94, 'Giường 2 tầng cho bé bằng gỗ công nghiệp tiện lợi', 94, 2, 1, 2, 11500000.00, 466, 1, '2026-01-02');
INSERT INTO `products` VALUES (95, 'Giường tầng cho bé thiết kế hiện đại thông minh GHS-9238', 95, 2, 1, 2, 16500000.00, 471, 1, '2026-01-02');
INSERT INTO `products` VALUES (96, 'Giường kết hợp tủ quần áo thông minh ', 96, 2, 1, 2, 13500000.00, 476, 1, '2026-01-02');
INSERT INTO `products` VALUES (97, 'Giường tầng cho bé tích hợp bàn học và tủ quần áo GHS-9381', 97, 2, 1, 2, 17500000.00, 481, 1, '2026-01-02');
INSERT INTO `products` VALUES (98, 'Giường tầng thiết kế đa năng cao cấp ', 98, 2, 1, 2, 16800000.00, 486, 1, '2026-01-02');
INSERT INTO `products` VALUES (99, 'Giường tầng gỗ cho trẻ em ấn tượng ', 99, 2, 1, 2, 12500000.00, 491, 1, '2026-01-02');
INSERT INTO `products` VALUES (100, 'Giường ngủ gỗ sồi tự nhiên tân cổ điển ', 100, 2, 1, 2, 14500000.00, 496, 1, '2026-01-02');
INSERT INTO `products` VALUES (101, 'Giường ngủ hiện đại bằng gỗ sồi tự nhiên ', 101, 2, 1, 2, 13100000.00, 501, 1, '2026-01-02');
INSERT INTO `products` VALUES (102, 'Giường ngủ gỗ sồi tự nhiên phong cách Bắc Âu hiện đại', 102, 2, 1, 2, 14500000.00, 506, 1, '2026-01-02');
INSERT INTO `products` VALUES (103, 'Bộ nội thất phòng ngủ cao cấp hiện đại (Giường, Tủ áo, Bàn trang điểm)', 103, 2, 1, 2, 35000000.00, 511, 1, '2026-01-02');
INSERT INTO `products` VALUES (104, 'Bộ giường đôi cho bé kèm kệ sách và tủ quần áo đa năng', 104, 2, 1, 2, 18500000.00, 516, 1, '2026-01-02');
INSERT INTO `products` VALUES (105, 'Giường ngủ gỗ sồi phủ Veneer óc chó bọc da cao cấp', 105, 2, 1, 2, 13500000.00, 521, 1, '2026-01-02');
INSERT INTO `products` VALUES (106, 'Giường ngủ gỗ tối giản phong cách Zen Nhật Bản', 106, 2, 1, 2, 8500000.00, 526, 1, '2026-01-02');
INSERT INTO `products` VALUES (107, 'Giường ngủ bọc nỉ hiện đại tích hợp ngăn chứa đồ', 107, 2, 1, 2, 12800000.00, 531, 1, '2026-01-02');
INSERT INTO `products` VALUES (108, 'Giường tầng sáng tạo hình lâu đài cho bé', 108, 2, 1, 2, 15500000.00, 536, 1, '2026-01-02');
INSERT INTO `products` VALUES (109, 'Giường ngủ chân cao phong cách Scandinavian', 109, 2, 1, 2, 9200000.00, 541, 1, '2026-01-02');
INSERT INTO `products` VALUES (110, 'Giường ngủ tân cổ điển bọc da hoàng gia', 110, 2, 1, 2, 22500000.00, 546, 1, '2026-01-02');
INSERT INTO `products` VALUES (111, 'Giường ngủ hiện đại tích hợp hộc kéo thông minh', 111, 2, 1, 2, 9500000.00, 551, 1, '2026-01-02');
INSERT INTO `products` VALUES (112, 'Giường ngủ hình ngôi nhà sáng tạo cho trẻ em', 112, 2, 1, 2, 10800000.00, 556, 1, '2026-01-02');
INSERT INTO `products` VALUES (113, 'Giường phản gỗ công nghiệp phong cách tối giản', 113, 2, 1, 2, 6500000.00, 561, 1, '2026-01-02');
INSERT INTO `products` VALUES (114, 'Giường ngủ gỗ sồi tự nhiên phong cách Vintage', 114, 2, 1, 2, 11500000.00, 566, 1, '2026-01-02');
INSERT INTO `products` VALUES (115, 'Giường ngủ thông minh gấp gọn tiết kiệm diện tích', 115, 2, 1, 2, 14200000.00, 571, 1, '2026-01-02');
INSERT INTO `products` VALUES (116, 'Giường ngủ hiện đại tích hợp đèn LED và cổng sạc', 116, 2, 1, 2, 10500000.00, 576, 1, '2026-01-02');
INSERT INTO `products` VALUES (117, 'Giường gỗ sồi thiết kế nan dọc tinh tế', 117, 2, 1, 2, 12000000.00, 581, 1, '2026-01-02');
INSERT INTO `products` VALUES (118, 'Giường ngủ bọc da Microfiber khung gỗ chắc chắn', 118, 2, 1, 2, 18500000.00, 586, 1, '2026-01-02');
INSERT INTO `products` VALUES (119, 'Giường tầng đa năng tích hợp giường kéo cho bé', 119, 2, 1, 2, 16800000.00, 591, 1, '2026-01-02');
INSERT INTO `products` VALUES (120, 'Giường ngủ gỗ cao cấp phủ Veneer óc chó thượng lưu', 120, 2, 1, 2, 15500000.00, 596, 1, '2026-01-02');
INSERT INTO `products` VALUES (121, 'Kệ tivi bo góc cao cấp phong cách hiện đại', 121, 1, 1, 3, 4500000.00, 601, 1, '2026-01-02');
INSERT INTO `products` VALUES (122, 'Kệ tivi đặt đất thiết kế đơn giản sang trọng', 122, 1, 1, 3, 3800000.00, 606, 1, '2026-01-02');
INSERT INTO `products` VALUES (123, 'Kệ tivi màu trắng thiết kế độc đáo hiện đại', 123, 1, 1, 3, 5200000.00, 611, 1, '2026-01-02');
INSERT INTO `products` VALUES (124, 'Hệ kệ tivi kết hợp tủ trang trí đa năng cao cấp', 124, 1, 1, 3, 12500000.00, 616, 1, '2026-01-02');
INSERT INTO `products` VALUES (125, 'Kệ thấp để tivi thiết kế sang trọng hiện đại', 125, 1, 1, 3, 4200000.00, 621, 1, '2026-01-02');
INSERT INTO `products` VALUES (126, 'Kệ để dưới tivi thiết kế tối giản thanh lịch', 126, 1, 1, 3, 3600000.00, 626, 1, '2026-01-02');
INSERT INTO `products` VALUES (127, 'Kệ tivi đứng thiết kế sang trọng hiện đại', 127, 1, 1, 3, 4500000.00, 631, 1, '2026-01-02');
INSERT INTO `products` VALUES (128, 'Kệ để tivi đẹp kiểu dáng hiện đại', 128, 1, 1, 3, 3600000.00, 636, 1, '2026-01-02');
INSERT INTO `products` VALUES (129, 'Kệ tivi gia đình gỗ công nghiệp sang trọng tiện nghi', 129, 1, 1, 3, 4400000.00, 641, 1, '2026-01-02');
INSERT INTO `products` VALUES (130, 'Kệ tivi hiện đại thiết kế đơn giản đa năng', 130, 1, 1, 3, 3900000.00, 646, 1, '2026-01-02');
INSERT INTO `products` VALUES (131, 'Kệ tivi phong cách Hàn Quốc tối giản Gỗ Sồi', 131, 1, 1, 3, 7500000.00, 651, 1, '2026-01-02');
INSERT INTO `products` VALUES (132, 'Kệ tivi tân cổ điển sang trọng kết hợp kính sọc', 132, 1, 1, 3, 8200000.00, 656, 1, '2026-01-02');
INSERT INTO `products` VALUES (133, 'Kệ tivi có chân gỗ MDF lõi xanh cao cấp', 133, 1, 1, 3, 4200000.00, 661, 1, '2026-01-02');
INSERT INTO `products` VALUES (134, 'Kệ tivi treo tường cho nhà chung cư hiện đại', 134, 1, 1, 3, 4700000.00, 666, 1, '2026-01-02');
INSERT INTO `products` VALUES (135, 'Kệ tivi bằng gỗ công nghiệp nhỏ gọn tiết kiệm diện tích', 135, 1, 1, 3, 3200000.00, 671, 1, '2026-01-02');
INSERT INTO `products` VALUES (136, 'Tủ gỗ nhỏ để đầu giường đẹp sang trọng', 136, 2, 1, 3, 1200000.00, 676, 1, '2026-01-02');
INSERT INTO `products` VALUES (137, 'Kệ tivi gỗ hiện đại chân cao thanh lịch', 137, 2, 1, 3, 4500000.00, 681, 1, '2026-01-02');
INSERT INTO `products` VALUES (138, 'Tủ trang trí gỗ MDF hiện đại nhỏ gọn', 138, 2, 1, 3, 1350000.00, 686, 1, '2026-01-02');
INSERT INTO `products` VALUES (139, 'Kệ đầu giường cao cấp hiện đại', 139, 2, 1, 3, 1450000.00, 691, 1, '2026-01-02');
INSERT INTO `products` VALUES (140, 'Tủ đầu giường gỗ công nghiệp MDF phủ Melamine hiện đại', 140, 2, 1, 3, 1100000.00, 696, 1, '2026-01-02');
INSERT INTO `products` VALUES (141, 'Tủ đầu giường 1 ngăn kéo hiện đại', 141, 2, 1, 3, 950000.00, 701, 1, '2026-01-02');
INSERT INTO `products` VALUES (142, 'Kệ đầu giường chân gỗ tự nhiên', 142, 2, 1, 3, 1150000.00, 706, 1, '2026-01-02');
INSERT INTO `products` VALUES (143, 'Tủ đầu giường 2 ngăn kéo tối giản', 143, 2, 1, 3, 1250000.00, 711, 1, '2026-01-02');
INSERT INTO `products` VALUES (144, 'Tủ đầu giường phong cách Nordic', 144, 2, 1, 3, 1300000.00, 716, 1, '2026-01-02');
INSERT INTO `products` VALUES (145, 'Kệ đầu giường khối hộp vuông', 145, 2, 1, 3, 850000.00, 721, 1, '2026-01-02');
INSERT INTO `products` VALUES (146, 'Tủ đầu giường tích hợp kệ hở', 146, 2, 1, 3, 1400000.00, 726, 1, '2026-01-02');
INSERT INTO `products` VALUES (147, 'Tủ đầu giường cánh mở truyền thống', 147, 2, 1, 3, 1180000.00, 731, 1, '2026-01-02');
INSERT INTO `products` VALUES (148, 'Tủ đầu giường decor nhỏ gọn', 148, 2, 1, 3, 790000.00, 736, 1, '2026-01-02');
INSERT INTO `products` VALUES (149, 'Kệ đầu giường gỗ MDF chống ẩm', 149, 2, 1, 3, 1050000.00, 741, 1, '2026-01-02');
INSERT INTO `products` VALUES (150, 'Tủ đầu giường phối màu Bắc Âu', 150, 2, 1, 3, 1380000.00, 746, 1, '2026-01-02');
INSERT INTO `products` VALUES (151, 'Tủ sách phòng làm việc tối giản thanh lịch', 151, 3, 1, 3, 4850000.00, 751, 1, '2026-01-02');
INSERT INTO `products` VALUES (152, 'Giá sách nhỏ gọn hiện đại đa năng', 152, 3, 1, 3, 1850000.00, 756, 1, '2026-01-02');
INSERT INTO `products` VALUES (153, 'Giá sách gỗ công nghiệp hiện đại thiết kế lớn', 153, 3, 1, 3, 4200000.00, 761, 1, '2026-01-02');
INSERT INTO `products` VALUES (154, 'Kệ giá sách gỗ hình bậc thang hiện đại', 154, 3, 1, 3, 2450000.00, 766, 1, '2026-01-02');
INSERT INTO `products` VALUES (155, 'Kệ sách 5 tầng phong cách Bắc Âu hiện đại', 155, 3, 1, 3, 3250000.00, 771, 1, '2026-01-02');
INSERT INTO `products` VALUES (156, 'Giá sách chân sắt hiện đại sang trọng', 156, 3, 1, 3, 3850000.00, 776, 1, '2026-01-02');
INSERT INTO `products` VALUES (157, 'Tủ để tài liệu văn phòng hiện đại đa năng', 157, 3, 1, 3, 3800000.00, 781, 1, '2026-01-02');
INSERT INTO `products` VALUES (158, 'Kệ gỗ sồi tự nhiên đa năng hệ Module', 158, 3, 1, 3, 1100000.00, 786, 1, '2026-01-02');
INSERT INTO `products` VALUES (159, 'Kệ để đồ hình robot sáng tạo cho bé', 159, 3, 1, 3, 1650000.00, 791, 1, '2026-01-02');
INSERT INTO `products` VALUES (160, 'Kệ để tạp chí gỗ công nghiệp chuyên nghiệp', 160, 3, 1, 3, 1450000.00, 796, 1, '2026-01-03');
INSERT INTO `products` VALUES (161, 'Kệ góc để sách hiện đại tối ưu không gian', 161, 3, 1, 3, 3300000.00, 801, 1, '2026-01-03');
INSERT INTO `products` VALUES (162, 'Kệ sách góc tường hiện đại GHS-2659', 162, 3, 1, 3, 3650000.00, 806, 1, '2026-01-03');
INSERT INTO `products` VALUES (163, 'Giá để sách gỗ đa năng nhiều ngăn hiện đại', 163, 3, 1, 3, 2550000.00, 811, 1, '2026-01-03');
INSERT INTO `products` VALUES (164, 'Giá sách gia đình thiết kế ấn tượng GHS-2244', 164, 3, 1, 3, 1500000.00, 816, 1, '2026-01-03');
INSERT INTO `products` VALUES (165, 'Kệ sách góc tường phân tầng sáng tạo', 165, 3, 1, 3, 3650000.00, 821, 1, '2026-01-03');
INSERT INTO `products` VALUES (166, 'Tủ buffet gỗ cao cấp thiết kế hiện đại', 166, 3, 1, 3, 8500000.00, 826, 1, '2026-01-03');
INSERT INTO `products` VALUES (167, 'Tủ buffet gỗ MDF cao cấp thiết kế hiện đại', 167, 3, 1, 3, 7800000.00, 831, 1, '2026-01-03');
INSERT INTO `products` VALUES (168, 'Tủ búp phê hiện đại kiểu dáng sang trọng', 168, 3, 1, 3, 8900000.00, 836, 1, '2026-01-03');
INSERT INTO `products` VALUES (169, 'Mẫu tủ búp phê đẹp thiết kế đa năng', 169, 3, 1, 3, 8700000.00, 841, 1, '2026-01-03');
INSERT INTO `products` VALUES (170, 'Tủ búp phê cao cấp thiết kế hiện đại sang trọng', 170, 3, 1, 3, 7900000.00, 846, 1, '2026-01-03');
INSERT INTO `products` VALUES (171, 'Tủ đựng đồ phòng bếp kiểu dáng sang trọng và hiện đại', 171, 3, 1, 3, 8200000.00, 851, 1, '2026-01-03');
INSERT INTO `products` VALUES (172, 'Tủ đựng nồi chảo thiết kế đơn giản và tiện lợi', 172, 3, 1, 3, 7500000.00, 856, 1, '2026-01-03');
INSERT INTO `products` VALUES (173, 'Tủ để chén bằng gỗ thiết kế hiện đại và đa năng', 173, 3, 1, 3, 7800000.00, 861, 1, '2026-01-03');
INSERT INTO `products` VALUES (174, 'Tủ để bát đũa thiết kế sang trọng và đa năng', 174, 3, 1, 3, 8000000.00, 866, 1, '2026-01-03');
INSERT INTO `products` VALUES (175, 'Tủ bếp MDF chống ẩm thiết kế treo tường hiện đại', 175, 3, 1, 3, 2500000.00, 871, 1, '2026-01-03');
INSERT INTO `products` VALUES (176, 'Tủ để đồ nhà bếp thiết kế nhỏ gọn tiện dụng', 176, 3, 1, 3, 3200000.00, 876, 1, '2026-01-03');
INSERT INTO `products` VALUES (177, 'Tủ bếp đa năng thiết kế tối giản hiện đại', 177, 3, 1, 3, 3500000.00, 881, 1, '2026-01-03');
INSERT INTO `products` VALUES (178, 'Tủ đựng đồ nhà bếp nhiều ngăn tiện lợi', 178, 3, 1, 3, 4800000.00, 886, 1, '2026-01-03');
INSERT INTO `products` VALUES (179, 'Tủ chén gỗ MDF thiết kế sang trọng', 179, 3, 1, 3, 3900000.00, 891, 1, '2026-01-03');
INSERT INTO `products` VALUES (180, 'Hệ tủ bếp lưu trữ thông minh', 180, 3, 1, 3, 6200000.00, 896, 1, '2026-01-03');
INSERT INTO `products` VALUES (181, 'Hộp đựng bút xoay gỗ tự nhiên cao cấp', 181, 6, 1, NULL, 450000.00, 901, 1, '2026-01-03');
INSERT INTO `products` VALUES (182, 'Hộp cắm bút gỗ để bàn làm quà tặng doanh nghiệp', 182, 6, 1, NULL, 350000.00, 906, 1, '2026-01-03');
INSERT INTO `products` VALUES (183, 'Hộp đựng bút gỗ tự nhiên thiết kế tối giản', 183, 6, 1, NULL, 220000.00, 911, 1, '2026-01-03');
INSERT INTO `products` VALUES (184, 'Hộp bút gỗ cao cấp thiết kế theo yêu cầu', 184, 6, 1, NULL, 550000.00, 916, 1, '2026-01-03');
INSERT INTO `products` VALUES (185, 'Đồng hồ gỗ mini để bàn decor', 185, 6, 1, NULL, 280000.00, 921, 1, '2026-01-03');
INSERT INTO `products` VALUES (186, 'Đồng hồ gỗ treo tường hình chữ nhật nghệ thuật', 186, 6, 1, NULL, 200000.00, 926, 1, '2026-01-03');
INSERT INTO `products` VALUES (187, 'Đồng hồ gỗ để bàn khắc Laser cao cấp', 187, 6, 1, NULL, 370000.00, 931, 1, '2026-01-03');
INSERT INTO `products` VALUES (188, 'Đồng hồ gỗ treo tường hình tròn khắc Laser', 188, 6, 1, NULL, 205000.00, 936, 1, '2026-01-03');
INSERT INTO `products` VALUES (189, 'Lịch Gỗ Mừng Năm Mới trang trí tết', 189, 6, 1, NULL, 250000.00, 941, 1, '2026-01-03');
INSERT INTO `products` VALUES (190, 'Lịch Gỗ Kèm Khung Ảnh để bàn đa năng', 190, 6, 1, NULL, 280000.00, 946, 1, '2026-01-03');
INSERT INTO `products` VALUES (191, 'Lịch Gỗ 12 Mặt thiết kế sáng tạo độc đáo', 191, 6, 1, NULL, 150000.00, 951, 1, '2026-01-03');
INSERT INTO `products` VALUES (192, 'Lịch Gỗ Trượt Để Bàn khắc theo yêu cầu', 192, 6, 1, NULL, 250000.00, 956, 1, '2026-01-03');
INSERT INTO `products` VALUES (193, 'Móc khóa gỗ khắc họa tiết trang trí', 193, 6, 1, NULL, 12000.00, 961, 1, '2026-01-03');
INSERT INTO `products` VALUES (194, 'Móc khóa gỗ in hình Chibi dễ thương', 194, 6, 1, NULL, 17000.00, 966, 1, '2026-01-03');
INSERT INTO `products` VALUES (195, 'Móc khóa gỗ thiết kế tinh tế', 195, 6, 1, NULL, 12000.00, 971, 1, '2026-01-03');
INSERT INTO `products` VALUES (196, 'Móc khóa 12 con giáp bằng gỗ thủ công', 196, 6, 1, NULL, 30000.00, 976, 1, '2026-01-03');
INSERT INTO `products` VALUES (197, 'Hộp đựng đũa muỗng 2 tầng cao cấp', 197, 5, 1, NULL, 650000.00, 981, 1, '2026-01-03');
INSERT INTO `products` VALUES (198, 'Khay đựng muỗng đũa kéo giãn thông minh', 198, 5, 1, NULL, 550000.00, 986, 1, '2026-01-03');
INSERT INTO `products` VALUES (199, 'Hộp đựng đũa muỗng bằng gỗ có nắp', 199, 5, 1, NULL, 320000.00, 991, 1, '2026-01-03');
INSERT INTO `products` VALUES (200, 'Hộp đựng đũa muỗng thìa tích hợp ngăn gia vị', 200, 5, 1, NULL, 480000.00, 996, 1, '2026-01-03');

-- ----------------------------
-- Table structure for promotion
-- ----------------------------
DROP TABLE IF EXISTS `promotion`;
CREATE TABLE `promotion`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `sku` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `discount_percent` int NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `is_active` tinyint NULL DEFAULT 1,
  `created_at` datetime NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of promotion
-- ----------------------------

-- ----------------------------
-- Table structure for rank_configs
-- ----------------------------
DROP TABLE IF EXISTS `rank_configs`;
CREATE TABLE `rank_configs`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `rank_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'rankName',
  `min_orders` int NOT NULL DEFAULT 0 COMMENT 'minOrders',
  `min_spending` decimal(15, 2) NOT NULL DEFAULT 0.00 COMMENT 'minSpending',
  `cycle_months` int NOT NULL DEFAULT 6 COMMENT 'cycleMonths (Chu kỳ xét hạng)',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `rank_name`(`rank_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rank_configs
-- ----------------------------
INSERT INTO `rank_configs` VALUES (1, 'SILVER', 3, 1000000.00, 6, '2026-03-25 22:34:34', NULL);
INSERT INTO `rank_configs` VALUES (2, 'GOLD', 20, 5000000.00, 6, '2026-03-25 22:34:34', NULL);
INSERT INTO `rank_configs` VALUES (3, 'DIAMOND', 75, 15000000.00, 6, '2026-03-25 22:34:34', NULL);

-- ----------------------------
-- Table structure for reviews
-- ----------------------------
DROP TABLE IF EXISTS `reviews`;
CREATE TABLE `reviews`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `response_id` int NULL DEFAULT 0,
  `user_id` int NULL DEFAULT NULL,
  `product_id` int NULL DEFAULT NULL,
  `rate` int NULL DEFAULT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `createAt` datetime NULL DEFAULT NULL,
  `order_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_review_user`(`user_id` ASC) USING BTREE,
  INDEX `fk_review_product`(`product_id` ASC) USING BTREE,
  CONSTRAINT `fk_review_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_review_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of reviews
-- ----------------------------
INSERT INTO `reviews` VALUES (4, 0, 118, 2, 1, 'khong nhu mo ta san pham te', '2026-03-27 21:29:08', NULL);
INSERT INTO `reviews` VALUES (5, 0, 118, 6, 5, 'San phan chat luong se mua them', '2026-03-27 21:29:13', NULL);
INSERT INTO `reviews` VALUES (6, 0, 121, 11, 4, 'Sẩn phẩm tốt nên mua', '2026-03-27 21:29:19', NULL);
INSERT INTO `reviews` VALUES (7, 6, 123, 11, 0, 'abc', '2026-03-27 21:29:37', NULL);
INSERT INTO `reviews` VALUES (8, 4, 123, 2, 0, 'abc', '2026-03-27 21:30:01', NULL);
INSERT INTO `reviews` VALUES (9, 4, 123, 2, 0, 'xã', '2026-03-27 21:30:23', NULL);
INSERT INTO `reviews` VALUES (10, 5, 123, 6, 0, 'dssd', '2026-03-27 21:33:40', NULL);
INSERT INTO `reviews` VALUES (11, 5, 123, 6, 0, 'acsa', '2026-03-27 21:34:09', NULL);

-- ----------------------------
-- Table structure for shopping_cart_items
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart_items`;
CREATE TABLE `shopping_cart_items`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `cart_id` int NULL DEFAULT NULL,
  `product_variant_id` int NULL DEFAULT NULL,
  `quantity` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_cart_item_cart`(`cart_id` ASC) USING BTREE,
  INDEX `fk_cart_item_variant`(`product_variant_id` ASC) USING BTREE,
  CONSTRAINT `fk_cart_item_cart` FOREIGN KEY (`cart_id`) REFERENCES `shopping_carts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cart_item_variant` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of shopping_cart_items
-- ----------------------------

-- ----------------------------
-- Table structure for shopping_carts
-- ----------------------------
DROP TABLE IF EXISTS `shopping_carts`;
CREATE TABLE `shopping_carts`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_cart_user`(`user_id` ASC) USING BTREE,
  CONSTRAINT `fk_cart_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of shopping_carts
-- ----------------------------
INSERT INTO `shopping_carts` VALUES (1, 2);

-- ----------------------------
-- Table structure for sizes
-- ----------------------------
DROP TABLE IF EXISTS `sizes`;
CREATE TABLE `sizes`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `size_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `length` decimal(10, 2) NULL DEFAULT NULL,
  `width` decimal(10, 2) NULL DEFAULT NULL,
  `height` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sizes
-- ----------------------------
INSERT INTO `sizes` VALUES (1, '900x2200', 900.00, 2200.00, NULL);
INSERT INTO `sizes` VALUES (2, '810x2150', 810.00, 2150.00, NULL);
INSERT INTO `sizes` VALUES (3, '1220x2440x25', 1220.00, 2440.00, 25.00);
INSERT INTO `sizes` VALUES (4, '1220x2440x18', 1220.00, 2440.00, 18.00);
INSERT INTO `sizes` VALUES (5, '1220x2440x17', 1220.00, 2440.00, 17.00);
INSERT INTO `sizes` VALUES (6, '1600x600x2000', 1600.00, 600.00, 2000.00);
INSERT INTO `sizes` VALUES (7, '2000x600x2000', 2000.00, 600.00, 2000.00);
INSERT INTO `sizes` VALUES (8, '900x600x2000', 900.00, 600.00, 2000.00);
INSERT INTO `sizes` VALUES (9, '1200x600x400', 1200.00, 600.00, 400.00);
INSERT INTO `sizes` VALUES (10, '1200x550x450', 1200.00, 550.00, 450.00);
INSERT INTO `sizes` VALUES (11, '890x400x610', 890.00, 400.00, 610.00);
INSERT INTO `sizes` VALUES (12, '1600x2000x350', 1600.00, 2000.00, 350.00);
INSERT INTO `sizes` VALUES (13, '1800x2000x350', 1800.00, 2000.00, 350.00);
INSERT INTO `sizes` VALUES (14, '2000x2200x350', 2000.00, 2200.00, 350.00);
INSERT INTO `sizes` VALUES (15, '1400x600x2200', 1400.00, 600.00, 2200.00);
INSERT INTO `sizes` VALUES (16, '1800x600x2400', 1800.00, 600.00, 2400.00);
INSERT INTO `sizes` VALUES (17, '2400x600x2600', 2400.00, 600.00, 2600.00);
INSERT INTO `sizes` VALUES (18, '1200x600x750', 1200.00, 600.00, 750.00);
INSERT INTO `sizes` VALUES (19, '1400x800x750', 1400.00, 800.00, 750.00);
INSERT INTO `sizes` VALUES (20, '1600x800x750', 1600.00, 800.00, 750.00);
INSERT INTO `sizes` VALUES (21, '1800x400x450', 1800.00, 400.00, 450.00);
INSERT INTO `sizes` VALUES (22, '1000x500x420', 1000.00, 500.00, 420.00);
INSERT INTO `sizes` VALUES (23, '2200x450x500', 2200.00, 450.00, 500.00);
INSERT INTO `sizes` VALUES (24, '1200x2000x300', 1200.00, 2000.00, 300.00);
INSERT INTO `sizes` VALUES (25, '1400x2000x300', 1400.00, 2000.00, 300.00);
INSERT INTO `sizes` VALUES (26, '2200x2000x350', 2200.00, 2000.00, 350.00);
INSERT INTO `sizes` VALUES (27, '1000x600x2000', 1000.00, 600.00, 2000.00);
INSERT INTO `sizes` VALUES (28, '1200x600x2200', 1200.00, 600.00, 2200.00);
INSERT INTO `sizes` VALUES (29, '2000x600x2400', 2000.00, 600.00, 2400.00);
INSERT INTO `sizes` VALUES (30, '2400x600x2500', 2400.00, 600.00, 2500.00);
INSERT INTO `sizes` VALUES (31, '800x800x750', 800.00, 800.00, 750.00);
INSERT INTO `sizes` VALUES (32, '1800x900x750', 1800.00, 900.00, 750.00);
INSERT INTO `sizes` VALUES (33, '2000x1000x750', 2000.00, 1000.00, 750.00);
INSERT INTO `sizes` VALUES (34, '1100x500x750', 1100.00, 500.00, 750.00);
INSERT INTO `sizes` VALUES (35, '800x300x1800', 800.00, 300.00, 1800.00);
INSERT INTO `sizes` VALUES (36, '1200x350x2000', 1200.00, 350.00, 2000.00);
INSERT INTO `sizes` VALUES (37, '600x300x1300', 600.00, 300.00, 1200.00);

-- ----------------------------
-- Table structure for sources
-- ----------------------------
DROP TABLE IF EXISTS `sources`;
CREATE TABLE `sources`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `sourcename` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sources
-- ----------------------------
INSERT INTO `sources` VALUES (1, 'Xưởng gỗ Phù ');
INSERT INTO `sources` VALUES (2, 'Xưởng Gỗ Hàm Linh');
INSERT INTO `sources` VALUES (3, 'Nhà cung cấp gỗ cao cấp Linh Xuân');
INSERT INTO `sources` VALUES (4, 'Nhà cung cấp gỗ Thúy Kiều');
INSERT INTO `sources` VALUES (5, 'Xưởng gỗ Bình Định');
INSERT INTO `sources` VALUES (6, 'Nhà phân phối gỗ cao cấp');
INSERT INTO `sources` VALUES (7, 'Gỗ cao cấp NK');
INSERT INTO `sources` VALUES (8, 'Xưởng xản xuất gỗ TG');
INSERT INTO `sources` VALUES (9, 'Công ty Gỗ NKTG');
INSERT INTO `sources` VALUES (10, 'Gỗ uy tín PDL');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `display_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `birth_date` date NULL DEFAULT NULL,
  `email` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `password` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `avatar_id` int NULL DEFAULT NULL,
  `createAt` date NULL DEFAULT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_avatar_id`(`avatar_id` ASC) USING BTREE,
  CONSTRAINT `fk_avatar_id` FOREIGN KEY (`avatar_id`) REFERENCES `images` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 132 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (2, 'Quản Trị Viên 2', 'Jan', '2026-01-28', '23130165@st.hcmuaf.edu.vn', '$2a$12$c3vCZj5mEqiBzfaccRvsX.A0J02wNPMtxpQFhmWylArM8xtXxJ8jy', '0974913047', 'Male', 1163, '2026-01-01', 'Admin', 'Active');
INSERT INTO `users` VALUES (4, 'Văn MAi ', 'Bé BAy123', '2026-01-30', 'tranthithuykieupm@gmail.com', '$2a$12$6Jr3TA4iOmKbgIGHPQI5jeo2VXLIK0GpLOzWi08DmbqS0/jBkBLoy', '0987672813', 'Nữ', 1009, '2026-01-01', 'User', 'Active');
INSERT INTO `users` VALUES (10, 'Giang', 'Khang', NULL, '23130082@st.hcmuaf.edu.vn', '$2a$12$lbXB60xMx019TTj81NJKZOBSm48AvWPehN5TctzMhr2NeAQpoIDme', '0944459364', 'Nữ', NULL, '2026-01-03', 'Admin', 'Active');
INSERT INTO `users` VALUES (11, 'mai', 'baby', '0000-00-00', '1@gmail.com', '12$2a$12$lbXB60xMx019TTj81NJKZOBSm48AvWPehN5TctzMhr2NeAQpoIDme$2a$12$lbXB60xMx019TTj81NJKZOBSm48AvWPehN5TctzMhr2NeAQpoIDme', NULL, NULL, NULL, NULL, 'Staff', 'Active');
INSERT INTO `users` VALUES (118, 'Kiều', 'thkiu', '2026-01-22', 'tranthithuykieu@gmail.com', '$2a$12$c3vCZj5mEqiBzfaccRvsX.A0J02wNPMtxpQFhmWylArM8xtXxJ8jy', '1234521321', 'Nữ', 1152, '2026-01-25', 'User', 'Active');
INSERT INTO `users` VALUES (120, 'Kiều', NULL, NULL, 'kithuy379@gmail.com', '$2a$12$GF4e432YqD3Bi0mYUOmdmufzZfXSYqsO4.och0eYQg0wF4bfYejjS', NULL, NULL, NULL, '2026-01-27', 'Staff', 'Active');
INSERT INTO `users` VALUES (121, 'Trần Thị Thúy Kiều', 'Thúy Kiều', '2005-08-23', 'tranthithuykieupm12005@gmail.com', '$2a$12$IcLr1DexTwN7rh0pAiH7nu8psQv7mJpS53YNE6v8NViuPDV2m52Nm', '0984335', 'Nữ', 1163, '2026-01-28', 'User', 'Active');
INSERT INTO `users` VALUES (122, 'G T N', 'Giang', NULL, 'truonggiang2005pt@gmail.com', 'GOOGLE_1769562362656', '0984335012', 'Nữ', 1155, '2026-01-28', 'User', 'Active');
INSERT INTO `users` VALUES (123, 'Minh Hậu', NULL, NULL, 'nmhau2410@gmail.com', '$2a$12$1KRVFHs561xZLsoiiMEVxurQ82ZK1/7xz34HdC6gj88Uqic15ez3m', NULL, NULL, NULL, '2026-03-27', 'Admin', 'Active');
INSERT INTO `users` VALUES (124, 'Minh Hậu', '', '2026-04-03', '23130096@st.hcmuaf.edu.vn', '$2a$12$x6ZPbtNVYq.quVMJG9xOi.7Odl.EXCLiqSa/InimRsokQCsCixF5i', '', 'Nữ', NULL, '2026-03-27', 'User', 'Active');
INSERT INTO `users` VALUES (125, 'abc', 'abc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'User', NULL);
INSERT INTO `users` VALUES (126, 'Minh Hậu', NULL, NULL, 'mhaunguyen2410@gmail.com', '$2a$12$3xwWwdwPToCCgc3hEdU99.XGSuNRke.jGUX7TmNR9wAy99JKotzN.', NULL, NULL, NULL, '2026-03-30', 'User', 'Active');
INSERT INTO `users` VALUES (128, 'Minh Hậu', NULL, NULL, 'nmhau0142@gmail.com', '$2a$12$mKNLpBeGtFhBOCgEL097SuGiRp1XjbrPuPkBHjso.0E7OMeHk4FmO', NULL, NULL, NULL, '2026-03-30', 'User', 'Active');

-- ----------------------------
-- Table structure for voucher_applicable_ranks
-- ----------------------------
DROP TABLE IF EXISTS `voucher_applicable_ranks`;
CREATE TABLE `voucher_applicable_ranks`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `voucher_id` int NOT NULL,
  `rank_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'SILVER, GOLD, DIAMOND',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_voucher_rank`(`voucher_id` ASC) USING BTREE,
  CONSTRAINT `fk_voucher_rank` FOREIGN KEY (`voucher_id`) REFERENCES `vouchers` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of voucher_applicable_ranks
-- ----------------------------

-- ----------------------------
-- Table structure for vouchers
-- ----------------------------
DROP TABLE IF EXISTS `vouchers`;
CREATE TABLE `vouchers`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `voucher_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'voucherCode',
  `voucher_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'voucherName',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'description',
  `promo_type` enum('PERCENT','AMOUNT') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'promoType',
  `promo_value` decimal(15, 2) NOT NULL COMMENT 'promoValue (Mức giảm)',
  `min_order_value` decimal(15, 2) NULL DEFAULT 0.00 COMMENT 'minOrderValue',
  `reward_style` enum('NORMAL','SPECIAL') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'NORMAL' COMMENT 'rewardStyle',
  `total_release` int NOT NULL COMMENT 'totalRelease',
  `max_per_user` int NULL DEFAULT 1 COMMENT 'maxPerUser',
  `display_date` datetime NULL DEFAULT NULL COMMENT 'displayDate',
  `start_date` datetime NOT NULL COMMENT 'startDate',
  `end_date` datetime NOT NULL COMMENT 'endDate',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT 'status (1: Active, 0: Inactive)',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `voucher_code`(`voucher_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vouchers
-- ----------------------------
INSERT INTO `vouchers` VALUES (1, 'DSADĐÁ', 'đâsđấ', 'ádasádsa', 'PERCENT', 40.00, 100000.00, 'NORMAL', 100, 1, NULL, '2026-03-28 23:15:00', '2026-04-28 23:15:00', 1, '2026-03-28 23:15:39', '2026-03-29 10:07:41');
INSERT INTO `vouchers` VALUES (2, '12345678', 'Giảm 20%', 'Giảm 20% tổng đơn cho đơn hàng tối thiểu 200.000 ngàn', 'AMOUNT', 200000.00, 200000.00, 'NORMAL', 100, 1, NULL, '2026-03-29 08:00:00', '2026-04-05 22:00:00', 1, '2026-03-29 22:43:56', '2026-04-01 23:01:23');

SET FOREIGN_KEY_CHECKS = 1;
