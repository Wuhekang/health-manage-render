package com.health.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.health.common.Result;
import com.health.entity.HealthRecord;
import com.health.entity.User;
import com.health.service.HealthRecordService;
import com.health.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/health-record")
public class HealthRecordController {

    @Autowired
    private HealthRecordService healthRecordService;
    @Autowired
    private UserService userService;

    @GetMapping("/list")
    public Result<?> list(@RequestParam(defaultValue = "1") Integer pageNum,
                          @RequestParam(defaultValue = "10") Integer pageSize,
                          @RequestParam(required = false) String startDate,
                          @RequestParam(required = false) String endDate,
                          HttpServletRequest request) {
        Long userId = (Long) request.getAttribute("userId");
        LambdaQueryWrapper<HealthRecord> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(HealthRecord::getUserId, userId);
        if (StrUtil.isNotBlank(startDate)) wrapper.ge(HealthRecord::getRecordDate, LocalDate.parse(startDate));
        if (StrUtil.isNotBlank(endDate)) wrapper.le(HealthRecord::getRecordDate, LocalDate.parse(endDate));
        wrapper.orderByDesc(HealthRecord::getRecordDate);
        return Result.success(healthRecordService.page(new Page<>(pageNum, pageSize), wrapper));
    }

    @GetMapping("/all")
    public Result<?> listAll(@RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize,
                             @RequestParam(required = false) String username,
                             @RequestParam(required = false) String startDate,
                             @RequestParam(required = false) String endDate) {
        LambdaQueryWrapper<HealthRecord> wrapper = new LambdaQueryWrapper<>();
        if (StrUtil.isNotBlank(username)) {
            List<Long> userIds = userService.list(new LambdaQueryWrapper<User>().like(User::getUsername, username))
                    .stream().map(User::getId).collect(Collectors.toList());
            if (userIds.isEmpty()) return Result.success(new Page<>());
            wrapper.in(HealthRecord::getUserId, userIds);
        }
        if (StrUtil.isNotBlank(startDate)) wrapper.ge(HealthRecord::getRecordDate, LocalDate.parse(startDate));
        if (StrUtil.isNotBlank(endDate)) wrapper.le(HealthRecord::getRecordDate, LocalDate.parse(endDate));
        wrapper.orderByDesc(HealthRecord::getRecordDate);
        Page<HealthRecord> page = healthRecordService.page(new Page<>(pageNum, pageSize), wrapper);
        Map<Long, String> userMap = userService.list().stream().collect(Collectors.toMap(User::getId, u -> u.getNickname() != null ? u.getNickname() : u.getUsername()));
        page.getRecords().forEach(r -> r.setUsername(userMap.getOrDefault(r.getUserId(), "")));
        return Result.success(page);
    }

    @PostMapping
    public Result<?> add(@RequestBody HealthRecord record, HttpServletRequest request) {
        Long userId = (Long) request.getAttribute("userId");
        record.setUserId(userId);
        calculateBmi(record);
        long count = healthRecordService.count(new LambdaQueryWrapper<HealthRecord>()
                .eq(HealthRecord::getUserId, userId).eq(HealthRecord::getRecordDate, record.getRecordDate()));
        if (count > 0) {
            throw new RuntimeException("该日期已有记录，请编辑修改");
        }
        healthRecordService.save(record);
        return Result.success();
    }

    @PutMapping
    public Result<?> update(@RequestBody HealthRecord record, HttpServletRequest request) {
        Long userId = (Long) request.getAttribute("userId");
        HealthRecord existing = healthRecordService.getById(record.getId());
        if (existing == null || !existing.getUserId().equals(userId)) {
            throw new RuntimeException("无权操作");
        }
        record.setUserId(userId);
        calculateBmi(record);
        healthRecordService.updateById(record);
        return Result.success();
    }

    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Long id, HttpServletRequest request) {
        Long userId = (Long) request.getAttribute("userId");
        HealthRecord existing = healthRecordService.getById(id);
        if (existing == null || !existing.getUserId().equals(userId)) {
            throw new RuntimeException("无权操作");
        }
        healthRecordService.removeById(id);
        return Result.success();
    }

    @GetMapping("/latest")
    public Result<HealthRecord> latest(HttpServletRequest request) {
        Long userId = (Long) request.getAttribute("userId");
        HealthRecord record = healthRecordService.getOne(new LambdaQueryWrapper<HealthRecord>()
                .eq(HealthRecord::getUserId, userId).orderByDesc(HealthRecord::getRecordDate).last("LIMIT 1"));
        return Result.success(record);
    }

    @GetMapping("/trend")
    public Result<?> trend(@RequestParam(defaultValue = "30") Integer days, HttpServletRequest request) {
        Long userId = (Long) request.getAttribute("userId");
        LocalDate startDate = LocalDate.now().minusDays(days);
        List<HealthRecord> records = healthRecordService.list(new LambdaQueryWrapper<HealthRecord>()
                .eq(HealthRecord::getUserId, userId).ge(HealthRecord::getRecordDate, startDate)
                .orderByAsc(HealthRecord::getRecordDate));
        return Result.success(records);
    }

    private void calculateBmi(HealthRecord record) {
        if (record.getHeight() != null && record.getWeight() != null
                && record.getHeight().compareTo(BigDecimal.ZERO) > 0) {
            BigDecimal heightM = record.getHeight().divide(new BigDecimal("100"), 4, RoundingMode.HALF_UP);
            BigDecimal bmi = record.getWeight().divide(heightM.multiply(heightM), 1, RoundingMode.HALF_UP);
            record.setBmi(bmi);
        }
    }
}
