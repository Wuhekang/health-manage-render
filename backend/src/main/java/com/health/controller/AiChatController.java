package com.health.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.health.common.Result;
import com.health.entity.AiChatRecord;
import com.health.mapper.AiChatRecordMapper;
import com.health.service.AiService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/ai-chat")
public class AiChatController {

    @Autowired
    private AiService aiService;
    @Autowired
    private AiChatRecordMapper aiChatRecordMapper;

    @PostMapping("/send")
    public Result<?> send(@RequestBody Map<String, String> params, HttpServletRequest request) {
        Long userId = (Long) request.getAttribute("userId");
        String message = params.get("message");
        if (message == null || message.isBlank()) {
            throw new RuntimeException("消息不能为空");
        }

        String reply = aiService.chat(message);

        AiChatRecord record = new AiChatRecord();
        record.setUserId(userId);
        record.setUserMessage(message);
        record.setAiResponse(reply);
        aiChatRecordMapper.insert(record);

        return Result.success(Map.of("reply", reply));
    }

    @GetMapping("/history")
    public Result<?> history(@RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "20") Integer pageSize,
                             HttpServletRequest request) {
        Long userId = (Long) request.getAttribute("userId");
        Page<AiChatRecord> page = new Page<>(pageNum, pageSize);
        aiChatRecordMapper.selectPage(page, new LambdaQueryWrapper<AiChatRecord>()
                .eq(AiChatRecord::getUserId, userId).orderByAsc(AiChatRecord::getCreateTime));
        return Result.success(page);
    }

    @DeleteMapping("/clear")
    public Result<?> clear(HttpServletRequest request) {
        Long userId = (Long) request.getAttribute("userId");
        aiChatRecordMapper.delete(new LambdaQueryWrapper<AiChatRecord>().eq(AiChatRecord::getUserId, userId));
        return Result.success();
    }
}
