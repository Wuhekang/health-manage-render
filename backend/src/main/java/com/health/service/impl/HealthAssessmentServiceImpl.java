package com.health.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.health.entity.HealthAssessment;
import com.health.mapper.HealthAssessmentMapper;
import com.health.service.HealthAssessmentService;
import org.springframework.stereotype.Service;

@Service
public class HealthAssessmentServiceImpl extends ServiceImpl<HealthAssessmentMapper, HealthAssessment> implements HealthAssessmentService {
}
