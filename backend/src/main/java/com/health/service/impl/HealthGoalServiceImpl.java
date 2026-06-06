package com.health.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.health.entity.HealthGoal;
import com.health.mapper.HealthGoalMapper;
import com.health.service.HealthGoalService;
import org.springframework.stereotype.Service;

@Service
public class HealthGoalServiceImpl extends ServiceImpl<HealthGoalMapper, HealthGoal> implements HealthGoalService {
}
