package com.operatingSystem.service;

import com.operatingSystem.model.User;

import java.util.List;

public interface UserService {
    public List<User> getAllUsers() throws Exception;
    public User getUserByUsername(String username) throws Exception;
    public User getUserByIdAndPassword(User user) throws Exception;
    public int insertOneUser(User user) throws Exception;
    public int deleteUserById(String id) throws Exception;
}
