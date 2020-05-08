/*
 Navicat Premium Data Transfer

 Source Server         : 吖_是本机没错了!
 Source Server Type    : MySQL
 Source Server Version : 50714
 Source Host           : localhost:3306
 Source Schema         : tangzihao

 Target Server Type    : MySQL
 Target Server Version : 50714
 File Encoding         : 65001

 Date: 21/04/2020 20:22:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for reader
-- ----------------------------
DROP TABLE IF EXISTS `reader`;
CREATE TABLE `reader`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reader` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reader
-- ----------------------------
INSERT INTO `reader` VALUES (1, '唐子豪');
INSERT INTO `reader` VALUES (2, '刘聪');
INSERT INTO `reader` VALUES (4, '林娟娟');
INSERT INTO `reader` VALUES (7, '邹想云');
INSERT INTO `reader` VALUES (8, '班政');
INSERT INTO `reader` VALUES (9, '钟林军');

SET FOREIGN_KEY_CHECKS = 1;
