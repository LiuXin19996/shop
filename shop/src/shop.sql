/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : shop

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 14/10/2019 19:43:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for adminuser
-- ----------------------------
DROP TABLE IF EXISTS `adminuser`;
CREATE TABLE `adminuser`  (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of adminuser
-- ----------------------------
INSERT INTO `adminuser` VALUES (1, 'admin', 'admin');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '男子');
INSERT INTO `category` VALUES (2, '女子');
INSERT INTO `category` VALUES (3, '男童');
INSERT INTO `category` VALUES (4, '女童');
INSERT INTO `category` VALUES (5, '运动配件');
INSERT INTO `category` VALUES (6, '运动装备');
INSERT INTO `category` VALUES (7, '运动项目');

-- ----------------------------
-- Table structure for categorysecond
-- ----------------------------
DROP TABLE IF EXISTS `categorysecond`;
CREATE TABLE `categorysecond`  (
  `csid` int(11) NOT NULL AUTO_INCREMENT,
  `csname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`csid`) USING BTREE,
  INDEX `FK936FCAF21DB1FD15`(`cid`) USING BTREE,
  CONSTRAINT `FK936FCAF21DB1FD15` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 99 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categorysecond
-- ----------------------------
INSERT INTO `categorysecond` VALUES (1, '跑步鞋', 1);
INSERT INTO `categorysecond` VALUES (2, '篮球鞋', 1);
INSERT INTO `categorysecond` VALUES (3, '运动时尚鞋', 1);
INSERT INTO `categorysecond` VALUES (4, '户外鞋', 1);
INSERT INTO `categorysecond` VALUES (5, '羽毛球鞋', 1);
INSERT INTO `categorysecond` VALUES (6, '训练鞋', 1);
INSERT INTO `categorysecond` VALUES (7, '凉鞋', 1);
INSERT INTO `categorysecond` VALUES (8, '拖鞋', 1);
INSERT INTO `categorysecond` VALUES (9, '羽绒服', 1);
INSERT INTO `categorysecond` VALUES (10, '棉服', 1);
INSERT INTO `categorysecond` VALUES (11, '外套', 1);
INSERT INTO `categorysecond` VALUES (12, '马甲', 1);
INSERT INTO `categorysecond` VALUES (13, '卫衣', 1);
INSERT INTO `categorysecond` VALUES (14, '裤装', 1);
INSERT INTO `categorysecond` VALUES (15, '套装', 1);
INSERT INTO `categorysecond` VALUES (16, '紧身服', 1);
INSERT INTO `categorysecond` VALUES (17, '比赛服', 1);
INSERT INTO `categorysecond` VALUES (18, '其他服装', 1);
INSERT INTO `categorysecond` VALUES (19, '运动内裤', 1);
INSERT INTO `categorysecond` VALUES (20, 'T恤', 1);
INSERT INTO `categorysecond` VALUES (21, 'Polo衫', 1);
INSERT INTO `categorysecond` VALUES (22, '背心', 1);
INSERT INTO `categorysecond` VALUES (23, '泳裤', 1);
INSERT INTO `categorysecond` VALUES (24, '跑步鞋', 2);
INSERT INTO `categorysecond` VALUES (25, '篮球鞋', 2);
INSERT INTO `categorysecond` VALUES (26, '运动时尚鞋', 2);
INSERT INTO `categorysecond` VALUES (27, '户外鞋', 2);
INSERT INTO `categorysecond` VALUES (28, '羽毛球鞋', 2);
INSERT INTO `categorysecond` VALUES (29, '训练鞋', 2);
INSERT INTO `categorysecond` VALUES (30, '凉鞋', 2);
INSERT INTO `categorysecond` VALUES (31, '拖鞋', 2);
INSERT INTO `categorysecond` VALUES (32, '羽绒服', 2);
INSERT INTO `categorysecond` VALUES (33, '棉服', 2);
INSERT INTO `categorysecond` VALUES (34, '外套', 2);
INSERT INTO `categorysecond` VALUES (35, '马甲', 2);
INSERT INTO `categorysecond` VALUES (36, '卫衣', 2);
INSERT INTO `categorysecond` VALUES (37, '裤装', 2);
INSERT INTO `categorysecond` VALUES (38, '套装', 2);
INSERT INTO `categorysecond` VALUES (39, '运动文胸', 2);
INSERT INTO `categorysecond` VALUES (40, '紧身服', 2);
INSERT INTO `categorysecond` VALUES (41, '裙装', 2);
INSERT INTO `categorysecond` VALUES (42, '比赛服', 2);
INSERT INTO `categorysecond` VALUES (43, 'T恤', 2);
INSERT INTO `categorysecond` VALUES (44, 'Polo衫', 2);
INSERT INTO `categorysecond` VALUES (45, '背心', 2);
INSERT INTO `categorysecond` VALUES (46, '其他服装', 2);
INSERT INTO `categorysecond` VALUES (47, '跑步鞋', 3);
INSERT INTO `categorysecond` VALUES (48, '篮球鞋', 3);
INSERT INTO `categorysecond` VALUES (49, '训练鞋', 3);
INSERT INTO `categorysecond` VALUES (50, '凉鞋', 3);
INSERT INTO `categorysecond` VALUES (51, '拖鞋', 3);
INSERT INTO `categorysecond` VALUES (52, '卫衣', 3);
INSERT INTO `categorysecond` VALUES (53, '针织衫', 3);
INSERT INTO `categorysecond` VALUES (54, '外套', 3);
INSERT INTO `categorysecond` VALUES (55, '马甲', 3);
INSERT INTO `categorysecond` VALUES (56, 'T恤', 3);
INSERT INTO `categorysecond` VALUES (57, 'Polo衫', 3);
INSERT INTO `categorysecond` VALUES (58, '背心', 3);
INSERT INTO `categorysecond` VALUES (59, '裤装', 3);
INSERT INTO `categorysecond` VALUES (60, '比赛服', 3);
INSERT INTO `categorysecond` VALUES (61, '棉服', 3);
INSERT INTO `categorysecond` VALUES (62, '羽绒服', 3);
INSERT INTO `categorysecond` VALUES (63, '套装', 3);
INSERT INTO `categorysecond` VALUES (64, '跑步鞋', 4);
INSERT INTO `categorysecond` VALUES (65, '训练鞋', 4);
INSERT INTO `categorysecond` VALUES (66, '篮球鞋', 4);
INSERT INTO `categorysecond` VALUES (67, '凉鞋', 4);
INSERT INTO `categorysecond` VALUES (68, '拖鞋', 4);
INSERT INTO `categorysecond` VALUES (70, '外套', 4);
INSERT INTO `categorysecond` VALUES (71, '马甲', 4);
INSERT INTO `categorysecond` VALUES (72, '比赛服', 4);
INSERT INTO `categorysecond` VALUES (73, 'T恤', 4);
INSERT INTO `categorysecond` VALUES (74, 'Polo衫', 4);
INSERT INTO `categorysecond` VALUES (75, '背心', 4);
INSERT INTO `categorysecond` VALUES (77, '裙装', 4);
INSERT INTO `categorysecond` VALUES (78, '棉服', 4);
INSERT INTO `categorysecond` VALUES (79, '羽绒服', 4);
INSERT INTO `categorysecond` VALUES (80, '套装', 4);
INSERT INTO `categorysecond` VALUES (81, '舞蹈服', 4);
INSERT INTO `categorysecond` VALUES (82, '袜子', 5);
INSERT INTO `categorysecond` VALUES (83, '包', 5);
INSERT INTO `categorysecond` VALUES (84, '护具', 5);
INSERT INTO `categorysecond` VALUES (85, '帽子', 5);
INSERT INTO `categorysecond` VALUES (86, '手套', 5);
INSERT INTO `categorysecond` VALUES (87, '围巾', 5);
INSERT INTO `categorysecond` VALUES (88, '配饰', 5);
INSERT INTO `categorysecond` VALUES (89, '乒乓球装备', 6);
INSERT INTO `categorysecond` VALUES (90, '羽毛球装备', 6);
INSERT INTO `categorysecond` VALUES (91, '球类', 6);
INSERT INTO `categorysecond` VALUES (92, '跑步', 7);
INSERT INTO `categorysecond` VALUES (93, '篮球', 7);
INSERT INTO `categorysecond` VALUES (94, '训练', 7);
INSERT INTO `categorysecond` VALUES (95, '乒乓球', 7);
INSERT INTO `categorysecond` VALUES (96, '羽毛球', 7);
INSERT INTO `categorysecond` VALUES (97, '足球', 7);
INSERT INTO `categorysecond` VALUES (98, '运动时尚', 7);

-- ----------------------------
-- Table structure for info
-- ----------------------------
DROP TABLE IF EXISTS `info`;
CREATE TABLE `info`  (
  `info_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pub_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `publisher` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of info
-- ----------------------------
INSERT INTO `info` VALUES (15, '1', '<p>请重新5656</p>', '2019-05-05 12:42:00', 'admin');
INSERT INTO `info` VALUES (16, '1', '<p>请重新6969</p>', '2019-05-05 12:43:35', 'admin');
INSERT INTO `info` VALUES (17, '78', '<p>666</p>', '2019-05-05 12:28:17', 'admin');
INSERT INTO `info` VALUES (18, '1', '<p>9999</p>', '2019-05-05 12:30:45', 'admin');
INSERT INTO `info` VALUES (20, '1', '<p>请重新输789</p>', '2019-05-05 12:37:48', 'admin');
INSERT INTO `info` VALUES (21, '789', '<p>sdfsfwe</p>', '2019-05-05 16:44:23', 'admin');
INSERT INTO `info` VALUES (24, 'fdv ', '<p>请输入内容sdf&nbsp;</p>', '2019-10-14 18:52:53', 'admin');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem`  (
  `itemid` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) NULL DEFAULT NULL,
  `subtotal` double NULL DEFAULT NULL,
  `pid` int(11) NULL DEFAULT NULL,
  `oid` int(11) NULL DEFAULT NULL,
  `evaluation_code` int(255) NULL DEFAULT NULL,
  `comments` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`itemid`) USING BTREE,
  INDEX `FKE8B2AB6166C01961`(`oid`) USING BTREE,
  INDEX `FKE8B2AB6171DB7AE4`(`pid`) USING BTREE,
  INDEX `FKE8B2AB6140ACF87A`(`oid`) USING BTREE,
  CONSTRAINT `FKE8B2AB6140ACF87A` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKE8B2AB6171DB7AE4` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES (113, 1, 199, 26, 2019469, 2, NULL, NULL, NULL);
INSERT INTO `orderitem` VALUES (114, 1, 459, 6, 2019470, 2, NULL, NULL, NULL);
INSERT INTO `orderitem` VALUES (115, 1, 699, 21, 2019471, 2, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `total` double NULL DEFAULT NULL,
  `ordertime` datetime(0) NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`oid`) USING BTREE,
  INDEX `FKC3DF62E5AA3D9C7`(`uid`) USING BTREE,
  CONSTRAINT `FKC3DF62E5AA3D9C7` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2019468 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (2019417, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (2019469, 199, '2019-10-14 18:58:13', 4, 'lx', '18681693421', '西南科技大学', 19);
INSERT INTO `orders` VALUES (2019470, 459, '2019-10-14 18:58:21', 4, 'lx', '18681693421', '西南科技大学', 19);
INSERT INTO `orders` VALUES (2019471, 699, '2019-10-14 19:36:25', 4, 'lx', '18681693421', '西南科技大学', 19);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `market_price` double NULL DEFAULT NULL,
  `shop_price` double NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pdesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_hot` int(11) NULL DEFAULT NULL,
  `pdate` datetime(0) NULL DEFAULT NULL,
  `csid` int(11) NULL DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `visits` int(11) NULL DEFAULT NULL,
  `sales` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`pid`) USING BTREE,
  INDEX `FKED8DCCEFB9B74E02`(`csid`) USING BTREE,
  CONSTRAINT `FKED8DCCEFB9B74E02` FOREIGN KEY (`csid`) REFERENCES `categorysecond` (`csid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, '超轻十五男子一体织减震轻质跑鞋', 499, 359, 'products/1/cs10001.png', '超轻十五一体织减震轻质跑鞋，运用简洁的色彩搭配，简约休闲。\n鞋面采用一体织工艺，舒适透气，提升穿着体验。中底李宁云LITE减震配方，提升缓震性能。鞋后侧李宁品牌标识设计，精致做工，彰显品牌魅力。', 1, '2014-11-02 20:18:00', 1, 'red-green-blue', '35码-36码-37码', 21, 4);
INSERT INTO `product` VALUES (2, '男子轻便耐磨减震跑鞋 ', 299, 138, 'products/1/cs10002.png', '轻便耐磨减震跑鞋，运用简洁的色彩搭配，简约休闲。鞋身李宁品牌标识设计，精致做工，彰显品牌魅力。鞋底采用EVA结合橡胶设计，轻盈舒适，耐磨防滑。', 1, '2014-11-02 20:18:00', 1, 'red-green-blue', '35码-36码-37码', 4, 2);
INSERT INTO `product` VALUES (3, '高达男子防滑耐磨野外跑鞋 ', 339, 239, 'products/1/cs10003.png', '高达防滑耐磨野外跑鞋，运用简洁的配色，简单休闲，时尚大方。\n鞋子上的李宁品牌标识设计,做工细致，彰显品牌魅力。鞋底采用野外跑橡胶大底，抓地与耐磨性能突出，更适合冬季路况。', 1, '2014-11-02 20:18:00', 1, NULL, NULL, 5, 3);
INSERT INTO `product` VALUES (4, '【2019新品】男子一体织透气减震跑鞋', 499, 319, 'products/1/cs10004.png', '一体织透气减震跑鞋，运用简洁的色彩搭配，简约休闲。\n鞋面飞织袜套设计，包裹性能好。鞋身品牌标志外框，和中底上的喷漆融合成一个大品牌标志，个性潮流。新轻云大底，搭配橡胶大底，轻质缓震的同时有效延长使用寿命。', 0, '2014-11-02 20:18:00', 1, NULL, NULL, 2, 1);
INSERT INTO `product` VALUES (5, '【2019新品】男子全掌气垫一体织中帮减震跑鞋', 599, 358, 'products/1/cs10005.png', '全掌气垫一体织中帮减震跑鞋，运用简洁的色彩搭配，简单时尚。\n鞋面采用立体飞织设计，上脚有型。个性鞋口和暗纹贴膜设计，时尚潮流。鞋身大网孔透视，呈现不完整的品牌标志，低调不张扬。全掌气垫弧，良好缓震功能保护双脚和膝盖', 0, '2014-11-02 20:18:00', 1, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (6, '【2019新品】封锁男子一体织透气高帮篮球专业比赛鞋 ', 599, 459, 'products/1/cs10006.png', '封锁一体织透气高帮篮球专业比赛鞋，运用简洁的色彩搭配，简约休闲。\n鞋面飞织织带设计，加强包裹，更加贴合脚部。外腰TPU上延，有效加强鞋身支撑。缓震PHYLON中底搭配橡胶大底，有效缓震的同时延长使用寿命。', 1, '2019-04-06 20:18:00', 2, NULL, NULL, 3, 1);
INSERT INTO `product` VALUES (7, '【2019新品】奔袭男子包裹篮球专业比赛鞋 ', 469, 278, 'products/1/cs10007.png', '奔袭包裹篮球专业比赛鞋，运用简洁的色彩搭配，简约休闲。\n鞋面采用时尚飞织、蜻蜓织带鞋带设计，加强包裹性。插3m鞋带提升安全性能，后跟反毛皮饰片提升细节品质。缓震PHYLON中底搭配橡胶大底，有效缓震的同时延长了使用寿命。', 1, '2019-04-06 20:18:00', 2, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (8, '【2019新品】WARNING男子一体织透气中帮篮球专业比赛鞋 ', 699, 438, 'products/1/cs10008.png', 'WARNING一体织透气中帮篮球专业比赛，运用简洁的色彩搭配，简约休闲。\n鞋面搭袢设计，穿着便捷加强包裹。飞线、织带、细节加强包裹，兼具时尚感。中底侧墙英文字体转印，脚背态度语言，彰显个性。云中底舒适缓震，领口TPU设计，增强支撑和包裹性能', 1, '2019-04-06 20:18:00', 2, NULL, NULL, 3, NULL);
INSERT INTO `product` VALUES (9, '夜行者2018男子李宁云减震篮球专业比赛鞋', 499, 318, 'products/1/cs10009.png', '夜行者2018耐磨防滑篮球专业比赛鞋，运用简洁的色彩搭配，简约休闲。\n鞋身李宁品牌标识设计，精致做工，彰显品牌魅力。', 0, '2019-04-06 20:18:00', 2, NULL, NULL, 2, NULL);
INSERT INTO `product` VALUES (10, '战隼男子减震回弹高帮篮球专业比赛鞋', 659, 458, 'products/1/cs100010.png', '战隼减震回弹高帮篮球专业比赛鞋，运用简洁的色彩搭配，简约休闲。\n网布鞋面设计，有助于运动时脚步热量散发，远离穿着闷热感，轻松透气。鞋底Bounse+科技，回弹缓震，分散足部压力。中底碳纤版，加强足弓支撑和力传导。', 0, '2019-04-06 20:18:00', 2, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (11, '光荣男子轻便耐磨经典休闲鞋', 399, 238, 'products/1/cs100011.png', '光荣轻便耐磨经典休闲鞋，运用简洁的色彩搭配，简约休闲。\n鞋面采用质感皮料拼接，时尚复古，体现混搭质感。橡胶大底+EVA中底+TPU，舒适耐磨防滑。', 1, '2019-04-06 20:18:00', 3, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (12, '逆风男子轻便耐磨经典休闲鞋', 439, 218, 'products/1/cs100012.png', '逆风轻便耐磨经典休闲鞋，运用简洁的色彩搭配，简约休闲。\n鞋面撞色设计，经典时尚，适用多种场合。鞋底EVA结合橡胶，轻盈舒适，耐磨防滑。', 1, '2019-04-06 20:18:00', 3, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (13, '【2019新品】男子支撑经典休闲鞋', 399, 238, 'products/1/cs100013.png', '支撑经典休闲鞋，运用简洁的色彩搭配，简约休闲。\n鞋面融合半开合，补丁设计手法、反毛皮拼接提升质感，打造不一样的复古。经典复古风格，潮流撞色设计。缓震PHYLON中底搭配橡胶鞋底，有效缓震的同时也延长了使用寿命。', 1, '2019-04-06 20:18:00', 3, NULL, NULL, 1, 1);
INSERT INTO `product` VALUES (14, '【2019新品】男子轻便包裹潮流休闲鞋', 299, 158, 'products/1/cs100014.png', '轻便包裹潮流休闲鞋，运用简洁的色彩搭配，简约休闲。\n鞋面采用网布设计，上脚更加透气舒适。鞋口处弹力网布领口，穿脱舒适。大底采用轻质材料打造，柔软易弯折，运动更加轻松自如。', 0, '2019-04-06 20:18:00', 3, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (15, '男子耐磨防滑经典休闲鞋 ', 239, 128, 'products/1/cs100015.png', '耐磨防滑经典休闲鞋，运用简洁的色彩搭配，简约休闲。\n鞋舌李宁品牌标识设计，精致做工，彰显品牌魅力。橡胶大底设计，耐磨防滑，有效延长使用寿命', 0, '2019-04-06 20:18:00', 3, NULL, NULL, 3, 1);
INSERT INTO `product` VALUES (16, '李宁男子户外徒步鞋 ', 359, 139, 'products/1/cs100016.png', '李宁户外徒步鞋，运用简洁的色彩搭配，简单大方。鞋子采用全皮革鞋面+WARM SHELL科技，穿着舒适保暖，美观大气。鞋带采用双色鞋带，经典时尚，是鞋子的亮点之一。鞋子上整齐的车线，增添鞋子的品质感。鞋头防撞设计，减少擦伤脚趾或碰撞，呵护每一步。鞋子上的李宁品牌LOGO，细致做工，彰显品牌魅力。鞋底采用轻质防滑抓地大底，耐磨防滑，使用寿命长。', 1, '2019-04-06 20:18:00', 4, NULL, NULL, 1, 1);
INSERT INTO `product` VALUES (17, '霸虎II男子耐磨防滑中帮户外休闲鞋  ', 569, 569, 'products/1/cs100017.png', '霸虎II耐磨防滑中帮户外休闲鞋，运用简洁的色彩搭配，简约休闲。\n鞋面采用牛皮革与纺织品打造，有效提升保暖性能。鞋底采用橡胶结合EVA打造，耐磨防滑，能有效延长使用寿命，更加适合户外登山徒步运动。', 1, '2019-04-06 20:18:00', 4, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (18, '炫途II男子加绒保暖户外休闲鞋', 439, 279, 'products/1/cs100018.png', '炫途II加绒保暖户外休闲鞋，运用简洁的色彩搭配，简约休闲。\n 大底采用橡胶结合EVA，耐磨防滑。鞋头防撞设计，减少擦伤脚趾或碰撞，呵护每一步。', 1, '2019-04-06 20:18:00', 4, NULL, NULL, 10, 3);
INSERT INTO `product` VALUES (19, '男子加绒保暖中帮户外徒步鞋', 499, 299, 'products/1/cs100019.png', '加绒保暖中帮户外徒步鞋，采用简洁的色彩搭配，简单大方，时尚百搭。\n鞋底采用户外徒步大底，耐磨防滑，抓地性强。鞋面撞色设计，时尚白搭。后跟提带设计，方便穿脱。', 0, '2019-04-06 20:18:00', 4, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (20, '男子耐磨中帮户外休闲鞋', 399, 199, 'products/1/cs100020.png', '耐磨中帮户外休闲鞋，运用简洁的色彩搭配，简约休闲。\n橡胶大底，耐磨防滑。皮质鞋面结合中帮设计，帅气时尚。鞋后跟提带设计，方便穿脱。', 0, '2019-04-06 20:18:00', 4, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (21, '【2019新品】酷鲨男子透气缓震羽毛球专业鞋', 899, 699, 'products/1/cs100021.png', '酷鲨羽毛球专业鞋，采用简洁的色彩搭配，简单大方，时尚百搭。\n设计师结合鲨鱼表层盾鳞结构设计底花，并通过计算机建模运算，交错排布，构建全新大底，有效提升抓地力。大底全掌鱼骨状弯折引导结构，有效提升启动和灵活性。前掌Bounse+有力回弹，后掌李宁云舒适缓震，足弓碳板结合 TPU，有效抗扭转。一体化鞋面结合局部 MONO 纱透气槽，实现良好的包裹性及透气性，同时搭配底部透气槽及中底鱼骨透气支撑，实现急速 3D 循环换气系统。', 1, '2019-04-06 20:18:00', 5, NULL, NULL, 41, 5);
INSERT INTO `product` VALUES (22, '突袭男子一体织减震回弹羽毛球专业比赛鞋', 899, 568, 'products/1/cs100022.png', '突袭男子一体织减震回弹羽毛球专业比赛鞋，采用简洁的色彩搭配，简单大方，时尚百搭。\n采用时下流行的袜套结构设计，织物网孔鞋面，贴合双脚，尽享舒适透气体验；鞋底采用德国巴斯夫材料公司研发的DRIVE FOAM科技，提供更长时间的回弹和缓震性能，帮助提升运动表现；加厚橡胶大底，抓地力强劲，中足X型结构，内置透气网孔，强韧抗扭，稳妥守护双脚。', 1, '2019-04-06 20:18:00', 5, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (23, '先锋男子减震回弹羽毛球专业比赛鞋', 899, 568, 'products/1/cs100023.png', '先锋减震回弹羽毛球专业比赛鞋，采用简洁的色彩搭配，简单大方，时尚百搭。\n中足抗扭设计，带来强力支撑效果，稳定抗扭转；隐藏式织带设计，提供侧向支撑；中底采用喷墨设计，活力动感，张扬运动风采；双科技加持中底，高弹减震，加厚橡胶大底，结合弯折沟设计，带来更强劲的抓地力和更舒适的弯曲体验，让运动更自如。', 1, '2019-04-06 20:18:00', 5, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (24, '羽动男子羽毛球训练鞋 ', 339, 258, 'products/1/cs100024.png', '羽动男子羽毛球训练鞋，采用简洁的色彩搭配，简单大方，时尚百搭。\n鞋面采用合成革与织物设计，内层网面织物结构，透气清爽；外层合成革拼接设计，稳妥包裹双脚，让步伐更灵活；撞色拼接鞋面，搭配BADMINTON英文大写字母，尽显动感活力，助攻赛场精彩发挥；菱形颗粒大底结合弯折沟设计，双脚弯曲更舒适；圆形单元让步伐变向更自由。', 0, '2019-04-06 20:18:00', 5, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (25, 'Dual Cloud男子李宁云减震羽毛球训练鞋 ', 499, 358, 'products/1/cs100025.png', '李宁男子羽毛球训练鞋，采用简洁的色彩搭配，简单大方，时尚百搭。\n中足TPU补强结构，带来强力支撑效果，抗扭转性增强；鞋面外侧采用热贴膜工艺，带来舒适包裹效果，增添时尚感。', 0, '2019-04-06 20:18:00', 5, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (26, 'Super Trainer男子轻便灵活训练鞋', 399, 199, 'products/1/cs100026.png', 'Super Trainer轻便灵活训练鞋，运用简洁的色彩搭配，简约休闲。\n灵活大底，柔软舒适。帮面采用网布+立体印压工艺，彰显细节的同时，提升了包裹束紧感', 1, '2019-04-06 20:18:00', 6, NULL, NULL, 1, 1);
INSERT INTO `product` VALUES (27, '無界男子一体织袜套高帮缓震训练鞋', 899, 769, 'products/1/cs100027.png', '宁無界一体织袜子鞋透气包裹耐磨防滑高帮缓震训练鞋，运用简洁的色彩搭配，简约休闲。\n鞋面一体织+多处织带，束紧性强，适应高强度运动。模块减震大底，分区域缓震单元更贴合运动需求。', 1, '2019-04-06 20:18:00', 6, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (28, '无界低帮版男子一体织透气缓震训练鞋', 469, 239, 'products/1/cs100028.png', '无界低帮版一体织透气缓震训练鞋，运用简洁的色彩搭配，简约休闲。\n鞋身采用一体织帮面+侧墙飞线技术，透气包裹，有效束紧。大底使用分模块减震大底，分区域缓震单元结构更加贴合运动需求。鞋面袜套结构，舒适包裹脚面的同时提升束紧感。', 1, '2019-04-06 20:18:00', 6, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (29, '男子一体织缓震训练鞋', 469, 239, 'products/1/cs100029.png', '训练系列一体织缓震训练鞋，运用简洁的色彩搭配，简约休闲。\n鞋面采用一体织材质，如第二层肌肤般贴合足部，舒适透气。袜套设计，舒适包裹，时尚潮流', 0, '2019-04-06 20:18:00', 6, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (30, '男子透气灵活训练鞋', 369, 239, 'products/1/cs100030.png', '透气灵活训练鞋，运用简洁的色彩搭配，简约休闲。\n鞋面采用纺织品材质，舒适透气，提供良好脚感。灵活切割大底设计，轻便柔软，耐磨防滑。', 0, '2019-04-06 20:18:00', 6, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (31, '男子透气轻便潮流凉鞋', 100, 59, 'products/1/cs100032.png', '透气轻便潮流凉鞋，运用简洁的色彩搭配，简约休闲。\n鞋面采用纺织品材质，舒适柔软，提供良好脚感。鞋底轻质中底，穿着轻量且舒适。', 0, '2019-04-06 20:18:00', 7, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (32, '男子轻便拖鞋 ', 50, 25, 'products/1/cs100031.png', '轻便拖鞋，运用简洁的色彩搭配，简约休闲。\nPVC耳带材质，柔软舒适，轻质易打理，带来清凉夏季感。EVA鞋底，轻便舒适。', 0, '2019-04-06 20:18:00', 8, NULL, NULL, 1, NULL);
INSERT INTO `product` VALUES (33, '女子透气轻便跑鞋  ', 299, 179, 'products/2/cs20001.png', '透气轻便跑鞋，运用简洁的色彩搭配，简约休闲。\n鞋面三明治网布，舒适透气，提升穿着体验。EVA中底+橡胶大底设计，轻便柔软，耐磨防滑。', 1, '2019-04-06 20:18:00', 24, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (34, '女子透气轻便跑鞋  ', 399, 279, 'products/2/cs20002.png', '轻质跑鞋，运用简洁的色彩搭配，简约休闲。\n鞋面贾卡材料，柔软透气舒适。鞋面3M织带透视，安全夜跑。', 1, '2019-04-06 20:18:00', 24, NULL, NULL, 1, NULL);
INSERT INTO `product` VALUES (35, '女子透气轻便跑鞋  ', 399, 279, 'products/2/cs20003.png', '轻质跑鞋，运用简洁的色彩搭配，简约休闲。\n鞋面贾卡材料，柔软透气舒适。鞋面3M织带透视，安全夜跑。', 1, '2019-04-06 20:18:00', 24, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (36, '【2019新品】女子一体织透气包裹减震跑鞋', 399, 218, 'products/2/cs20004.png', '一体织透气包裹减震跑鞋，运用简洁的色彩搭配，简约休闲。\n鞋面采用一体织材质，如第二层肌肤般贴合足部，舒适透气。后套贴膜空压，加强支持性能。加厚IP中底轻量灵活，鞋底柔软易弯折，运动更加轻松自如。', 0, '2019-04-06 20:18:00', 24, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (37, '【2019新品】CrazyRun-X女子减震跑鞋', 469, 378, 'products/2/cs20005.png', 'CrazyRun-X减震跑鞋，运用简洁的色彩搭配，简约休闲。\n帮面采用弹性莱卡材料拼接结构，侧墙织带，有效束紧。外侧TPU稳定加持，提高跑步防弯折功能属性。底部采用中底造型，带来舒适柔软的跑步体验。', 0, '2019-04-06 20:18:00', 24, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (38, '【2019新品】女子减震跑鞋', 399, 239, 'products/2/cs20006.png', '减震跑鞋，运用简洁的色彩搭配，简约休闲。\n鞋面PU材质撞色包边，视觉冲击力强。通过层叠等设计手法，打造复古风。半开合标志视觉效果，鞋面高周波细节，复古潮流。双密度中底，搭配橡胶大底，支撑缓震的同时有效延长使用寿命。', 1, '2019-04-06 20:18:00', 24, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (39, '双密云女子一体织回弹减震跑鞋 ', 399, 259, 'products/2/cs20007.png', '双密云一体织回弹减震跑鞋，运用简洁的色彩搭配，简约休闲。\n云配方双密度减震中底，底层低密度材料，有效缓冲。鞋身帮面混色一体织，舒适透气。两侧TPU支撑，稳定包裹。', 1, '2019-04-06 20:18:00', 24, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (40, '李宁弧2018女子一体织回弹减震跑鞋  ', 499, 359, 'products/2/cs20008.png', '李宁弧2018一体织回弹减震跑鞋，运用简洁的色彩搭配，简单时尚。\n采用一体织工艺，舒适透气，提供良好脚感。大底采用EVA结合橡胶，轻便耐磨防滑。鞋带处七彩膜设计，个性抢眼。', 1, '2019-04-06 20:18:00', 24, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (41, 'Retro 90 GS女子高帮篮球休闲鞋', 399, 199, 'products/2/cs20009.png', '李宁Retro 90 GS女子篮球休闲鞋，采用简洁的色彩搭配，简单大方，时尚百搭。\n鞋面采用合成革材质制作，质感有型；鞋底采用橡胶结合EVA设计，耐磨防滑，使用寿命长。', 1, '2019-04-06 20:18:00', 25, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (42, '青霜女子轻便耐磨潮流休闲鞋 ', 139, 99, 'products/2/cs200010.png', '青霜轻便耐磨潮流休闲鞋，运用简洁的色彩搭配，简单时尚。\nEVA结合橡胶大底设计，轻便耐磨防滑。鞋舌李宁品牌标识设计，精致做工，彰显品质感。', 1, '2019-04-06 20:18:00', 26, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (43, '女子耐磨防滑经典休闲鞋  ', 119, 98, 'products/2/cs200011.png', '李宁小白鞋滑板鞋耐磨防滑经典休闲鞋，运用简洁的色彩搭配，简约休闲。\n采用合成革材质，穿着舒适。特色后领口设计，时尚潮流。', 0, '2019-04-06 20:18:00', 26, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (44, '炫途II GS女子户外休闲鞋', 219, 198, 'products/2/cs200012.png', '炫途II GS户外休闲鞋，运用简洁的色彩搭配，简单时尚。\n皮革鞋面设计，减少碎石砂砾进入，便捷实用。橡胶大底搭载底部纹路设计，增强抓地力，适合户外徒步。', 1, '2019-04-06 20:18:00', 27, NULL, NULL, 2, NULL);
INSERT INTO `product` VALUES (45, '【2019新品】Protector女子羽毛球训练鞋 ', 319, 298, 'products/2/cs200013.png', 'rotector女子羽毛球训练鞋，采用简洁的色彩搭配，简单大方，时尚百搭。\n鞋面采用合成革与织物设计，内层网面织物结构，透气清爽；外层合成革拼接设计，稳妥包裹双脚，让步伐更灵活；鞋面采用SOLID SYSTEM织带绑缚设计，舒适固定脚部，助你赛场更好发挥；NON-MARKING橡胶大底结合弯折沟设计，双脚弯曲更舒适；轮胎纹后跟大底，让脚跟着地更加稳定。', 1, '2019-04-06 20:18:00', 28, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (46, '训练系列男子保暖修身90%白鸭绒短羽绒服 ', 699, 298, 'products/1/cs100033.png', '训练系列保暖修身90%白鸭绒短款羽绒服，运用简洁的色彩搭配，简单时尚。\n主身内里鸭绒填充，有效保暖，轻便出行。立领设计，包裹性强，兼顾休闲自然。', 1, '2019-04-06 20:18:00', 9, NULL, NULL, 2, 2);
INSERT INTO `product` VALUES (47, '训练系列男子白鸭绒短羽绒服  ', 599, 398, 'products/1/cs100034.png', '训练系列保暖白鸭绒短款羽绒服，运用简洁的色彩搭配，简单时尚。\n主身内里鸭绒填充，有效保暖，轻便出行。连帽设计，包裹性更强，兼顾休闲自然。采用哑光面料，表面采用无绗缝设计更显质感。', 1, '2019-04-06 20:18:00', 9, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (48, 'BAD FIVE篮球系列男子90%白鸭绒短款羽绒服', 499, 398, 'products/1/cs100035.png', '李宁BAD FIVE篮球系列90%白鸭绒修身保暖短羽绒服，运用简洁的色彩搭配，简单时尚。\n胸前BAD5标识设计，精致做工，彰显品牌魅力。衣服内侧图案设计，新颖别致，时尚美观。', 1, '2019-04-06 20:18:00', 9, NULL, NULL, 2, 1);
INSERT INTO `product` VALUES (49, '训练系列男子保暖白鸭绒中款羽绒服', 299, 198, 'products/1/cs100036.png', '训练系列保暖白鸭绒中款羽绒服，运用简洁的色彩搭配，简单时尚。\n内里白鸭绒填充，保暖舒适，轻盈蓬松。连帽设计，保暖舒适，时尚美观。衣服撞色设计，新颖潮流。', 0, '2019-04-06 20:18:00', 9, NULL, NULL, 2, 2);
INSERT INTO `product` VALUES (50, '运动时尚系列男子保暖中羽绒服', 399, 268, 'products/1/cs100037.png', '运动时尚系列保暖中羽绒服，运用简洁的色彩搭配，简单时尚。\n衣服添加白鸭绒，舒适保暖，蓬松百搭，增加衣服的保暖性。大身运用当季流行的机能风与多口袋工装感相融合的设计诠释时尚流行的品质感，大身正面胸前有章\n牌与3M反光印花进行点缀，潮流百搭。', 0, '2019-04-06 20:18:00', 9, NULL, NULL, 1, 1);
INSERT INTO `product` VALUES (51, '运动时尚系列男子保暖短棉服 ', 399, 268, 'products/1/cs100038.png', '运动时尚系列保暖短棉服，运用简洁的色彩搭配，简单时尚。\n经典版型，大身口袋与手臂上的口袋是当下潮流趋势，潮流百搭，时尚潮流。立领设计，型男专属。', 1, '2019-04-06 20:18:00', 10, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (52, '运动时尚系列男子保暖短棉服 ', 599, 368, 'products/1/cs100039.png', '运动时尚系列保暖短棉服，运用简洁的色彩搭配，简单时尚。\n采用涤纶面料材质，耐脏易洗，不易褶皱。立领设计，舒适贴合脖子，防风保暖。两侧实用拉链口袋设计，方便携带随身物品。', 1, '2019-04-06 20:18:00', 10, NULL, NULL, 1, NULL);
INSERT INTO `product` VALUES (53, '运动时尚系列男子保暖中棉服 ', 569, 468, 'products/1/cs100040.png', '运动时尚系列保暖中棉服，运用简洁的色彩搭配，简单时尚。\n中长款棉服，起到拉伸身材比例的视觉效果。腰部抽绳调节松紧，锁住热量，实现良好的保暖效果。帽里迷彩印花点缀，时尚个性，演绎街头风。连帽搭配抽绳设计，自由灵活调节，防风和保暖。', 1, '2019-04-06 20:18:00', 10, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (54, '勇气男子保暖短棉服  ', 369, 268, 'products/1/cs100041.png', '勇气保暖短棉服，运用简洁的色彩搭配，简单时尚。\n采用双侧结构性立体裁剪，穿着更有型。柔软的尼龙拉链设计，凸显细节品质。', 0, '2019-04-06 20:18:00', 10, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (55, '运动时尚系列男子短棉服 ', 569, 558, 'products/1/cs100042.png', '运动时尚系列短棉服，运用简洁的色彩搭配，简约休闲。\n采用锦纶面料，内填充涤纶，更加防风保暖。经典棒球服版棉服，下方李宁标志设计，潮酷的同时体现李宁精神。下摆及袖口螺纹收口，有限锁住热量，防寒保暖。', 0, '2019-04-06 20:18:00', 10, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (56, '【2019新品】CBA全明星南方战队篮球系列男子保暖宽松棉夹克  ', 469, 358, 'products/1/cs100043.png', 'CBA全明星南方战队篮球系列保暖宽松棉夹克，运用简洁的色彩搭配，简单时尚。\n采用混纺材质，穿着更加亲肤保暖。衣身撞色图案设计，与领口下摆罗纹处图案相呼应，诠释不一样的时尚潮流。两侧实用口袋设计，方便携带随身物品。', 1, '2019-04-06 20:18:00', 11, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (57, '【2019新品】巴黎时装周中国李宁系列男女同款宽松夹克 ', 569, 458, 'products/1/cs100044.png', '巴黎时装周中国李宁系列男女同款宽松夹克，运用简洁的色彩搭配，简单时尚。\n采用混纺面料，穿着更加防风保暖。宽松版型，袖子两侧撞色拼接，正面李宁大标志印花，与后背的字母刺绣相呼应。两侧拉链口袋设计，方便携带随身物品，实用性强。', 0, '2019-04-06 20:18:00', 11, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (58, '【2019新品】BAD FIVE篮球系列男子套头卫衣', 269, 158, 'products/1/cs100045.png', 'BAD FIVE篮球系列套头卫衣，运用简洁的色彩搭配，简单时尚。\n采用棉涤材质，亲肤柔和且穿着舒适。经典常规版型，舒适百搭。袖口罗纹收口设计，有效防风，方便运动。', 0, '2019-04-06 20:18:00', 13, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (59, '运动生活系列男子反光开衫连帽卫衣 ', 369, 258, 'products/1/cs100046.png', '李宁运动生活系列反光开衫连帽卫衣，运用简洁的色彩搭配，简单时尚。\n选用棉涤材质，亲肤柔和且穿着舒适。胸前李宁品牌LOGO设计，精致做工，彰显品牌魅力。衣身撞色设计，简约大方，时尚美观。', 1, '2019-04-06 20:18:00', 13, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (60, '巴黎时装周中国李宁系列男女同款套头连帽卫衣  ', 269, 258, 'products/1/cs100047.png', '巴黎时装周中国李宁系列男女同款套头连帽卫衣，运用简洁的色彩搭配，简单时尚。\n舒适面料，传统纺织工艺织造，保留其以传自然手感，辅以厚重质感。胸前采用刺绣工艺结合“中国李宁”，同时也表达了李宁品牌对于中国传统文化的崇敬之情。', 1, '2019-04-06 20:18:00', 13, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (61, '【2019新品】复古运动米奇系列男子收口卫裤 ', 269, 158, 'products/1/cs100048.png', '复古运动米奇系列收口卫裤，运用经典的纯色设计，简约时尚。\n采用双面布面料，穿着更加亲肤舒适。大身裤腿处大色块撞色印花，个性吸睛。另一侧后片印有趣味运动米奇轮廓印花，轻松活泼。', 1, '2019-04-06 20:18:00', 14, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (62, '韦德篮球系列男子平口短卫裤 ', 169, 118, 'products/1/cs100049.png', '韦德系列平口短卫裤，运用简洁的色彩搭配，简单时尚。 \n腰头DWADE刺绣结合公牛配色，精致美观，时尚就是这么简单。采用双卫衣布面料，柔软亲肤不紧绷，带来透气舒适的运动体验。腰部抽绳设计，松紧自由灵活调节，提升舒适度。', 0, '2019-04-06 20:18:00', 14, NULL, NULL, 1, 1);
INSERT INTO `product` VALUES (63, '训练系列男子开衫卫衣套装  ', 239, 218, 'products/1/cs100050.png', '训练系列开衫卫衣套装，运用简洁的色彩搭配，简单时尚。\n采用棉涤材质，亲肤柔和且穿着舒适。李宁品牌LOGO设计，精致做工，彰显品牌魅力。', 0, '2019-04-06 20:18:00', 15, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (64, '训练系列男子长袖紧身衣  ', 139, 118, 'products/1/cs100051.png', '训练系列长袖紧身衣，运用简洁的色彩搭配，简单时尚。\n采用舒适面料，穿着舒适。腋下拼接网布，兼顾透气效果。', 0, '2019-04-06 20:18:00', 16, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (65, '【2019新品】羽毛球系列男子速干凉爽比赛套装 ', 239, 218, 'products/1/cs100052.png', '李宁羽毛球系列速干凉爽比赛套装，运用简洁的色彩搭配，简单时尚。\n经典套装设计，常规运动版型，契合身型，凸显运动美感；巧妙的非对称设计结合肩部英伦风格图案，尽显运动美感。胸前与短裤的李宁品牌LOGO，精致做工，彰显品牌魅力。两侧插袋，方便放置随身物品，简约实用。', 0, '2019-04-06 20:18:00', 17, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (66, '训练系列男子运动内裤四条装（特殊产品不予退换货)  ', 59, 48, 'products/1/cs100053.png', '训练系列运动内裤四条装（特殊产品不予退换货)，运用简洁的色彩搭配，简约休闲。\n裤头的李宁品牌标识设计，彰显品牌魅力。内裤上整齐的车线，凸显品质感', 0, '2019-04-06 20:18:00', 19, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (67, '【2019新品】运动时尚系列男子短袖POLO衫  ', 119, 88, 'products/1/cs100054.png', '运动时尚系列短袖POLO衫，运用简洁的色彩搭配，简单时尚。\n采用品质棉质面料，穿着更加亲肤舒适。衣身大面积撞色拼接，胸口李宁标志设计，个性时尚。小翻领设计，搭配精致纽扣，更加舒适贴合。', 0, '2019-04-06 20:18:00', 21, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (68, '专业竞技系列男子泳裤(特殊产品不予退换货) ', 59, 38, 'products/1/cs100055.png', '专业竞技系列泳裤(特殊产品不予退换货)，运用简洁的色彩搭配，简单时尚。\n裤身李宁品牌大LOGO结合英文字母设计，精致做工，彰显品牌魅力。', 0, '2019-04-06 20:18:00', 23, NULL, NULL, 1, 1);
INSERT INTO `product` VALUES (69, '运动时尚系列女子保暖修身90%白鸭绒短羽绒服  ', 599, 298, 'products/2/cs200014.png', '运动时尚系列保暖修身90%白鸭绒短羽绒服，运用简洁的色彩搭配，简单时尚。\n衣服添加白鸭绒，舒适保暖，蓬松百搭，增加衣服的保暖性。连帽设计，舒适保暖，时尚百搭。衣服印花设计，时尚百搭，经典时尚。', 0, '2019-04-06 20:18:00', 32, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (70, '【2018新品】LNG女子保暖宽松拼接棉茄克 ', 499, 398, 'products/2/cs200015.png', 'LNG保暖宽松拼接棉茄克，运用简洁的色彩搭配，简单时尚。\n采用涤纶拼接PU设计，个性潮流，且穿着舒适。衣身刺绣图案，潮流美观。设计立领设计，舒适贴合脖子，防风保暖。两侧实用口袋设计，方便携带随身物品。', 0, '2019-04-06 20:18:00', 33, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (71, '【2019新品】训练系列女子紧身中度支撑运动胸衣(特殊产品不予退换货)AUBP054-2  ', 199, 138, 'products/2/cs200016.png', '训练系列紧身中度支撑运动胸衣(特殊产品不予退换货)，运用简洁的色彩搭配，简单时尚。\n采用弹力混纺面料，运动穿着透气舒适。胸前字母和品牌标志印花设计，具有视觉冲击力。肩带采用“Y”字型弹力背带设计，简洁大方，具有设计感。', 0, '2019-04-06 20:18:00', 39, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (72, '【2019新品】男大童半掌气垫减震跑步鞋 ', 229, 218, 'products/3/cs30001.png', '男大童半掌气垫减震跑步鞋，运用简洁的色彩搭配，简约休闲。\n鞋身撞色设计，个性时尚，给人不一样的视觉体验。袜子鞋设计，加强包裹性。柔软鞋底搭配多凹槽设计，灵活易弯折，自由迈步。', 0, '2019-04-06 20:18:00', 47, NULL, NULL, 1, NULL);
INSERT INTO `product` VALUES (73, '男大童减震回弹童篮球鞋 ', 399, 259, 'products/3/cs30002.png', '男大童减震回弹童篮球鞋，运用简洁的色彩搭配，简约休闲。\n鞋面采用纺织品结合皮革设计，立体有型，上脚舒适。弹簧扣系带设计，穿脱便捷。鞋身满地印花设计，个性潮流。鞋底由橡胶集合EVA打造，脚感轻便的同有效延长了使用寿命。', 0, '2019-04-06 20:18:00', 48, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (74, '男女大童缓震支撑羽毛球训练鞋  ', 299, 159, 'products/3/cs30003.png', '男女大童缓震支撑羽毛球训练鞋，采用简洁的色彩搭配，简单大方，时尚百搭。\n加厚橡胶大底搭配多维方向加速设计，提供良好缓震性及抓地性。鞋面采用了 合成革搭配织物的包裹系统，提供良好的支撑性和透气性。', 0, '2019-04-06 20:18:00', 49, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (75, '【2019新品】男大童轻便童凉鞋  ', 299, 159, 'products/3/cs30004.png', '男大童轻便童凉鞋，运用简洁的色彩搭配，简约休闲。\n鞋面采用纺织品材质，上脚透气舒适。鞋身露趾镂空设计，让孩子畅享清凉。大底由EVA结合橡胶打造，脚感轻便的同时也有效延长了使用寿命。', 0, '2019-04-06 20:18:00', 50, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (76, '【2019新品】男大童运动生活系列开衫连帽卫衣  ', 299, 179, 'products/3/cs30005.png', '男大童运动生活系列开衫连帽卫衣，运用简洁的色彩搭配，简单时尚。\n采用柔软棉涤面料，穿着更加亲肤舒适。胸前“世界福气”文字，搭配后背小猪图案印花，满满的喜庆感。帽子处撞色拼接，充满设计感，个性时尚。两侧口袋设计，美观且方便实用。', 0, '2019-04-06 20:18:00', 52, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (77, '男小童运动生活系列开衫无帽编织衫  ', 199, 179, 'products/3/cs30006.png', '男小童运动生活系列开衫无帽编织衫，运用简洁的色彩搭配，简单时尚。\n采用舒适面料，亲肤舒适，保暖柔软。两侧口袋设计，方便实用，活泼可爱。', 0, '2019-04-06 20:18:00', 53, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (78, '男小童运动生活系列针织外套  ', 199, 179, 'products/3/cs30007.png', '男小童运动生活系列针织外套，运用简洁的色彩搭配，简单时尚。\n胸前品牌LOGO设计，精致做工，彰显品牌魅力。衣身图案印花设计，童趣活泼，时尚美观。', 0, '2019-04-06 20:18:00', 54, NULL, NULL, 1, 1);
INSERT INTO `product` VALUES (79, '【2019新品】男女小大童迪士尼米奇联名款短袖文化衫 ', 99, 69, 'products/3/cs30008.png', '男女小大童迪士尼米奇联名款短袖文化衫，运用简洁的色彩搭配，简单时尚。\n采用柔软棉质面料，亲肤舒适，提升穿着体验。胸前经典“迪士尼”动画人物图案印花设计，天真可爱，符合孩子的活泼童趣。', 0, '2019-04-06 20:18:00', 55, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (80, '男大童篮球系列90%白鸭绒保暖短羽绒服 ', 199, 169, 'products/3/cs30009.png', '男大童篮球系列90%白鸭绒保暖短羽绒服，运用简洁的色彩搭配，简单时尚。\n采用轻质格子布面料，防风防水效果好。羽绒内里填充鸭绒，舒适保暖。', 0, '2019-04-06 20:18:00', 62, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (81, '女大童耐磨防滑童跑步鞋 ', 299, 269, 'products/4/cs40001.png', '女大童耐磨防滑童跑步鞋，运用简洁的色彩搭配，简约休闲。\n鞋身撞色设计，个性时尚，给人不一样的视觉体验。鞋底采用橡胶结合EVA设计，耐磨防滑，有效延长使用寿命。', 0, '2019-04-06 20:18:00', 64, NULL, NULL, 1, NULL);
INSERT INTO `product` VALUES (82, '女大童轻便耐磨防滑支撑中帮童训练鞋  ', 299, 269, 'products/4/cs40002.png', '女大童轻便耐磨防滑支撑中帮童训练鞋，运用简洁的色彩搭配，简约休闲。\n鞋面采用纺织品结合TPU材质，结合绑带设计，提供良好的支持性。后跟提带设计，方便穿脱。鞋底采用生理弯曲凹槽设计，同时结合前后片状橡胶，耐磨防滑。', 0, '2019-04-06 20:18:00', 65, NULL, NULL, 1, NULL);
INSERT INTO `product` VALUES (84, '女大童BAD FIVE篮球系列保暖90%白鸭绒短羽绒服  ', 299, 229, 'products/4/cs40004.png', '女大童BAD FIVE篮球系列保暖90%白鸭绒短羽绒服，运用简洁的色彩搭配，简单时尚。\n衣服添加白鸭绒，舒适保暖，蓬松舒适。两侧口袋设计，美观又便于收纳随身物品，安全实用。连帽设计，包裹性强，防风且保暖。', 0, '2019-04-06 20:18:00', 78, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (85, 'DANSKIN 女童 Dance舞蹈系列 紧身连体衣 ', 199, 139, 'products/4/cs40005.png', 'DANSKIN Dance舞蹈系列 紧身连体衣\n这件带有简洁现代感线条的半透明网眼拼接连体衣，适合健身房长时间的热身运动。材质舒适顺滑，采用七分袖及经典的圆弧形后背设计。', 0, '2019-04-06 20:18:00', 81, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (86, '【2019新品】训练系列男子中袜六双装 ', 29, 12, 'products/5/cs50001.png', '训练系列中袜六双装，运用简洁的色彩搭配，简单时尚。\n采用混纺材质，舒适柔软，提升穿着体验。袜口李宁品牌LOGO设计，精致做工，彰显品牌魅力。袜口采用弹性罗口，增加包裹感，带来舒适的穿着体验。', 0, '2019-04-06 20:18:00', 82, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (87, '运动生活系列双肩包', 199, 129, 'products/5/cs50002.png', '篮球系列双肩包，运用简洁的色彩搭配设计，休闲百搭。\n可调式肩带设计，可根据自身需求灵活调节长度。包包内部拉链暗格设计，可以放置重要物品，更加安全实用。', 0, '2019-04-06 20:18:00', 83, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (88, '【2019新品】专业竞技系列护膝 ', 99, 49, 'products/5/cs50003.png', '专业竞技系列护膝，运用简洁的色彩搭配，简单时尚。\n采用一体织成型，护膝四面都具弹性，一端采用全自动锁边编织防水，伸缩自如，佩戴舒适。提供适度的紧缚力，四向编织可紧密地包裹膝部，贴合肢体，提供适当的保护作用，更为舒适，不易位移。提供适当的保护作用，更符合人体工学，有效保护膝盖。', 1, '2019-04-06 20:18:00', 84, NULL, NULL, 1, NULL);
INSERT INTO `product` VALUES (89, '中国李宁2019纽约时装周系列棒球帽 ', 199, 149, 'products/5/cs50004.png', '中国李宁2019纽约时装周系列棒球帽，运用简单的色彩搭配，休闲百搭。\n帽身上文字设计，精致美观，凸显细节感。舒适的帽型设计，运动时尚，将美观与实用相融合。', 1, '2019-04-06 20:18:00', 85, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (90, '运动时尚系列男子运动手套 ', 199, 149, 'products/5/cs50005.png', '运动时尚系列运动手套，运用简洁的色彩搭配，简单时尚。\n采用涤纶材质，佩戴舒适。手套上的品牌标识设计，精致做工，彰显品牌魅力。穿戴手套时可操作触摸屏，实用方便。', 1, '2019-04-06 20:18:00', 86, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (91, '篮球系列围巾 ', 99, 59, 'products/5/cs50006.png', '篮球系列围巾，运用简洁的色彩搭配，简单时尚。\n采用舒适面料，柔软亲肤，保暖舒适。围巾上的图案设计，时尚潮流，百搭经典，增添时尚感。', 1, '2019-04-06 20:18:00', 87, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (93, '红双喜劲极2系列乒乓底板(横拍) ', 45, 25, 'products/6/cs60001.png', '型号：PG2-L，材质：5层纯木，拍型：横拍，类型：进攻型，适合打法：弧圈结合快攻，包装：1块  高性价比的纯木底板。适合以相持进攻为主要得分手段的运动员使用。\n\n商品与包装产生的个别说明差异，是DHS对商品性能进行的正常升级调整，DHS拥有最终解释权', 1, '2019-04-06 20:18:00', 89, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (94, 'A690全碳双拍套装（2支穿线球拍+羽毛球拍包+羽毛球+2条吸汗带） ', 145, 125, 'products/6/cs60002.png', '型号：A690                                           颜色: 蓝色 橙色 \n拍框材质：碳纤维                                      吸汗带材质：聚氨酯+不织布\n产品重量：W3（85-89g)                                 握把尺寸：S2\n长度：675                                             握把长度：200\n平衡点：285           ', 1, '2019-04-06 20:18:00', 90, NULL, NULL, 2, NULL);
INSERT INTO `product` VALUES (95, '【2019新品】李宁CBA B5000专业竞技系列篮球  ', 295, 225, 'products/6/cs60003.png', '李宁CBA B5000专业竞技系列篮球，运用简洁的色彩搭配，简单时尚。\n球面采用吸湿PU，提供良好的打球手感。球面简洁的李宁标志搭配CBA篮球标志设计，美观的同时又增加了触球的手感。', 1, '2019-04-06 20:18:00', 91, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (96, '跑步系列男子速干凉爽运动长裤 ', 195, 115, 'products/7/cs70001.png', '李宁跑步系列反光运动长裤，运用简洁的色彩搭配，简单时尚。\n选用弹性的面料，减少束缚感，随心运动。裤子上的李宁品牌LOGO及裤侧“LNRUN”字母使用酷炫反光设计，提升夜跑安全性。', 1, '2019-04-06 20:18:00', 92, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (97, '【2019新品】奔袭男子包裹篮球专业比赛鞋  ', 395, 215, 'products/7/cs70002.png', '奔袭包裹篮球专业比赛鞋，运用简洁的色彩搭配，简约休闲。\n鞋面采用时尚飞织、蜻蜓织带鞋带设计，加强包裹性。插3m鞋带提升安全性能，后跟反毛皮饰片提升细节品质。缓震PHYLON中底搭配橡胶大底，有效缓震的同时延长了使用寿命。', 1, '2019-04-06 20:18:00', 93, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (98, '【2019新品】训练系列男子套头卫衣 ', 95, 115, 'products/7/cs70003.png', '训练系列套头卫衣，运用简洁的色彩搭配，简单时尚。\n采用柔软棉涤面料，穿着更加亲肤舒适。胸口李宁标志和袖子一侧的字母印花设计，简约大气，好穿易搭。', 1, '2019-04-06 20:18:00', 94, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (99, '【2019新品】运动时尚系列男子短袖文化衫 ', 205, 115, 'products/7/cs70004.png', '运动时尚系列短袖文化衫，运用简洁的色彩搭配，简单时尚。\n采用柔软棉质面料，亲肤柔和且穿着舒适。衣身字母和漫画人物图案设计，吸睛聚焦，满满的街头潮流感。', 1, '2019-04-06 20:18:00', 98, NULL, NULL, 11, 4);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL,
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `member_points` double(15, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (8, 'bbb', 'bbbbbb', '张三777', 'bbb@shop.com', '18726607618', '北京市西三旗中腾建华3楼', 1, '', NULL, 1000);
INSERT INTO `user` VALUES (19, 'aaa', 'aaaaa', 'lx', 'aaa@shop.com', '18681693421', '西南科技大学', 1, '37e93dfff9194779a14540cbc7bb5264aa486e3be8bb4c59a22395524a157857', NULL, 1357);

SET FOREIGN_KEY_CHECKS = 1;
