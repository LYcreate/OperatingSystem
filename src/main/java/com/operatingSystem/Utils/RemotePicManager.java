package com.operatingSystem.Utils;

import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;
import com.qiniu.util.Base64;
import com.qiniu.util.StringMap;
import com.qiniu.util.UrlSafeBase64;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

/**
 * @author alan
 * @create 2019-01-26 下午2:02
 */

public class RemotePicManager {
    private Configuration cfg;
    private UploadManager uploadManager;
    private String accessKey;
    private String secretKey;
    private String bucketname;
    private Auth auth;
    private String URL;
    private String domainOfBucket;

    /**
     * @param accessKey 七牛云的密钥
     * @param secretKey　七牛云的密钥
     * @param bucket　七牛云存储空间的名字，自行定义
     * @param URL　七牛云上传用的域名
     * @param domainOfBucket 七牛云存储空间绑定的域名，目前采用的是公共空间
     */
    public RemotePicManager(String accessKey, String secretKey, String bucket, String URL, String domainOfBucket) {
        this.accessKey = accessKey;
        this.secretKey = secretKey;
        this.auth = Auth.create(accessKey, secretKey);
        this.bucketname = bucket;
        this.URL = URL;
        this.domainOfBucket = domainOfBucket;
    }

    /**
     * 生成Token
     * @param key 远程图床的文件名
     * @return 上传凭证, 有效时间一个小时
     */
    public String getUpToken(String key) {
        return auth.uploadToken(bucketname, key, 3600, new StringMap().put("insertOnly", 1));
    }

    /**
     * 上传本地文件
     * @param localFilePath 本地图片路径
     * @param key　远程图床的文件名
     * @return message: 成功的话返回OK, code: 返回200,　404等
     * @throws Exception
     */
    public Map<String, String> uploadLocalImage(String localFilePath, String key) throws Exception {
        FileInputStream fis = null;
        int length = (int) (new File(localFilePath).length());
        byte[] src = new byte[length];
        fis = new FileInputStream(new File(localFilePath));
        fis.read(src);
        String file64 = Base64.encodeToString(src, 0);
        Map<String, String> retMap = uploadBase64Image(length, file64, key);

        return retMap;
    }

    /**
     * 上传Base64编码以后的文件
     * @param length 文件大小,直接填写-1表示根据request body确定文件大小
     * @param file64　Base64编码以后的文件
     * @param key　远程图床文件名
     * @return response
     * @throws Exception
     */
    public Map<String, String> uploadBase64Image(int length, String file64, String key) throws Exception {
        String url =  URL + length + "/key/" + UrlSafeBase64.encodeToString(key);
        RequestBody rb = RequestBody.create(null, file64);
        Request request = new Request.Builder().
                url(url).
                addHeader("Content-Type", "application/octet-stream")
                .addHeader("Authorization", "UpToken " + getUpToken(key))
                .post(rb).build();
        System.out.println(request.headers());
        OkHttpClient client = new OkHttpClient();
        Response response = client.newCall(request).execute();

        HashMap<String, String> retMap = new HashMap<>();
        retMap.put("message", response.message());
        retMap.put("code", Integer.toString(response.code()));

        return retMap;
    }

    /**
     * 获取下载链接
     * @param key 远程图床文件名
     * @return 下载链接
     * @throws Exception
     */
    public String getDownloadURL(String key) throws Exception {
        String encodedFileName = URLEncoder.encode(key, "utf-8");
        String finalURL = String.format("%s/%s", domainOfBucket, encodedFileName);
        return finalURL;
    }

    public static void main(String... args) throws Exception {
        // 上传链接选择了华南地区和bucket创建的地区一致, domainOfBucket可以在七牛云存储的存储空间管理页面的内容管理找到，也可以自行绑定
        // 目前采用的是公共空间，创建时记得勾选公共空间, URL根据不同地区更换"/put64"前面部分即可, accesskey和secretkey在七牛获取
//        RemotePicManager manager = new RemotePicManager("ACCESSKEY",
//                                                        "SECRETKEY",
//                                                        "stupidspace",
//                                                        "http://upload-z2.qiniup.com/putb64/",
//                                                        "domainOfBucket");
//        System.out.println(manager.uploadLocalImage("/home/alan/Pictures/1_15512M043.jpg", "tusiji.jpg"));
//        System.out.println(manager.getDownloadURL("tusiji.jpg"));
    }
}
