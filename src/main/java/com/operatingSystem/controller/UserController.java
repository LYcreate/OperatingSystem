package com.operatingSystem.controller;

import com.operatingSystem.Utils.NetResult;
import com.operatingSystem.model.User;
import com.operatingSystem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

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

}