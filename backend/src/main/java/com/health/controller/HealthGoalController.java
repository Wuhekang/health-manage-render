package com.health.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.health.common.Result;
import com.health.entity.HealthGoal;
import com.health.service.HealthGoalService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/health-goal")
public class HealthGoalController {

    @Autowired
    private HealthGoalService healthGoalService;

    @GetMapping("/list")
    public Result<List<HealthGoal>> list(HttpServletRequest request) {
        Long userId = (Long) request.getAttribute("userId");
        List<HealthGoal> goals = healthGoalService.list(
                new LambdaQueryWrapper<HealthGoal>().eq(HealthGoal::getUserId, userId).orderByDesc(HealthGoal::getCreateTime));
        return Result.success(goals);
    }

    @PostMapping
    public Result<?> add(@RequestBody HealthGoal goal, HttpServletRequest request) {
        goal.setUserId((Long) request.getAttribute("userId"));
        goal.setStatus(0);
        healthGoalService.save(goal);
        return Result.success();
    }

    @PutMapping
    public Result<?> update(@RequestBody HealthGoal goal, HttpServletRequest request) {
        Long userId = (Long) request.getAttribute("userId");
        HealthGoal existing = healthGoalService.getById(goal.getId());
        if (existing == null || !existing.getUserId().equals(userId)) throw new RuntimeException("无权操作");
        goal.setUserId(userId);
        healthGoalService.updateById(goal);
        return Result.success();
    }

    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Long id, HttpServletRequest request) {
        Long userId = (Long) request.getAttribute("userId");
        HealthGoal existing = healthGoalService.getById(id);
        if (existing == null || !existing.getUserId().equals(userId)) throw new RuntimeException("无权操作");
        healthGoalService.removeById(id);
        return Result.success();
    }

    @PutMapping("/complete/{id}")
    public Result<?> complete(@PathVariable Long id, HttpServletRequest request) {
        Long userId = (Long) request.getAttribute("userId");
        HealthGoal existing = healthGoalService.getById(id);
        if (existing == null || !existing.getUserId().equals(userId)) throw new RuntimeException("无权操作");
        existing.setStatus(1);
        healthGoalService.updateById(existing);
        return Result.success();
    }

    @PutMapping("/abandon/{id}")
    public Result<?> abandon(@PathVariable Long id, HttpServletRequest request) {
        Long userId = (Long) request.getAttribute("userId");
        HealthGoal existing = healthGoalService.getById(id);
        if (existing == null || !existing.getUserId().equals(userId)) throw new RuntimeException("无权操作");
        existing.setStatus(2);
        healthGoalService.updateById(existing);
        return Result.success();
    }
}
