package com.operatingSystem.Utils;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class WebAppConfig extends WebMvcConfigurerAdapter {

    //@Value("${upload.dir}")
//    @Value("${uploadpath}")
//    public String ImgBase;
//    public final static  String ImgBase = "D:\\ImgBase";
//
//    @Override
//    public void addResourceHandlers(ResourceHandlerRegistry registry) {
//        registry.addResourceHandler("/ImgFiles/backgroundImg/**").addResourceLocations(ImgBase);
//        registry.addResourceHandler("/imgs/**").addResourceLocations(ImgBase);
//        super.addResourceHandlers(registry);
//    }
}