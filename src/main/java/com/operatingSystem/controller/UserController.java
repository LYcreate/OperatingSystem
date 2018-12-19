package com.operatingSystem.controller;

import com.operatingSystem.model.User;
import com.operatingSystem.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/test")
    public void test() throws Exception{
        User user = new User();
        user.setId(1);
        user.setPassword("admin");
        User us = userService.getUserByIdAndPassword(user);
        System.out.println(us.getName());
    }

}