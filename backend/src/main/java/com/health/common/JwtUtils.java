package com.health.common;

import cn.hutool.jwt.JWT;
import cn.hutool.jwt.signers.JWTSignerUtil;
import cn.hutool.jwt.signers.JWTSigner;

public class JwtUtils {

    private static final String SECRET = "health-management-secret-key-2026";
    private static final long EXPIRE_MS = 24 * 60 * 60 * 1000L;
    private static final JWTSigner SIGNER = JWTSignerUtil.hs256(SECRET.getBytes());

    public static String generateToken(Long userId, String role) {
        return JWT.create()
                .setPayload("userId", userId)
                .setPayload("role", role)
                .setPayload("expire", System.currentTimeMillis() + EXPIRE_MS)
                .sign(SIGNER);
    }

    public static Long getUserId(String token) {
        JWT jwt = JWT.of(token);
        return Long.valueOf(jwt.getPayload("userId").toString());
    }

    public static String getRole(String token) {
        JWT jwt = JWT.of(token);
        return jwt.getPayload("role").toString();
    }

    public static boolean isValid(String token) {
        try {
            JWT jwt = JWT.of(token);
            if (!jwt.verify(SIGNER)) {
                return false;
            }
            long expire = Long.parseLong(jwt.getPayload("expire").toString());
            return System.currentTimeMillis() < expire;
        } catch (Exception e) {
            return false;
        }
    }
}
