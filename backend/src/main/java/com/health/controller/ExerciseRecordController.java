package com.health.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.health.common.Result;
import com.health.entity.ExerciseRecord;
import com.health.service.ExerciseRecordService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/exercise-record")
public class ExerciseRecordController {

    @Autowired
    private ExerciseRecordService exerciseRecordService;

    @GetMapping("/list")
    public Result<?> list(@RequestParam(defaultValue = "1") Integer pageNum,
                          @RequestParam(defaultValue = "10") Integer pageSize,
                          @RequestParam(required = false) String exerciseType,
                          @RequestParam(required = false) String startDate,
                          @RequestParam(required = false) String endDate,
                          HttpServletRequest request) {
        Long userId = (Long) request.getAttribute("userId");
        LambdaQueryWrapper<ExerciseRecord> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(ExerciseRecord::getUserId, userId);
        wrapper.eq(StrUtil.isNotBlank(exerciseType), ExerciseRecord::getExerciseType, exerciseType);
        if (StrUtil.isNotBlank(startDate)) wrapper.ge(ExerciseRecord::getExerciseDate, LocalDate.parse(startDate));
        if (StrUtil.isNotBlank(endDate)) wrapper.le(ExerciseRecord::getExerciseDate, LocalDate.parse(endDate));
        wrapper.orderByDesc(ExerciseRecord::getExerciseDate);
        return Result.success(exerciseRecordService.page(new Page<>(pageNum, pageSize), wrapper));
    }

    @PostMapping
    public Result<?> add(@RequestBody ExerciseRecord record, HttpServletRequest request) {
        record.setUserId((Long) request.getAttribute("userId"));
        exerciseRecordService.save(record);
        return Result.success();
    }

    @PutMapping
    public Result<?> update(@RequestBody ExerciseRecord record, HttpServletRequest request) {
        Long userId = (Long) request.getAttribute("userId");
        ExerciseRecord existing = exerciseRecordService.getById(record.getId());
        if (existing == null || !existing.getUserId().equals(userId)) throw new RuntimeException("无权操作");
        record.setUserId(userId);
        exerciseRecordService.updateById(record);
        return Result.success();
    }

    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Long id, HttpServletRequest request) {
        Long userId = (Long) request.getAttribute("userId");
        ExerciseRecord existing = exerciseRecordService.getById(id);
        if (existing == null || !existing.getUserId().equals(userId)) throw new RuntimeException("无权操作");
        exerciseRecordService.removeById(id);
        return Result.success();
    }

    @GetMapping("/stats")
    public Result<?> stats(HttpServletRequest request) {
        Long userId = (Long) request.getAttribute("userId");
        List<ExerciseRecord> records = exerciseRecordService.list(
                new LambdaQueryWrapper<ExerciseRecord>().eq(ExerciseRecord::getUserId, userId)
                        .ge(ExerciseRecord::getExerciseDate, LocalDate.now().minusDays(90)));
        Map<String, Long> typeDistribution = records.stream()
                .collect(Collectors.groupingBy(ExerciseRecord::getExerciseType, Collectors.counting()));
        int totalDuration = records.stream().mapToInt(ExerciseRecord::getDuration).sum();
        int totalCalories = records.stream().mapToInt(r -> r.getCalories() != null ? r.getCalories() : 0).sum();
        return Result.success(Map.of("typeDistribution", typeDistribution, "totalDuration", totalDuration,
                "totalCalories", totalCalories, "totalCount", records.size()));
    }
}
