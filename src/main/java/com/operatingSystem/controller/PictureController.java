package com.operatingSystem.controller;
import com.operatingSystem.model.Picture;
import com.operatingSystem.service.PictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.*;
import java.util.List;

@Controller
public class PictureController {

    @Autowired
    private PictureService pictureService;

    @RequestMapping(value = "/gettestpiclist",    method = RequestMethod.GET)
    public @ResponseBody
    List<String> test() throws Exception{
        List testPics = new ArrayList();
        testPics.add("/screenos/imgs/16124400poster[7].jpg");
        testPics.add("/screenos/imgs/16124400poster[8].jpg");
        testPics.add("/screenos/imgs/16124400poster[9].jpg");
        testPics.add("/screenos/imgs/16124400poster[10].jpg");
        return testPics;
    }

    @RequestMapping(value = "/getallpics",    method = RequestMethod.GET)
    public @ResponseBody List<Picture> getAllpics() throws Exception{
        System.out.println("getAllpics!");
        List<Picture> pics = pictureService.getAllPictures();
        return pics;
    }

    @RequestMapping(value = "/getpicbypicname",    method = RequestMethod.GET)
    public @ResponseBody List<Picture> getPicByPicname(
            @RequestParam String picname) throws Exception{
        System.out.println("getpicbyname!");
        List<Picture> pics = pictureService.getPictureByPicturename(picname);
        return pics;
    }

    @RequestMapping(value = "/getpicbyid",    method = RequestMethod.GET)
    public @ResponseBody Picture getPicById(
            @RequestParam String id) throws Exception{
        System.out.println("getpicbyid!");
        Picture pic = pictureService.getPictureById(id);
        return pic;
    }
}
