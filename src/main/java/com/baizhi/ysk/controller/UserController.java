package com.baizhi.ysk.controller;

import com.baizhi.ysk.entity.User;
import com.baizhi.ysk.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("login")
    public String login(String username, String password, String validateCode, HttpSession session) {
        try {
            User user = userService.login(username, password, validateCode, session);
            return "" + user.getType();
        } catch (Exception e) {
            return e.getMessage();
        }
    }


}
