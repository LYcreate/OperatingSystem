package com.operatingSystem.controller;

import com.operatingSystem.Utils.NetResult;
import com.operatingSystem.model.User;
import com.operatingSystem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@RestController
public class UserController {

    @Autowired
    private UserService userService;

//    @RequestMapping(value = "/test",    method = RequestMethod.GET)
//    public @ResponseBody NetResult test() throws Exception{
//        System.out.println("imin");
//        User user = new User();
//        NetResult NetResult = new NetResult();
//        user.setId("1");
//        user.setPassword("admin");
//        User us = userService.getUserByIdAndPassword(user);
//        System.out.println(us.getUsername());
//        NetResult.status=1;
//        NetResult.result=us.getUsername();
//        return NetResult;
//    }

    @RequestMapping(value = "/user/login",method = RequestMethod.POST)
    public @ResponseBody NetResult login(HttpServletRequest request) throws Exception{
        NetResult netResult=new NetResult();
        String uid=request.getParameter("uid");
        System.out.println(uid);
        User user=userService.getUserByUid(uid);
        if (user==null){
            netResult.status=1;
            netResult.result="用户不存在!";
        }else {
            String password=request.getParameter("password");
            if (password.equals(user.getPassword())){
                netResult.status=0;
                netResult.result="成功登录!";
                request.getSession().setAttribute(User.CURRENT_USER,user);
                String sessionId=request.getSession().getId();
                user.setSessionId(sessionId);
                userService.updateUserSessionId(user);
            }else {
                netResult.status=1;
                netResult.result="密码错误!";
            }
        }
        return netResult;
    }
    @RequestMapping(value = "/getallusers")
    public @ResponseBody
        List<User> getAllusers() throws Exception{
        System.out.println("getAllpics!");
        List<User> pics = userService.getAllUsers();
        return pics;
    }

    @RequestMapping(value = "/getuserbyusername",    method = RequestMethod.GET)
    public @ResponseBody User getPicByPicname(
            @RequestParam String username) throws Exception{
        System.out.println("getpicbyname!");
        User pics = userService.getUserByUsername(username);
        return pics;
    }

    @RequestMapping(value = "/deleteuser")
    public NetResult deleteUser(@RequestParam String id) {
//        User user = new User();
//        user.setId(id);
        try {
            int an = userService.deleteUserById(id);
        }catch (Exception e)
        {
            System.out.println(e);
        }
        NetResult result = new NetResult();
//        if(an>0) {
            result.status = 0;
            result.result = "删除成功";
//        }else{
//            result.status = 1;
//            result.result = "删除失败";
//        }
        return result;
    }

    @RequestMapping(value = "/user/saveUser")
    public @ResponseBody NetResult saveUser(
            @RequestParam String username,
            @RequestParam String uid,
            @RequestParam String password,
            @RequestParam String userType,
            @RequestParam String gender,
            @RequestParam String part) {
        User user = new User(uid, username, password,userType,part,gender);
        NetResult result = new NetResult();
        try{
            userService.insertOneUser(user);
            result.status = 0;
            result.result = "保存成功";
            System.out.println("SAVEUSER");
            System.out.println(result.result);
        }catch (Exception e)
        {
            System.out.println(e);
            result.status = 1;
            result.result = "保存失败";
            System.out.println("SAVEUSER");
            System.out.println(result.result);
        }

        return result;
    }

    @RequestMapping(value = "/user/editUser")
    public @ResponseBody NetResult editUser(
            @RequestParam String id,
            @RequestParam String username,
            @RequestParam String uid,
            @RequestParam String password,
            @RequestParam String userType,
            @RequestParam String gender,
            @RequestParam String part) {
        System.out.println("id:"+id);
        User dbuser = new User(uid, username, password,userType,part,gender);
        NetResult result = new NetResult();
        try {
            dbuser = userService.getUserById(id);
            dbuser.setGender(gender);
            dbuser.setUserType(userType);
            dbuser.setPart(part);
            dbuser.setPassword(password);
            dbuser.setUsername(username);
            dbuser.setUid(uid);
        }catch (Exception e)
        {
            System.out.println(e);
            System.out.println("dbuser查库失败");
        }
        try{
            System.out.println("dbuserid:"+dbuser.getId());
            userService.updateOneUser(dbuser);
            result.status = 0;
            result.result = "更新成功";
            System.out.println("editUSER");
            System.out.println(result.result);
        }catch (Exception e)
        {
            System.out.println(e);
            result.status = 1;
            result.result = "更新失败";
            System.out.println("editUSER");
            System.out.println(result.result);
        }
        return result;
    }

//    @RequestMapping(value = "/manage/deleteUser",method = RequestMethod.GET)
//    public NetResult deleteUser(User user) {
//        userService.deleteUserById(user);
//        NetResult result = new NetResult();
//        result.status = 0;
//        result.result = "删除成功";
//        return result;
//    }

}