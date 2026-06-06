package com.health.controller;

import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.health.common.Result;
import com.health.entity.HealthAssessment;
import com.health.entity.HealthRecord;
import com.health.service.AiService;
import com.health.service.HealthAssessmentService;
import com.health.service.HealthRecordService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/health-assessment")
public class HealthAssessmentController {

    @Autowired
    private HealthAssessmentService healthAssessmentService;
    @Autowired
    private HealthRecordService healthRecordService;
    @Autowired
    private AiService aiService;

    @PostMapping("/evaluate")
    public Result<HealthAssessment> evaluate(HttpServletRequest request) {
        Long userId = (Long) request.getAttribute("userId");
        List<HealthRecord> records = healthRecordService.list(new LambdaQueryWrapper<HealthRecord>()
                .eq(HealthRecord::getUserId, userId)
                .ge(HealthRecord::getRecordDate, LocalDate.now().minusDays(30))
                .orderByAsc(HealthRecord::getRecordDate));

        if (records.isEmpty()) {
            throw new RuntimeException("请先录入健康数据后再进行评估");
        }

        String aiResult = aiService.healthAssessment(records);

        HealthAssessment assessment = new HealthAssessment();
        assessment.setUserId(userId);
        assessment.setAssessmentDate(LocalDate.now());

        try {
            String jsonStr = aiResult;
            if (jsonStr.contains("```json")) {
                jsonStr = jsonStr.substring(jsonStr.indexOf("```json") + 7);
                jsonStr = jsonStr.substring(0, jsonStr.indexOf("```"));
            } else if (jsonStr.contains("```")) {
                jsonStr = jsonStr.substring(jsonStr.indexOf("```") + 3);
                jsonStr = jsonStr.substring(0, jsonStr.indexOf("```"));
            }
            jsonStr = jsonStr.trim();
            JSONObject json = JSONUtil.parseObj(jsonStr);
            assessment.setHealthScore(json.getInt("healthScore", 70));
            assessment.setBmiStatus(json.getStr("bmiStatus", "正常"));
            assessment.setBloodPressureStatus(json.getStr("bloodPressureStatus", "正常"));
            assessment.setOverallStatus(json.getStr("overallStatus", "良好"));
            assessment.setAiAnalysis(json.getStr("analysis", aiResult));
            Object suggestions = json.get("suggestions");
            assessment.setAiSuggestion(suggestions != null ? suggestions.toString() : "保持良好的生活习惯");
        } catch (Exception e) {
            assessment.setHealthScore(70);
            assessment.setOverallStatus("良好");
            assessment.setAiAnalysis(aiResult);
            assessment.setAiSuggestion("请保持规律的作息和运动习惯");
        }

        healthAssessmentService.save(assessment);
        return Result.success(assessment);
    }

    @GetMapping("/list")
    public Result<?> list(@RequestParam(defaultValue = "1") Integer pageNum,
                          @RequestParam(defaultValue = "10") Integer pageSize,
                          HttpServletRequest request) {
        Long userId = (Long) request.getAttribute("userId");
        Page<HealthAssessment> page = healthAssessmentService.page(new Page<>(pageNum, pageSize),
                new LambdaQueryWrapper<HealthAssessment>().eq(HealthAssessment::getUserId, userId)
                        .orderByDesc(HealthAssessment::getCreateTime));
        return Result.success(page);
    }

    @GetMapping("/{id}")
    public Result<HealthAssessment> detail(@PathVariable Long id, HttpServletRequest request) {
        Long userId = (Long) request.getAttribute("userId");
        HealthAssessment assessment = healthAssessmentService.getById(id);
        if (assessment == null || !assessment.getUserId().equals(userId)) {
            throw new RuntimeException("无权查看");
        }
        return Result.success(assessment);
    }
}
