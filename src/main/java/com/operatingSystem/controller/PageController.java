package com.operatingSystem.controller;

//import net.sf.json.JSONObject;
//import com.alibaba.fastjson.JSONObject;
import com.operatingSystem.model.Picture;
import com.operatingSystem.model.User;
import com.operatingSystem.service.PictureService;
import com.operatingSystem.service.UserService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PageController {


    @Autowired
    private PictureService pictureService;
    @Autowired
    private UserService userService;
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

    @RequestMapping("/searchpic")
    public String goUserSearch(){

        return "/user/searchpic";
    }

    @RequestMapping("/user/addpic")
    public String goUserAddpic() {

        return "/user/addpic";
    }

    @RequestMapping("/user/editpicture")
    public String goUserAddpic(Model model, String url) {

//        Picture pic = new Picture();
//        try {
//            pic = pictureService.getPictureById(id);
//        }catch (Exception e){
//            System.out.println(e);
//        }
//        model.addAttribute("picture", JSONObject.fromObject(pic));
        model.addAttribute("url", url);
        System.out.println("url"+url);
//        model.addAttribute("picture", JSONObject.toJSON(pic));
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

    @RequestMapping(value = "/manage/edituser", method = RequestMethod.GET)
    public String goManageedituser(String id,Model model) {

        User user = new User();
        try {
            user = userService.getUserById(id);
        }catch (Exception e){
            System.out.println(e);
        }
//        model.addAttribute("user", JSONObject.toJSON(user));
//        System.out.println(JSONObject.toJSON(user));
        model.addAttribute("user", JSONObject.fromObject(user));
        System.out.println(JSONObject.fromObject(user));
        return "/manage/edituser";
    }
}
