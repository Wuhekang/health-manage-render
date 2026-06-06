package com.health.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.health.common.Result;
import com.health.entity.DietRecord;
import com.health.service.DietRecordService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;

@RestController
@RequestMapping("/diet-record")
public class DietRecordController {

    @Autowired
    private DietRecordService dietRecordService;

    @GetMapping("/list")
    public Result<?> list(@RequestParam(defaultValue = "1") Integer pageNum,
                          @RequestParam(defaultValue = "10") Integer pageSize,
                          @RequestParam(required = false) Integer mealType,
                          @RequestParam(required = false) String startDate,
                          @RequestParam(required = false) String endDate,
                          HttpServletRequest request) {
        Long userId = (Long) request.getAttribute("userId");
        LambdaQueryWrapper<DietRecord> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(DietRecord::getUserId, userId);
        wrapper.eq(mealType != null, DietRecord::getMealType, mealType);
        if (StrUtil.isNotBlank(startDate)) wrapper.ge(DietRecord::getDietDate, LocalDate.parse(startDate));
        if (StrUtil.isNotBlank(endDate)) wrapper.le(DietRecord::getDietDate, LocalDate.parse(endDate));
        wrapper.orderByDesc(DietRecord::getDietDate);
        return Result.success(dietRecordService.page(new Page<>(pageNum, pageSize), wrapper));
    }

    @PostMapping
    public Result<?> add(@RequestBody DietRecord record, HttpServletRequest request) {
        record.setUserId((Long) request.getAttribute("userId"));
        dietRecordService.save(record);
        return Result.success();
    }

    @PutMapping
    public Result<?> update(@RequestBody DietRecord record, HttpServletRequest request) {
        Long userId = (Long) request.getAttribute("userId");
        DietRecord existing = dietRecordService.getById(record.getId());
        if (existing == null || !existing.getUserId().equals(userId)) throw new RuntimeException("无权操作");
        record.setUserId(userId);
        dietRecordService.updateById(record);
        return Result.success();
    }

    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Long id, HttpServletRequest request) {
        Long userId = (Long) request.getAttribute("userId");
        DietRecord existing = dietRecordService.getById(id);
        if (existing == null || !existing.getUserId().equals(userId)) throw new RuntimeException("无权操作");
        dietRecordService.removeById(id);
        return Result.success();
    }
}
