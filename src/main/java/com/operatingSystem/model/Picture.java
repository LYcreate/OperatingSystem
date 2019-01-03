package com.operatingSystem.model;

import javax.persistence.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@Entity
@Table(name = "picture")
public class Picture {

    public Picture(){
        super();
        ensureId();
        subDate = new Date();
    }

    public Picture(String picturename, String url,String endDate, String suber,
                    String realpath, Integer picsize) {
        super();
        ensureId();
        subDate = new Date();
        this.setPicturename(picturename);
        this.setUrl(url);
        this.setEndDate(endDate);
        this.setSuber(suber);
        this.setPicsize(picsize);
        this.setRealpath(realpath);
        this.hide="1";
    }

    public Picture(String picturename, String url,String endDate, String suber) {
        super();
        ensureId();
        this.subDate = new Date();
        this.setPicturename(picturename);
        this.setUrl(url);
        this.setEndDate(endDate);
        this.setSuber(suber);
        this.hide="1";
    }

    private void ensureId() {
        this.setId(UUID.randomUUID().toString());
    }

    @Id
    private String id;

    private String picturename; // 活动名字

    private String url;//图片请求地址

    private String realpath;//图片真实路径

    @Temporal(value = TemporalType.DATE)
    private Date subDate; // 投放时间

    @Temporal(value = TemporalType.DATE)
    private Date endDate; // 结束时间

    private String suber;//投稿人

    private Integer picsize;//投稿人

    private String hide;//是否隐藏   1yes 0no

    public String getHide() {
        return hide;
    }

    public void setHide(String hide) {
        this.hide = hide;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPicturename() {
        return picturename;
    }

    public void setPicturename(String picturename) {
        this.picturename = picturename;
    }

    public String getUrl() {
        if (url == null) {
            return "imgs/defaultpic.png";
        }
        return url;
    }

    public Picture setUrl(String url) {
        this.url = url;
        return this;
    }

    public String getRealpath() {
        if (realpath == null) {
            return "imgs/defaultpic.png";
        }
        return realpath;
    }

    public void  setRealpath(String realpath) {
        this.realpath = realpath;
    }

    public Date getSubDate() {
        return subDate;
    }

    public void setSubDate(Date subDate) {
        this.subDate = subDate;
    }

    public Integer getPicsize() {
        return picsize;
    }

    public void setPicsize(Integer picsize) {
        this.picsize = picsize;
    }


    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        try{
            SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd");
            Date d=sdf.parse(endDate);
            this.endDate = d;
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    public String getSuber() {
        return suber;
    }

    public void setSuber(String suber) {
        this.suber = suber;
    }
}
