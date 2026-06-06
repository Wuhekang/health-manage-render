package com.health.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.health.common.Result;
import com.health.entity.SysConfig;
import com.health.mapper.SysConfigMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/sys-config")
public class SysConfigController {

    @Autowired
    private SysConfigMapper sysConfigMapper;

    @GetMapping("/list")
    public Result<List<SysConfig>> list() {
        List<SysConfig> configs = sysConfigMapper.selectList(
                new LambdaQueryWrapper<SysConfig>().orderByAsc(SysConfig::getId));
        return Result.success(configs);
    }

    @GetMapping("/ai")
    public Result<Map<String, String>> aiConfig() {
        List<SysConfig> configs = sysConfigMapper.selectList(
                new LambdaQueryWrapper<SysConfig>().likeRight(SysConfig::getConfigKey, "ai_"));
        Map<String, String> map = configs.stream()
                .collect(Collectors.toMap(SysConfig::getConfigKey, SysConfig::getConfigValue));
        return Result.success(map);
    }

    @PutMapping
    public Result<?> update(@RequestBody SysConfig config) {
        sysConfigMapper.updateById(config);
        return Result.success();
    }

    @PutMapping("/batch")
    public Result<?> batchUpdate(@RequestBody List<SysConfig> configs) {
        for (SysConfig config : configs) {
            sysConfigMapper.updateById(config);
        }
        return Result.success();
    }
}
