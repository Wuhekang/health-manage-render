package com.health.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.health.entity.ExerciseRecord;
import com.health.mapper.ExerciseRecordMapper;
import com.health.service.ExerciseRecordService;
import org.springframework.stereotype.Service;

@Service
public class ExerciseRecordServiceImpl extends ServiceImpl<ExerciseRecordMapper, ExerciseRecord> implements ExerciseRecordService {
}
