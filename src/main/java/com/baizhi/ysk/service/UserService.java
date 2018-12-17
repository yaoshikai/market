package com.baizhi.ysk.service;

import com.baizhi.ysk.entity.User;

import javax.servlet.http.HttpSession;

public interface UserService {
    User login(String username, String passwword, String code, HttpSession session);
}
