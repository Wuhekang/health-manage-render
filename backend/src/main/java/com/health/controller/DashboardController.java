package com.health.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.health.common.Result;
import com.health.entity.*;
import com.health.service.*;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;

@RestController
@RequestMapping("/dashboard")
public class DashboardController {

    @Autowired
    private UserService userService;
    @Autowired
    private HealthRecordService healthRecordService;
    @Autowired
    private HealthKnowledgeService healthKnowledgeService;
    @Autowired
    private NoticeService noticeService;
    @Autowired
    private ExerciseRecordService exerciseRecordService;
    @Autowired
    private HealthAssessmentService healthAssessmentService;

    @GetMapping("/admin-stats")
    public Result<?> adminStats() {
        Map<String, Object> stats = new HashMap<>();
        stats.put("userCount", userService.count());
        stats.put("recordCount", healthRecordService.count());
        stats.put("knowledgeCount", healthKnowledgeService.count());
        stats.put("noticeCount", noticeService.count());

        List<User> recentUsers = userService.list(new LambdaQueryWrapper<User>()
                .orderByDesc(User::getCreateTime).last("LIMIT 10"));
        recentUsers.forEach(u -> u.setPassword(null));
        stats.put("recentUsers", recentUsers);

        List<String> last7Days = new ArrayList<>();
        List<Long> registerCounts = new ArrayList<>();
        List<Long> recordCounts = new ArrayList<>();
        for (int i = 6; i >= 0; i--) {
            LocalDate date = LocalDate.now().minusDays(i);
            last7Days.add(date.toString().substring(5));
            LocalDateTime start = date.atStartOfDay();
            LocalDateTime end = date.plusDays(1).atStartOfDay();
            registerCounts.add(userService.count(new LambdaQueryWrapper<User>()
                    .ge(User::getCreateTime, start).lt(User::getCreateTime, end)));
            recordCounts.add(healthRecordService.count(new LambdaQueryWrapper<HealthRecord>()
                    .eq(HealthRecord::getRecordDate, date)));
        }
        stats.put("trendDates", last7Days);
        stats.put("registerTrend", registerCounts);
        stats.put("recordTrend", recordCounts);

        return Result.success(stats);
    }

    @GetMapping("/user-stats")
    public Result<?> userStats(HttpServletRequest request) {
        Long userId = (Long) request.getAttribute("userId");
        Map<String, Object> stats = new HashMap<>();

        HealthRecord latest = healthRecordService.getOne(new LambdaQueryWrapper<HealthRecord>()
                .eq(HealthRecord::getUserId, userId).orderByDesc(HealthRecord::getRecordDate).last("LIMIT 1"));
        stats.put("latestRecord", latest);

        long exerciseCount = exerciseRecordService.count(new LambdaQueryWrapper<ExerciseRecord>()
                .eq(ExerciseRecord::getUserId, userId)
                .ge(ExerciseRecord::getExerciseDate, LocalDate.now().withDayOfMonth(1)));
        stats.put("exerciseCountThisMonth", exerciseCount);

        long assessmentCount = healthAssessmentService.count(new LambdaQueryWrapper<HealthAssessment>()
                .eq(HealthAssessment::getUserId, userId));
        stats.put("assessmentCount", assessmentCount);

        List<HealthKnowledge> latestKnowledge = healthKnowledgeService.list(new LambdaQueryWrapper<HealthKnowledge>()
                .eq(HealthKnowledge::getStatus, 1).orderByDesc(HealthKnowledge::getCreateTime).last("LIMIT 3"));
        stats.put("latestKnowledge", latestKnowledge);

        return Result.success(stats);
    }
}
