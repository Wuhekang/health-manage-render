package com.health.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.health.entity.User;

public interface UserService extends IService<User> {

    User login(String username, String password);

    void register(User user);
}
