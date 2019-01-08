package com.operatingSystem.controller;
import com.operatingSystem.Utils.ImageReptile;
import com.operatingSystem.Utils.NetResult;
import com.operatingSystem.model.Picture;
import com.operatingSystem.model.User;
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

    @RequestMapping(value = "/getallpics")
    public @ResponseBody List<Picture> getAllpics() throws Exception{
        System.out.println("getAllpics!");
        List<Picture> pics = pictureService.getAllPictures();
        return pics;
    }

    @RequestMapping(value = "/getallpictrues" )
    public @ResponseBody List<Picture> getAllpictrues() throws Exception{
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
        //String id = ((User)request.getSession().getAttribute(User.CURRENT_USER)).getUid();
        uploadImageMap = uploadResolver.uploadImgByStream(file,"16124400");
        return uploadImageMap;
    }

    @RequestMapping(value = "/uploadImgBase")
    public @ResponseBody Map<String, String> upload4(
            String imgBase64,
            String fileName,
            HttpServletRequest request,
            HttpServletResponse response) {
        Map<String, String> uploadImageMap  =  new HashMap<>();
        //String userUid = ((User) request.getSession().getAttribute(User.CURRENT_USER)).getUid();
        System.out.println("imgBase64"+imgBase64);
        System.out.println("fileName"+fileName);
        UploadResolver uploadResolver = new UploadResolver();
        uploadImageMap = uploadResolver.uploadImgBase(imgBase64,fileName,"16124400",response);
        return uploadImageMap;
    }

    @RequestMapping(value = "/user/savePicture")
//    @RequestMapping(value = "/savePicture")
    public @ResponseBody NetResult saveAct(
                            @RequestParam String picturename,
                            @RequestParam String url,
                            @RequestParam String realpath,
                            @RequestParam Integer picsize,
                            @RequestParam String endDate) {
        NetResult r = new NetResult();
        String suber = "16124400";
//        String realpath= "none";
//        Integer picsize = 0;
        try {
            Picture picture = new Picture(picturename,url,endDate,suber,realpath,picsize);
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

    @RequestMapping(value = "/searchpictrues")
    public @ResponseBody NetResult onlineSearch(
            String keyword,
            String num,
            String batch) {
        NetResult result = new NetResult();
        ImageReptile i = new ImageReptile();
        result.status = 0;
        result.result = i.OnlineSearch(keyword,num,batch);
        return result;
    }

    @RequestMapping(value = "/getorgipictrues")
    public @ResponseBody NetResult getOrgiPictrues(
            String orginalfilename) {
        NetResult result = new NetResult();
        ImageReptile i = new ImageReptile();
        result.status = 0;
        result.result = i.DownloadFullImage(orginalfilename);
        return result;
    }

    @RequestMapping(value = "/deletepictrue")
    public NetResult deletePicture(@RequestParam String id) {
        try {
            int an = pictureService.deletePictureById(id);
            System.out.println(an);
            System.out.println("an");
        }catch (Exception e){
            System.out.println(e);
        }
        NetResult result = new NetResult();
        result.status = 0;
        result.result = "删除成功";
        return result;
    }
}
