package com.health.interceptor;

import cn.hutool.core.util.StrUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.health.common.JwtUtils;
import com.health.common.Result;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import java.io.IOException;
import java.util.List;

@Component
public class JwtInterceptor implements HandlerInterceptor {

    private static final List<String> ADMIN_PATHS = List.of(
            "/user/list", "/user/add", "/user/delete",
            "/health-knowledge/add", "/health-knowledge/update", "/health-knowledge/delete",
            "/notice/add", "/notice/update", "/notice/delete",
            "/dashboard/admin-stats",
            "/health-record/all",
            "/sys-config"
    );

    private final ObjectMapper objectMapper = new ObjectMapper();

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if ("OPTIONS".equalsIgnoreCase(request.getMethod())) {
            return true;
        }

        String token = request.getHeader("Authorization");
        if (StrUtil.isNotBlank(token) && token.startsWith("Bearer ")) {
            token = token.substring(7);
        }

        if (StrUtil.isBlank(token) || !JwtUtils.isValid(token)) {
            writeError(response, 401, "请先登录");
            return false;
        }

        Long userId = JwtUtils.getUserId(token);
        String role = JwtUtils.getRole(token);
        request.setAttribute("userId", userId);
        request.setAttribute("userRole", role);

        String path = request.getRequestURI();
        String method = request.getMethod();
        if (isAdminOnly(path, method) && !"admin".equals(role)) {
            writeError(response, 403, "权限不足");
            return false;
        }

        return true;
    }

    private boolean isAdminOnly(String path, String method) {
        for (String adminPath : ADMIN_PATHS) {
            if (path.contains(adminPath)) {
                return true;
            }
        }
        if (path.startsWith("/user") && ("POST".equals(method) || "DELETE".equals(method))) {
            return true;
        }
        return false;
    }

    private void writeError(HttpServletResponse response, int code, String msg) throws IOException {
        response.setStatus(code);
        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().write(objectMapper.writeValueAsString(Result.error(code, msg)));
    }
}
