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

import java.awt.*;
import java.util.*;
import java.util.List;

@RestController
public class PictureController {

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
}
