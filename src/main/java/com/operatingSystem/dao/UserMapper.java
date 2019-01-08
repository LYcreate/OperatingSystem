package com.operatingSystem.dao;

import com.operatingSystem.model.User;

import java.util.List;

public interface UserMapper {
   public User getUserByIdAndPassword(User user);
   public User getUserByUsername(String username);
   public User insertOneUser(User user);
   public int deleteUserById(User user);
   public List<User> getAllUsers() throws Exception;
   public User getUserByUid(String userUid);
   public int updateUserSessionId(User user);
}
