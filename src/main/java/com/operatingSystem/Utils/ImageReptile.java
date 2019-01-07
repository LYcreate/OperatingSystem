package com.operatingSystem.Utils;

import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ImageReptile {
    // 获取img标签及对应网站链接正则
    private static final String downloadURL= "https://wallpapers.wallhaven.cc/wallpapers/full/wallhaven-%%.jpg" ;
    private static final String downloadURL2= "https://wallpapers.wallhaven.cc/wallpapers/full/wallhaven-%%.png" ;
    // 下载大图连接
    private static final String searchURL = "https://alpha.wallhaven.cc/search?q=%%&categories=111&purity=100&sorting=relevance&order=desc&page=2";
    // 下载小图网站
    private static final String IMGURL = "<figure(.*?)><img(.*?)>" ;
    // 获取src大图路径的正则
    private static final String IMGSRC_HTML = "/(.*?)\\.html";
    // 获取src路径的正则
    private static final String IMGSRC_REG = "https:(.*?)\\.jpg";
    private static final String IMG = "<img(.*?)>";
    private static final String sep = File.separator;
    private static final String PATH = "D:"+sep+"Image"+sep;
    private JSONObject result = new JSONObject();
    private JSONArray resultList = new JSONArray();

    ImageReptile(){
        result.put("resultList",resultList);
        result.put("total","0");
        result.put("position","0");
        result.put("number", "0");
        result.put("batch", "0");
        result.put("keyword", "NO keyword");

    }
    public static void  main(String...args){
        ImageReptile ima = new ImageReptile();
        JSONObject ASD = ima.OnlineSearch("fate","20","1");
    }
    //搜索功能
    //batch未实现
    public JSONObject OnlineSearch(String keyword,String num,String batch){
        String search =  searchURL.replace("%%",keyword);
        try{
            //获取html文本内容
            String document = this.getHtml(search);
            result.put("keyword",keyword);
            //获取imgSrc
            List<String> imgSrc = this.getImage(document);
            //下载小图
            this.Download(imgSrc,num);
            //下载大图
            //this.DownloadFullImage(downloadURL,imgSrc.get(0));

        }catch(Exception e){
            System.out.println("Error");
        }
        System.out.println(result);
        return result;
    }
    //获取HTML内容
    private String getHtml(String url)throws Exception{
        URL url1=new URL(url);
        URLConnection connection=url1.openConnection();
        connection.setRequestProperty("User-agent","Mozilla/5.0 (Windows NT 10.0; Win64; x64)");
        InputStream in=connection.getInputStream();
        InputStreamReader isr=new InputStreamReader(in);
        BufferedReader br=new BufferedReader(isr);
        String line;
        StringBuffer sb=new StringBuffer();
        while((line=br.readLine())!=null){
            sb.append(line,0,line.length());
            sb.append('\n');
        }
        br.close();
        isr.close();
        in.close();
        return sb.toString();
    }

    //获取IMG标签内容
    private List<String> getImage(String html){
        Matcher matcher=Pattern.compile(IMGURL).matcher(html);
        List<String>listimgurl=new ArrayList<String>();
        while (matcher.find()){
            listimgurl.add(matcher.group());
        }
        System.out.println(listimgurl);
        System.out.println(listimgurl.size());
        List<String> listimgSrc = this.getImageSrc(listimgurl);
        return listimgSrc;
    }

    //获取ImageSrc地址
    private List<String> getImageSrc(List<String> listimageurl) {
        List<String> listImage = new ArrayList<String>();
        for (String image : listimageurl) {
            Matcher matcher = Pattern.compile(IMG).matcher(image);
            while (matcher.find()) {
                listImage.add(matcher.group());
            }
        }
        System.out.println(listImage);
        List<String> listImageSrc = new ArrayList<String>();
        for (String image : listImage) {
            Matcher matcher = Pattern.compile(IMGSRC_REG).matcher(image);
            while (matcher.find()) {
                listImageSrc.add(matcher.group());
            }

        }
        return listImageSrc;
    }
    //下载图片
    private void Download(List<String> listImgSrc,String num){
        Map<String, String> uploadImageMap  =  new HashMap<>();
        int number = Integer.parseInt(num);
        try {
            //开始时间
            Date beginDate = new Date();
            for (int i=0; i < number;i++) {
                //开始时间
                String url = listImgSrc.get(i);                                           //网页路径
                Date beginDate2 = new Date();
                String imageName = Getnum(url);
                URL urll = new URL(url);
                URLConnection connection=urll.openConnection();
                connection.setRequestProperty("User-agent","Mozilla/5.0 (Windows NT 10.0; Win64; x64)");
                InputStream in = connection.getInputStream();
                File file = new File(PATH+imageName+".jpg");
                FileOutputStream fo = new FileOutputStream(new File(PATH+imageName+".jpg"));
                byte[] buf = new byte[1024];
                int length = 0;
                System.out.println("开始下载:" + url);
                while ((length = in.read(buf, 0, buf.length)) != -1) {
                    fo.write(buf, 0, length);
                }
                in.close();
                fo.close();
                System.out.println(imageName + "下载完成");
                //结束时间
                Date overdate2 = new Date();
                double time = overdate2.getTime() - beginDate2.getTime();
                System.out.println("耗时：" + time / 1000 + "s");
                uploadImageMap.put("status","0");
                uploadImageMap.put("result","上传成功");
                uploadImageMap.put("url","Image"+sep+imageName+".jpg");
                uploadImageMap.put("realPath",PATH+imageName+".jpg");
                uploadImageMap.put("picsize", Long.toString(file.length()));
                uploadImageMap.put("originalName",file.getName());
                resultList.add(uploadImageMap);
            }
            Date overdate = new Date();
            double time = overdate.getTime() - beginDate.getTime();
            System.out.println("总耗时：" + time / 1000 + "s");
        } catch (Exception e) {
            e.printStackTrace();
            uploadImageMap.put("status","-1");
            uploadImageMap.put("results","上传失败");
            resultList.add(uploadImageMap);
        }
        this.result.put("resultList",resultList);
        this.result.getInt("number");
        this.result.put("total",number+result.getInt("total")+"");
        this.result.put("position","1");
        this.result.put("number",num);
        this.result.put("batch","0");
    }

    //得到图片内部编号
    private String Getnum(String str){
        String regEx="[^0-9]";
        Pattern p = Pattern.compile(regEx);
        Matcher m = p.matcher(str);
        System.out.println( m.replaceAll("").trim());
        return m.replaceAll("").trim();
    }


/**
 Method: onlineSearch
 请求参数：String keyword（在线搜索图片资源所用的关键词），String number（请求返回图片的数量），未实现【String batch (请求返回图片的批次) , 以及Httprequest，Httpsession】
 返回类型：JSONObject:result (不返回List是因为这次返回的格式没有对应的实体类)
 result内容：
 JSONArray: resultlist
             resultlist内容：Map<String,String>
             Map内容：
                url:缩略图缓存在服务器的请求地址
                origurl:原图地址
                path:图片在服务器的真实路径
                size:图片文件的大小
 String:total 图片总数
 String:position 当前返回的第一张图片在总序列里的位置
 String:number 当前返回图片的数量（这个参数也用于前端的请求）
 String:batch  当前返回图片的批次（这个参数也用于前端的请求）
 keyword：在线搜索图片资源所用的关键词
 **/
/**
 Method: DownloadFullImage（
 请求参数：String origurl(原图地址)  , 【以及Httprequest，Httpsession】未实现
 返回类型：Map<String,String>
 Map内容：
     url:缩略图缓存在服务器的请求地址 调用uploadreslover.uploadImgByStream得到
     origurl:原图地址
     path:图片在服务器的真实路径 调用uploadreslover.uploadImgByStream得到
     size:图片文件的大小
 **/
    public Map<String,String> DownloadFullImage(String ImageSrc){
        Map<String, String> uploadImageMap  =  new HashMap<>();
        try {
            //开始时间
            String imageName = Getnum(ImageSrc);
            String url = downloadURL.replace("%%",imageName);
           //大图网页路径
            URL urll = new URL(url);
            HttpURLConnection connection = (HttpURLConnection) urll.openConnection();
            connection.setRequestProperty("User-agent","Mozilla/5.0 (Windows NT 10.0; Win64; x64)");
            if(connection.getResponseCode() == 404){
                String ur2 = downloadURL2.replace("%%",imageName);
                URL url2 = new URL(ur2);
                HttpURLConnection connection2 = (HttpURLConnection) url2.openConnection();
                connection2.setRequestProperty("User-agent","Mozilla/5.0 (Windows NT 10.0; Win64; x64)");
                InputStream in = connection.getInputStream();
                File file = new File(PATH+imageName+".png");
                FileOutputStream fo = new FileOutputStream(file);
                byte[] buf = new byte[1024];
                int length = 0;
                System.out.println("开始下载:" + ur2);
                while ((length = in.read(buf, 0, buf.length)) != -1) {
                    fo.write(buf, 0, length);
                }
                in.close();
                fo.close();
                uploadImageMap.put("picsize", Long.toString(file.length()));
                uploadImageMap.put("originalName",file.getName());
                //结束时间
            }else {
                InputStream in = connection.getInputStream();
                File file = new File(PATH+imageName+".png");
                FileOutputStream fo = new FileOutputStream(file);
                byte[] buf = new byte[1024];
                int length = 0;
                while ((length = in.read(buf, 0, buf.length)) != -1) {
                    fo.write(buf, 0, length);
                }
                in.close();
                fo.close();
                uploadImageMap.put("picsize", Long.toString(file.length()));
                uploadImageMap.put("originalName",file.getName());
            }
            uploadImageMap.put("status","0");
            uploadImageMap.put("result","上传成功");
            uploadImageMap.put("url","Image"+sep+imageName+".jpg");
            uploadImageMap.put("realPath",PATH+imageName+".jpg");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("下载失败");
        }
        return uploadImageMap;
    }
}
