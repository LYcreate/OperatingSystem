package com.operatingSystem.dao;

import com.operatingSystem.model.User;

import java.util.List;

public interface UserMapper {
//   public User getUserByIdAndPassword(User user);
   public List<User> getAllUsers() throws Exception;
   public User getUserByUsername(String username);
   public User getUserByUid(String userUid);
   public User getUserById(String id);
   public int insertOneUser(User user);
   public int deleteUserById(String id);
   public int updateUserSessionId(User user);
   public int updateOneUser(User user);

}
