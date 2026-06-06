package com.health.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.health.entity.HealthKnowledge;
import com.health.mapper.HealthKnowledgeMapper;
import com.health.service.HealthKnowledgeService;
import org.springframework.stereotype.Service;

@Service
public class HealthKnowledgeServiceImpl extends ServiceImpl<HealthKnowledgeMapper, HealthKnowledge> implements HealthKnowledgeService {
}
