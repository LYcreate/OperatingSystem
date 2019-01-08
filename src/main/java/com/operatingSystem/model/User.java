package com.operatingSystem.model;

import com.operatingSystem.Utils.MD5Encode;

import java.sql.Timestamp;
import java.util.Date;
import java.util.UUID;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
//
@Entity
@Table(name = "user")
public class User {

    public static String CURRENT_USER = "currentUser"; //当前用户

    public static enum Gender {
        MALE, // 男
        FEMAIL, // 女
    }

    public User() {
        super();
        ensureId();
        createDate = new Date();
        part = "-";
        sessionId="";
        System.out.println("使用了第一个");
    }

    public User(String uid, String name, String password, String userType, String part,String gender) {
        super();
        ensureId();
        this.uid = uid;
        this.username = name;
        this.setPassword(encryptPassword(password));
        this.createDate = new Date();
        this.userType = userType;
        this.part = part;
        this.gender=gender;
        this.sessionId="";
        System.out.println("使用了第二个");
    }

    private void ensureId() {
        this.setId(UUID.randomUUID().toString());
    }

    @Id
    private String id;

    private String username; // 姓名

    private String uid; // 学号

    private String password; // 登陆密码

    private Date loginDate; // 登录时间

    private Date createDate; // 创建时间

    private String userType;// 用户类型 学生0、管理员1、设备2

    private String gender; // 1-男 0-女

    private String part;

    private String sessionId;

    public String getSessionId() {
        return sessionId;
    }

    public void setSessionId(String SessionId) {
        this.sessionId = SessionId;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getLoginDate() {
        return loginDate;
    }

    public void setLoginDate(Date loginDate) {
        this.loginDate = loginDate;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getPart() {
        return part;
    }

    public void setPart(String part) {
        this.part = part;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }


    public String getTypeStr() {
        if (userType == "1") {
            return "管理员";
        } else if (userType == "0") {
            return "学生用户";
        } else {
            return "状态错误";
        }
    }

    public boolean isPasswordCorrect(String password) {
        return this.password.equals(MD5Encode.encode(password) + MD5Encode.encode(password));
    }

    public static String encryptPassword(String password) {
        return MD5Encode.encode(password) + MD5Encode.encode(password);
    }
}
//@Entity
//@Table(name = "User")
//public class User {
//    @Id
//    private int id;
//    private String name;
//    private String password;
//    private Timestamp createDate;
//    private Timestamp updateDate;
//
//    public int getId() {
//        return this.id;
//    }
//
//    public void setId(int id) {
//        this.id = id;
//    }
//
//    public String getName() {
//        return this.name;
//    }
//
//    public void setName(String name) {
//        this.name = name;
//    }
//
//    public String getPassword() {
//        return this.password;
//    }
//
//    public void setPassword(String password) {
//        this.password = password;
//    }
//
//    public Timestamp getCreateDate() {
//        return this.createDate;
//    }
//
//    public void setCreateDate(Timestamp createDate) {
//        this.createDate = createDate;
//    }
//
//    public Timestamp getUpdateDate() {
//        return this.updateDate;
//    }
//
//    public void setUpdateDate(Timestamp updateDate) {
//        this.updateDate = updateDate;
//    }
//
//    public String toString() {
//        return "User{id=" + this.id + ", name='" + this.name + '\'' + ", password='" + this.password + '\'' + ", createDate=" + this.createDate + ", updateDate=" + this.updateDate + '}';
//    }
//
//    public User() {
//    }
//}
