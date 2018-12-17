package com.baizhi.ysk.serviceimpl;

import com.baizhi.ysk.entity.User;
import com.baizhi.ysk.mapper.UserMapper;
import com.baizhi.ysk.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public User login(String username, String passwword, String code, HttpSession session) {
        String vcode = (String) session.getAttribute("code");
        if (!vcode.equals(code)) throw new RuntimeException("验证码错误!");
        User t = new User();
        t.setUsername(username);
        User user = userMapper.selectOne(t);
        if (user == null) throw new RuntimeException("用户不存在!");
        if (!user.getPassword().equals(passwword)) throw new RuntimeException("密码错误!");
        session.setAttribute("user", user);
        return user;
    }
}
