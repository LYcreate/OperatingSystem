package com.operatingSystem.service.impl;

import com.operatingSystem.dao.UserMapper;
import com.operatingSystem.model.User;
import com.operatingSystem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User getUserByIdAndPassword(User user) throws Exception{
        return userMapper.getUserByIdAndPassword(user);
    }

    @Override
    public User insertOneUser(User user) throws Exception{
        return userMapper.insertOneUser(user);
    }
}
