package com.operatingSystem.service;

import com.operatingSystem.model.User;

import java.util.List;

public interface UserService {
    public List<User> getAllUsers() throws Exception;

    public User getUserByUsername(String username) throws Exception;

//    public User getUserByIdAndPassword(User user) throws Exception;

    public User getUserByUid(String uid);

    public int updateUserSessionId(User user);

    public int insertOneUser(User user) throws Exception;

    public int deleteUserById(String id) throws Exception;

    public User getUserById(String id) throws Exception;

    public int updateOneUser(User user) throws Exception;
}
