/*
 Navicat Premium Dump SQL

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80032 (8.0.32)
 Source Host           : localhost:3307
 Source Schema         : health_management

 Target Server Type    : MySQL
 Target Server Version : 80032 (8.0.32)
 File Encoding         : 65001

 Date: 10/04/2026 06:20:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ai_chat_record
-- ----------------------------
DROP TABLE IF EXISTS `ai_chat_record`;
CREATE TABLE `ai_chat_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `user_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户消息',
  `ai_response` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'AI回复',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'AI对话记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ai_chat_record
-- ----------------------------
INSERT INTO `ai_chat_record` VALUES (1, 1, '你好，请简单回复一句话测试连接', '哈喽😉连接正常，随时为你提供大学生健康咨询服务哦～', '2026-04-10 05:52:06');
INSERT INTO `ai_chat_record` VALUES (2, 1, '你好，请简单回复一句话测试连接', '哈喽～连接正常😉', '2026-04-10 05:52:20');
INSERT INTO `ai_chat_record` VALUES (3, 2, '??', '嗨😊 是不是还没想好怎么提问呀？关于大学生的健康问题，比如：\n- 运动计划、饮食搭配建议\n- 睡眠改善小技巧\n- 常见小病（比如感冒、口腔溃疡）预防\n- BMI/血压/心率等健康指标解读\n都可以随时告诉我哦～', '2026-04-10 05:52:24');
INSERT INTO `ai_chat_record` VALUES (4, 1, '你好，请简单回复一句话测试连接', '哈喽😊连接正常，有任何健康问题都可以随时找我哦～', '2026-04-10 05:52:26');
INSERT INTO `ai_chat_record` VALUES (5, 1, '你好，请简单回复一句话测试连接', '主人，连接测试成功啦(๑•̀ㅂ•́)و✧，记得多喝温水呀💕', '2026-04-10 05:53:38');

-- ----------------------------
-- Table structure for community_comment
-- ----------------------------
DROP TABLE IF EXISTS `community_comment`;
CREATE TABLE `community_comment`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `post_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'ACTIVE',
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_comment_post_id`(`post_id` ASC) USING BTREE,
  INDEX `idx_comment_created_at`(`created_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of community_comment
-- ----------------------------
INSERT INTO `community_comment` VALUES (1, 5, 3, '不错！一起坚持。', 'ACTIVE', '2026-03-23 01:57:02');
INSERT INTO `community_comment` VALUES (2, 14, 11, '不错！一起坚持。', 'ACTIVE', '2026-03-23 02:57:02');
INSERT INTO `community_comment` VALUES (3, 5, 9, '不错！一起坚持。', 'ACTIVE', '2026-03-19 01:57:02');
INSERT INTO `community_comment` VALUES (4, 2, 12, '不错！一起坚持。', 'ACTIVE', '2026-03-21 20:57:02');
INSERT INTO `community_comment` VALUES (5, 30, 3, '不错！一起坚持。', 'ACTIVE', '2026-03-19 02:57:02');
INSERT INTO `community_comment` VALUES (6, 10, 4, '不错！一起坚持。', 'ACTIVE', '2026-03-20 13:57:02');
INSERT INTO `community_comment` VALUES (7, 4, 7, '不错！一起坚持。', 'ACTIVE', '2026-03-20 07:57:02');
INSERT INTO `community_comment` VALUES (8, 10, 5, '不错！一起坚持。', 'ACTIVE', '2026-03-20 00:57:02');
INSERT INTO `community_comment` VALUES (9, 30, 6, '不错！一起坚持。', 'ACTIVE', '2026-03-21 12:57:02');
INSERT INTO `community_comment` VALUES (10, 19, 5, '不错！一起坚持。', 'ACTIVE', '2026-03-21 06:57:02');
INSERT INTO `community_comment` VALUES (11, 27, 8, '不错！一起坚持。', 'ACTIVE', '2026-03-21 21:57:02');
INSERT INTO `community_comment` VALUES (12, 3, 10, '不错！一起坚持。', 'ACTIVE', '2026-03-21 08:57:02');
INSERT INTO `community_comment` VALUES (13, 30, 4, '不错！一起坚持。', 'ACTIVE', '2026-03-19 23:57:02');
INSERT INTO `community_comment` VALUES (14, 23, 4, '不错！一起坚持。', 'ACTIVE', '2026-03-21 17:57:02');
INSERT INTO `community_comment` VALUES (15, 24, 4, '不错！一起坚持。', 'ACTIVE', '2026-03-22 06:57:02');
INSERT INTO `community_comment` VALUES (16, 2, 5, '不错！一起坚持。', 'ACTIVE', '2026-03-19 11:57:02');
INSERT INTO `community_comment` VALUES (17, 20, 8, '不错！一起坚持。', 'ACTIVE', '2026-03-20 15:57:02');
INSERT INTO `community_comment` VALUES (18, 23, 11, '不错！一起坚持。', 'ACTIVE', '2026-03-20 09:57:02');
INSERT INTO `community_comment` VALUES (19, 3, 3, '不错！一起坚持。', 'ACTIVE', '2026-03-22 10:57:02');
INSERT INTO `community_comment` VALUES (20, 18, 7, '不错！一起坚持。', 'ACTIVE', '2026-03-22 07:57:02');
INSERT INTO `community_comment` VALUES (21, 20, 8, '不错！一起坚持。', 'ACTIVE', '2026-03-19 11:57:02');
INSERT INTO `community_comment` VALUES (22, 13, 8, '不错！一起坚持。', 'ACTIVE', '2026-03-20 14:57:02');
INSERT INTO `community_comment` VALUES (23, 3, 8, '不错！一起坚持。', 'ACTIVE', '2026-03-19 20:57:02');
INSERT INTO `community_comment` VALUES (24, 27, 11, '不错！一起坚持。', 'ACTIVE', '2026-03-18 23:57:02');
INSERT INTO `community_comment` VALUES (25, 7, 11, '不错！一起坚持。', 'ACTIVE', '2026-03-19 05:57:02');
INSERT INTO `community_comment` VALUES (26, 2, 5, '不错！一起坚持。', 'ACTIVE', '2026-03-23 08:57:02');
INSERT INTO `community_comment` VALUES (27, 18, 5, '不错！一起坚持。', 'ACTIVE', '2026-03-23 01:57:02');
INSERT INTO `community_comment` VALUES (28, 12, 12, '不错！一起坚持。', 'ACTIVE', '2026-03-23 02:57:02');
INSERT INTO `community_comment` VALUES (29, 20, 12, '不错！一起坚持。', 'ACTIVE', '2026-03-19 19:57:02');
INSERT INTO `community_comment` VALUES (30, 2, 6, '不错！一起坚持。', 'ACTIVE', '2026-03-19 18:57:02');
INSERT INTO `community_comment` VALUES (31, 10, 10, '不错！一起坚持。', 'ACTIVE', '2026-03-20 00:57:02');
INSERT INTO `community_comment` VALUES (32, 2, 10, '不错！一起坚持。', 'ACTIVE', '2026-03-21 08:57:02');
INSERT INTO `community_comment` VALUES (33, 23, 6, '不错！一起坚持。', 'ACTIVE', '2026-03-20 01:57:02');
INSERT INTO `community_comment` VALUES (34, 30, 7, '不错！一起坚持。', 'ACTIVE', '2026-03-19 12:57:02');
INSERT INTO `community_comment` VALUES (35, 24, 11, '不错！一起坚持。', 'ACTIVE', '2026-03-19 18:57:02');
INSERT INTO `community_comment` VALUES (36, 13, 3, '不错！一起坚持。', 'ACTIVE', '2026-03-19 08:57:02');
INSERT INTO `community_comment` VALUES (37, 12, 12, '不错！一起坚持。', 'ACTIVE', '2026-03-22 07:57:02');
INSERT INTO `community_comment` VALUES (38, 10, 11, '不错！一起坚持。', 'ACTIVE', '2026-03-20 04:57:02');
INSERT INTO `community_comment` VALUES (39, 7, 3, '不错！一起坚持。', 'ACTIVE', '2026-03-22 17:57:02');
INSERT INTO `community_comment` VALUES (40, 23, 12, '不错！一起坚持。', 'ACTIVE', '2026-03-20 22:57:02');
INSERT INTO `community_comment` VALUES (41, 9, 7, '不错！一起坚持。', 'ACTIVE', '2026-03-19 11:57:02');
INSERT INTO `community_comment` VALUES (42, 7, 6, '不错！一起坚持。', 'ACTIVE', '2026-03-22 07:57:02');
INSERT INTO `community_comment` VALUES (43, 18, 12, '不错！一起坚持。', 'ACTIVE', '2026-03-21 19:57:02');
INSERT INTO `community_comment` VALUES (44, 17, 8, '不错！一起坚持。', 'ACTIVE', '2026-03-19 03:57:02');
INSERT INTO `community_comment` VALUES (45, 12, 9, '不错！一起坚持。', 'ACTIVE', '2026-03-19 14:57:02');
INSERT INTO `community_comment` VALUES (46, 4, 4, '不错！一起坚持。', 'ACTIVE', '2026-03-21 22:57:02');
INSERT INTO `community_comment` VALUES (47, 24, 9, '不错！一起坚持。', 'ACTIVE', '2026-03-19 04:57:02');
INSERT INTO `community_comment` VALUES (48, 25, 3, '不错！一起坚持。', 'ACTIVE', '2026-03-20 09:57:02');
INSERT INTO `community_comment` VALUES (49, 10, 8, '不错！一起坚持。', 'ACTIVE', '2026-03-21 10:57:02');
INSERT INTO `community_comment` VALUES (50, 25, 3, '不错！一起坚持。', 'ACTIVE', '2026-03-20 16:57:02');

-- ----------------------------
-- Table structure for community_post
-- ----------------------------
DROP TABLE IF EXISTS `community_post`;
CREATE TABLE `community_post`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `topic_id` bigint NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `images_json` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `status` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'PENDING',
  `audit_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `like_count` int NOT NULL DEFAULT 0,
  `comment_count` int NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_post_status`(`status` ASC) USING BTREE,
  INDEX `idx_post_topic_id`(`topic_id` ASC) USING BTREE,
  INDEX `idx_post_created_at`(`created_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of community_post
-- ----------------------------
INSERT INTO `community_post` VALUES (1, 8, 4, '打卡第1天：今天状态一般，继续加油！', NULL, 'REJECTED', '内容不符合规范（演示数据）', 0, 0, '2026-03-22 19:57:02', '2026-03-23 19:57:02');
INSERT INTO `community_post` VALUES (2, 3, 5, '打卡第2天：今天状态一般，继续加油！', NULL, 'APPROVED', NULL, 0, 5, '2026-03-20 19:57:02', '2026-03-23 19:57:02');
INSERT INTO `community_post` VALUES (3, 8, 1, '打卡第3天：今天状态不错，继续加油！', NULL, 'APPROVED', NULL, 0, 3, '2026-03-20 19:57:02', '2026-03-23 19:57:02');
INSERT INTO `community_post` VALUES (4, 8, 4, '打卡第4天：今天状态一般，继续加油！', NULL, 'APPROVED', NULL, 0, 2, '2026-03-20 19:57:02', '2026-03-23 19:57:02');
INSERT INTO `community_post` VALUES (5, 7, 1, '打卡第5天：今天状态不错，继续加油！', NULL, 'APPROVED', NULL, 0, 2, '2026-03-22 19:57:02', '2026-03-23 19:57:02');
INSERT INTO `community_post` VALUES (6, 9, 3, '打卡第6天：今天状态一般，继续加油！', NULL, 'PENDING', NULL, 0, 0, '2026-03-19 19:57:02', '2026-03-23 19:57:02');
INSERT INTO `community_post` VALUES (7, 9, 3, '打卡第7天：今天状态不错，继续加油！', NULL, 'APPROVED', NULL, 0, 3, '2026-03-16 19:57:02', '2026-03-23 19:57:02');
INSERT INTO `community_post` VALUES (8, 4, 1, '打卡第8天：今天状态不错，继续加油！', NULL, 'REJECTED', '内容不符合规范（演示数据）', 0, 0, '2026-03-23 19:57:02', '2026-03-23 19:57:02');
INSERT INTO `community_post` VALUES (9, 11, 3, '打卡第9天：今天状态不错，继续加油！', NULL, 'APPROVED', NULL, 0, 1, '2026-03-21 19:57:02', '2026-03-23 19:57:02');
INSERT INTO `community_post` VALUES (10, 8, 1, '打卡第10天：今天状态一般，继续加油！', NULL, 'APPROVED', NULL, 0, 5, '2026-03-14 19:57:02', '2026-03-23 19:57:02');
INSERT INTO `community_post` VALUES (11, 3, 3, '打卡第11天：今天状态不错，继续加油！', NULL, 'PENDING', NULL, 0, 0, '2026-03-19 19:57:02', '2026-03-23 19:57:02');
INSERT INTO `community_post` VALUES (12, 8, 5, '打卡第12天：今天状态一般，继续加油！', NULL, 'APPROVED', NULL, 0, 3, '2026-03-16 19:57:02', '2026-03-23 19:57:02');
INSERT INTO `community_post` VALUES (13, 11, 1, '打卡第13天：今天状态不错，继续加油！', NULL, 'APPROVED', NULL, 0, 2, '2026-03-15 19:57:02', '2026-03-23 19:57:02');
INSERT INTO `community_post` VALUES (14, 8, 2, '打卡第14天：今天状态一般，继续加油！', NULL, 'APPROVED', NULL, 0, 1, '2026-03-22 19:57:02', '2026-03-23 19:57:02');
INSERT INTO `community_post` VALUES (15, 8, 4, '打卡第15天：今天状态不错，继续加油！', NULL, 'REJECTED', '内容不符合规范（演示数据）', 0, 0, '2026-03-19 19:57:02', '2026-03-23 19:57:02');
INSERT INTO `community_post` VALUES (16, 4, 3, '打卡第16天：今天状态一般，继续加油！', NULL, 'PENDING', NULL, 0, 0, '2026-03-18 19:57:02', '2026-03-23 19:57:02');
INSERT INTO `community_post` VALUES (17, 6, 4, '打卡第17天：今天状态一般，继续加油！', NULL, 'APPROVED', NULL, 0, 1, '2026-03-17 19:57:02', '2026-03-23 19:57:02');
INSERT INTO `community_post` VALUES (18, 9, 2, '打卡第18天：今天状态一般，继续加油！', NULL, 'APPROVED', NULL, 0, 3, '2026-03-17 19:57:02', '2026-03-23 19:57:02');
INSERT INTO `community_post` VALUES (19, 11, 4, '打卡第19天：今天状态一般，继续加油！', NULL, 'APPROVED', NULL, 0, 1, '2026-03-19 19:57:02', '2026-03-23 19:57:02');
INSERT INTO `community_post` VALUES (20, 6, 3, '打卡第20天：今天状态不错，继续加油！', NULL, 'APPROVED', NULL, 0, 3, '2026-03-22 19:57:02', '2026-03-23 19:57:02');
INSERT INTO `community_post` VALUES (21, 5, 3, '打卡第21天：今天状态不错，继续加油！', NULL, 'PENDING', NULL, 0, 0, '2026-03-21 19:57:02', '2026-03-23 19:57:02');
INSERT INTO `community_post` VALUES (22, 12, 5, '打卡第22天：今天状态不错，继续加油！', NULL, 'REJECTED', '内容不符合规范（演示数据）', 0, 0, '2026-03-20 19:57:02', '2026-03-23 19:57:02');
INSERT INTO `community_post` VALUES (23, 9, 1, '打卡第23天：今天状态一般，继续加油！', NULL, 'APPROVED', NULL, 0, 4, '2026-03-22 19:57:02', '2026-03-23 19:57:02');
INSERT INTO `community_post` VALUES (24, 6, 2, '打卡第24天：今天状态不错，继续加油！', NULL, 'APPROVED', NULL, 0, 3, '2026-03-21 19:57:02', '2026-03-23 19:57:02');
INSERT INTO `community_post` VALUES (25, 11, 3, '打卡第25天：今天状态一般，继续加油！', NULL, 'APPROVED', NULL, 0, 2, '2026-03-14 19:57:02', '2026-03-23 19:57:02');
INSERT INTO `community_post` VALUES (26, 4, 3, '打卡第26天：今天状态一般，继续加油！', NULL, 'PENDING', NULL, 0, 0, '2026-03-23 19:57:02', '2026-03-23 19:57:02');
INSERT INTO `community_post` VALUES (27, 12, 2, '打卡第27天：今天状态不错，继续加油！', NULL, 'APPROVED', NULL, 0, 2, '2026-03-19 19:57:02', '2026-03-23 19:57:02');
INSERT INTO `community_post` VALUES (28, 12, 4, '打卡第28天：今天状态一般，继续加油！', NULL, 'APPROVED', NULL, 0, 0, '2026-03-14 19:57:02', '2026-03-23 19:57:02');
INSERT INTO `community_post` VALUES (29, 5, 1, '打卡第29天：今天状态不错，继续加油！', NULL, 'REJECTED', '内容不符合规范（演示数据）', 0, 0, '2026-03-16 19:57:02', '2026-03-23 19:57:02');
INSERT INTO `community_post` VALUES (30, 4, 2, '打卡第30天：今天状态不错，继续加油！', NULL, 'APPROVED', NULL, 0, 4, '2026-03-19 19:57:02', '2026-03-23 19:57:02');

-- ----------------------------
-- Table structure for community_post_like
-- ----------------------------
DROP TABLE IF EXISTS `community_post_like`;
CREATE TABLE `community_post_like`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `post_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_like_post_user`(`post_id` ASC, `user_id` ASC) USING BTREE,
  INDEX `idx_like_post_id`(`post_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of community_post_like
-- ----------------------------

-- ----------------------------
-- Table structure for community_topic
-- ----------------------------
DROP TABLE IF EXISTS `community_topic`;
CREATE TABLE `community_topic`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'ACTIVE',
  `sort_no` int NULL DEFAULT 0,
  `created_by` bigint NULL DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_topic_status`(`status` ASC) USING BTREE,
  INDEX `idx_topic_sort`(`sort_no` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of community_topic
-- ----------------------------
INSERT INTO `community_topic` VALUES (1, '减脂打卡', '记录每日热量与运动，互相监督。', 'ACTIVE', 1, NULL, '2026-03-23 19:57:01', '2026-03-23 19:57:01');
INSERT INTO `community_topic` VALUES (2, '增肌饮食', '分享增肌期饮食搭配与经验。', 'ACTIVE', 2, NULL, '2026-03-23 19:57:01', '2026-03-23 19:57:01');
INSERT INTO `community_topic` VALUES (3, '训练计划', '交流训练安排、动作要点与恢复。', 'ACTIVE', 3, NULL, '2026-03-23 19:57:01', '2026-03-23 19:57:01');
INSERT INTO `community_topic` VALUES (4, '睡眠与恢复', '讨论疲劳管理与恢复策略。', 'ACTIVE', 4, NULL, '2026-03-23 19:57:01', '2026-03-23 19:57:01');
INSERT INTO `community_topic` VALUES (5, '新手入门', '新手健身问题集中交流区。', 'ACTIVE', 5, NULL, '2026-03-23 19:57:01', '2026-03-23 19:57:01');

-- ----------------------------
-- Table structure for diet_log
-- ----------------------------
DROP TABLE IF EXISTS `diet_log`;
CREATE TABLE `diet_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `eat_time` datetime NOT NULL,
  `meal_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `food_id` bigint NULL DEFAULT NULL,
  `food_name_snapshot` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `amount_g` decimal(8, 2) NOT NULL,
  `kcal` decimal(10, 2) NOT NULL,
  `protein_g` decimal(10, 2) NULL DEFAULT NULL,
  `fat_g` decimal(10, 2) NULL DEFAULT NULL,
  `carb_g` decimal(10, 2) NULL DEFAULT NULL,
  `source` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'SEARCH',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_diet_user_time`(`user_id` ASC, `eat_time` ASC) USING BTREE,
  INDEX `idx_diet_meal_type`(`meal_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 301 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of diet_log
-- ----------------------------
INSERT INTO `diet_log` VALUES (1, 3, '2026-03-22 19:45:00', 'BREAKFAST', 1, '鸡胸肉', 136.00, 224.40, 42.16, 4.90, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (2, 3, '2026-03-21 07:10:00', 'LUNCH', 1, '鸡胸肉', 212.00, 349.80, 65.72, 7.63, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (3, 3, '2026-03-21 18:07:00', 'DINNER', 1, '鸡胸肉', 274.00, 452.10, 84.94, 9.86, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (4, 3, '2026-03-18 16:03:00', 'SNACK', 1, '鸡胸肉', 135.00, 222.75, 41.85, 4.86, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (5, 3, '2026-03-22 20:43:00', 'BREAKFAST', 1, '鸡胸肉', 174.00, 287.10, 53.94, 6.26, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (6, 3, '2026-03-20 19:14:00', 'LUNCH', 1, '鸡胸肉', 170.00, 280.50, 52.70, 6.12, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (7, 3, '2026-03-19 12:08:00', 'DINNER', 1, '鸡胸肉', 186.00, 306.90, 57.66, 6.70, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (8, 3, '2026-03-20 07:21:00', 'SNACK', 1, '鸡胸肉', 122.00, 201.30, 37.82, 4.39, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (9, 3, '2026-03-22 18:14:00', 'BREAKFAST', 1, '鸡胸肉', 252.00, 415.80, 78.12, 9.07, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (10, 3, '2026-03-23 09:24:00', 'LUNCH', 1, '鸡胸肉', 167.00, 275.55, 51.77, 6.01, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (11, 3, '2026-03-19 15:03:00', 'DINNER', 1, '鸡胸肉', 190.00, 313.50, 58.90, 6.84, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (12, 3, '2026-03-20 14:16:00', 'SNACK', 1, '鸡胸肉', 251.00, 414.15, 77.81, 9.04, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (13, 3, '2026-03-19 18:28:00', 'BREAKFAST', 1, '鸡胸肉', 105.00, 173.25, 32.55, 3.78, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (14, 3, '2026-03-20 11:05:00', 'LUNCH', 1, '鸡胸肉', 233.00, 384.45, 72.23, 8.39, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (15, 3, '2026-03-22 14:31:00', 'DINNER', 1, '鸡胸肉', 149.00, 245.85, 46.19, 5.36, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (16, 3, '2026-03-20 17:38:00', 'SNACK', 1, '鸡胸肉', 138.00, 227.70, 42.78, 4.97, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (17, 3, '2026-03-22 19:28:00', 'BREAKFAST', 1, '鸡胸肉', 219.00, 361.35, 67.89, 7.88, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (18, 3, '2026-03-21 14:59:00', 'LUNCH', 1, '鸡胸肉', 247.00, 407.55, 76.57, 8.89, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (19, 3, '2026-03-22 08:43:00', 'DINNER', 1, '鸡胸肉', 144.00, 237.60, 44.64, 5.18, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (20, 3, '2026-03-23 09:11:00', 'SNACK', 1, '鸡胸肉', 293.00, 483.45, 90.83, 10.55, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (21, 3, '2026-03-19 14:17:00', 'BREAKFAST', 1, '鸡胸肉', 181.00, 298.65, 56.11, 6.52, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (22, 3, '2026-03-19 19:15:00', 'LUNCH', 1, '鸡胸肉', 223.00, 367.95, 69.13, 8.03, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (23, 3, '2026-03-20 14:44:00', 'DINNER', 1, '鸡胸肉', 255.00, 420.75, 79.05, 9.18, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (24, 3, '2026-03-20 13:58:00', 'SNACK', 1, '鸡胸肉', 146.00, 240.90, 45.26, 5.26, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (25, 3, '2026-03-17 11:10:00', 'BREAKFAST', 1, '鸡胸肉', 173.00, 285.45, 53.63, 6.23, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (26, 3, '2026-03-21 16:24:00', 'LUNCH', 1, '鸡胸肉', 120.00, 198.00, 37.20, 4.32, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (27, 3, '2026-03-18 07:22:00', 'DINNER', 1, '鸡胸肉', 279.00, 460.35, 86.49, 10.04, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (28, 3, '2026-03-23 20:18:00', 'SNACK', 1, '鸡胸肉', 293.00, 483.45, 90.83, 10.55, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (29, 3, '2026-03-19 19:31:00', 'BREAKFAST', 1, '鸡胸肉', 116.00, 191.40, 35.96, 4.18, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (30, 3, '2026-03-20 17:31:00', 'LUNCH', 1, '鸡胸肉', 299.00, 493.35, 92.69, 10.76, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (31, 4, '2026-03-18 09:28:00', 'BREAKFAST', 1, '鸡胸肉', 275.00, 453.75, 85.25, 9.90, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (32, 4, '2026-03-21 13:47:00', 'LUNCH', 1, '鸡胸肉', 96.00, 158.40, 29.76, 3.46, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (33, 4, '2026-03-21 07:58:00', 'DINNER', 1, '鸡胸肉', 245.00, 404.25, 75.95, 8.82, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (34, 4, '2026-03-20 10:53:00', 'SNACK', 1, '鸡胸肉', 291.00, 480.15, 90.21, 10.48, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (35, 4, '2026-03-21 12:37:00', 'BREAKFAST', 1, '鸡胸肉', 201.00, 331.65, 62.31, 7.24, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (36, 4, '2026-03-23 11:53:00', 'LUNCH', 1, '鸡胸肉', 201.00, 331.65, 62.31, 7.24, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (37, 4, '2026-03-21 17:00:00', 'DINNER', 1, '鸡胸肉', 299.00, 493.35, 92.69, 10.76, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (38, 4, '2026-03-19 08:20:00', 'SNACK', 1, '鸡胸肉', 244.00, 402.60, 75.64, 8.78, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (39, 4, '2026-03-22 20:36:00', 'BREAKFAST', 1, '鸡胸肉', 112.00, 184.80, 34.72, 4.03, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (40, 4, '2026-03-21 08:22:00', 'LUNCH', 1, '鸡胸肉', 285.00, 470.25, 88.35, 10.26, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (41, 4, '2026-03-18 19:04:00', 'DINNER', 1, '鸡胸肉', 180.00, 297.00, 55.80, 6.48, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (42, 4, '2026-03-22 09:10:00', 'SNACK', 1, '鸡胸肉', 131.00, 216.15, 40.61, 4.72, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (43, 4, '2026-03-21 07:27:00', 'BREAKFAST', 1, '鸡胸肉', 256.00, 422.40, 79.36, 9.22, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (44, 4, '2026-03-18 16:01:00', 'LUNCH', 1, '鸡胸肉', 137.00, 226.05, 42.47, 4.93, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (45, 4, '2026-03-22 17:48:00', 'DINNER', 1, '鸡胸肉', 133.00, 219.45, 41.23, 4.79, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (46, 4, '2026-03-23 11:39:00', 'SNACK', 1, '鸡胸肉', 241.00, 397.65, 74.71, 8.68, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (47, 4, '2026-03-21 15:48:00', 'BREAKFAST', 1, '鸡胸肉', 280.00, 462.00, 86.80, 10.08, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (48, 4, '2026-03-23 19:31:00', 'LUNCH', 1, '鸡胸肉', 146.00, 240.90, 45.26, 5.26, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (49, 4, '2026-03-17 19:21:00', 'DINNER', 1, '鸡胸肉', 209.00, 344.85, 64.79, 7.52, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (50, 4, '2026-03-18 07:39:00', 'SNACK', 1, '鸡胸肉', 198.00, 326.70, 61.38, 7.13, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (51, 4, '2026-03-19 14:31:00', 'BREAKFAST', 1, '鸡胸肉', 140.00, 231.00, 43.40, 5.04, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (52, 4, '2026-03-22 20:59:00', 'LUNCH', 1, '鸡胸肉', 196.00, 323.40, 60.76, 7.06, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (53, 4, '2026-03-17 08:10:00', 'DINNER', 1, '鸡胸肉', 278.00, 458.70, 86.18, 10.01, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (54, 4, '2026-03-17 17:53:00', 'SNACK', 1, '鸡胸肉', 241.00, 397.65, 74.71, 8.68, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (55, 4, '2026-03-21 14:43:00', 'BREAKFAST', 1, '鸡胸肉', 121.00, 199.65, 37.51, 4.36, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (56, 4, '2026-03-19 14:13:00', 'LUNCH', 1, '鸡胸肉', 83.00, 136.95, 25.73, 2.99, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (57, 4, '2026-03-21 11:24:00', 'DINNER', 1, '鸡胸肉', 90.00, 148.50, 27.90, 3.24, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (58, 4, '2026-03-21 07:13:00', 'SNACK', 1, '鸡胸肉', 286.00, 471.90, 88.66, 10.30, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (59, 4, '2026-03-17 15:08:00', 'BREAKFAST', 1, '鸡胸肉', 163.00, 268.95, 50.53, 5.87, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (60, 4, '2026-03-18 09:05:00', 'LUNCH', 1, '鸡胸肉', 185.00, 305.25, 57.35, 6.66, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (61, 5, '2026-03-22 09:53:00', 'BREAKFAST', 1, '鸡胸肉', 217.00, 358.05, 67.27, 7.81, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (62, 5, '2026-03-23 12:06:00', 'LUNCH', 1, '鸡胸肉', 129.00, 212.85, 39.99, 4.64, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (63, 5, '2026-03-22 15:03:00', 'DINNER', 1, '鸡胸肉', 270.00, 445.50, 83.70, 9.72, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (64, 5, '2026-03-19 07:32:00', 'SNACK', 1, '鸡胸肉', 253.00, 417.45, 78.43, 9.11, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (65, 5, '2026-03-22 12:55:00', 'BREAKFAST', 1, '鸡胸肉', 196.00, 323.40, 60.76, 7.06, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (66, 5, '2026-03-20 16:04:00', 'LUNCH', 1, '鸡胸肉', 99.00, 163.35, 30.69, 3.56, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (67, 5, '2026-03-20 19:12:00', 'DINNER', 1, '鸡胸肉', 243.00, 400.95, 75.33, 8.75, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (68, 5, '2026-03-18 18:23:00', 'SNACK', 1, '鸡胸肉', 111.00, 183.15, 34.41, 4.00, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (69, 5, '2026-03-22 11:39:00', 'BREAKFAST', 1, '鸡胸肉', 86.00, 141.90, 26.66, 3.10, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (70, 5, '2026-03-21 07:20:00', 'LUNCH', 1, '鸡胸肉', 257.00, 424.05, 79.67, 9.25, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (71, 5, '2026-03-23 07:44:00', 'DINNER', 1, '鸡胸肉', 94.00, 155.10, 29.14, 3.38, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (72, 5, '2026-03-22 16:47:00', 'SNACK', 1, '鸡胸肉', 108.00, 178.20, 33.48, 3.89, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (73, 5, '2026-03-21 16:54:00', 'BREAKFAST', 1, '鸡胸肉', 230.00, 379.50, 71.30, 8.28, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (74, 5, '2026-03-21 19:03:00', 'LUNCH', 1, '鸡胸肉', 108.00, 178.20, 33.48, 3.89, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (75, 5, '2026-03-18 20:56:00', 'DINNER', 1, '鸡胸肉', 94.00, 155.10, 29.14, 3.38, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (76, 5, '2026-03-20 13:04:00', 'SNACK', 1, '鸡胸肉', 185.00, 305.25, 57.35, 6.66, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (77, 5, '2026-03-22 11:46:00', 'BREAKFAST', 1, '鸡胸肉', 271.00, 447.15, 84.01, 9.76, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (78, 5, '2026-03-21 15:04:00', 'LUNCH', 1, '鸡胸肉', 224.00, 369.60, 69.44, 8.06, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (79, 5, '2026-03-18 11:27:00', 'DINNER', 1, '鸡胸肉', 192.00, 316.80, 59.52, 6.91, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (80, 5, '2026-03-21 09:50:00', 'SNACK', 1, '鸡胸肉', 141.00, 232.65, 43.71, 5.08, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (81, 5, '2026-03-18 18:19:00', 'BREAKFAST', 1, '鸡胸肉', 251.00, 414.15, 77.81, 9.04, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (82, 5, '2026-03-18 13:53:00', 'LUNCH', 1, '鸡胸肉', 278.00, 458.70, 86.18, 10.01, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (83, 5, '2026-03-22 20:31:00', 'DINNER', 1, '鸡胸肉', 259.00, 427.35, 80.29, 9.32, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (84, 5, '2026-03-20 16:48:00', 'SNACK', 1, '鸡胸肉', 272.00, 448.80, 84.32, 9.79, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (85, 5, '2026-03-22 19:37:00', 'BREAKFAST', 1, '鸡胸肉', 195.00, 321.75, 60.45, 7.02, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (86, 5, '2026-03-20 19:40:00', 'LUNCH', 1, '鸡胸肉', 146.00, 240.90, 45.26, 5.26, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (87, 5, '2026-03-20 08:38:00', 'DINNER', 1, '鸡胸肉', 180.00, 297.00, 55.80, 6.48, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (88, 5, '2026-03-22 15:21:00', 'SNACK', 1, '鸡胸肉', 279.00, 460.35, 86.49, 10.04, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (89, 5, '2026-03-19 11:17:00', 'BREAKFAST', 1, '鸡胸肉', 201.00, 331.65, 62.31, 7.24, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (90, 5, '2026-03-18 13:11:00', 'LUNCH', 1, '鸡胸肉', 113.00, 186.45, 35.03, 4.07, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:01');
INSERT INTO `diet_log` VALUES (91, 6, '2026-03-19 19:31:00', 'BREAKFAST', 1, '鸡胸肉', 260.00, 429.00, 80.60, 9.36, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (92, 6, '2026-03-19 12:22:00', 'LUNCH', 1, '鸡胸肉', 194.00, 320.10, 60.14, 6.98, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (93, 6, '2026-03-18 07:28:00', 'DINNER', 1, '鸡胸肉', 118.00, 194.70, 36.58, 4.25, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (94, 6, '2026-03-23 16:34:00', 'SNACK', 1, '鸡胸肉', 262.00, 432.30, 81.22, 9.43, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (95, 6, '2026-03-18 19:15:00', 'BREAKFAST', 1, '鸡胸肉', 221.00, 364.65, 68.51, 7.96, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (96, 6, '2026-03-17 18:51:00', 'LUNCH', 1, '鸡胸肉', 179.00, 295.35, 55.49, 6.44, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (97, 6, '2026-03-23 07:00:00', 'DINNER', 1, '鸡胸肉', 278.00, 458.70, 86.18, 10.01, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (98, 6, '2026-03-19 15:49:00', 'SNACK', 1, '鸡胸肉', 299.00, 493.35, 92.69, 10.76, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (99, 6, '2026-03-22 17:06:00', 'BREAKFAST', 1, '鸡胸肉', 259.00, 427.35, 80.29, 9.32, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (100, 6, '2026-03-18 15:18:00', 'LUNCH', 1, '鸡胸肉', 250.00, 412.50, 77.50, 9.00, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (101, 6, '2026-03-18 16:00:00', 'DINNER', 1, '鸡胸肉', 205.00, 338.25, 63.55, 7.38, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (102, 6, '2026-03-22 12:52:00', 'SNACK', 1, '鸡胸肉', 281.00, 463.65, 87.11, 10.12, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (103, 6, '2026-03-22 19:11:00', 'BREAKFAST', 1, '鸡胸肉', 276.00, 455.40, 85.56, 9.94, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (104, 6, '2026-03-23 14:28:00', 'LUNCH', 1, '鸡胸肉', 195.00, 321.75, 60.45, 7.02, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (105, 6, '2026-03-20 13:54:00', 'DINNER', 1, '鸡胸肉', 94.00, 155.10, 29.14, 3.38, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (106, 6, '2026-03-19 11:58:00', 'SNACK', 1, '鸡胸肉', 170.00, 280.50, 52.70, 6.12, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (107, 6, '2026-03-20 17:57:00', 'BREAKFAST', 1, '鸡胸肉', 87.00, 143.55, 26.97, 3.13, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (108, 6, '2026-03-22 18:02:00', 'LUNCH', 1, '鸡胸肉', 254.00, 419.10, 78.74, 9.14, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (109, 6, '2026-03-19 20:30:00', 'DINNER', 1, '鸡胸肉', 263.00, 433.95, 81.53, 9.47, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (110, 6, '2026-03-19 12:59:00', 'SNACK', 1, '鸡胸肉', 174.00, 287.10, 53.94, 6.26, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (111, 6, '2026-03-20 09:53:00', 'BREAKFAST', 1, '鸡胸肉', 196.00, 323.40, 60.76, 7.06, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (112, 6, '2026-03-20 13:11:00', 'LUNCH', 1, '鸡胸肉', 169.00, 278.85, 52.39, 6.08, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (113, 6, '2026-03-23 17:20:00', 'DINNER', 1, '鸡胸肉', 177.00, 292.05, 54.87, 6.37, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (114, 6, '2026-03-20 14:23:00', 'SNACK', 1, '鸡胸肉', 202.00, 333.30, 62.62, 7.27, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (115, 6, '2026-03-19 08:37:00', 'BREAKFAST', 1, '鸡胸肉', 86.00, 141.90, 26.66, 3.10, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (116, 6, '2026-03-23 19:47:00', 'LUNCH', 1, '鸡胸肉', 296.00, 488.40, 91.76, 10.66, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (117, 6, '2026-03-20 18:18:00', 'DINNER', 1, '鸡胸肉', 259.00, 427.35, 80.29, 9.32, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (118, 6, '2026-03-22 09:27:00', 'SNACK', 1, '鸡胸肉', 191.00, 315.15, 59.21, 6.88, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (119, 6, '2026-03-23 12:54:00', 'BREAKFAST', 1, '鸡胸肉', 253.00, 417.45, 78.43, 9.11, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (120, 6, '2026-03-18 15:14:00', 'LUNCH', 1, '鸡胸肉', 205.00, 338.25, 63.55, 7.38, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (121, 7, '2026-03-20 08:12:00', 'BREAKFAST', 1, '鸡胸肉', 205.00, 338.25, 63.55, 7.38, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (122, 7, '2026-03-22 13:40:00', 'LUNCH', 1, '鸡胸肉', 174.00, 287.10, 53.94, 6.26, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (123, 7, '2026-03-23 17:59:00', 'DINNER', 1, '鸡胸肉', 179.00, 295.35, 55.49, 6.44, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (124, 7, '2026-03-21 14:23:00', 'SNACK', 1, '鸡胸肉', 145.00, 239.25, 44.95, 5.22, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (125, 7, '2026-03-23 09:44:00', 'BREAKFAST', 1, '鸡胸肉', 205.00, 338.25, 63.55, 7.38, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (126, 7, '2026-03-20 13:55:00', 'LUNCH', 1, '鸡胸肉', 80.00, 132.00, 24.80, 2.88, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (127, 7, '2026-03-18 17:04:00', 'DINNER', 1, '鸡胸肉', 184.00, 303.60, 57.04, 6.62, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (128, 7, '2026-03-17 14:22:00', 'SNACK', 1, '鸡胸肉', 219.00, 361.35, 67.89, 7.88, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (129, 7, '2026-03-20 07:05:00', 'BREAKFAST', 1, '鸡胸肉', 213.00, 351.45, 66.03, 7.67, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (130, 7, '2026-03-23 13:41:00', 'LUNCH', 1, '鸡胸肉', 293.00, 483.45, 90.83, 10.55, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (131, 7, '2026-03-17 08:16:00', 'DINNER', 1, '鸡胸肉', 99.00, 163.35, 30.69, 3.56, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (132, 7, '2026-03-19 10:10:00', 'SNACK', 1, '鸡胸肉', 84.00, 138.60, 26.04, 3.02, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (133, 7, '2026-03-23 12:43:00', 'BREAKFAST', 1, '鸡胸肉', 107.00, 176.55, 33.17, 3.85, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (134, 7, '2026-03-17 14:43:00', 'LUNCH', 1, '鸡胸肉', 201.00, 331.65, 62.31, 7.24, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (135, 7, '2026-03-21 14:22:00', 'DINNER', 1, '鸡胸肉', 215.00, 354.75, 66.65, 7.74, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (136, 7, '2026-03-23 08:26:00', 'SNACK', 1, '鸡胸肉', 268.00, 442.20, 83.08, 9.65, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (137, 7, '2026-03-22 07:46:00', 'BREAKFAST', 1, '鸡胸肉', 225.00, 371.25, 69.75, 8.10, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (138, 7, '2026-03-22 11:06:00', 'LUNCH', 1, '鸡胸肉', 168.00, 277.20, 52.08, 6.05, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (139, 7, '2026-03-21 19:40:00', 'DINNER', 1, '鸡胸肉', 121.00, 199.65, 37.51, 4.36, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (140, 7, '2026-03-17 09:19:00', 'SNACK', 1, '鸡胸肉', 193.00, 318.45, 59.83, 6.95, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (141, 7, '2026-03-23 19:35:00', 'BREAKFAST', 1, '鸡胸肉', 177.00, 292.05, 54.87, 6.37, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (142, 7, '2026-03-17 14:32:00', 'LUNCH', 1, '鸡胸肉', 175.00, 288.75, 54.25, 6.30, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (143, 7, '2026-03-21 18:54:00', 'DINNER', 1, '鸡胸肉', 256.00, 422.40, 79.36, 9.22, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (144, 7, '2026-03-22 18:20:00', 'SNACK', 1, '鸡胸肉', 274.00, 452.10, 84.94, 9.86, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (145, 7, '2026-03-23 13:23:00', 'BREAKFAST', 1, '鸡胸肉', 157.00, 259.05, 48.67, 5.65, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (146, 7, '2026-03-21 16:45:00', 'LUNCH', 1, '鸡胸肉', 272.00, 448.80, 84.32, 9.79, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (147, 7, '2026-03-17 19:16:00', 'DINNER', 1, '鸡胸肉', 160.00, 264.00, 49.60, 5.76, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (148, 7, '2026-03-18 10:22:00', 'SNACK', 1, '鸡胸肉', 286.00, 471.90, 88.66, 10.30, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (149, 7, '2026-03-21 16:50:00', 'BREAKFAST', 1, '鸡胸肉', 273.00, 450.45, 84.63, 9.83, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (150, 7, '2026-03-18 12:59:00', 'LUNCH', 1, '鸡胸肉', 149.00, 245.85, 46.19, 5.36, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (151, 8, '2026-03-20 18:31:00', 'BREAKFAST', 1, '鸡胸肉', 211.00, 348.15, 65.41, 7.60, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (152, 8, '2026-03-21 13:07:00', 'LUNCH', 1, '鸡胸肉', 240.00, 396.00, 74.40, 8.64, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (153, 8, '2026-03-20 10:45:00', 'DINNER', 1, '鸡胸肉', 275.00, 453.75, 85.25, 9.90, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (154, 8, '2026-03-21 11:03:00', 'SNACK', 1, '鸡胸肉', 83.00, 136.95, 25.73, 2.99, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (155, 8, '2026-03-23 14:51:00', 'BREAKFAST', 1, '鸡胸肉', 183.00, 301.95, 56.73, 6.59, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (156, 8, '2026-03-23 13:11:00', 'LUNCH', 1, '鸡胸肉', 205.00, 338.25, 63.55, 7.38, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (157, 8, '2026-03-21 14:17:00', 'DINNER', 1, '鸡胸肉', 250.00, 412.50, 77.50, 9.00, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (158, 8, '2026-03-19 09:49:00', 'SNACK', 1, '鸡胸肉', 293.00, 483.45, 90.83, 10.55, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (159, 8, '2026-03-19 07:22:00', 'BREAKFAST', 1, '鸡胸肉', 105.00, 173.25, 32.55, 3.78, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (160, 8, '2026-03-20 17:39:00', 'LUNCH', 1, '鸡胸肉', 192.00, 316.80, 59.52, 6.91, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (161, 8, '2026-03-23 09:09:00', 'DINNER', 1, '鸡胸肉', 240.00, 396.00, 74.40, 8.64, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (162, 8, '2026-03-17 14:07:00', 'SNACK', 1, '鸡胸肉', 128.00, 211.20, 39.68, 4.61, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (163, 8, '2026-03-21 19:39:00', 'BREAKFAST', 1, '鸡胸肉', 183.00, 301.95, 56.73, 6.59, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (164, 8, '2026-03-17 20:28:00', 'LUNCH', 1, '鸡胸肉', 255.00, 420.75, 79.05, 9.18, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (165, 8, '2026-03-20 19:49:00', 'DINNER', 1, '鸡胸肉', 195.00, 321.75, 60.45, 7.02, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (166, 8, '2026-03-21 09:43:00', 'SNACK', 1, '鸡胸肉', 138.00, 227.70, 42.78, 4.97, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (167, 8, '2026-03-23 15:21:00', 'BREAKFAST', 1, '鸡胸肉', 197.00, 325.05, 61.07, 7.09, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (168, 8, '2026-03-21 08:38:00', 'LUNCH', 1, '鸡胸肉', 162.00, 267.30, 50.22, 5.83, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (169, 8, '2026-03-22 11:04:00', 'DINNER', 1, '鸡胸肉', 225.00, 371.25, 69.75, 8.10, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (170, 8, '2026-03-21 09:38:00', 'SNACK', 1, '鸡胸肉', 133.00, 219.45, 41.23, 4.79, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (171, 8, '2026-03-22 11:19:00', 'BREAKFAST', 1, '鸡胸肉', 249.00, 410.85, 77.19, 8.96, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (172, 8, '2026-03-23 12:26:00', 'LUNCH', 1, '鸡胸肉', 244.00, 402.60, 75.64, 8.78, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (173, 8, '2026-03-23 18:25:00', 'DINNER', 1, '鸡胸肉', 197.00, 325.05, 61.07, 7.09, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (174, 8, '2026-03-19 20:34:00', 'SNACK', 1, '鸡胸肉', 169.00, 278.85, 52.39, 6.08, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (175, 8, '2026-03-22 07:28:00', 'BREAKFAST', 1, '鸡胸肉', 82.00, 135.30, 25.42, 2.95, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (176, 8, '2026-03-18 18:45:00', 'LUNCH', 1, '鸡胸肉', 153.00, 252.45, 47.43, 5.51, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (177, 8, '2026-03-19 09:16:00', 'DINNER', 1, '鸡胸肉', 190.00, 313.50, 58.90, 6.84, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (178, 8, '2026-03-17 12:59:00', 'SNACK', 1, '鸡胸肉', 181.00, 298.65, 56.11, 6.52, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (179, 8, '2026-03-23 17:47:00', 'BREAKFAST', 1, '鸡胸肉', 96.00, 158.40, 29.76, 3.46, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (180, 8, '2026-03-23 11:43:00', 'LUNCH', 1, '鸡胸肉', 287.00, 473.55, 88.97, 10.33, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (181, 9, '2026-03-17 13:59:00', 'BREAKFAST', 1, '鸡胸肉', 138.00, 227.70, 42.78, 4.97, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (182, 9, '2026-03-18 07:52:00', 'LUNCH', 1, '鸡胸肉', 248.00, 409.20, 76.88, 8.93, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (183, 9, '2026-03-18 20:16:00', 'DINNER', 1, '鸡胸肉', 228.00, 376.20, 70.68, 8.21, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (184, 9, '2026-03-17 10:08:00', 'SNACK', 1, '鸡胸肉', 219.00, 361.35, 67.89, 7.88, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (185, 9, '2026-03-23 18:26:00', 'BREAKFAST', 1, '鸡胸肉', 290.00, 478.50, 89.90, 10.44, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (186, 9, '2026-03-21 14:31:00', 'LUNCH', 1, '鸡胸肉', 220.00, 363.00, 68.20, 7.92, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (187, 9, '2026-03-23 15:49:00', 'DINNER', 1, '鸡胸肉', 122.00, 201.30, 37.82, 4.39, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (188, 9, '2026-03-20 12:28:00', 'SNACK', 1, '鸡胸肉', 151.00, 249.15, 46.81, 5.44, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (189, 9, '2026-03-21 14:33:00', 'BREAKFAST', 1, '鸡胸肉', 277.00, 457.05, 85.87, 9.97, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (190, 9, '2026-03-19 18:37:00', 'LUNCH', 1, '鸡胸肉', 297.00, 490.05, 92.07, 10.69, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (191, 9, '2026-03-20 19:13:00', 'DINNER', 1, '鸡胸肉', 124.00, 204.60, 38.44, 4.46, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (192, 9, '2026-03-17 07:14:00', 'SNACK', 1, '鸡胸肉', 272.00, 448.80, 84.32, 9.79, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (193, 9, '2026-03-19 12:40:00', 'BREAKFAST', 1, '鸡胸肉', 83.00, 136.95, 25.73, 2.99, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (194, 9, '2026-03-18 09:13:00', 'LUNCH', 1, '鸡胸肉', 206.00, 339.90, 63.86, 7.42, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (195, 9, '2026-03-18 14:54:00', 'DINNER', 1, '鸡胸肉', 234.00, 386.10, 72.54, 8.42, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (196, 9, '2026-03-20 19:03:00', 'SNACK', 1, '鸡胸肉', 114.00, 188.10, 35.34, 4.10, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (197, 9, '2026-03-22 16:13:00', 'BREAKFAST', 1, '鸡胸肉', 149.00, 245.85, 46.19, 5.36, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (198, 9, '2026-03-20 14:47:00', 'LUNCH', 1, '鸡胸肉', 294.00, 485.10, 91.14, 10.58, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (199, 9, '2026-03-17 15:35:00', 'DINNER', 1, '鸡胸肉', 141.00, 232.65, 43.71, 5.08, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (200, 9, '2026-03-20 10:12:00', 'SNACK', 1, '鸡胸肉', 117.00, 193.05, 36.27, 4.21, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (201, 9, '2026-03-20 18:21:00', 'BREAKFAST', 1, '鸡胸肉', 214.00, 353.10, 66.34, 7.70, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (202, 9, '2026-03-22 19:09:00', 'LUNCH', 1, '鸡胸肉', 203.00, 334.95, 62.93, 7.31, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (203, 9, '2026-03-19 18:53:00', 'DINNER', 1, '鸡胸肉', 276.00, 455.40, 85.56, 9.94, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (204, 9, '2026-03-23 20:09:00', 'SNACK', 1, '鸡胸肉', 260.00, 429.00, 80.60, 9.36, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (205, 9, '2026-03-18 15:30:00', 'BREAKFAST', 1, '鸡胸肉', 173.00, 285.45, 53.63, 6.23, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (206, 9, '2026-03-23 20:44:00', 'LUNCH', 1, '鸡胸肉', 137.00, 226.05, 42.47, 4.93, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (207, 9, '2026-03-20 20:26:00', 'DINNER', 1, '鸡胸肉', 269.00, 443.85, 83.39, 9.68, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (208, 9, '2026-03-20 20:48:00', 'SNACK', 1, '鸡胸肉', 88.00, 145.20, 27.28, 3.17, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (209, 9, '2026-03-19 16:56:00', 'BREAKFAST', 1, '鸡胸肉', 281.00, 463.65, 87.11, 10.12, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (210, 9, '2026-03-17 10:05:00', 'LUNCH', 1, '鸡胸肉', 108.00, 178.20, 33.48, 3.89, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (211, 10, '2026-03-19 17:42:00', 'BREAKFAST', 1, '鸡胸肉', 171.00, 282.15, 53.01, 6.16, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (212, 10, '2026-03-22 09:36:00', 'LUNCH', 1, '鸡胸肉', 220.00, 363.00, 68.20, 7.92, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (213, 10, '2026-03-22 16:03:00', 'DINNER', 1, '鸡胸肉', 112.00, 184.80, 34.72, 4.03, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (214, 10, '2026-03-21 07:45:00', 'SNACK', 1, '鸡胸肉', 266.00, 438.90, 82.46, 9.58, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (215, 10, '2026-03-22 12:59:00', 'BREAKFAST', 1, '鸡胸肉', 148.00, 244.20, 45.88, 5.33, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (216, 10, '2026-03-18 13:54:00', 'LUNCH', 1, '鸡胸肉', 108.00, 178.20, 33.48, 3.89, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (217, 10, '2026-03-21 07:37:00', 'DINNER', 1, '鸡胸肉', 238.00, 392.70, 73.78, 8.57, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (218, 10, '2026-03-21 08:37:00', 'SNACK', 1, '鸡胸肉', 234.00, 386.10, 72.54, 8.42, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (219, 10, '2026-03-22 08:21:00', 'BREAKFAST', 1, '鸡胸肉', 272.00, 448.80, 84.32, 9.79, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (220, 10, '2026-03-21 19:47:00', 'LUNCH', 1, '鸡胸肉', 203.00, 334.95, 62.93, 7.31, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (221, 10, '2026-03-17 10:54:00', 'DINNER', 1, '鸡胸肉', 154.00, 254.10, 47.74, 5.54, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (222, 10, '2026-03-21 08:37:00', 'SNACK', 1, '鸡胸肉', 195.00, 321.75, 60.45, 7.02, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (223, 10, '2026-03-21 08:07:00', 'BREAKFAST', 1, '鸡胸肉', 201.00, 331.65, 62.31, 7.24, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (224, 10, '2026-03-18 18:04:00', 'LUNCH', 1, '鸡胸肉', 128.00, 211.20, 39.68, 4.61, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (225, 10, '2026-03-19 15:51:00', 'DINNER', 1, '鸡胸肉', 269.00, 443.85, 83.39, 9.68, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (226, 10, '2026-03-23 20:50:00', 'SNACK', 1, '鸡胸肉', 216.00, 356.40, 66.96, 7.78, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (227, 10, '2026-03-21 10:20:00', 'BREAKFAST', 1, '鸡胸肉', 84.00, 138.60, 26.04, 3.02, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (228, 10, '2026-03-22 16:08:00', 'LUNCH', 1, '鸡胸肉', 187.00, 308.55, 57.97, 6.73, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (229, 10, '2026-03-17 19:24:00', 'DINNER', 1, '鸡胸肉', 189.00, 311.85, 58.59, 6.80, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (230, 10, '2026-03-17 20:21:00', 'SNACK', 1, '鸡胸肉', 287.00, 473.55, 88.97, 10.33, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (231, 10, '2026-03-17 09:25:00', 'BREAKFAST', 1, '鸡胸肉', 119.00, 196.35, 36.89, 4.28, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (232, 10, '2026-03-17 19:59:00', 'LUNCH', 1, '鸡胸肉', 242.00, 399.30, 75.02, 8.71, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (233, 10, '2026-03-20 12:23:00', 'DINNER', 1, '鸡胸肉', 132.00, 217.80, 40.92, 4.75, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (234, 10, '2026-03-21 16:50:00', 'SNACK', 1, '鸡胸肉', 246.00, 405.90, 76.26, 8.86, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (235, 10, '2026-03-19 14:32:00', 'BREAKFAST', 1, '鸡胸肉', 91.00, 150.15, 28.21, 3.28, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (236, 10, '2026-03-22 20:04:00', 'LUNCH', 1, '鸡胸肉', 291.00, 480.15, 90.21, 10.48, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (237, 10, '2026-03-21 08:19:00', 'DINNER', 1, '鸡胸肉', 297.00, 490.05, 92.07, 10.69, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (238, 10, '2026-03-21 07:11:00', 'SNACK', 1, '鸡胸肉', 147.00, 242.55, 45.57, 5.29, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (239, 10, '2026-03-17 08:51:00', 'BREAKFAST', 1, '鸡胸肉', 225.00, 371.25, 69.75, 8.10, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (240, 10, '2026-03-19 13:13:00', 'LUNCH', 1, '鸡胸肉', 183.00, 301.95, 56.73, 6.59, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (241, 11, '2026-03-23 08:20:00', 'BREAKFAST', 1, '鸡胸肉', 131.00, 216.15, 40.61, 4.72, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (242, 11, '2026-03-21 18:23:00', 'LUNCH', 1, '鸡胸肉', 194.00, 320.10, 60.14, 6.98, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (243, 11, '2026-03-21 16:13:00', 'DINNER', 1, '鸡胸肉', 159.00, 262.35, 49.29, 5.72, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (244, 11, '2026-03-22 11:32:00', 'SNACK', 1, '鸡胸肉', 164.00, 270.60, 50.84, 5.90, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (245, 11, '2026-03-17 17:42:00', 'BREAKFAST', 1, '鸡胸肉', 223.00, 367.95, 69.13, 8.03, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (246, 11, '2026-03-22 18:41:00', 'LUNCH', 1, '鸡胸肉', 156.00, 257.40, 48.36, 5.62, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (247, 11, '2026-03-21 11:42:00', 'DINNER', 1, '鸡胸肉', 257.00, 424.05, 79.67, 9.25, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (248, 11, '2026-03-21 16:54:00', 'SNACK', 1, '鸡胸肉', 97.00, 160.05, 30.07, 3.49, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (249, 11, '2026-03-21 12:27:00', 'BREAKFAST', 1, '鸡胸肉', 106.00, 174.90, 32.86, 3.82, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (250, 11, '2026-03-18 19:59:00', 'LUNCH', 1, '鸡胸肉', 264.00, 435.60, 81.84, 9.50, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (251, 11, '2026-03-18 07:54:00', 'DINNER', 1, '鸡胸肉', 194.00, 320.10, 60.14, 6.98, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (252, 11, '2026-03-17 12:13:00', 'SNACK', 1, '鸡胸肉', 173.00, 285.45, 53.63, 6.23, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (253, 11, '2026-03-20 19:24:00', 'BREAKFAST', 1, '鸡胸肉', 116.00, 191.40, 35.96, 4.18, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (254, 11, '2026-03-23 09:22:00', 'LUNCH', 1, '鸡胸肉', 238.00, 392.70, 73.78, 8.57, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (255, 11, '2026-03-21 18:10:00', 'DINNER', 1, '鸡胸肉', 187.00, 308.55, 57.97, 6.73, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (256, 11, '2026-03-20 09:51:00', 'SNACK', 1, '鸡胸肉', 280.00, 462.00, 86.80, 10.08, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (257, 11, '2026-03-21 12:49:00', 'BREAKFAST', 1, '鸡胸肉', 287.00, 473.55, 88.97, 10.33, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (258, 11, '2026-03-19 13:03:00', 'LUNCH', 1, '鸡胸肉', 106.00, 174.90, 32.86, 3.82, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (259, 11, '2026-03-17 09:48:00', 'DINNER', 1, '鸡胸肉', 166.00, 273.90, 51.46, 5.98, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (260, 11, '2026-03-17 13:53:00', 'SNACK', 1, '鸡胸肉', 281.00, 463.65, 87.11, 10.12, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (261, 11, '2026-03-17 16:09:00', 'BREAKFAST', 1, '鸡胸肉', 164.00, 270.60, 50.84, 5.90, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (262, 11, '2026-03-20 11:26:00', 'LUNCH', 1, '鸡胸肉', 99.00, 163.35, 30.69, 3.56, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (263, 11, '2026-03-17 19:07:00', 'DINNER', 1, '鸡胸肉', 134.00, 221.10, 41.54, 4.82, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (264, 11, '2026-03-21 10:59:00', 'SNACK', 1, '鸡胸肉', 298.00, 491.70, 92.38, 10.73, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (265, 11, '2026-03-21 15:29:00', 'BREAKFAST', 1, '鸡胸肉', 154.00, 254.10, 47.74, 5.54, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (266, 11, '2026-03-19 11:27:00', 'LUNCH', 1, '鸡胸肉', 149.00, 245.85, 46.19, 5.36, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (267, 11, '2026-03-23 19:32:00', 'DINNER', 1, '鸡胸肉', 89.00, 146.85, 27.59, 3.20, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (268, 11, '2026-03-20 08:22:00', 'SNACK', 1, '鸡胸肉', 160.00, 264.00, 49.60, 5.76, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (269, 11, '2026-03-18 08:34:00', 'BREAKFAST', 1, '鸡胸肉', 182.00, 300.30, 56.42, 6.55, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (270, 11, '2026-03-17 17:26:00', 'LUNCH', 1, '鸡胸肉', 234.00, 386.10, 72.54, 8.42, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (271, 12, '2026-03-22 18:15:00', 'BREAKFAST', 1, '鸡胸肉', 125.00, 206.25, 38.75, 4.50, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (272, 12, '2026-03-19 11:07:00', 'LUNCH', 1, '鸡胸肉', 98.00, 161.70, 30.38, 3.53, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (273, 12, '2026-03-22 10:20:00', 'DINNER', 1, '鸡胸肉', 170.00, 280.50, 52.70, 6.12, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (274, 12, '2026-03-18 09:27:00', 'SNACK', 1, '鸡胸肉', 292.00, 481.80, 90.52, 10.51, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (275, 12, '2026-03-22 07:55:00', 'BREAKFAST', 1, '鸡胸肉', 151.00, 249.15, 46.81, 5.44, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (276, 12, '2026-03-21 16:37:00', 'LUNCH', 1, '鸡胸肉', 124.00, 204.60, 38.44, 4.46, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (277, 12, '2026-03-22 07:44:00', 'DINNER', 1, '鸡胸肉', 251.00, 414.15, 77.81, 9.04, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (278, 12, '2026-03-18 09:10:00', 'SNACK', 1, '鸡胸肉', 128.00, 211.20, 39.68, 4.61, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (279, 12, '2026-03-18 12:33:00', 'BREAKFAST', 1, '鸡胸肉', 260.00, 429.00, 80.60, 9.36, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (280, 12, '2026-03-19 09:44:00', 'LUNCH', 1, '鸡胸肉', 132.00, 217.80, 40.92, 4.75, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (281, 12, '2026-03-23 18:52:00', 'DINNER', 1, '鸡胸肉', 239.00, 394.35, 74.09, 8.60, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (282, 12, '2026-03-22 14:58:00', 'SNACK', 1, '鸡胸肉', 287.00, 473.55, 88.97, 10.33, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (283, 12, '2026-03-18 19:46:00', 'BREAKFAST', 1, '鸡胸肉', 88.00, 145.20, 27.28, 3.17, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (284, 12, '2026-03-23 09:59:00', 'LUNCH', 1, '鸡胸肉', 215.00, 354.75, 66.65, 7.74, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (285, 12, '2026-03-20 09:15:00', 'DINNER', 1, '鸡胸肉', 278.00, 458.70, 86.18, 10.01, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (286, 12, '2026-03-19 17:41:00', 'SNACK', 1, '鸡胸肉', 131.00, 216.15, 40.61, 4.72, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (287, 12, '2026-03-19 11:17:00', 'BREAKFAST', 1, '鸡胸肉', 241.00, 397.65, 74.71, 8.68, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (288, 12, '2026-03-23 19:51:00', 'LUNCH', 1, '鸡胸肉', 250.00, 412.50, 77.50, 9.00, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (289, 12, '2026-03-17 15:00:00', 'DINNER', 1, '鸡胸肉', 207.00, 341.55, 64.17, 7.45, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (290, 12, '2026-03-23 12:19:00', 'SNACK', 1, '鸡胸肉', 211.00, 348.15, 65.41, 7.60, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (291, 12, '2026-03-20 07:31:00', 'BREAKFAST', 1, '鸡胸肉', 277.00, 457.05, 85.87, 9.97, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (292, 12, '2026-03-19 08:08:00', 'LUNCH', 1, '鸡胸肉', 282.00, 465.30, 87.42, 10.15, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (293, 12, '2026-03-19 07:08:00', 'DINNER', 1, '鸡胸肉', 287.00, 473.55, 88.97, 10.33, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (294, 12, '2026-03-20 09:55:00', 'SNACK', 1, '鸡胸肉', 142.00, 234.30, 44.02, 5.11, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (295, 12, '2026-03-21 14:29:00', 'BREAKFAST', 1, '鸡胸肉', 205.00, 338.25, 63.55, 7.38, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (296, 12, '2026-03-17 12:21:00', 'LUNCH', 1, '鸡胸肉', 243.00, 400.95, 75.33, 8.75, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (297, 12, '2026-03-21 08:32:00', 'DINNER', 1, '鸡胸肉', 237.00, 391.05, 73.47, 8.53, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (298, 12, '2026-03-17 09:29:00', 'SNACK', 1, '鸡胸肉', 159.00, 262.35, 49.29, 5.72, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (299, 12, '2026-03-21 16:08:00', 'BREAKFAST', 1, '鸡胸肉', 269.00, 443.85, 83.39, 9.68, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');
INSERT INTO `diet_log` VALUES (300, 12, '2026-03-23 12:42:00', 'LUNCH', 1, '鸡胸肉', 214.00, 353.10, 66.34, 7.70, 0.00, 'SEARCH', NULL, '2026-03-23 19:57:02');

-- ----------------------------
-- Table structure for diet_record
-- ----------------------------
DROP TABLE IF EXISTS `diet_record`;
CREATE TABLE `diet_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `diet_date` date NOT NULL COMMENT '饮食日期',
  `meal_type` tinyint NOT NULL COMMENT '餐次:1=早餐,2=午餐,3=晚餐,4=加餐',
  `food_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '食物名称',
  `calories` int NULL DEFAULT NULL COMMENT '卡路里(kcal)',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_date`(`user_id` ASC, `diet_date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '饮食记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of diet_record
-- ----------------------------
INSERT INTO `diet_record` VALUES (1, 2, '2026-04-10', 1, '牛奶+全麦面包+鸡蛋', 450, NULL, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `diet_record` VALUES (2, 2, '2026-04-10', 2, '米饭+红烧鸡腿+西兰花', 680, NULL, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `diet_record` VALUES (3, 2, '2026-04-10', 3, '小米粥+清炒时蔬', 380, NULL, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `diet_record` VALUES (4, 3, '2026-04-10', 1, '豆浆+包子', 350, NULL, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `diet_record` VALUES (5, 3, '2026-04-10', 2, '面条+卤蛋', 520, NULL, '2026-04-10 05:04:36', '2026-04-10 05:04:36');

-- ----------------------------
-- Table structure for exercise_record
-- ----------------------------
DROP TABLE IF EXISTS `exercise_record`;
CREATE TABLE `exercise_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `exercise_date` date NOT NULL COMMENT '运动日期',
  `exercise_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '运动类型',
  `duration` int NOT NULL COMMENT '运动时长(分钟)',
  `calories` int NULL DEFAULT NULL COMMENT '消耗卡路里(kcal)',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_date`(`user_id` ASC, `exercise_date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '运动记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exercise_record
-- ----------------------------
INSERT INTO `exercise_record` VALUES (1, 2, '2026-04-01', '跑步', 30, 280, NULL, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `exercise_record` VALUES (2, 2, '2026-04-03', '游泳', 45, 400, NULL, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `exercise_record` VALUES (3, 2, '2026-04-05', '健身', 60, 350, NULL, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `exercise_record` VALUES (4, 2, '2026-04-07', '骑行', 40, 300, NULL, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `exercise_record` VALUES (5, 2, '2026-04-09', '跑步', 35, 310, NULL, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `exercise_record` VALUES (6, 3, '2026-04-02', '瑜伽', 50, 180, NULL, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `exercise_record` VALUES (7, 3, '2026-04-04', '散步', 60, 150, NULL, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `exercise_record` VALUES (8, 3, '2026-04-06', '跑步', 25, 230, NULL, '2026-04-10 05:04:36', '2026-04-10 05:04:36');

-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `brand` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `barcode` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `category` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `kcal_per_100g` decimal(8, 2) NOT NULL,
  `protein_g` decimal(8, 2) NULL DEFAULT NULL,
  `fat_g` decimal(8, 2) NULL DEFAULT NULL,
  `carb_g` decimal(8, 2) NULL DEFAULT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'ACTIVE',
  `created_by` bigint NULL DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_food_barcode`(`barcode` ASC) USING BTREE,
  INDEX `idx_food_name`(`name` ASC) USING BTREE,
  INDEX `idx_food_category`(`category` ASC) USING BTREE,
  INDEX `idx_food_status`(`status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO `food` VALUES (1, '鸡胸肉', NULL, '6900000000001', '肉蛋奶', 165.00, 31.00, 3.60, 0.00, NULL, 'ACTIVE', 1, '2026-03-23 19:57:01', '2026-03-23 19:57:01');

-- ----------------------------
-- Table structure for friend_request
-- ----------------------------
DROP TABLE IF EXISTS `friend_request`;
CREATE TABLE `friend_request`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint NOT NULL,
  `to_user_id` bigint NOT NULL,
  `status` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'PENDING',
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_friend_from_to`(`from_user_id` ASC, `to_user_id` ASC) USING BTREE,
  INDEX `idx_friend_to_status`(`to_user_id` ASC, `status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of friend_request
-- ----------------------------
INSERT INTO `friend_request` VALUES (1, 3, 4, 'PENDING', '一起打卡减脂吧！', '2026-03-23 19:57:02', '2026-03-23 19:57:02');

-- ----------------------------
-- Table structure for health_assessment
-- ----------------------------
DROP TABLE IF EXISTS `health_assessment`;
CREATE TABLE `health_assessment`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `assessment_date` date NOT NULL COMMENT '评估日期',
  `health_score` int NULL DEFAULT NULL COMMENT '健康评分(0-100)',
  `bmi_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'BMI状态',
  `blood_pressure_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '血压状态',
  `overall_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '综合状态',
  `ai_analysis` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'AI分析内容',
  `ai_suggestion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'AI个性化建议',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '健康评估表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of health_assessment
-- ----------------------------

-- ----------------------------
-- Table structure for health_daily_record
-- ----------------------------
DROP TABLE IF EXISTS `health_daily_record`;
CREATE TABLE `health_daily_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `record_date` date NOT NULL,
  `weight_kg` decimal(5, 2) NULL DEFAULT NULL,
  `body_fat_pct` decimal(5, 2) NULL DEFAULT NULL,
  `waist_cm` decimal(5, 2) NULL DEFAULT NULL,
  `hrv_ms` decimal(6, 2) NULL DEFAULT NULL,
  `resting_hr_bpm` int NULL DEFAULT NULL,
  `sleep_hours` decimal(4, 2) NULL DEFAULT NULL,
  `subjective_fatigue` int NULL DEFAULT NULL,
  `training_load_score` decimal(6, 2) NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_health_daily_user_date`(`user_id` ASC, `record_date` ASC) USING BTREE,
  INDEX `idx_health_daily_user_date`(`user_id` ASC, `record_date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 141 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of health_daily_record
-- ----------------------------
INSERT INTO `health_daily_record` VALUES (1, 3, '2026-03-23', 60.48, 25.20, NULL, 34.04, NULL, 5.19, 8, 40.65, NULL, '2026-03-23 19:57:01');
INSERT INTO `health_daily_record` VALUES (2, 3, '2026-03-22', 68.21, 18.20, NULL, 61.23, NULL, 5.54, 5, 46.05, NULL, '2026-03-23 19:57:01');
INSERT INTO `health_daily_record` VALUES (3, 3, '2026-03-21', 59.28, 28.30, NULL, 59.42, NULL, 5.01, 9, 94.96, NULL, '2026-03-23 19:57:01');
INSERT INTO `health_daily_record` VALUES (4, 3, '2026-03-20', 57.45, 25.17, NULL, 33.89, NULL, 6.49, 6, 43.51, NULL, '2026-03-23 19:57:01');
INSERT INTO `health_daily_record` VALUES (5, 3, '2026-03-19', 61.57, 18.50, NULL, 32.92, NULL, 7.71, 5, 68.89, NULL, '2026-03-23 19:57:01');
INSERT INTO `health_daily_record` VALUES (6, 3, '2026-03-18', 68.71, 28.97, NULL, 57.61, NULL, 7.91, 8, 71.05, NULL, '2026-03-23 19:57:01');
INSERT INTO `health_daily_record` VALUES (7, 3, '2026-03-17', 67.93, 24.85, NULL, 45.14, NULL, 7.36, 4, 50.32, NULL, '2026-03-23 19:57:01');
INSERT INTO `health_daily_record` VALUES (8, 3, '2026-03-16', 70.73, 21.86, NULL, 43.44, NULL, 7.20, 5, 46.67, NULL, '2026-03-23 19:57:01');
INSERT INTO `health_daily_record` VALUES (9, 3, '2026-03-15', 58.87, 18.66, NULL, 62.66, NULL, 5.23, 9, 52.40, NULL, '2026-03-23 19:57:01');
INSERT INTO `health_daily_record` VALUES (10, 3, '2026-03-14', 69.31, 21.18, NULL, 57.18, NULL, 5.50, 7, 43.64, NULL, '2026-03-23 19:57:01');
INSERT INTO `health_daily_record` VALUES (11, 3, '2026-03-13', 59.22, 28.66, NULL, 32.97, NULL, 7.53, 3, 62.58, NULL, '2026-03-23 19:57:01');
INSERT INTO `health_daily_record` VALUES (12, 3, '2026-03-12', 73.40, 25.90, NULL, 43.07, NULL, 6.37, 7, 44.63, NULL, '2026-03-23 19:57:01');
INSERT INTO `health_daily_record` VALUES (13, 3, '2026-03-11', 67.03, 24.32, NULL, 52.42, NULL, 6.68, 3, 67.84, NULL, '2026-03-23 19:57:01');
INSERT INTO `health_daily_record` VALUES (14, 3, '2026-03-10', 69.02, 22.13, NULL, 39.59, NULL, 5.29, 9, 61.67, NULL, '2026-03-23 19:57:01');
INSERT INTO `health_daily_record` VALUES (15, 4, '2026-03-23', 55.99, 27.60, NULL, 36.73, NULL, 5.12, 7, 58.03, NULL, '2026-03-23 19:57:01');
INSERT INTO `health_daily_record` VALUES (16, 4, '2026-03-22', 64.06, 20.10, NULL, 27.34, NULL, 5.18, 8, 70.88, NULL, '2026-03-23 19:57:01');
INSERT INTO `health_daily_record` VALUES (17, 4, '2026-03-21', 64.48, 24.17, NULL, 47.04, NULL, 6.60, 5, 48.89, NULL, '2026-03-23 19:57:01');
INSERT INTO `health_daily_record` VALUES (18, 4, '2026-03-20', 57.02, 19.97, NULL, 43.50, NULL, 5.84, 4, 95.77, NULL, '2026-03-23 19:57:01');
INSERT INTO `health_daily_record` VALUES (19, 4, '2026-03-19', 64.50, 15.82, NULL, 29.85, NULL, 7.83, 7, 68.93, NULL, '2026-03-23 19:57:01');
INSERT INTO `health_daily_record` VALUES (20, 4, '2026-03-18', 57.13, 15.89, NULL, 36.84, NULL, 5.57, 6, 41.36, NULL, '2026-03-23 19:57:01');
INSERT INTO `health_daily_record` VALUES (21, 4, '2026-03-17', 64.54, 17.22, NULL, 54.00, NULL, 7.12, 9, 43.42, NULL, '2026-03-23 19:57:01');
INSERT INTO `health_daily_record` VALUES (22, 4, '2026-03-16', 66.33, 25.16, NULL, 35.22, NULL, 7.41, 8, 71.30, NULL, '2026-03-23 19:57:01');
INSERT INTO `health_daily_record` VALUES (23, 4, '2026-03-15', 73.01, 22.42, NULL, 47.57, NULL, 6.08, 5, 98.93, NULL, '2026-03-23 19:57:01');
INSERT INTO `health_daily_record` VALUES (24, 4, '2026-03-14', 63.26, 19.84, NULL, 31.51, NULL, 5.35, 7, 80.48, NULL, '2026-03-23 19:57:01');
INSERT INTO `health_daily_record` VALUES (25, 4, '2026-03-13', 72.07, 29.51, NULL, 60.82, NULL, 7.57, 4, 92.99, NULL, '2026-03-23 19:57:01');
INSERT INTO `health_daily_record` VALUES (26, 4, '2026-03-12', 70.11, 21.40, NULL, 61.99, NULL, 5.91, 9, 83.61, NULL, '2026-03-23 19:57:01');
INSERT INTO `health_daily_record` VALUES (27, 4, '2026-03-11', 63.08, 20.95, NULL, 25.13, NULL, 5.54, 7, 96.13, NULL, '2026-03-23 19:57:01');
INSERT INTO `health_daily_record` VALUES (28, 4, '2026-03-10', 58.39, 16.89, NULL, 58.29, NULL, 7.19, 7, 75.79, NULL, '2026-03-23 19:57:01');
INSERT INTO `health_daily_record` VALUES (29, 5, '2026-03-23', 56.35, 23.24, NULL, 58.29, NULL, 5.87, 5, 73.73, NULL, '2026-03-23 19:57:01');
INSERT INTO `health_daily_record` VALUES (30, 5, '2026-03-22', 72.88, 27.17, NULL, 25.55, NULL, 7.43, 7, 66.22, NULL, '2026-03-23 19:57:01');
INSERT INTO `health_daily_record` VALUES (31, 5, '2026-03-21', 67.58, 23.29, NULL, 43.74, NULL, 7.61, 3, 72.40, NULL, '2026-03-23 19:57:01');
INSERT INTO `health_daily_record` VALUES (32, 5, '2026-03-20', 72.38, 19.84, NULL, 48.09, NULL, 5.75, 9, 90.49, NULL, '2026-03-23 19:57:01');
INSERT INTO `health_daily_record` VALUES (33, 5, '2026-03-19', 61.77, 22.59, NULL, 58.22, NULL, 7.04, 8, 99.57, NULL, '2026-03-23 19:57:01');
INSERT INTO `health_daily_record` VALUES (34, 5, '2026-03-18', 57.04, 24.73, NULL, 30.46, NULL, 5.39, 7, 55.40, NULL, '2026-03-23 19:57:01');
INSERT INTO `health_daily_record` VALUES (35, 5, '2026-03-17', 65.71, 21.18, NULL, 60.72, NULL, 7.93, 3, 40.54, NULL, '2026-03-23 19:57:01');
INSERT INTO `health_daily_record` VALUES (36, 5, '2026-03-16', 62.68, 26.25, NULL, 40.72, NULL, 5.84, 6, 83.13, NULL, '2026-03-23 19:57:01');
INSERT INTO `health_daily_record` VALUES (37, 5, '2026-03-15', 73.89, 15.04, NULL, 34.19, NULL, 5.98, 8, 98.00, NULL, '2026-03-23 19:57:01');
INSERT INTO `health_daily_record` VALUES (38, 5, '2026-03-14', 63.74, 28.52, NULL, 47.74, NULL, 5.00, 4, 99.10, NULL, '2026-03-23 19:57:01');
INSERT INTO `health_daily_record` VALUES (39, 5, '2026-03-13', 70.60, 23.82, NULL, 37.56, NULL, 7.91, 6, 66.54, NULL, '2026-03-23 19:57:01');
INSERT INTO `health_daily_record` VALUES (40, 5, '2026-03-12', 65.19, 20.80, NULL, 40.31, NULL, 5.13, 6, 84.27, NULL, '2026-03-23 19:57:01');
INSERT INTO `health_daily_record` VALUES (41, 5, '2026-03-11', 63.11, 27.22, NULL, 61.62, NULL, 5.91, 7, 66.54, NULL, '2026-03-23 19:57:01');
INSERT INTO `health_daily_record` VALUES (42, 5, '2026-03-10', 69.19, 19.99, NULL, 38.85, NULL, 7.49, 8, 54.21, NULL, '2026-03-23 19:57:01');
INSERT INTO `health_daily_record` VALUES (43, 6, '2026-03-23', 58.29, 20.78, NULL, 53.48, NULL, 5.02, 6, 41.78, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (44, 6, '2026-03-22', 70.58, 16.57, NULL, 50.60, NULL, 5.47, 8, 42.92, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (45, 6, '2026-03-21', 59.05, 28.90, NULL, 43.49, NULL, 6.40, 8, 98.27, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (46, 6, '2026-03-20', 73.05, 16.18, NULL, 45.54, NULL, 5.32, 6, 58.68, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (47, 6, '2026-03-19', 59.33, 15.28, NULL, 27.83, NULL, 6.08, 8, 54.83, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (48, 6, '2026-03-18', 58.84, 18.96, NULL, 55.79, NULL, 7.36, 6, 70.91, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (49, 6, '2026-03-17', 61.62, 27.28, NULL, 40.20, NULL, 7.88, 3, 67.69, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (50, 6, '2026-03-16', 64.47, 18.91, NULL, 41.81, NULL, 5.64, 4, 57.21, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (51, 6, '2026-03-15', 58.27, 27.58, NULL, 35.79, NULL, 6.13, 9, 84.84, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (52, 6, '2026-03-14', 72.58, 15.98, NULL, 50.41, NULL, 5.87, 3, 54.01, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (53, 6, '2026-03-13', 66.05, 28.89, NULL, 30.64, NULL, 5.08, 3, 59.32, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (54, 6, '2026-03-12', 70.87, 25.07, NULL, 50.32, NULL, 5.57, 8, 75.53, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (55, 6, '2026-03-11', 70.90, 20.75, NULL, 39.61, NULL, 7.88, 8, 41.38, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (56, 6, '2026-03-10', 66.89, 27.50, NULL, 51.35, NULL, 6.85, 7, 54.47, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (57, 7, '2026-03-23', 71.07, 18.45, NULL, 39.17, NULL, 5.29, 4, 61.51, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (58, 7, '2026-03-22', 63.61, 16.94, NULL, 62.07, NULL, 7.16, 9, 58.50, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (59, 7, '2026-03-21', 61.95, 21.60, NULL, 45.60, NULL, 6.38, 3, 75.45, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (60, 7, '2026-03-20', 74.23, 25.06, NULL, 30.56, NULL, 5.92, 5, 77.94, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (61, 7, '2026-03-19', 60.03, 23.23, NULL, 38.41, NULL, 7.58, 9, 93.95, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (62, 7, '2026-03-18', 63.41, 26.90, NULL, 25.93, NULL, 6.66, 5, 98.85, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (63, 7, '2026-03-17', 70.32, 26.01, NULL, 64.67, NULL, 7.07, 5, 63.58, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (64, 7, '2026-03-16', 59.36, 24.03, NULL, 29.92, NULL, 6.54, 4, 83.17, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (65, 7, '2026-03-15', 74.26, 18.14, NULL, 57.58, NULL, 7.52, 5, 98.06, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (66, 7, '2026-03-14', 64.65, 29.29, NULL, 60.89, NULL, 6.76, 5, 42.42, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (67, 7, '2026-03-13', 61.75, 28.24, NULL, 25.22, NULL, 6.62, 5, 70.31, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (68, 7, '2026-03-12', 71.38, 22.77, NULL, 60.52, NULL, 6.32, 9, 94.46, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (69, 7, '2026-03-11', 72.76, 27.54, NULL, 55.44, NULL, 6.87, 5, 66.18, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (70, 7, '2026-03-10', 64.72, 18.70, NULL, 38.91, NULL, 5.19, 6, 55.69, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (71, 8, '2026-03-23', 73.25, 16.04, NULL, 36.09, NULL, 7.49, 5, 94.99, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (72, 8, '2026-03-22', 69.89, 25.61, NULL, 47.46, NULL, 7.31, 6, 92.14, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (73, 8, '2026-03-21', 59.52, 20.05, NULL, 36.77, NULL, 7.02, 7, 85.84, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (74, 8, '2026-03-20', 67.81, 25.31, NULL, 40.42, NULL, 6.41, 8, 42.08, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (75, 8, '2026-03-19', 62.37, 18.83, NULL, 46.95, NULL, 7.86, 4, 78.62, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (76, 8, '2026-03-18', 68.46, 19.35, NULL, 37.39, NULL, 6.68, 6, 69.42, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (77, 8, '2026-03-17', 61.04, 18.56, NULL, 30.73, NULL, 6.71, 9, 68.36, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (78, 8, '2026-03-16', 68.89, 22.89, NULL, 56.53, NULL, 7.27, 7, 64.63, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (79, 8, '2026-03-15', 64.80, 24.72, NULL, 44.38, NULL, 7.25, 9, 47.26, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (80, 8, '2026-03-14', 70.84, 24.14, NULL, 54.27, NULL, 5.53, 3, 44.43, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (81, 8, '2026-03-13', 57.26, 19.35, NULL, 36.15, NULL, 5.51, 8, 50.08, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (82, 8, '2026-03-12', 66.50, 21.85, NULL, 37.04, NULL, 6.10, 4, 53.47, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (83, 8, '2026-03-11', 68.90, 27.92, NULL, 48.89, NULL, 6.48, 6, 71.48, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (84, 8, '2026-03-10', 63.94, 26.25, NULL, 52.52, NULL, 5.88, 8, 98.51, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (85, 9, '2026-03-23', 66.74, 25.60, NULL, 44.41, NULL, 6.99, 4, 48.99, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (86, 9, '2026-03-22', 59.85, 29.42, NULL, 26.36, NULL, 5.16, 8, 60.08, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (87, 9, '2026-03-21', 74.56, 22.13, NULL, 61.26, NULL, 5.81, 9, 59.46, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (88, 9, '2026-03-20', 60.65, 20.35, NULL, 59.53, NULL, 7.82, 7, 67.24, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (89, 9, '2026-03-19', 58.91, 15.84, NULL, 61.82, NULL, 7.55, 7, 64.13, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (90, 9, '2026-03-18', 73.54, 20.24, NULL, 36.39, NULL, 6.95, 3, 50.73, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (91, 9, '2026-03-17', 68.03, 19.36, NULL, 47.32, NULL, 7.15, 4, 42.11, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (92, 9, '2026-03-16', 68.46, 27.73, NULL, 49.99, NULL, 7.16, 5, 49.54, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (93, 9, '2026-03-15', 70.43, 19.34, NULL, 51.04, NULL, 6.58, 5, 75.16, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (94, 9, '2026-03-14', 64.27, 16.21, NULL, 57.73, NULL, 5.77, 5, 96.03, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (95, 9, '2026-03-13', 56.42, 28.63, NULL, 37.63, NULL, 5.32, 9, 92.38, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (96, 9, '2026-03-12', 60.14, 29.05, NULL, 41.19, NULL, 6.70, 5, 48.06, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (97, 9, '2026-03-11', 59.52, 25.96, NULL, 54.44, NULL, 6.94, 6, 65.45, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (98, 9, '2026-03-10', 70.13, 18.65, NULL, 61.15, NULL, 5.19, 6, 56.31, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (99, 10, '2026-03-23', 68.54, 16.23, NULL, 55.47, NULL, 6.76, 9, 90.68, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (100, 10, '2026-03-22', 74.13, 17.52, NULL, 43.00, NULL, 6.78, 7, 68.42, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (101, 10, '2026-03-21', 58.93, 16.54, NULL, 35.74, NULL, 6.45, 8, 72.60, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (102, 10, '2026-03-20', 58.53, 21.29, NULL, 52.58, NULL, 7.86, 9, 46.49, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (103, 10, '2026-03-19', 70.76, 29.34, NULL, 40.35, NULL, 5.86, 6, 82.62, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (104, 10, '2026-03-18', 74.73, 19.30, NULL, 42.94, NULL, 6.97, 5, 90.26, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (105, 10, '2026-03-17', 71.21, 23.22, NULL, 26.39, NULL, 7.13, 3, 91.80, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (106, 10, '2026-03-16', 65.98, 29.09, NULL, 47.00, NULL, 7.79, 6, 74.56, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (107, 10, '2026-03-15', 63.00, 21.48, NULL, 35.56, NULL, 7.55, 7, 42.91, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (108, 10, '2026-03-14', 71.62, 17.61, NULL, 41.52, NULL, 7.10, 5, 58.53, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (109, 10, '2026-03-13', 73.80, 28.20, NULL, 51.83, NULL, 6.71, 9, 56.82, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (110, 10, '2026-03-12', 71.33, 29.52, NULL, 53.77, NULL, 5.31, 8, 75.53, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (111, 10, '2026-03-11', 68.80, 18.05, NULL, 60.81, NULL, 7.18, 5, 63.90, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (112, 10, '2026-03-10', 61.71, 24.75, NULL, 41.43, NULL, 7.59, 5, 61.41, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (113, 11, '2026-03-23', 60.26, 22.83, NULL, 43.94, NULL, 5.51, 5, 45.52, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (114, 11, '2026-03-22', 60.78, 25.30, NULL, 47.06, NULL, 7.86, 4, 98.94, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (115, 11, '2026-03-21', 74.29, 18.73, NULL, 62.71, NULL, 7.67, 8, 43.19, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (116, 11, '2026-03-20', 74.56, 26.27, NULL, 41.92, NULL, 7.43, 9, 74.21, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (117, 11, '2026-03-19', 65.62, 27.15, NULL, 38.89, NULL, 6.86, 4, 53.66, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (118, 11, '2026-03-18', 55.22, 20.64, NULL, 36.90, NULL, 5.05, 3, 49.97, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (119, 11, '2026-03-17', 66.87, 22.82, NULL, 27.54, NULL, 7.21, 5, 71.79, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (120, 11, '2026-03-16', 70.22, 23.37, NULL, 63.28, NULL, 7.93, 7, 81.62, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (121, 11, '2026-03-15', 59.04, 26.05, NULL, 59.63, NULL, 6.90, 4, 87.32, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (122, 11, '2026-03-14', 63.41, 24.97, NULL, 41.21, NULL, 7.91, 6, 70.28, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (123, 11, '2026-03-13', 73.76, 20.81, NULL, 46.33, NULL, 5.77, 4, 82.01, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (124, 11, '2026-03-12', 68.31, 15.60, NULL, 57.96, NULL, 6.33, 5, 75.52, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (125, 11, '2026-03-11', 63.50, 16.04, NULL, 62.35, NULL, 7.37, 5, 62.64, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (126, 11, '2026-03-10', 62.81, 20.89, NULL, 41.92, NULL, 5.25, 6, 70.41, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (127, 12, '2026-03-23', 71.64, 19.15, NULL, 41.02, NULL, 5.87, 6, 49.48, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (128, 12, '2026-03-22', 72.77, 18.21, NULL, 36.02, NULL, 6.00, 7, 60.37, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (129, 12, '2026-03-21', 61.20, 28.88, NULL, 55.34, NULL, 5.17, 9, 85.16, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (130, 12, '2026-03-20', 59.48, 19.75, NULL, 54.01, NULL, 5.46, 9, 44.75, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (131, 12, '2026-03-19', 64.18, 23.75, NULL, 51.00, NULL, 5.68, 4, 77.78, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (132, 12, '2026-03-18', 67.08, 28.32, NULL, 52.82, NULL, 6.73, 7, 66.25, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (133, 12, '2026-03-17', 68.53, 23.59, NULL, 31.31, NULL, 5.67, 7, 41.67, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (134, 12, '2026-03-16', 72.07, 20.70, NULL, 40.37, NULL, 5.59, 9, 65.20, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (135, 12, '2026-03-15', 71.68, 17.47, NULL, 25.26, NULL, 6.58, 5, 60.03, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (136, 12, '2026-03-14', 71.17, 19.27, NULL, 35.58, NULL, 6.38, 5, 51.56, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (137, 12, '2026-03-13', 74.94, 21.09, NULL, 36.37, NULL, 5.09, 5, 93.62, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (138, 12, '2026-03-12', 64.30, 28.65, NULL, 51.29, NULL, 5.33, 4, 56.56, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (139, 12, '2026-03-11', 61.06, 18.43, NULL, 49.01, NULL, 5.98, 3, 48.75, NULL, '2026-03-23 19:57:02');
INSERT INTO `health_daily_record` VALUES (140, 12, '2026-03-10', 72.52, 17.82, NULL, 42.92, NULL, 6.79, 4, 54.09, NULL, '2026-03-23 19:57:02');

-- ----------------------------
-- Table structure for health_goal
-- ----------------------------
DROP TABLE IF EXISTS `health_goal`;
CREATE TABLE `health_goal`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `goal_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '目标类型',
  `target_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '目标值描述',
  `current_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '当前值描述',
  `start_date` date NOT NULL COMMENT '开始日期',
  `end_date` date NOT NULL COMMENT '截止日期',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态:0=进行中,1=已完成,2=已放弃',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '健康目标表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of health_goal
-- ----------------------------
INSERT INTO `health_goal` VALUES (1, 2, '减重', '68kg', '69.3kg', '2026-04-01', '2026-06-01', 0, NULL, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `health_goal` VALUES (2, 2, '增加运动', '每周4次', '每周2次', '2026-04-01', '2026-05-01', 0, NULL, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `health_goal` VALUES (3, 3, '改善睡眠', '每天8小时', '7.5小时', '2026-04-01', '2026-05-01', 0, NULL, '2026-04-10 05:04:36', '2026-04-10 05:04:36');

-- ----------------------------
-- Table structure for health_knowledge
-- ----------------------------
DROP TABLE IF EXISTS `health_knowledge`;
CREATE TABLE `health_knowledge`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `category` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类:运动/饮食/睡眠/心理/疾病预防',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作者',
  `view_count` int NOT NULL DEFAULT 0 COMMENT '浏览量',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态:0=下架,1=上架',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '健康知识表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of health_knowledge
-- ----------------------------
INSERT INTO `health_knowledge` VALUES (1, '大学生每日运动指南', '大学生每天应保持至少30分钟的中等强度运动。建议选择跑步、游泳、骑行等有氧运动，每周至少3-5次。运动前要做好热身，运动后注意拉伸放松。长期坚持运动可以增强心肺功能、改善睡眠质量、提升学习效率。', '运动', '健康编辑部', 156, 1, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `health_knowledge` VALUES (2, '科学跑步入门教程', '跑步是最简单有效的有氧运动之一。新手建议从慢跑开始，每次20-30分钟，配速在6-7分钟/公里。注意选择合适的跑鞋，跑步时保持上身挺直，呼吸均匀。避免空腹跑步和饭后立即运动。', '运动', '运动医学专家', 205, 1, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `health_knowledge` VALUES (3, '均衡膳食营养搭配', '健康饮食应遵循\"食物多样、谷类为主\"的原则。每天摄入12种以上食物，包括谷薯类、蔬菜水果、畜禽鱼蛋奶、大豆坚果等。控制油盐糖摄入，多吃蔬菜水果，适量补充蛋白质。大学生尤其要注意早餐的营养均衡。', '饮食', '营养师团队', 289, 1, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `health_knowledge` VALUES (4, '远离\"垃圾食品\"指南', '方便面、炸鸡、奶茶等高油高糖食品虽然美味，但长期摄入会导致营养不良、肥胖等问题。建议用水果代替零食，用白开水或绿茶代替含糖饮料。一周偶尔一次解馋是可以的，但不要养成习惯。', '饮食', '营养师团队', 178, 1, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `health_knowledge` VALUES (5, '大学生睡眠质量提升方案', '良好的睡眠是健康的基石。建议每天保持7-8小时睡眠，固定作息时间。睡前1小时避免使用手机和电脑，可以听轻音乐或阅读纸质书。保持寝室安静、凉爽、黑暗的睡眠环境。避免睡前摄入咖啡因。', '睡眠', '心理健康中心', 312, 1, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `health_knowledge` VALUES (6, '如何应对考试焦虑', '考试焦虑是大学生常见的心理问题。适度焦虑可以提高学习效率，但过度焦虑会影响发挥。建议制定合理的复习计划，运用深呼吸、冥想等放松技巧。保持规律作息，适当运动释放压力。如果焦虑严重影响生活，请寻求专业心理咨询。', '心理', '心理咨询师', 245, 1, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `health_knowledge` VALUES (7, '情绪管理与心理健康', '学会管理情绪是心理健康的重要部分。当感到压力或负面情绪时，可以尝试写日记、与朋友倾诉、进行体育运动等方式释放。培养兴趣爱好，保持积极的社交活动。记住，寻求帮助不是软弱的表现。', '心理', '心理咨询师', 199, 1, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `health_knowledge` VALUES (8, '季节性疾病预防手册', '换季时节是感冒、流感等疾病的高发期。预防措施包括：勤洗手、戴口罩、保持室内通风、加强锻炼、注意保暖。饮食上多摄入富含维生素C的水果蔬菜，增强免疫力。出现发热等症状及时就医。', '疾病预防', '校医院', 267, 1, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `health_knowledge` VALUES (9, '大学生常见疾病防护指南', '大学生常见疾病包括近视、颈椎病、胃病等。预防近视要注意用眼卫生，每隔40分钟休息眼睛；预防颈椎病要避免长时间低头看手机；预防胃病要三餐规律、不暴饮暴食。定期体检，早发现早治疗。', '疾病预防', '校医院', 334, 1, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `health_knowledge` VALUES (10, 'BMI与体重管理入门', 'BMI（身体质量指数）是衡量体重是否正常的常用指标。计算公式：BMI = 体重(kg) ÷ 身高(m)²。中国标准：<18.5偏瘦、18.5-23.9正常、24-27.9偏胖、≥28肥胖。维持健康体重需要合理饮食和规律运动相结合。', '运动', '健康编辑部', 421, 1, '2026-04-10 05:04:36', '2026-04-10 05:04:36');

-- ----------------------------
-- Table structure for health_record
-- ----------------------------
DROP TABLE IF EXISTS `health_record`;
CREATE TABLE `health_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `record_date` date NOT NULL COMMENT '记录日期',
  `height` decimal(5, 1) NULL DEFAULT NULL COMMENT '身高(cm)',
  `weight` decimal(5, 1) NULL DEFAULT NULL COMMENT '体重(kg)',
  `bmi` decimal(4, 1) NULL DEFAULT NULL COMMENT 'BMI',
  `systolic_pressure` int NULL DEFAULT NULL COMMENT '收缩压(mmHg)',
  `diastolic_pressure` int NULL DEFAULT NULL COMMENT '舒张压(mmHg)',
  `heart_rate` int NULL DEFAULT NULL COMMENT '心率(次/分)',
  `blood_sugar` decimal(4, 1) NULL DEFAULT NULL COMMENT '血糖(mmol/L)',
  `body_temperature` decimal(3, 1) NULL DEFAULT NULL COMMENT '体温(℃)',
  `sleep_hours` decimal(3, 1) NULL DEFAULT NULL COMMENT '睡眠时长(h)',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_date`(`user_id` ASC, `record_date` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '健康数据记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of health_record
-- ----------------------------
INSERT INTO `health_record` VALUES (1, 2, '2026-03-27', 175.0, 70.5, 23.0, 118, 76, 72, 5.2, 36.5, 7.5, NULL, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `health_record` VALUES (2, 2, '2026-03-28', 175.0, 70.3, 22.9, 120, 78, 74, 5.1, 36.6, 7.0, NULL, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `health_record` VALUES (3, 2, '2026-03-29', 175.0, 70.8, 23.1, 122, 80, 76, 5.3, 36.4, 6.5, NULL, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `health_record` VALUES (4, 2, '2026-03-30', 175.0, 70.2, 22.9, 116, 74, 70, 5.0, 36.5, 8.0, NULL, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `health_record` VALUES (5, 2, '2026-03-31', 175.0, 70.0, 22.9, 119, 77, 73, 5.2, 36.6, 7.5, NULL, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `health_record` VALUES (6, 2, '2026-04-01', 175.0, 69.8, 22.8, 117, 75, 71, 5.1, 36.5, 7.0, NULL, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `health_record` VALUES (7, 2, '2026-04-02', 175.0, 70.1, 22.9, 121, 79, 75, 5.4, 36.7, 6.0, NULL, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `health_record` VALUES (8, 2, '2026-04-03', 175.0, 69.5, 22.7, 115, 73, 68, 4.9, 36.5, 8.5, NULL, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `health_record` VALUES (9, 2, '2026-04-04', 175.0, 69.8, 22.8, 118, 76, 72, 5.2, 36.6, 7.5, NULL, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `health_record` VALUES (10, 2, '2026-04-05', 175.0, 70.0, 22.9, 120, 78, 74, 5.3, 36.5, 7.0, NULL, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `health_record` VALUES (11, 2, '2026-04-06', 175.0, 69.6, 22.7, 116, 74, 70, 5.0, 36.4, 8.0, NULL, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `health_record` VALUES (12, 2, '2026-04-07', 175.0, 69.9, 22.8, 119, 77, 73, 5.2, 36.5, 7.5, NULL, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `health_record` VALUES (13, 2, '2026-04-08', 175.0, 69.7, 22.8, 117, 75, 71, 5.1, 36.6, 7.0, NULL, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `health_record` VALUES (14, 2, '2026-04-09', 175.0, 69.5, 22.7, 114, 72, 69, 4.8, 36.5, 8.0, NULL, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `health_record` VALUES (15, 2, '2026-04-10', 175.0, 69.3, 22.6, 116, 74, 70, 5.0, 36.5, 7.5, NULL, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `health_record` VALUES (16, 3, '2026-04-01', 162.0, 55.0, 20.9, 110, 70, 68, 4.8, 36.3, 8.0, NULL, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `health_record` VALUES (17, 3, '2026-04-03', 162.0, 55.2, 21.0, 112, 72, 70, 4.9, 36.4, 7.5, NULL, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `health_record` VALUES (18, 3, '2026-04-05', 162.0, 54.8, 20.9, 108, 68, 66, 4.7, 36.3, 8.5, NULL, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `health_record` VALUES (19, 3, '2026-04-07', 162.0, 55.5, 21.2, 115, 74, 72, 5.1, 36.5, 7.0, NULL, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `health_record` VALUES (20, 3, '2026-04-09', 162.0, 55.0, 20.9, 110, 70, 68, 4.8, 36.4, 8.0, NULL, '2026-04-10 05:04:36', '2026-04-10 05:04:36');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `publisher_id` bigint NOT NULL COMMENT '发布人ID',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态:0=草稿,1=已发布',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '系统上线公告', '欢迎使用AI个人健康管理系统！本系统支持健康数据记录、AI智能评估、数据可视化等功能，帮助您更好地管理个人健康。', 1, 1, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `notice` VALUES (2, '健康知识更新提醒', '我们新增了多篇关于运动、饮食、睡眠等方面的健康知识文章，欢迎在\"健康知识\"页面浏览学习。', 1, 1, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `notice` VALUES (3, '系统维护通知', '系统将于2026年4月15日凌晨2:00-4:00进行维护升级，届时系统将暂时无法访问，请提前做好安排。', 1, 1, '2026-04-10 05:04:36', '2026-04-10 05:04:36');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '配置键',
  `config_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '配置值',
  `config_desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_key`(`config_key` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, 'ai_api_key', '540e17d0-e8db-4dee-bd7d-46617934e95c', 'AI API密钥', '2026-04-10 05:46:22');
INSERT INTO `sys_config` VALUES (2, 'ai_base_url', 'https://api.doubao-ai.com/v1', 'AI API基础地址', '2026-04-10 05:48:44');
INSERT INTO `sys_config` VALUES (3, 'ai_model', 'doubao-seed-1-8-251228', 'AI模型名称', '2026-04-10 05:46:22');
INSERT INTO `sys_config` VALUES (4, 'ai_enabled', 'true', 'AI功能开关', '2026-04-10 05:28:18');
INSERT INTO `sys_config` VALUES (5, 'ai_max_tokens', '2048', 'AI最大Token数', '2026-04-10 05:28:18');
INSERT INTO `sys_config` VALUES (6, 'ai_temperature', '0.7', 'AI温度参数(0-1)', '2026-04-10 05:28:18');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码(MD5)',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像URL',
  `gender` tinyint NULL DEFAULT 0 COMMENT '性别:0=未知,1=男,2=女',
  `age` int NULL DEFAULT NULL COMMENT '年龄',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'user' COMMENT '角色:admin/user',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态:0=禁用,1=正常',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '系统管理员', NULL, 1, 30, '13800000001', 'admin@health.com', 'admin', 1, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `sys_user` VALUES (2, 'zhangsan', 'e10adc3949ba59abbe56e057f20f883e', '张三', NULL, 1, 21, '13800000002', 'zhangsan@health.com', 'user', 1, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `sys_user` VALUES (3, 'lisi', 'e10adc3949ba59abbe56e057f20f883e', '李四', NULL, 2, 22, '13800000003', 'lisi@health.com', 'user', 1, '2026-04-10 05:04:36', '2026-04-10 05:04:36');
INSERT INTO `sys_user` VALUES (4, 'wangwu', 'e10adc3949ba59abbe56e057f20f883e', '王五', NULL, 1, 20, '13800000004', 'wangwu@health.com', 'user', 1, '2026-04-10 05:04:36', '2026-04-10 05:04:36');

-- ----------------------------
-- Table structure for training_action
-- ----------------------------
DROP TABLE IF EXISTS `training_action`;
CREATE TABLE `training_action`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `category` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `muscle_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `difficulty` int NOT NULL DEFAULT 1,
  `equip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `kcal_per_min` decimal(8, 2) NULL DEFAULT NULL,
  `cover_image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `video_bilibili_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `video_file_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `status` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'ACTIVE',
  `created_by` bigint NULL DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_action_category`(`category` ASC) USING BTREE,
  INDEX `idx_action_difficulty`(`difficulty` ASC) USING BTREE,
  INDEX `idx_action_status`(`status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of training_action
-- ----------------------------
INSERT INTO `training_action` VALUES (1, '深蹲', 'STRENGTH', '下肢', 2, NULL, 7.50, NULL, NULL, NULL, NULL, 'ACTIVE', 1, '2026-03-23 19:57:01', '2026-03-23 19:57:01');
INSERT INTO `training_action` VALUES (2, '俯卧撑', 'STRENGTH', '胸/三头', 2, NULL, 8.00, NULL, NULL, NULL, NULL, 'ACTIVE', 1, '2026-03-23 19:57:01', '2026-03-23 19:57:01');
INSERT INTO `training_action` VALUES (3, '慢跑', 'CARDIO', '全身', 2, NULL, 9.00, NULL, NULL, NULL, NULL, 'ACTIVE', 1, '2026-03-23 19:57:01', '2026-03-23 19:57:01');
INSERT INTO `training_action` VALUES (4, '拉伸放松（全身）', 'FLEXIBILITY', '全身', 1, NULL, 3.00, NULL, NULL, NULL, NULL, 'ACTIVE', 1, '2026-03-23 19:57:01', '2026-03-23 19:57:01');

-- ----------------------------
-- Table structure for training_plan
-- ----------------------------
DROP TABLE IF EXISTS `training_plan`;
CREATE TABLE `training_plan`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `plan_date` date NOT NULL,
  `goal_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `intensity_level` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DRAFT',
  `total_duration_min` int NULL DEFAULT NULL,
  `total_kcal_est` decimal(10, 2) NULL DEFAULT NULL,
  `adjust_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_plan_user_date`(`user_id` ASC, `plan_date` ASC) USING BTREE,
  INDEX `idx_plan_user_date`(`user_id` ASC, `plan_date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of training_plan
-- ----------------------------
INSERT INTO `training_plan` VALUES (1, 3, '2026-03-23', 'FAT_LOSS', 'LOW', 'DRAFT', 40, 285.00, 'HRV 偏低，已自动降低训练强度', '2026-03-23 19:57:01');
INSERT INTO `training_plan` VALUES (2, 3, '2026-03-22', 'FAT_LOSS', 'LOW', 'DRAFT', 40, 285.00, '睡眠不足，已自动降低训练强度', '2026-03-23 19:57:01');
INSERT INTO `training_plan` VALUES (3, 3, '2026-03-21', 'FAT_LOSS', 'LOW', 'DRAFT', 40, 285.00, '睡眠不足，已自动降低训练强度', '2026-03-23 19:57:01');
INSERT INTO `training_plan` VALUES (4, 3, '2026-03-20', 'FAT_LOSS', 'LOW', 'DRAFT', 40, 285.00, 'HRV 偏低，已自动降低训练强度', '2026-03-23 19:57:01');
INSERT INTO `training_plan` VALUES (5, 3, '2026-03-19', 'FAT_LOSS', 'LOW', 'DRAFT', 40, 285.00, 'HRV 偏低，已自动降低训练强度', '2026-03-23 19:57:01');
INSERT INTO `training_plan` VALUES (6, 3, '2026-03-18', 'FAT_LOSS', 'LOW', 'DRAFT', 40, 285.00, '主观疲劳偏高，已自动降低训练强度', '2026-03-23 19:57:01');
INSERT INTO `training_plan` VALUES (7, 3, '2026-03-17', 'FAT_LOSS', 'MID', 'DRAFT', 60, 455.00, NULL, '2026-03-23 19:57:01');
INSERT INTO `training_plan` VALUES (8, 4, '2026-03-23', 'MAINTAIN', 'MID', 'DRAFT', 60, 455.00, '睡眠不足，已自动降低训练强度', '2026-03-23 19:57:01');
INSERT INTO `training_plan` VALUES (9, 4, '2026-03-22', 'MAINTAIN', 'MID', 'DRAFT', 60, 455.00, 'HRV 偏低，已自动降低训练强度', '2026-03-23 19:57:01');
INSERT INTO `training_plan` VALUES (10, 4, '2026-03-21', 'MAINTAIN', 'HIGH', 'DRAFT', 70, 545.00, NULL, '2026-03-23 19:57:01');
INSERT INTO `training_plan` VALUES (11, 4, '2026-03-20', 'MAINTAIN', 'MID', 'DRAFT', 60, 455.00, '睡眠不足，已自动降低训练强度', '2026-03-23 19:57:01');
INSERT INTO `training_plan` VALUES (12, 4, '2026-03-19', 'MAINTAIN', 'MID', 'DRAFT', 60, 455.00, 'HRV 偏低，已自动降低训练强度', '2026-03-23 19:57:01');
INSERT INTO `training_plan` VALUES (13, 4, '2026-03-18', 'MAINTAIN', 'MID', 'DRAFT', 60, 455.00, '睡眠不足，已自动降低训练强度', '2026-03-23 19:57:01');
INSERT INTO `training_plan` VALUES (14, 4, '2026-03-17', 'MAINTAIN', 'MID', 'DRAFT', 60, 455.00, '主观疲劳偏高，已自动降低训练强度', '2026-03-23 19:57:01');
INSERT INTO `training_plan` VALUES (15, 5, '2026-03-23', 'MUSCLE_GAIN', 'LOW', 'DRAFT', 40, 285.00, '睡眠不足，已自动降低训练强度', '2026-03-23 19:57:01');
INSERT INTO `training_plan` VALUES (16, 5, '2026-03-22', 'MUSCLE_GAIN', 'LOW', 'DRAFT', 40, 285.00, 'HRV 偏低，已自动降低训练强度', '2026-03-23 19:57:01');
INSERT INTO `training_plan` VALUES (17, 5, '2026-03-21', 'MUSCLE_GAIN', 'LOW', 'DRAFT', 40, 285.00, NULL, '2026-03-23 19:57:01');
INSERT INTO `training_plan` VALUES (18, 5, '2026-03-20', 'MUSCLE_GAIN', 'LOW', 'DRAFT', 40, 285.00, '睡眠不足，已自动降低训练强度', '2026-03-23 19:57:01');
INSERT INTO `training_plan` VALUES (19, 5, '2026-03-19', 'MUSCLE_GAIN', 'LOW', 'DRAFT', 40, 285.00, '主观疲劳偏高，已自动降低训练强度', '2026-03-23 19:57:01');
INSERT INTO `training_plan` VALUES (20, 5, '2026-03-18', 'MUSCLE_GAIN', 'LOW', 'DRAFT', 40, 285.00, 'HRV 偏低，已自动降低训练强度', '2026-03-23 19:57:01');
INSERT INTO `training_plan` VALUES (21, 5, '2026-03-17', 'MUSCLE_GAIN', 'LOW', 'DRAFT', 40, 285.00, NULL, '2026-03-23 19:57:01');
INSERT INTO `training_plan` VALUES (22, 6, '2026-03-23', 'FAT_LOSS', 'LOW', 'DRAFT', 40, 285.00, '睡眠不足，已自动降低训练强度', '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (23, 6, '2026-03-22', 'FAT_LOSS', 'LOW', 'DRAFT', 40, 285.00, '睡眠不足，已自动降低训练强度', '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (24, 6, '2026-03-21', 'FAT_LOSS', 'LOW', 'DRAFT', 40, 285.00, '主观疲劳偏高，已自动降低训练强度', '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (25, 6, '2026-03-20', 'FAT_LOSS', 'LOW', 'DRAFT', 40, 285.00, '睡眠不足，已自动降低训练强度', '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (26, 6, '2026-03-19', 'FAT_LOSS', 'LOW', 'DRAFT', 40, 285.00, 'HRV 偏低，已自动降低训练强度', '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (27, 6, '2026-03-18', 'FAT_LOSS', 'MID', 'DRAFT', 60, 455.00, NULL, '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (28, 6, '2026-03-17', 'FAT_LOSS', 'MID', 'DRAFT', 60, 455.00, NULL, '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (29, 7, '2026-03-23', 'MAINTAIN', 'MID', 'DRAFT', 60, 455.00, '睡眠不足，已自动降低训练强度', '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (30, 7, '2026-03-22', 'MAINTAIN', 'MID', 'DRAFT', 60, 455.00, '主观疲劳偏高，已自动降低训练强度', '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (31, 7, '2026-03-21', 'MAINTAIN', 'HIGH', 'DRAFT', 70, 545.00, NULL, '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (32, 7, '2026-03-20', 'MAINTAIN', 'MID', 'DRAFT', 60, 455.00, 'HRV 偏低，已自动降低训练强度', '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (33, 7, '2026-03-19', 'MAINTAIN', 'MID', 'DRAFT', 60, 455.00, '主观疲劳偏高，已自动降低训练强度', '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (34, 7, '2026-03-18', 'MAINTAIN', 'MID', 'DRAFT', 60, 455.00, 'HRV 偏低，已自动降低训练强度', '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (35, 7, '2026-03-17', 'MAINTAIN', 'HIGH', 'DRAFT', 70, 545.00, NULL, '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (36, 8, '2026-03-23', 'MUSCLE_GAIN', 'HIGH', 'DRAFT', 70, 545.00, NULL, '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (37, 8, '2026-03-22', 'MUSCLE_GAIN', 'HIGH', 'DRAFT', 70, 545.00, NULL, '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (38, 8, '2026-03-21', 'MUSCLE_GAIN', 'HIGH', 'DRAFT', 70, 545.00, NULL, '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (39, 8, '2026-03-20', 'MUSCLE_GAIN', 'MID', 'DRAFT', 60, 455.00, '主观疲劳偏高，已自动降低训练强度', '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (40, 8, '2026-03-19', 'MUSCLE_GAIN', 'HIGH', 'DRAFT', 70, 545.00, NULL, '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (41, 8, '2026-03-18', 'MUSCLE_GAIN', 'HIGH', 'DRAFT', 70, 545.00, NULL, '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (42, 8, '2026-03-17', 'MUSCLE_GAIN', 'MID', 'DRAFT', 60, 455.00, 'HRV 偏低，已自动降低训练强度', '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (43, 9, '2026-03-23', 'FAT_LOSS', 'HIGH', 'DRAFT', 70, 545.00, NULL, '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (44, 9, '2026-03-22', 'FAT_LOSS', 'MID', 'DRAFT', 60, 455.00, 'HRV 偏低，已自动降低训练强度', '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (45, 9, '2026-03-21', 'FAT_LOSS', 'MID', 'DRAFT', 60, 455.00, '睡眠不足，已自动降低训练强度', '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (46, 9, '2026-03-20', 'FAT_LOSS', 'HIGH', 'DRAFT', 70, 545.00, NULL, '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (47, 9, '2026-03-19', 'FAT_LOSS', 'HIGH', 'DRAFT', 70, 545.00, NULL, '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (48, 9, '2026-03-18', 'FAT_LOSS', 'HIGH', 'DRAFT', 70, 545.00, NULL, '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (49, 9, '2026-03-17', 'FAT_LOSS', 'HIGH', 'DRAFT', 70, 545.00, NULL, '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (50, 10, '2026-03-23', 'MAINTAIN', 'LOW', 'DRAFT', 40, 285.00, '主观疲劳偏高，已自动降低训练强度', '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (51, 10, '2026-03-22', 'MAINTAIN', 'MID', 'DRAFT', 60, 455.00, NULL, '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (52, 10, '2026-03-21', 'MAINTAIN', 'LOW', 'DRAFT', 40, 285.00, '主观疲劳偏高，已自动降低训练强度', '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (53, 10, '2026-03-20', 'MAINTAIN', 'LOW', 'DRAFT', 40, 285.00, '主观疲劳偏高，已自动降低训练强度', '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (54, 10, '2026-03-19', 'MAINTAIN', 'LOW', 'DRAFT', 40, 285.00, '睡眠不足，已自动降低训练强度', '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (55, 10, '2026-03-18', 'MAINTAIN', 'MID', 'DRAFT', 60, 455.00, NULL, '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (56, 10, '2026-03-17', 'MAINTAIN', 'LOW', 'DRAFT', 40, 285.00, 'HRV 偏低，已自动降低训练强度', '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (57, 11, '2026-03-23', 'MUSCLE_GAIN', 'LOW', 'DRAFT', 40, 285.00, '睡眠不足，已自动降低训练强度', '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (58, 11, '2026-03-22', 'MUSCLE_GAIN', 'MID', 'DRAFT', 60, 455.00, NULL, '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (59, 11, '2026-03-21', 'MUSCLE_GAIN', 'LOW', 'DRAFT', 40, 285.00, '主观疲劳偏高，已自动降低训练强度', '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (60, 11, '2026-03-20', 'MUSCLE_GAIN', 'LOW', 'DRAFT', 40, 285.00, '主观疲劳偏高，已自动降低训练强度', '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (61, 11, '2026-03-19', 'MUSCLE_GAIN', 'MID', 'DRAFT', 60, 455.00, NULL, '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (62, 11, '2026-03-18', 'MUSCLE_GAIN', 'LOW', 'DRAFT', 40, 285.00, '睡眠不足，已自动降低训练强度', '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (63, 11, '2026-03-17', 'MUSCLE_GAIN', 'LOW', 'DRAFT', 40, 285.00, 'HRV 偏低，已自动降低训练强度', '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (64, 12, '2026-03-23', 'FAT_LOSS', 'MID', 'DRAFT', 60, 455.00, '睡眠不足，已自动降低训练强度', '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (65, 12, '2026-03-22', 'FAT_LOSS', 'HIGH', 'DRAFT', 70, 545.00, NULL, '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (66, 12, '2026-03-21', 'FAT_LOSS', 'MID', 'DRAFT', 60, 455.00, '睡眠不足，已自动降低训练强度', '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (67, 12, '2026-03-20', 'FAT_LOSS', 'MID', 'DRAFT', 60, 455.00, '睡眠不足，已自动降低训练强度', '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (68, 12, '2026-03-19', 'FAT_LOSS', 'MID', 'DRAFT', 60, 455.00, '睡眠不足，已自动降低训练强度', '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (69, 12, '2026-03-18', 'FAT_LOSS', 'HIGH', 'DRAFT', 70, 545.00, NULL, '2026-03-23 19:57:02');
INSERT INTO `training_plan` VALUES (70, 12, '2026-03-17', 'FAT_LOSS', 'MID', 'DRAFT', 60, 455.00, 'HRV 偏低，已自动降低训练强度', '2026-03-23 19:57:02');

-- ----------------------------
-- Table structure for training_plan_item
-- ----------------------------
DROP TABLE IF EXISTS `training_plan_item`;
CREATE TABLE `training_plan_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `plan_id` bigint NOT NULL,
  `action_id` bigint NOT NULL,
  `sort_no` int NOT NULL,
  `sets` int NULL DEFAULT NULL,
  `reps` int NULL DEFAULT NULL,
  `duration_min` int NULL DEFAULT NULL,
  `rest_sec` int NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_plan_item_plan_id`(`plan_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 253 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of training_plan_item
-- ----------------------------
INSERT INTO `training_plan_item` VALUES (1, 1, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (2, 1, 3, 2, NULL, NULL, 20, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (3, 1, 1, 3, 2, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (4, 2, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (5, 2, 3, 2, NULL, NULL, 20, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (6, 2, 1, 3, 2, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (7, 3, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (8, 3, 3, 2, NULL, NULL, 20, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (9, 3, 1, 3, 2, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (10, 4, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (11, 4, 3, 2, NULL, NULL, 20, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (12, 4, 1, 3, 2, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (13, 5, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (14, 5, 3, 2, NULL, NULL, 20, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (15, 5, 1, 3, 2, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (16, 6, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (17, 6, 3, 2, NULL, NULL, 20, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (18, 6, 1, 3, 2, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (19, 7, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (20, 7, 2, 2, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (21, 7, 3, 3, NULL, NULL, 30, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (22, 7, 1, 4, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (23, 8, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (24, 8, 2, 2, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (25, 8, 3, 3, NULL, NULL, 30, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (26, 8, 1, 4, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (27, 9, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (28, 9, 2, 2, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (29, 9, 3, 3, NULL, NULL, 30, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (30, 9, 1, 4, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (31, 10, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (32, 10, 2, 2, 3, 12, NULL, 45, NULL);
INSERT INTO `training_plan_item` VALUES (33, 10, 3, 3, NULL, NULL, 40, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (34, 10, 1, 4, 3, 12, NULL, 45, NULL);
INSERT INTO `training_plan_item` VALUES (35, 11, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (36, 11, 2, 2, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (37, 11, 3, 3, NULL, NULL, 30, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (38, 11, 1, 4, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (39, 12, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (40, 12, 2, 2, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (41, 12, 3, 3, NULL, NULL, 30, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (42, 12, 1, 4, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (43, 13, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (44, 13, 2, 2, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (45, 13, 3, 3, NULL, NULL, 30, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (46, 13, 1, 4, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (47, 14, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (48, 14, 2, 2, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (49, 14, 3, 3, NULL, NULL, 30, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (50, 14, 1, 4, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (51, 15, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (52, 15, 3, 2, NULL, NULL, 20, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (53, 15, 1, 3, 2, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (54, 16, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (55, 16, 3, 2, NULL, NULL, 20, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (56, 16, 1, 3, 2, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (57, 17, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (58, 17, 3, 2, NULL, NULL, 20, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (59, 17, 1, 3, 2, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (60, 18, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (61, 18, 3, 2, NULL, NULL, 20, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (62, 18, 1, 3, 2, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (63, 19, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (64, 19, 3, 2, NULL, NULL, 20, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (65, 19, 1, 3, 2, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (66, 20, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (67, 20, 3, 2, NULL, NULL, 20, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (68, 20, 1, 3, 2, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (69, 21, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (70, 21, 3, 2, NULL, NULL, 20, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (71, 21, 1, 3, 2, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (72, 22, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (73, 22, 3, 2, NULL, NULL, 20, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (74, 22, 1, 3, 2, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (75, 23, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (76, 23, 3, 2, NULL, NULL, 20, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (77, 23, 1, 3, 2, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (78, 24, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (79, 24, 3, 2, NULL, NULL, 20, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (80, 24, 1, 3, 2, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (81, 25, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (82, 25, 3, 2, NULL, NULL, 20, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (83, 25, 1, 3, 2, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (84, 26, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (85, 26, 3, 2, NULL, NULL, 20, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (86, 26, 1, 3, 2, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (87, 27, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (88, 27, 2, 2, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (89, 27, 3, 3, NULL, NULL, 30, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (90, 27, 1, 4, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (91, 28, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (92, 28, 2, 2, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (93, 28, 3, 3, NULL, NULL, 30, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (94, 28, 1, 4, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (95, 29, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (96, 29, 2, 2, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (97, 29, 3, 3, NULL, NULL, 30, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (98, 29, 1, 4, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (99, 30, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (100, 30, 2, 2, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (101, 30, 3, 3, NULL, NULL, 30, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (102, 30, 1, 4, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (103, 31, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (104, 31, 2, 2, 3, 12, NULL, 45, NULL);
INSERT INTO `training_plan_item` VALUES (105, 31, 3, 3, NULL, NULL, 40, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (106, 31, 1, 4, 3, 12, NULL, 45, NULL);
INSERT INTO `training_plan_item` VALUES (107, 32, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (108, 32, 2, 2, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (109, 32, 3, 3, NULL, NULL, 30, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (110, 32, 1, 4, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (111, 33, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (112, 33, 2, 2, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (113, 33, 3, 3, NULL, NULL, 30, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (114, 33, 1, 4, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (115, 34, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (116, 34, 2, 2, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (117, 34, 3, 3, NULL, NULL, 30, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (118, 34, 1, 4, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (119, 35, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (120, 35, 2, 2, 3, 12, NULL, 45, NULL);
INSERT INTO `training_plan_item` VALUES (121, 35, 3, 3, NULL, NULL, 40, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (122, 35, 1, 4, 3, 12, NULL, 45, NULL);
INSERT INTO `training_plan_item` VALUES (123, 36, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (124, 36, 2, 2, 3, 12, NULL, 45, NULL);
INSERT INTO `training_plan_item` VALUES (125, 36, 3, 3, NULL, NULL, 40, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (126, 36, 1, 4, 3, 12, NULL, 45, NULL);
INSERT INTO `training_plan_item` VALUES (127, 37, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (128, 37, 2, 2, 3, 12, NULL, 45, NULL);
INSERT INTO `training_plan_item` VALUES (129, 37, 3, 3, NULL, NULL, 40, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (130, 37, 1, 4, 3, 12, NULL, 45, NULL);
INSERT INTO `training_plan_item` VALUES (131, 38, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (132, 38, 2, 2, 3, 12, NULL, 45, NULL);
INSERT INTO `training_plan_item` VALUES (133, 38, 3, 3, NULL, NULL, 40, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (134, 38, 1, 4, 3, 12, NULL, 45, NULL);
INSERT INTO `training_plan_item` VALUES (135, 39, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (136, 39, 2, 2, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (137, 39, 3, 3, NULL, NULL, 30, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (138, 39, 1, 4, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (139, 40, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (140, 40, 2, 2, 3, 12, NULL, 45, NULL);
INSERT INTO `training_plan_item` VALUES (141, 40, 3, 3, NULL, NULL, 40, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (142, 40, 1, 4, 3, 12, NULL, 45, NULL);
INSERT INTO `training_plan_item` VALUES (143, 41, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (144, 41, 2, 2, 3, 12, NULL, 45, NULL);
INSERT INTO `training_plan_item` VALUES (145, 41, 3, 3, NULL, NULL, 40, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (146, 41, 1, 4, 3, 12, NULL, 45, NULL);
INSERT INTO `training_plan_item` VALUES (147, 42, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (148, 42, 2, 2, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (149, 42, 3, 3, NULL, NULL, 30, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (150, 42, 1, 4, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (151, 43, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (152, 43, 2, 2, 3, 12, NULL, 45, NULL);
INSERT INTO `training_plan_item` VALUES (153, 43, 3, 3, NULL, NULL, 40, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (154, 43, 1, 4, 3, 12, NULL, 45, NULL);
INSERT INTO `training_plan_item` VALUES (155, 44, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (156, 44, 2, 2, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (157, 44, 3, 3, NULL, NULL, 30, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (158, 44, 1, 4, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (159, 45, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (160, 45, 2, 2, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (161, 45, 3, 3, NULL, NULL, 30, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (162, 45, 1, 4, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (163, 46, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (164, 46, 2, 2, 3, 12, NULL, 45, NULL);
INSERT INTO `training_plan_item` VALUES (165, 46, 3, 3, NULL, NULL, 40, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (166, 46, 1, 4, 3, 12, NULL, 45, NULL);
INSERT INTO `training_plan_item` VALUES (167, 47, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (168, 47, 2, 2, 3, 12, NULL, 45, NULL);
INSERT INTO `training_plan_item` VALUES (169, 47, 3, 3, NULL, NULL, 40, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (170, 47, 1, 4, 3, 12, NULL, 45, NULL);
INSERT INTO `training_plan_item` VALUES (171, 48, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (172, 48, 2, 2, 3, 12, NULL, 45, NULL);
INSERT INTO `training_plan_item` VALUES (173, 48, 3, 3, NULL, NULL, 40, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (174, 48, 1, 4, 3, 12, NULL, 45, NULL);
INSERT INTO `training_plan_item` VALUES (175, 49, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (176, 49, 2, 2, 3, 12, NULL, 45, NULL);
INSERT INTO `training_plan_item` VALUES (177, 49, 3, 3, NULL, NULL, 40, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (178, 49, 1, 4, 3, 12, NULL, 45, NULL);
INSERT INTO `training_plan_item` VALUES (179, 50, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (180, 50, 3, 2, NULL, NULL, 20, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (181, 50, 1, 3, 2, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (182, 51, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (183, 51, 2, 2, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (184, 51, 3, 3, NULL, NULL, 30, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (185, 51, 1, 4, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (186, 52, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (187, 52, 3, 2, NULL, NULL, 20, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (188, 52, 1, 3, 2, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (189, 53, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (190, 53, 3, 2, NULL, NULL, 20, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (191, 53, 1, 3, 2, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (192, 54, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (193, 54, 3, 2, NULL, NULL, 20, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (194, 54, 1, 3, 2, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (195, 55, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (196, 55, 2, 2, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (197, 55, 3, 3, NULL, NULL, 30, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (198, 55, 1, 4, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (199, 56, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (200, 56, 3, 2, NULL, NULL, 20, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (201, 56, 1, 3, 2, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (202, 57, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (203, 57, 3, 2, NULL, NULL, 20, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (204, 57, 1, 3, 2, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (205, 58, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (206, 58, 2, 2, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (207, 58, 3, 3, NULL, NULL, 30, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (208, 58, 1, 4, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (209, 59, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (210, 59, 3, 2, NULL, NULL, 20, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (211, 59, 1, 3, 2, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (212, 60, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (213, 60, 3, 2, NULL, NULL, 20, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (214, 60, 1, 3, 2, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (215, 61, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (216, 61, 2, 2, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (217, 61, 3, 3, NULL, NULL, 30, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (218, 61, 1, 4, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (219, 62, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (220, 62, 3, 2, NULL, NULL, 20, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (221, 62, 1, 3, 2, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (222, 63, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (223, 63, 3, 2, NULL, NULL, 20, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (224, 63, 1, 3, 2, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (225, 64, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (226, 64, 2, 2, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (227, 64, 3, 3, NULL, NULL, 30, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (228, 64, 1, 4, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (229, 65, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (230, 65, 2, 2, 3, 12, NULL, 45, NULL);
INSERT INTO `training_plan_item` VALUES (231, 65, 3, 3, NULL, NULL, 40, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (232, 65, 1, 4, 3, 12, NULL, 45, NULL);
INSERT INTO `training_plan_item` VALUES (233, 66, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (234, 66, 2, 2, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (235, 66, 3, 3, NULL, NULL, 30, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (236, 66, 1, 4, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (237, 67, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (238, 67, 2, 2, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (239, 67, 3, 3, NULL, NULL, 30, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (240, 67, 1, 4, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (241, 68, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (242, 68, 2, 2, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (243, 68, 3, 3, NULL, NULL, 30, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (244, 68, 1, 4, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (245, 69, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (246, 69, 2, 2, 3, 12, NULL, 45, NULL);
INSERT INTO `training_plan_item` VALUES (247, 69, 3, 3, NULL, NULL, 40, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (248, 69, 1, 4, 3, 12, NULL, 45, NULL);
INSERT INTO `training_plan_item` VALUES (249, 70, 4, 1, NULL, NULL, 10, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (250, 70, 2, 2, 3, 10, NULL, 60, NULL);
INSERT INTO `training_plan_item` VALUES (251, 70, 3, 3, NULL, NULL, 30, NULL, NULL);
INSERT INTO `training_plan_item` VALUES (252, 70, 1, 4, 3, 10, NULL, 60, NULL);

-- ----------------------------
-- Table structure for user_profile
-- ----------------------------
DROP TABLE IF EXISTS `user_profile`;
CREATE TABLE `user_profile`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `birthday` date NULL DEFAULT NULL,
  `height_cm` decimal(5, 2) NULL DEFAULT NULL,
  `fitness_years` int NULL DEFAULT 0,
  `goal_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'MAINTAIN',
  `activity_level` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'MID',
  `daily_kcal_target` int NULL DEFAULT NULL,
  `macro_protein_g` int NULL DEFAULT NULL,
  `macro_fat_g` int NULL DEFAULT NULL,
  `macro_carb_g` int NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_profile_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_user_profile_goal`(`goal_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_profile
-- ----------------------------
INSERT INTO `user_profile` VALUES (1, 3, NULL, 168.00, 1, 'FAT_LOSS', 'LOW', 2078, 144, 40, 152, NULL, '2026-03-23 19:57:01');
INSERT INTO `user_profile` VALUES (2, 4, NULL, 176.00, 3, 'MAINTAIN', 'MID', 1710, 126, 59, 233, NULL, '2026-03-23 19:57:01');
INSERT INTO `user_profile` VALUES (3, 5, NULL, 170.00, 0, 'MUSCLE_GAIN', 'LOW', 1836, 135, 45, 166, NULL, '2026-03-23 19:57:01');
INSERT INTO `user_profile` VALUES (4, 6, NULL, 166.00, 1, 'FAT_LOSS', 'MID', 2117, 157, 55, 172, NULL, '2026-03-23 19:57:02');
INSERT INTO `user_profile` VALUES (5, 7, NULL, 161.00, 4, 'MAINTAIN', 'LOW', 1731, 112, 66, 211, NULL, '2026-03-23 19:57:02');
INSERT INTO `user_profile` VALUES (6, 8, NULL, 177.00, 4, 'MUSCLE_GAIN', 'MID', 1841, 116, 41, 243, NULL, '2026-03-23 19:57:02');
INSERT INTO `user_profile` VALUES (7, 9, NULL, 172.00, 4, 'FAT_LOSS', 'LOW', 2284, 100, 52, 231, NULL, '2026-03-23 19:57:02');
INSERT INTO `user_profile` VALUES (8, 10, NULL, 177.00, 1, 'MAINTAIN', 'MID', 2019, 101, 66, 207, NULL, '2026-03-23 19:57:02');
INSERT INTO `user_profile` VALUES (9, 11, NULL, 162.00, 1, 'MUSCLE_GAIN', 'LOW', 1811, 109, 41, 234, NULL, '2026-03-23 19:57:02');
INSERT INTO `user_profile` VALUES (10, 12, NULL, 166.00, 4, 'FAT_LOSS', 'MID', 1953, 114, 56, 216, NULL, '2026-03-23 19:57:02');
INSERT INTO `user_profile` VALUES (11, 1, NULL, NULL, 0, 'MAINTAIN', 'MID', NULL, NULL, NULL, NULL, NULL, '2026-03-23 20:09:52');

-- ----------------------------
-- Table structure for warning_event
-- ----------------------------
DROP TABLE IF EXISTS `warning_event`;
CREATE TABLE `warning_event`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `warn_time` datetime NOT NULL,
  `warn_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `level` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `metric_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `metric_value` decimal(12, 2) NULL DEFAULT NULL,
  `threshold_value` decimal(12, 2) NULL DEFAULT NULL,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'UNREAD',
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_warning_user_time`(`user_id` ASC, `warn_time` ASC) USING BTREE,
  INDEX `idx_warning_type`(`warn_type` ASC) USING BTREE,
  INDEX `idx_warning_status`(`status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 95 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of warning_event
-- ----------------------------
INSERT INTO `warning_event` VALUES (1, 3, '2026-03-23 19:57:01', 'FATIGUE', 'WARN', 'hrv_ms', 34.04, 35.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:01');
INSERT INTO `warning_event` VALUES (2, 3, '2026-03-23 19:57:01', 'FATIGUE', 'WARN', 'sleep_hours', 5.54, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:01');
INSERT INTO `warning_event` VALUES (3, 3, '2026-03-23 19:57:01', 'FATIGUE', 'WARN', 'sleep_hours', 5.01, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:01');
INSERT INTO `warning_event` VALUES (4, 3, '2026-03-23 19:57:01', 'FATIGUE', 'WARN', 'hrv_ms', 33.89, 35.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:01');
INSERT INTO `warning_event` VALUES (5, 3, '2026-03-23 19:57:01', 'FATIGUE', 'WARN', 'hrv_ms', 32.92, 35.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:01');
INSERT INTO `warning_event` VALUES (6, 3, '2026-03-23 19:57:01', 'FATIGUE', 'WARN', 'subjective_fatigue', 8.00, 8.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:01');
INSERT INTO `warning_event` VALUES (7, 3, '2026-03-23 19:57:01', 'FATIGUE', 'WARN', 'sleep_hours', 5.23, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:01');
INSERT INTO `warning_event` VALUES (8, 3, '2026-03-23 19:57:01', 'FATIGUE', 'WARN', 'sleep_hours', 5.50, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:01');
INSERT INTO `warning_event` VALUES (9, 3, '2026-03-23 19:57:01', 'FATIGUE', 'WARN', 'hrv_ms', 32.97, 35.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:01');
INSERT INTO `warning_event` VALUES (10, 3, '2026-03-23 19:57:01', 'FATIGUE', 'WARN', 'sleep_hours', 5.29, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:01');
INSERT INTO `warning_event` VALUES (11, 3, '2026-03-23 19:57:01', 'CALORIE_DEFICIT', 'INFO', 'daily_kcal', 1242.45, 1778.00, '当日热量摄入偏低，建议合理补充营养，避免过度节食', 'UNREAD', '2026-03-23 19:57:01');
INSERT INTO `warning_event` VALUES (12, 4, '2026-03-23 19:57:01', 'FATIGUE', 'WARN', 'sleep_hours', 5.12, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:01');
INSERT INTO `warning_event` VALUES (13, 4, '2026-03-23 19:57:01', 'FATIGUE', 'WARN', 'hrv_ms', 27.34, 35.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:01');
INSERT INTO `warning_event` VALUES (14, 4, '2026-03-23 19:57:01', 'FATIGUE', 'WARN', 'sleep_hours', 5.84, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:01');
INSERT INTO `warning_event` VALUES (15, 4, '2026-03-23 19:57:01', 'FATIGUE', 'WARN', 'hrv_ms', 29.85, 35.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:01');
INSERT INTO `warning_event` VALUES (16, 4, '2026-03-23 19:57:01', 'FATIGUE', 'WARN', 'sleep_hours', 5.57, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:01');
INSERT INTO `warning_event` VALUES (17, 4, '2026-03-23 19:57:01', 'FATIGUE', 'WARN', 'subjective_fatigue', 9.00, 8.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:01');
INSERT INTO `warning_event` VALUES (18, 4, '2026-03-23 19:57:01', 'FATIGUE', 'WARN', 'subjective_fatigue', 8.00, 8.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:01');
INSERT INTO `warning_event` VALUES (19, 4, '2026-03-23 19:57:01', 'FATIGUE', 'WARN', 'hrv_ms', 31.51, 35.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:01');
INSERT INTO `warning_event` VALUES (20, 4, '2026-03-23 19:57:01', 'FATIGUE', 'WARN', 'sleep_hours', 5.91, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:01');
INSERT INTO `warning_event` VALUES (21, 4, '2026-03-23 19:57:01', 'FATIGUE', 'WARN', 'hrv_ms', 25.13, 35.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:01');
INSERT INTO `warning_event` VALUES (22, 4, '2026-03-23 19:57:01', 'CALORIE_DEFICIT', 'INFO', 'daily_kcal', 970.20, 1410.00, '当日热量摄入偏低，建议合理补充营养，避免过度节食', 'UNREAD', '2026-03-23 19:57:01');
INSERT INTO `warning_event` VALUES (23, 5, '2026-03-23 19:57:01', 'FATIGUE', 'WARN', 'sleep_hours', 5.87, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:01');
INSERT INTO `warning_event` VALUES (24, 5, '2026-03-23 19:57:01', 'FATIGUE', 'WARN', 'hrv_ms', 25.55, 35.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:01');
INSERT INTO `warning_event` VALUES (25, 5, '2026-03-23 19:57:01', 'FATIGUE', 'WARN', 'sleep_hours', 5.75, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:01');
INSERT INTO `warning_event` VALUES (26, 5, '2026-03-23 19:57:01', 'FATIGUE', 'WARN', 'subjective_fatigue', 8.00, 8.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:01');
INSERT INTO `warning_event` VALUES (27, 5, '2026-03-23 19:57:01', 'FATIGUE', 'WARN', 'hrv_ms', 30.46, 35.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:01');
INSERT INTO `warning_event` VALUES (28, 5, '2026-03-23 19:57:01', 'FATIGUE', 'WARN', 'sleep_hours', 5.84, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:01');
INSERT INTO `warning_event` VALUES (29, 5, '2026-03-23 19:57:01', 'FATIGUE', 'WARN', 'hrv_ms', 34.19, 35.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:01');
INSERT INTO `warning_event` VALUES (30, 5, '2026-03-23 19:57:01', 'FATIGUE', 'WARN', 'sleep_hours', 5.00, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:01');
INSERT INTO `warning_event` VALUES (31, 5, '2026-03-23 19:57:01', 'FATIGUE', 'WARN', 'sleep_hours', 5.13, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:01');
INSERT INTO `warning_event` VALUES (32, 5, '2026-03-23 19:57:01', 'FATIGUE', 'WARN', 'sleep_hours', 5.91, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:01');
INSERT INTO `warning_event` VALUES (33, 5, '2026-03-23 19:57:01', 'FATIGUE', 'WARN', 'subjective_fatigue', 8.00, 8.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:01');
INSERT INTO `warning_event` VALUES (34, 5, '2026-03-23 19:57:01', 'CALORIE_DEFICIT', 'INFO', 'daily_kcal', 367.95, 1536.00, '当日热量摄入偏低，建议合理补充营养，避免过度节食', 'UNREAD', '2026-03-23 19:57:01');
INSERT INTO `warning_event` VALUES (35, 6, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'sleep_hours', 5.02, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (36, 6, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'sleep_hours', 5.47, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (37, 6, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'subjective_fatigue', 8.00, 8.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (38, 6, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'sleep_hours', 5.32, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (39, 6, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'hrv_ms', 27.83, 35.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (40, 6, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'sleep_hours', 5.64, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (41, 6, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'subjective_fatigue', 9.00, 8.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (42, 6, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'sleep_hours', 5.87, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (43, 6, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'hrv_ms', 30.64, 35.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (44, 6, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'sleep_hours', 5.57, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (45, 6, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'subjective_fatigue', 8.00, 8.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (46, 7, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'sleep_hours', 5.29, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (47, 7, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'subjective_fatigue', 9.00, 8.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (48, 7, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'hrv_ms', 30.56, 35.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (49, 7, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'subjective_fatigue', 9.00, 8.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (50, 7, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'hrv_ms', 25.93, 35.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (51, 7, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'hrv_ms', 29.92, 35.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (52, 7, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'hrv_ms', 25.22, 35.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (53, 7, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'subjective_fatigue', 9.00, 8.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (54, 7, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'sleep_hours', 5.19, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (55, 7, '2026-03-23 19:57:02', 'CALORIE_SURPLUS', 'WARN', 'daily_kcal', 2286.90, 2031.00, '当日热量摄入偏高，建议适当调整饮食或增加低强度活动', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (56, 8, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'subjective_fatigue', 8.00, 8.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (57, 8, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'hrv_ms', 30.73, 35.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (58, 8, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'subjective_fatigue', 9.00, 8.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (59, 8, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'sleep_hours', 5.53, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (60, 8, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'sleep_hours', 5.51, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (61, 8, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'sleep_hours', 5.88, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (62, 8, '2026-03-23 19:57:02', 'CALORIE_SURPLUS', 'WARN', 'daily_kcal', 2720.85, 2141.00, '当日热量摄入偏高，建议适当调整饮食或增加低强度活动', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (63, 9, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'hrv_ms', 26.36, 35.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (64, 9, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'sleep_hours', 5.81, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (65, 9, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'sleep_hours', 5.77, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (66, 9, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'sleep_hours', 5.32, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (67, 9, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'sleep_hours', 5.19, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (68, 9, '2026-03-23 19:57:02', 'CALORIE_DEFICIT', 'INFO', 'daily_kcal', 1334.85, 1984.00, '当日热量摄入偏低，建议合理补充营养，避免过度节食', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (69, 10, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'subjective_fatigue', 9.00, 8.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (70, 10, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'subjective_fatigue', 8.00, 8.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (71, 10, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'subjective_fatigue', 9.00, 8.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (72, 10, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'sleep_hours', 5.86, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (73, 10, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'hrv_ms', 26.39, 35.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (74, 10, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'subjective_fatigue', 9.00, 8.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (75, 10, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'sleep_hours', 5.31, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (76, 10, '2026-03-23 19:57:02', 'CALORIE_DEFICIT', 'INFO', 'daily_kcal', 356.40, 1719.00, '当日热量摄入偏低，建议合理补充营养，避免过度节食', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (77, 11, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'sleep_hours', 5.51, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (78, 11, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'subjective_fatigue', 8.00, 8.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (79, 11, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'subjective_fatigue', 9.00, 8.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (80, 11, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'sleep_hours', 5.05, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (81, 11, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'hrv_ms', 27.54, 35.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (82, 11, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'sleep_hours', 5.77, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (83, 11, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'sleep_hours', 5.25, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (84, 11, '2026-03-23 19:57:02', 'CALORIE_DEFICIT', 'INFO', 'daily_kcal', 755.70, 1511.00, '当日热量摄入偏低，建议合理补充营养，避免过度节食', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (85, 12, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'sleep_hours', 5.87, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (86, 12, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'sleep_hours', 5.17, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (87, 12, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'sleep_hours', 5.46, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (88, 12, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'sleep_hours', 5.68, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (89, 12, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'hrv_ms', 31.31, 35.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (90, 12, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'sleep_hours', 5.59, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (91, 12, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'hrv_ms', 25.26, 35.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (92, 12, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'sleep_hours', 5.09, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (93, 12, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'sleep_hours', 5.33, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');
INSERT INTO `warning_event` VALUES (94, 12, '2026-03-23 19:57:02', 'FATIGUE', 'WARN', 'sleep_hours', 5.98, 6.00, '检测到疲劳风险，建议降低训练强度并保证睡眠与恢复', 'UNREAD', '2026-03-23 19:57:02');

-- ----------------------------
-- Table structure for workout_log
-- ----------------------------
DROP TABLE IF EXISTS `workout_log`;
CREATE TABLE `workout_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `plan_id` bigint NULL DEFAULT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `duration_min` int NOT NULL,
  `kcal_burn` decimal(10, 2) NULL DEFAULT NULL,
  `perceived_exertion` int NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_workout_user_time`(`user_id` ASC, `start_time` ASC) USING BTREE,
  INDEX `idx_workout_plan_id`(`plan_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of workout_log
-- ----------------------------
INSERT INTO `workout_log` VALUES (1, 3, NULL, '2026-03-21 20:25:00', '2026-03-21 21:07:00', 42, 461.91, 7, NULL, '2026-03-23 19:57:01');
INSERT INTO `workout_log` VALUES (2, 3, NULL, '2026-03-15 18:50:00', '2026-03-15 19:19:00', 29, 223.38, 5, NULL, '2026-03-23 19:57:01');
INSERT INTO `workout_log` VALUES (3, 3, NULL, '2026-03-22 20:06:00', '2026-03-22 20:28:00', 22, 259.76, 5, NULL, '2026-03-23 19:57:01');
INSERT INTO `workout_log` VALUES (4, 3, NULL, '2026-03-20 18:57:00', '2026-03-20 19:46:00', 49, 298.23, 4, NULL, '2026-03-23 19:57:01');
INSERT INTO `workout_log` VALUES (5, 3, NULL, '2026-03-23 19:46:00', '2026-03-23 20:34:00', 48, 313.34, 9, NULL, '2026-03-23 19:57:01');
INSERT INTO `workout_log` VALUES (6, 3, NULL, '2026-03-15 20:55:00', '2026-03-15 21:47:00', 52, 602.36, 6, NULL, '2026-03-23 19:57:01');
INSERT INTO `workout_log` VALUES (7, 3, NULL, '2026-03-19 19:39:00', '2026-03-19 20:11:00', 32, 241.55, 7, NULL, '2026-03-23 19:57:01');
INSERT INTO `workout_log` VALUES (8, 3, NULL, '2026-03-19 18:34:00', '2026-03-19 18:56:00', 22, 135.58, 9, NULL, '2026-03-23 19:57:01');
INSERT INTO `workout_log` VALUES (9, 3, NULL, '2026-03-18 18:30:00', '2026-03-18 19:06:00', 36, 275.34, 4, NULL, '2026-03-23 19:57:01');
INSERT INTO `workout_log` VALUES (10, 3, NULL, '2026-03-17 20:26:00', '2026-03-17 21:10:00', 44, 422.98, 9, NULL, '2026-03-23 19:57:01');
INSERT INTO `workout_log` VALUES (11, 4, NULL, '2026-03-18 18:46:00', '2026-03-18 19:22:00', 36, 283.42, 6, NULL, '2026-03-23 19:57:01');
INSERT INTO `workout_log` VALUES (12, 4, NULL, '2026-03-17 20:39:00', '2026-03-17 21:10:00', 31, 192.01, 9, NULL, '2026-03-23 19:57:01');
INSERT INTO `workout_log` VALUES (13, 4, NULL, '2026-03-19 18:59:00', '2026-03-19 19:47:00', 48, 414.63, 5, NULL, '2026-03-23 19:57:01');
INSERT INTO `workout_log` VALUES (14, 4, NULL, '2026-03-22 19:47:00', '2026-03-22 20:09:00', 22, 231.13, 8, NULL, '2026-03-23 19:57:01');
INSERT INTO `workout_log` VALUES (15, 4, NULL, '2026-03-15 18:34:00', '2026-03-15 19:14:00', 40, 375.84, 5, NULL, '2026-03-23 19:57:01');
INSERT INTO `workout_log` VALUES (16, 4, NULL, '2026-03-20 19:34:00', '2026-03-20 20:33:00', 59, 486.21, 5, NULL, '2026-03-23 19:57:01');
INSERT INTO `workout_log` VALUES (17, 4, NULL, '2026-03-19 19:44:00', '2026-03-19 20:34:00', 50, 533.25, 9, NULL, '2026-03-23 19:57:01');
INSERT INTO `workout_log` VALUES (18, 4, NULL, '2026-03-22 20:30:00', '2026-03-22 21:27:00', 57, 404.29, 8, NULL, '2026-03-23 19:57:01');
INSERT INTO `workout_log` VALUES (19, 4, NULL, '2026-03-16 18:06:00', '2026-03-16 18:31:00', 25, 208.64, 5, NULL, '2026-03-23 19:57:01');
INSERT INTO `workout_log` VALUES (20, 4, NULL, '2026-03-22 19:47:00', '2026-03-22 20:08:00', 21, 167.28, 9, NULL, '2026-03-23 19:57:01');
INSERT INTO `workout_log` VALUES (21, 5, NULL, '2026-03-23 18:53:00', '2026-03-23 19:48:00', 55, 380.36, 6, NULL, '2026-03-23 19:57:01');
INSERT INTO `workout_log` VALUES (22, 5, NULL, '2026-03-20 20:52:00', '2026-03-20 21:29:00', 37, 380.75, 8, NULL, '2026-03-23 19:57:01');
INSERT INTO `workout_log` VALUES (23, 5, NULL, '2026-03-18 18:18:00', '2026-03-18 18:59:00', 41, 273.39, 9, NULL, '2026-03-23 19:57:01');
INSERT INTO `workout_log` VALUES (24, 5, NULL, '2026-03-19 20:42:00', '2026-03-19 21:17:00', 35, 253.72, 6, NULL, '2026-03-23 19:57:01');
INSERT INTO `workout_log` VALUES (25, 5, NULL, '2026-03-22 19:30:00', '2026-03-22 20:02:00', 32, 225.52, 8, NULL, '2026-03-23 19:57:01');
INSERT INTO `workout_log` VALUES (26, 5, NULL, '2026-03-15 18:27:00', '2026-03-15 19:05:00', 38, 424.17, 8, NULL, '2026-03-23 19:57:01');
INSERT INTO `workout_log` VALUES (27, 5, NULL, '2026-03-17 20:35:00', '2026-03-17 21:22:00', 47, 390.10, 5, NULL, '2026-03-23 19:57:01');
INSERT INTO `workout_log` VALUES (28, 5, NULL, '2026-03-17 20:36:00', '2026-03-17 21:10:00', 34, 235.62, 7, NULL, '2026-03-23 19:57:01');
INSERT INTO `workout_log` VALUES (29, 5, NULL, '2026-03-18 18:48:00', '2026-03-18 19:42:00', 54, 374.96, 6, NULL, '2026-03-23 19:57:01');
INSERT INTO `workout_log` VALUES (30, 5, NULL, '2026-03-18 18:47:00', '2026-03-18 19:29:00', 42, 417.27, 9, NULL, '2026-03-23 19:57:01');
INSERT INTO `workout_log` VALUES (31, 6, NULL, '2026-03-19 19:46:00', '2026-03-19 20:25:00', 39, 378.36, 7, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (32, 6, NULL, '2026-03-20 19:09:00', '2026-03-20 20:01:00', 52, 491.31, 5, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (33, 6, NULL, '2026-03-19 19:24:00', '2026-03-19 19:54:00', 30, 272.46, 8, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (34, 6, NULL, '2026-03-23 19:13:00', '2026-03-23 19:54:00', 41, 283.55, 9, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (35, 6, NULL, '2026-03-22 19:20:00', '2026-03-22 20:19:00', 59, 382.09, 7, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (36, 6, NULL, '2026-03-18 20:28:00', '2026-03-18 21:12:00', 44, 265.09, 5, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (37, 6, NULL, '2026-03-19 20:24:00', '2026-03-19 21:15:00', 51, 455.07, 8, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (38, 6, NULL, '2026-03-23 19:45:00', '2026-03-23 20:28:00', 43, 279.29, 7, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (39, 6, NULL, '2026-03-22 18:10:00', '2026-03-22 18:59:00', 49, 560.04, 8, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (40, 6, NULL, '2026-03-16 18:54:00', '2026-03-16 19:14:00', 20, 153.08, 5, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (41, 7, NULL, '2026-03-22 19:57:00', '2026-03-22 20:23:00', 26, 258.63, 7, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (42, 7, NULL, '2026-03-18 20:49:00', '2026-03-18 21:09:00', 20, 235.10, 6, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (43, 7, NULL, '2026-03-20 18:51:00', '2026-03-20 19:46:00', 55, 394.36, 8, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (44, 7, NULL, '2026-03-21 19:38:00', '2026-03-21 20:22:00', 44, 353.56, 7, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (45, 7, NULL, '2026-03-17 18:22:00', '2026-03-17 19:19:00', 57, 416.95, 9, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (46, 7, NULL, '2026-03-23 20:55:00', '2026-03-23 21:17:00', 22, 231.07, 9, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (47, 7, NULL, '2026-03-18 20:10:00', '2026-03-18 20:41:00', 31, 294.27, 9, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (48, 7, NULL, '2026-03-18 18:39:00', '2026-03-18 19:10:00', 31, 345.34, 9, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (49, 7, NULL, '2026-03-14 18:12:00', '2026-03-14 18:54:00', 42, 372.46, 6, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (50, 7, NULL, '2026-03-20 19:35:00', '2026-03-20 19:58:00', 23, 231.58, 5, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (51, 8, NULL, '2026-03-14 20:25:00', '2026-03-14 21:04:00', 39, 339.97, 8, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (52, 8, NULL, '2026-03-14 18:41:00', '2026-03-14 19:36:00', 55, 534.46, 4, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (53, 8, NULL, '2026-03-17 19:01:00', '2026-03-17 20:00:00', 59, 674.47, 8, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (54, 8, NULL, '2026-03-17 20:23:00', '2026-03-17 20:46:00', 23, 263.40, 6, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (55, 8, NULL, '2026-03-14 19:54:00', '2026-03-14 20:51:00', 57, 467.16, 5, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (56, 8, NULL, '2026-03-16 20:11:00', '2026-03-16 20:35:00', 24, 282.80, 6, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (57, 8, NULL, '2026-03-22 19:52:00', '2026-03-22 20:51:00', 59, 626.82, 4, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (58, 8, NULL, '2026-03-21 18:46:00', '2026-03-21 19:45:00', 59, 547.78, 9, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (59, 8, NULL, '2026-03-21 18:23:00', '2026-03-21 18:49:00', 26, 251.01, 6, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (60, 8, NULL, '2026-03-16 19:11:00', '2026-03-16 19:32:00', 21, 164.95, 4, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (61, 9, NULL, '2026-03-16 20:36:00', '2026-03-16 21:17:00', 41, 327.14, 6, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (62, 9, NULL, '2026-03-22 19:19:00', '2026-03-22 20:09:00', 50, 392.17, 6, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (63, 9, NULL, '2026-03-20 19:13:00', '2026-03-20 20:08:00', 55, 406.01, 6, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (64, 9, NULL, '2026-03-16 20:57:00', '2026-03-16 21:46:00', 49, 511.57, 9, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (65, 9, NULL, '2026-03-21 19:54:00', '2026-03-21 20:16:00', 22, 257.09, 9, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (66, 9, NULL, '2026-03-18 18:53:00', '2026-03-18 19:16:00', 23, 264.67, 7, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (67, 9, NULL, '2026-03-15 20:28:00', '2026-03-15 21:00:00', 32, 349.62, 7, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (68, 9, NULL, '2026-03-21 18:21:00', '2026-03-21 19:13:00', 52, 593.00, 6, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (69, 9, NULL, '2026-03-17 18:42:00', '2026-03-17 19:13:00', 31, 323.60, 8, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (70, 9, NULL, '2026-03-20 20:14:00', '2026-03-20 20:41:00', 27, 255.69, 6, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (71, 10, NULL, '2026-03-21 18:55:00', '2026-03-21 19:52:00', 57, 468.48, 4, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (72, 10, NULL, '2026-03-22 20:33:00', '2026-03-22 21:23:00', 50, 333.05, 6, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (73, 10, NULL, '2026-03-22 18:47:00', '2026-03-22 19:27:00', 40, 268.16, 9, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (74, 10, NULL, '2026-03-16 20:25:00', '2026-03-16 21:03:00', 38, 238.00, 7, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (75, 10, NULL, '2026-03-20 19:23:00', '2026-03-20 19:46:00', 23, 247.27, 9, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (76, 10, NULL, '2026-03-21 19:16:00', '2026-03-21 20:10:00', 54, 523.88, 6, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (77, 10, NULL, '2026-03-14 20:07:00', '2026-03-14 20:58:00', 51, 444.41, 6, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (78, 10, NULL, '2026-03-23 18:27:00', '2026-03-23 19:20:00', 53, 607.52, 8, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (79, 10, NULL, '2026-03-17 19:55:00', '2026-03-17 20:38:00', 43, 333.35, 7, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (80, 10, NULL, '2026-03-20 18:43:00', '2026-03-20 19:36:00', 53, 477.15, 5, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (81, 11, NULL, '2026-03-22 18:11:00', '2026-03-22 18:52:00', 41, 353.71, 4, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (82, 11, NULL, '2026-03-19 20:05:00', '2026-03-19 20:35:00', 30, 214.98, 4, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (83, 11, NULL, '2026-03-22 20:39:00', '2026-03-22 21:36:00', 57, 535.22, 5, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (84, 11, NULL, '2026-03-14 18:12:00', '2026-03-14 18:32:00', 20, 167.57, 6, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (85, 11, NULL, '2026-03-17 20:18:00', '2026-03-17 20:43:00', 25, 220.97, 7, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (86, 11, NULL, '2026-03-23 18:03:00', '2026-03-23 18:57:00', 54, 491.77, 9, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (87, 11, NULL, '2026-03-15 18:26:00', '2026-03-15 19:03:00', 37, 261.41, 9, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (88, 11, NULL, '2026-03-19 18:28:00', '2026-03-19 19:02:00', 34, 376.43, 6, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (89, 11, NULL, '2026-03-22 18:04:00', '2026-03-22 18:40:00', 36, 394.14, 5, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (90, 11, NULL, '2026-03-22 19:11:00', '2026-03-22 19:58:00', 47, 518.63, 6, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (91, 12, NULL, '2026-03-14 19:49:00', '2026-03-14 20:41:00', 52, 619.00, 7, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (92, 12, NULL, '2026-03-19 20:05:00', '2026-03-19 20:57:00', 52, 379.11, 9, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (93, 12, NULL, '2026-03-23 18:23:00', '2026-03-23 18:55:00', 32, 244.93, 8, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (94, 12, NULL, '2026-03-22 19:48:00', '2026-03-22 20:29:00', 41, 469.21, 5, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (95, 12, NULL, '2026-03-17 19:51:00', '2026-03-17 20:31:00', 40, 258.74, 7, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (96, 12, NULL, '2026-03-21 20:11:00', '2026-03-21 20:44:00', 33, 283.98, 6, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (97, 12, NULL, '2026-03-18 19:04:00', '2026-03-18 19:58:00', 54, 346.99, 5, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (98, 12, NULL, '2026-03-21 18:07:00', '2026-03-21 19:02:00', 55, 487.18, 8, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (99, 12, NULL, '2026-03-14 18:00:00', '2026-03-14 18:37:00', 37, 298.78, 9, NULL, '2026-03-23 19:57:02');
INSERT INTO `workout_log` VALUES (100, 12, NULL, '2026-03-17 19:03:00', '2026-03-17 19:29:00', 26, 306.94, 5, NULL, '2026-03-23 19:57:02');

SET FOREIGN_KEY_CHECKS = 1;
