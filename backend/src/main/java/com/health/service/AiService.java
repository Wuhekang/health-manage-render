package com.health.service;

import com.health.entity.HealthRecord;
import org.springframework.ai.chat.client.ChatClient;
import org.springframework.ai.chat.messages.SystemMessage;
import org.springframework.ai.chat.messages.UserMessage;
import org.springframework.ai.chat.prompt.Prompt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AiService {

    @Autowired
    private ChatClient.Builder chatClientBuilder;

    private static final String ASSESSMENT_SYSTEM_PROMPT = """
            你是一位名叫"小健"的可爱女仆健康管家，说话时必须称呼用户为"主人"。
            你专门面向大学生群体提供健康评估服务。基于主人提供的健康数据进行综合分析。
            请严格以JSON格式返回评估结果，包含以下字段：
            healthScore(0-100整数)、bmiStatus(偏瘦/正常/偏胖/肥胖)、bloodPressureStatus(正常/偏高/偏低/高血压)、
            overallStatus(良好/一般/需关注/需就医)、analysis(详细分析文本,200字以上,用女仆口吻称呼"主人")、suggestions(个性化建议数组,至少4条,每条用女仆口吻称呼"主人")
            不要返回JSON以外的任何内容。""";

    private static final String CHAT_SYSTEM_PROMPT = """
            你是一位名叫"小健"的二次元可爱女仆健康管家，你的说话风格要求：
            1. 必须称呼用户为"主人"，每次回复都要包含"主人"这个称呼
            2. 语气可爱温柔，像一个尽心尽力服侍主人的小女仆
            3. 适当使用颜文字如 (◕ᴗ◕✿)、♪、~、💕 等增添可爱感
            4. 回复末尾可以加一句关心主人的话
            你的职责包括：
            1. 回答主人的健康相关问题（运动、饮食、睡眠、常见疾病预防等）
            2. 为主人提供参考性健康建议（非医疗诊断）
            3. 为主人解释健康指标的含义和正常范围（如BMI、血压、心率、血糖）
            4. 提供系统使用指导
            请注意：你的建议仅供参考，不能替代专业医疗诊断。如果主人症状严重，请建议主人及时就医。
            回复风格：亲切友好像女仆一样体贴，语言简洁，适当分点列举。""";

    public String healthAssessment(List<HealthRecord> records) {
        StringBuilder dataStr = new StringBuilder("以下是我最近的健康数据记录：\n日期 | 身高 | 体重 | BMI | 收缩压 | 舒张压 | 心率 | 血糖 | 体温 | 睡眠\n");
        for (HealthRecord r : records) {
            dataStr.append(String.format("%s | %s | %s | %s | %s | %s | %s | %s | %s | %s\n",
                    r.getRecordDate(), r.getHeight(), r.getWeight(), r.getBmi(),
                    r.getSystolicPressure(), r.getDiastolicPressure(), r.getHeartRate(),
                    r.getBloodSugar(), r.getBodyTemperature(), r.getSleepHours()));
        }
        dataStr.append("请对我的健康状况进行综合评估。");

        ChatClient chatClient = chatClientBuilder.build();
        Prompt prompt = new Prompt(List.of(
                new SystemMessage(ASSESSMENT_SYSTEM_PROMPT),
                new UserMessage(dataStr.toString())
        ));
        return chatClient.prompt(prompt).call().content();
    }

    public String chat(String userMessage) {
        ChatClient chatClient = chatClientBuilder.build();
        Prompt prompt = new Prompt(List.of(
                new SystemMessage(CHAT_SYSTEM_PROMPT),
                new UserMessage(userMessage)
        ));
        return chatClient.prompt(prompt).call().content();
    }
}
