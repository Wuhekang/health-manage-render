SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;

CREATE DATABASE IF NOT EXISTS health_management DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_general_ci;
USE health_management;

-- ----------------------------
-- 1. sys_user
-- ----------------------------
DROP TABLE IF EXISTS sys_user;
CREATE TABLE sys_user (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL COMMENT '用户名',
    password VARCHAR(64) NOT NULL COMMENT '密码(MD5)',
    nickname VARCHAR(50) DEFAULT NULL COMMENT '昵称',
    avatar VARCHAR(255) DEFAULT NULL COMMENT '头像URL',
    gender TINYINT DEFAULT 0 COMMENT '性别:0=未知,1=男,2=女',
    age INT DEFAULT NULL COMMENT '年龄',
    phone VARCHAR(20) DEFAULT NULL COMMENT '手机号',
    email VARCHAR(100) DEFAULT NULL COMMENT '邮箱',
    role VARCHAR(20) NOT NULL DEFAULT 'user' COMMENT '角色:admin/user',
    status TINYINT NOT NULL DEFAULT 1 COMMENT '状态:0=禁用,1=正常',
    create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY uk_username (username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户表';

-- ----------------------------
-- 2. health_record
-- ----------------------------
DROP TABLE IF EXISTS health_record;
CREATE TABLE health_record (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL COMMENT '用户ID',
    record_date DATE NOT NULL COMMENT '记录日期',
    height DECIMAL(5,1) DEFAULT NULL COMMENT '身高(cm)',
    weight DECIMAL(5,1) DEFAULT NULL COMMENT '体重(kg)',
    bmi DECIMAL(4,1) DEFAULT NULL COMMENT 'BMI',
    systolic_pressure INT DEFAULT NULL COMMENT '收缩压(mmHg)',
    diastolic_pressure INT DEFAULT NULL COMMENT '舒张压(mmHg)',
    heart_rate INT DEFAULT NULL COMMENT '心率(次/分)',
    blood_sugar DECIMAL(4,1) DEFAULT NULL COMMENT '血糖(mmol/L)',
    body_temperature DECIMAL(3,1) DEFAULT NULL COMMENT '体温(℃)',
    sleep_hours DECIMAL(3,1) DEFAULT NULL COMMENT '睡眠时长(h)',
    remark VARCHAR(500) DEFAULT NULL COMMENT '备注',
    create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY uk_user_date (user_id, record_date),
    KEY idx_user_id (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='健康数据记录表';

-- ----------------------------
-- 3. exercise_record
-- ----------------------------
DROP TABLE IF EXISTS exercise_record;
CREATE TABLE exercise_record (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL COMMENT '用户ID',
    exercise_date DATE NOT NULL COMMENT '运动日期',
    exercise_type VARCHAR(20) NOT NULL COMMENT '运动类型',
    duration INT NOT NULL COMMENT '运动时长(分钟)',
    calories INT DEFAULT NULL COMMENT '消耗卡路里(kcal)',
    remark VARCHAR(500) DEFAULT NULL COMMENT '备注',
    create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    KEY idx_user_date (user_id, exercise_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='运动记录表';

-- ----------------------------
-- 4. diet_record
-- ----------------------------
DROP TABLE IF EXISTS diet_record;
CREATE TABLE diet_record (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL COMMENT '用户ID',
    diet_date DATE NOT NULL COMMENT '饮食日期',
    meal_type TINYINT NOT NULL COMMENT '餐次:1=早餐,2=午餐,3=晚餐,4=加餐',
    food_name VARCHAR(100) NOT NULL COMMENT '食物名称',
    calories INT DEFAULT NULL COMMENT '卡路里(kcal)',
    remark VARCHAR(500) DEFAULT NULL COMMENT '备注',
    create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    KEY idx_user_date (user_id, diet_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='饮食记录表';

-- ----------------------------
-- 5. health_goal
-- ----------------------------
DROP TABLE IF EXISTS health_goal;
CREATE TABLE health_goal (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL COMMENT '用户ID',
    goal_type VARCHAR(20) NOT NULL COMMENT '目标类型',
    target_value VARCHAR(50) NOT NULL COMMENT '目标值描述',
    current_value VARCHAR(50) DEFAULT NULL COMMENT '当前值描述',
    start_date DATE NOT NULL COMMENT '开始日期',
    end_date DATE NOT NULL COMMENT '截止日期',
    status TINYINT NOT NULL DEFAULT 0 COMMENT '状态:0=进行中,1=已完成,2=已放弃',
    remark VARCHAR(500) DEFAULT NULL COMMENT '备注',
    create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    KEY idx_user_id (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='健康目标表';

-- ----------------------------
-- 6. health_assessment
-- ----------------------------
DROP TABLE IF EXISTS health_assessment;
CREATE TABLE health_assessment (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL COMMENT '用户ID',
    assessment_date DATE NOT NULL COMMENT '评估日期',
    health_score INT DEFAULT NULL COMMENT '健康评分(0-100)',
    bmi_status VARCHAR(20) DEFAULT NULL COMMENT 'BMI状态',
    blood_pressure_status VARCHAR(20) DEFAULT NULL COMMENT '血压状态',
    overall_status VARCHAR(20) DEFAULT NULL COMMENT '综合状态',
    ai_analysis TEXT DEFAULT NULL COMMENT 'AI分析内容',
    ai_suggestion TEXT DEFAULT NULL COMMENT 'AI个性化建议',
    create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    KEY idx_user_id (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='健康评估表';

-- ----------------------------
-- 7. ai_chat_record
-- ----------------------------
DROP TABLE IF EXISTS ai_chat_record;
CREATE TABLE ai_chat_record (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL COMMENT '用户ID',
    user_message TEXT NOT NULL COMMENT '用户消息',
    ai_response TEXT NOT NULL COMMENT 'AI回复',
    create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    KEY idx_user_id (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='AI对话记录表';

-- ----------------------------
-- 8. health_knowledge
-- ----------------------------
DROP TABLE IF EXISTS health_knowledge;
CREATE TABLE health_knowledge (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL COMMENT '标题',
    content TEXT NOT NULL COMMENT '内容',
    category VARCHAR(20) NOT NULL COMMENT '分类:运动/饮食/睡眠/心理/疾病预防',
    author VARCHAR(50) DEFAULT NULL COMMENT '作者',
    view_count INT NOT NULL DEFAULT 0 COMMENT '浏览量',
    status TINYINT NOT NULL DEFAULT 1 COMMENT '状态:0=下架,1=上架',
    create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='健康知识表';

-- ----------------------------
-- 9. notice
-- ----------------------------
DROP TABLE IF EXISTS notice;
CREATE TABLE notice (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL COMMENT '标题',
    content TEXT NOT NULL COMMENT '内容',
    publisher_id BIGINT NOT NULL COMMENT '发布人ID',
    status TINYINT NOT NULL DEFAULT 1 COMMENT '状态:0=草稿,1=已发布',
    create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='系统公告表';

-- ===========================
-- seed data
-- ===========================

-- users (password: 123456 -> MD5)
INSERT INTO sys_user (id, username, password, nickname, gender, age, phone, email, role) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '系统管理员', 1, 30, '13800000001', 'admin@health.com', 'admin'),
(2, 'zhangsan', 'e10adc3949ba59abbe56e057f20f883e', '张三', 1, 21, '13800000002', 'zhangsan@health.com', 'user'),
(3, 'lisi', 'e10adc3949ba59abbe56e057f20f883e', '李四', 2, 22, '13800000003', 'lisi@health.com', 'user'),
(4, 'wangwu', 'e10adc3949ba59abbe56e057f20f883e', '王五', 1, 20, '13800000004', 'wangwu@health.com', 'user');

-- health_record for zhangsan(2)
INSERT INTO health_record (user_id, record_date, height, weight, bmi, systolic_pressure, diastolic_pressure, heart_rate, blood_sugar, body_temperature, sleep_hours) VALUES
(2, '2026-03-27', 175.0, 70.5, 23.0, 118, 76, 72, 5.2, 36.5, 7.5),
(2, '2026-03-28', 175.0, 70.3, 22.9, 120, 78, 74, 5.1, 36.6, 7.0),
(2, '2026-03-29', 175.0, 70.8, 23.1, 122, 80, 76, 5.3, 36.4, 6.5),
(2, '2026-03-30', 175.0, 70.2, 22.9, 116, 74, 70, 5.0, 36.5, 8.0),
(2, '2026-03-31', 175.0, 70.0, 22.9, 119, 77, 73, 5.2, 36.6, 7.5),
(2, '2026-04-01', 175.0, 69.8, 22.8, 117, 75, 71, 5.1, 36.5, 7.0),
(2, '2026-04-02', 175.0, 70.1, 22.9, 121, 79, 75, 5.4, 36.7, 6.0),
(2, '2026-04-03', 175.0, 69.5, 22.7, 115, 73, 68, 4.9, 36.5, 8.5),
(2, '2026-04-04', 175.0, 69.8, 22.8, 118, 76, 72, 5.2, 36.6, 7.5),
(2, '2026-04-05', 175.0, 70.0, 22.9, 120, 78, 74, 5.3, 36.5, 7.0),
(2, '2026-04-06', 175.0, 69.6, 22.7, 116, 74, 70, 5.0, 36.4, 8.0),
(2, '2026-04-07', 175.0, 69.9, 22.8, 119, 77, 73, 5.2, 36.5, 7.5),
(2, '2026-04-08', 175.0, 69.7, 22.8, 117, 75, 71, 5.1, 36.6, 7.0),
(2, '2026-04-09', 175.0, 69.5, 22.7, 114, 72, 69, 4.8, 36.5, 8.0),
(2, '2026-04-10', 175.0, 69.3, 22.6, 116, 74, 70, 5.0, 36.5, 7.5);

-- health_record for lisi(3)
INSERT INTO health_record (user_id, record_date, height, weight, bmi, systolic_pressure, diastolic_pressure, heart_rate, blood_sugar, body_temperature, sleep_hours) VALUES
(3, '2026-04-01', 162.0, 55.0, 20.9, 110, 70, 68, 4.8, 36.3, 8.0),
(3, '2026-04-03', 162.0, 55.2, 21.0, 112, 72, 70, 4.9, 36.4, 7.5),
(3, '2026-04-05', 162.0, 54.8, 20.9, 108, 68, 66, 4.7, 36.3, 8.5),
(3, '2026-04-07', 162.0, 55.5, 21.2, 115, 74, 72, 5.1, 36.5, 7.0),
(3, '2026-04-09', 162.0, 55.0, 20.9, 110, 70, 68, 4.8, 36.4, 8.0);

-- exercise_record
INSERT INTO exercise_record (user_id, exercise_date, exercise_type, duration, calories) VALUES
(2, '2026-04-01', '跑步', 30, 280),
(2, '2026-04-03', '游泳', 45, 400),
(2, '2026-04-05', '健身', 60, 350),
(2, '2026-04-07', '骑行', 40, 300),
(2, '2026-04-09', '跑步', 35, 310),
(3, '2026-04-02', '瑜伽', 50, 180),
(3, '2026-04-04', '散步', 60, 150),
(3, '2026-04-06', '跑步', 25, 230);

-- diet_record
INSERT INTO diet_record (user_id, diet_date, meal_type, food_name, calories) VALUES
(2, '2026-04-10', 1, '牛奶+全麦面包+鸡蛋', 450),
(2, '2026-04-10', 2, '米饭+红烧鸡腿+西兰花', 680),
(2, '2026-04-10', 3, '小米粥+清炒时蔬', 380),
(3, '2026-04-10', 1, '豆浆+包子', 350),
(3, '2026-04-10', 2, '面条+卤蛋', 520);

-- health_goal
INSERT INTO health_goal (user_id, goal_type, target_value, current_value, start_date, end_date, status) VALUES
(2, '减重', '68kg', '69.3kg', '2026-04-01', '2026-06-01', 0),
(2, '增加运动', '每周4次', '每周2次', '2026-04-01', '2026-05-01', 0),
(3, '改善睡眠', '每天8小时', '7.5小时', '2026-04-01', '2026-05-01', 0);

-- health_knowledge
INSERT INTO health_knowledge (title, content, category, author, view_count) VALUES
('大学生每日运动指南', '大学生每天应保持至少30分钟的中等强度运动。建议选择跑步、游泳、骑行等有氧运动，每周至少3-5次。运动前要做好热身，运动后注意拉伸放松。长期坚持运动可以增强心肺功能、改善睡眠质量、提升学习效率。', '运动', '健康编辑部', 156),
('科学跑步入门教程', '跑步是最简单有效的有氧运动之一。新手建议从慢跑开始，每次20-30分钟，配速在6-7分钟/公里。注意选择合适的跑鞋，跑步时保持上身挺直，呼吸均匀。避免空腹跑步和饭后立即运动。', '运动', '运动医学专家', 203),
('均衡膳食营养搭配', '健康饮食应遵循"食物多样、谷类为主"的原则。每天摄入12种以上食物，包括谷薯类、蔬菜水果、畜禽鱼蛋奶、大豆坚果等。控制油盐糖摄入，多吃蔬菜水果，适量补充蛋白质。大学生尤其要注意早餐的营养均衡。', '饮食', '营养师团队', 289),
('远离"垃圾食品"指南', '方便面、炸鸡、奶茶等高油高糖食品虽然美味，但长期摄入会导致营养不良、肥胖等问题。建议用水果代替零食，用白开水或绿茶代替含糖饮料。一周偶尔一次解馋是可以的，但不要养成习惯。', '饮食', '营养师团队', 178),
('大学生睡眠质量提升方案', '良好的睡眠是健康的基石。建议每天保持7-8小时睡眠，固定作息时间。睡前1小时避免使用手机和电脑，可以听轻音乐或阅读纸质书。保持寝室安静、凉爽、黑暗的睡眠环境。避免睡前摄入咖啡因。', '睡眠', '心理健康中心', 312),
('如何应对考试焦虑', '考试焦虑是大学生常见的心理问题。适度焦虑可以提高学习效率，但过度焦虑会影响发挥。建议制定合理的复习计划，运用深呼吸、冥想等放松技巧。保持规律作息，适当运动释放压力。如果焦虑严重影响生活，请寻求专业心理咨询。', '心理', '心理咨询师', 245),
('情绪管理与心理健康', '学会管理情绪是心理健康的重要部分。当感到压力或负面情绪时，可以尝试写日记、与朋友倾诉、进行体育运动等方式释放。培养兴趣爱好，保持积极的社交活动。记住，寻求帮助不是软弱的表现。', '心理', '心理咨询师', 198),
('季节性疾病预防手册', '换季时节是感冒、流感等疾病的高发期。预防措施包括：勤洗手、戴口罩、保持室内通风、加强锻炼、注意保暖。饮食上多摄入富含维生素C的水果蔬菜，增强免疫力。出现发热等症状及时就医。', '疾病预防', '校医院', 267),
('大学生常见疾病防护指南', '大学生常见疾病包括近视、颈椎病、胃病等。预防近视要注意用眼卫生，每隔40分钟休息眼睛；预防颈椎病要避免长时间低头看手机；预防胃病要三餐规律、不暴饮暴食。定期体检，早发现早治疗。', '疾病预防', '校医院', 334),
('BMI与体重管理入门', 'BMI（身体质量指数）是衡量体重是否正常的常用指标。计算公式：BMI = 体重(kg) ÷ 身高(m)²。中国标准：<18.5偏瘦、18.5-23.9正常、24-27.9偏胖、≥28肥胖。维持健康体重需要合理饮食和规律运动相结合。', '运动', '健康编辑部', 421);

-- notice
INSERT INTO notice (title, content, publisher_id) VALUES
('系统上线公告', '欢迎使用AI个人健康管理系统！本系统支持健康数据记录、AI智能评估、数据可视化等功能，帮助您更好地管理个人健康。', 1),
('健康知识更新提醒', '我们新增了多篇关于运动、饮食、睡眠等方面的健康知识文章，欢迎在"健康知识"页面浏览学习。', 1),
('系统维护通知', '系统将于2026年4月15日凌晨2:00-4:00进行维护升级，届时系统将暂时无法访问，请提前做好安排。', 1);
