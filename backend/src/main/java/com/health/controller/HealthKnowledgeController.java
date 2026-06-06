package com.health.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.health.common.Result;
import com.health.entity.HealthKnowledge;
import com.health.service.HealthKnowledgeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/health-knowledge")
public class HealthKnowledgeController {

    @Autowired
    private HealthKnowledgeService healthKnowledgeService;

    @GetMapping("/list")
    public Result<?> list(@RequestParam(defaultValue = "1") Integer pageNum,
                          @RequestParam(defaultValue = "10") Integer pageSize,
                          @RequestParam(required = false) String title,
                          @RequestParam(required = false) String category) {
        LambdaQueryWrapper<HealthKnowledge> wrapper = new LambdaQueryWrapper<>();
        wrapper.like(StrUtil.isNotBlank(title), HealthKnowledge::getTitle, title);
        wrapper.eq(StrUtil.isNotBlank(category), HealthKnowledge::getCategory, category);
        wrapper.orderByDesc(HealthKnowledge::getCreateTime);
        return Result.success(healthKnowledgeService.page(new Page<>(pageNum, pageSize), wrapper));
    }

    @GetMapping("/browse")
    public Result<?> browse(@RequestParam(defaultValue = "1") Integer pageNum,
                            @RequestParam(defaultValue = "12") Integer pageSize,
                            @RequestParam(required = false) String category) {
        LambdaQueryWrapper<HealthKnowledge> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(HealthKnowledge::getStatus, 1);
        wrapper.eq(StrUtil.isNotBlank(category), HealthKnowledge::getCategory, category);
        wrapper.orderByDesc(HealthKnowledge::getCreateTime);
        return Result.success(healthKnowledgeService.page(new Page<>(pageNum, pageSize), wrapper));
    }

    @GetMapping("/detail/{id}")
    public Result<HealthKnowledge> detail(@PathVariable Long id) {
        HealthKnowledge knowledge = healthKnowledgeService.getById(id);
        if (knowledge != null) {
            knowledge.setViewCount(knowledge.getViewCount() + 1);
            healthKnowledgeService.updateById(knowledge);
        }
        return Result.success(knowledge);
    }

    @PostMapping
    public Result<?> add(@RequestBody HealthKnowledge knowledge) {
        healthKnowledgeService.save(knowledge);
        return Result.success();
    }

    @PutMapping
    public Result<?> update(@RequestBody HealthKnowledge knowledge) {
        healthKnowledgeService.updateById(knowledge);
        return Result.success();
    }

    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Long id) {
        healthKnowledgeService.removeById(id);
        return Result.success();
    }
}
