package com.operatingSystem.controller;
import com.operatingSystem.Utils.NetResult;
import com.operatingSystem.model.Picture;
import com.operatingSystem.service.PictureService;
import com.operatingSystem.Utils.UploadResolver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.util.*;
import java.util.List;

@RestController
public class PictureController {

    @Autowired
    private PictureService pictureService;

    @RequestMapping(value = "/gettestpiclist",    method = RequestMethod.GET)
    public @ResponseBody
    List<String> test() throws Exception{
        List testPics = new ArrayList();
        testPics.add("/screenos/images/16124400poster[7].jpg");
        testPics.add("/screenos/images/16124400poster[8].jpg");
        testPics.add("/screenos/images/16124400poster[9].jpg");
        testPics.add("/screenos/images/16124400poster[10].jpg");
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

//    @RequestMapping(value = "/user/saveAct", method = RequestMethod.POST)
//    public NetResult saveAct(@RequestParam String actname,
//                             @RequestParam String picture,
//                             @RequestParam String endDate,
//                             @RequestParam String address,
//                             HttpSession session) {
//        User user = (User)session.getAttribute(User.CURRENT_USER);
//        NetResult r = new NetResult();
//        String suber = user.getUsername();
//        Act act = new Act(actname, picture, endDate, suber==null?"123456":suber, address);
//        actRepository.save(act);
//        r.result="你的图片有问题";
//        r.status=0;
//        return r;
//    }

//
    @RequestMapping(value = "/user/upload")
    public @ResponseBody Map<String, String> upload2(@RequestParam MultipartFile file, HttpServletRequest request) {
        Map<String, String> uploadImageMap  =  new HashMap<>();
        System.out.println(file.getOriginalFilename());
        System.out.println(file.getSize());
        if(file.isEmpty())
        {
            System.out.println("wenjiankong");
        }else{
            System.out.println("wenjianbukong");
        }
        System.out.println(request.toString());
        UploadResolver uploadResolver = new UploadResolver();
        uploadImageMap = uploadResolver.uploadImgByStream(file,request);
        return uploadImageMap;
    }

    @RequestMapping(value = "/uploadImgBase")
    public @ResponseBody Map<String, String> upload4(
            String imgBase64,
            String fileName,
            HttpServletRequest request,
            HttpServletResponse response) {
        Map<String, String> uploadImageMap  =  new HashMap<>();
        System.out.println("imgBase64"+imgBase64);
        System.out.println("fileName"+fileName);
        UploadResolver uploadResolver = new UploadResolver();
        uploadImageMap = uploadResolver.uploadImgBase(imgBase64,fileName,request,response);
        return uploadImageMap;
    }

    @RequestMapping(value = "/user/savePicture", method = RequestMethod.GET)
//    @RequestMapping(value = "/savePicture")
    public @ResponseBody NetResult saveAct(@RequestParam String picturename,
                             @RequestParam String url,
                             @RequestParam String endDate) {
        NetResult r = new NetResult();
        String suber = "16124400";
        try {
            Picture picture = new Picture(picturename,url,endDate,suber);
            pictureService.insertOnePicture(picture);
            r.result="ok";
            r.status=1;
        }catch (Exception e){
            r.result="notok";
            r.status=0;
            System.out.println(e);
        }
        return r;
    }

}
