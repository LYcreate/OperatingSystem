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

    @RequestMapping(value = "/test",    method = RequestMethod.GET)
    public @ResponseBody NetResult test() throws Exception{
        System.out.println("imin");
        User user = new User();
        NetResult NetResult = new NetResult();
        user.setId("1");
        user.setPassword("admin");
        User us = userService.getUserByIdAndPassword(user);
        System.out.println(us.getUsername());
        NetResult.status=1;
        NetResult.result=us.getUsername();
        return NetResult;
    }

    @RequestMapping(value = "/user/login",method = RequestMethod.POST)
    public @ResponseBody NetResult login(HttpServletRequest request) throws Exception{
        NetResult netResult=new NetResult();
        String uid=request.getParameter("uid");
        System.out.println(uid);
        User user=userService.getUserByUid(uid);
        if (user==null){
            netResult.status=1;
            netResult.result="Username dosen't exit!";
        }else {
            String password=request.getParameter("password");
            if (password.equals(user.getPassword())){
                netResult.status=0;
                netResult.result="Successfully login!";
                request.getSession().setAttribute(User.CURRENT_USER,user);
                String sessionId=request.getSession().getId();
                user.setSessionId(sessionId);
                userService.updateUserSessionId(user);
            }else {
                netResult.status=1;
                netResult.result="Password error!";
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

    @RequestMapping(value = "/deleteUser",method = RequestMethod.GET)
    public NetResult deleteUser(@RequestParam String id) {
        User user = new User();
        user.setId(id);
        try {
            int an = userService.deleteUserById(user);
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
        try{
            user = userService.insertOneUser(user);
        }catch (Exception e)
        {
            System.out.println(e);
        }
        NetResult result = new NetResult();
        System.out.println(user.getId());
        result.status = 0;
        result.result = "上传成功";
        return result;
    }

}