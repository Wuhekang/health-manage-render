SET NAMES utf8mb4;
USE health_management;

DROP TABLE IF EXISTS sys_config;
CREATE TABLE sys_config (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    config_key VARCHAR(100) NOT NULL COMMENT '配置键',
    config_value TEXT NOT NULL COMMENT '配置值',
    config_desc VARCHAR(200) DEFAULT NULL COMMENT '描述',
    update_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY uk_key (config_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='系统配置表';

INSERT INTO sys_config (config_key, config_value, config_desc) VALUES
('ai_api_key', 'your-doubao-api-key', 'AI API密钥'),
('ai_base_url', 'https://ark.cn-beijing.volces.com/api/v3', 'AI API基础地址'),
('ai_model', 'doubao-1-5-pro-256k-250115', 'AI模型名称'),
('ai_enabled', 'true', 'AI功能开关'),
('ai_max_tokens', '2048', 'AI最大Token数'),
('ai_temperature', '0.7', 'AI温度参数(0-1)');
