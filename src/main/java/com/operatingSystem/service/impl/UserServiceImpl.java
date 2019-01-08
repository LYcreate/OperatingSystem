package com.operatingSystem.service.impl;

import com.operatingSystem.dao.UserMapper;
import com.operatingSystem.model.Picture;
import com.operatingSystem.model.User;
import com.operatingSystem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User getUserByIdAndPassword(User user) throws Exception{
        return userMapper.getUserByIdAndPassword(user);
    }

    @Override
    public User getUserByUsername(String username) throws Exception{

        return userMapper.getUserByUsername(username);
    }

    @Override
    public int insertOneUser(User user) throws Exception{
        return userMapper.insertOneUser(user);
    }

    @Override
    public List<User> getAllUsers() throws Exception{
        return userMapper.getAllUsers();
    }

    @Override
    public int deleteUserById(User user) throws Exception{
        return userMapper.deleteUserById(user);
    }
}
