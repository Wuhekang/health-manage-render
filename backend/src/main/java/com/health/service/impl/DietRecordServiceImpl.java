package com.health.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.health.entity.DietRecord;
import com.health.mapper.DietRecordMapper;
import com.health.service.DietRecordService;
import org.springframework.stereotype.Service;

@Service
public class DietRecordServiceImpl extends ServiceImpl<DietRecordMapper, DietRecord> implements DietRecordService {
}
