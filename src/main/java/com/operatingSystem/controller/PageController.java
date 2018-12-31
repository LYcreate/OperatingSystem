package com.operatingSystem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PageController {


    /*
     测试
            */
    @RequestMapping(value = {"/","/home"}, method = RequestMethod.GET)
    public String goIndex(){

        return "index";
    }

    /*
     登陆页面
            */
    @RequestMapping("/login")
    public String goLogin(){

        return "login";
    }

    /*
    显示页面
    */
    @RequestMapping("/screen")
    public String goScreen(){

        return "screen";
    }

    /*
     图片控制部分
            */

    @RequestMapping("/manage/control")
    public String goManageIndex(){

        return "/manage/control";
    }


    /*
     图片管理部分
     权限：任意用户 包括设备
            */

    @RequestMapping("/user/piclist")
    public String goUserPiclist(){

        return "/user/piclist";
    }

    @RequestMapping("/user/searchpic")
    public String goUserSearch(){

        return "/user/searchpic";
    }

    @RequestMapping("/user/addpic")
    public String goUserAddpic() {

        return "/user/addpic";
    }

    @RequestMapping("/user/editpic")
    public String goUserEditpic() {

        return "/user/editpic";
    }

    /*
     用户与设备部分
     权限：管理员
            */
    @RequestMapping("/manage/userlist")
    public String goManageUserlist(){

        return "/manage/userlist";
    }

    @RequestMapping("/manage/adduser")
    public String goManageAdduser(){

        return "/manage/adduser";
    }

    @RequestMapping("/manage/edituser")
    public String goManageedituser(){

        return "/manage/edituser";
    }
}
