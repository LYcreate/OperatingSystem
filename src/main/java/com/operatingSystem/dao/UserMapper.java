package com.operatingSystem.dao;

import com.operatingSystem.model.User;

import java.util.List;

public interface UserMapper {
   public User getUserByIdAndPassword(User user);
   public User getUserByUsername(String username);
   public int insertOneUser(User user);
   public int deleteUserById(String id);
   public List<User> getAllUsers() throws Exception;
   public User getUserByUid(String userUid);
   public int updateUserSessionId(User user);
}
