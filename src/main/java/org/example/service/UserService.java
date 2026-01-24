package org.example.service;

import org.example.domain.UserVO;
import org.example.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;

    public UserVO login(String username, String password) {
        UserVO user = userMapper.findByUsername(username);
        return (user != null && user.getPassword().equals(password)) ? user : null;
    }

    public void register(UserVO user) {
        userMapper.register(user);
    }

    public boolean exists(String username){
        return userMapper.countByUsername(username) > 0;
    }
}