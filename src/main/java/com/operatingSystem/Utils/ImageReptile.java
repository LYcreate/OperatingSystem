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
    // ��ȡimg��ǩ����Ӧ��վ��������
    private static final String downloadURL= "https://wallpapers.wallhaven.cc/wallpapers/full/wallhaven-%%.jpg" ;
    private static final String downloadURL2= "https://wallpapers.wallhaven.cc/wallpapers/full/wallhaven-%%.png" ;
    // ���ش�ͼ����
    private static final String searchURL = "https://alpha.wallhaven.cc/search?q=%%&categories=111&purity=100&sorting=relevance&order=desc&page=2";
    // ����Сͼ��վ
    private static final String IMGURL = "<figure(.*?)><img(.*?)>" ;
    // ��ȡsrc��ͼ·��������
    private static final String IMGSRC_HTML = "/(.*?)\\.html";
    // ��ȡsrc·��������
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
    //��������
    //batchδʵ��
    public JSONObject OnlineSearch(String keyword,String num,String batch){
        String search =  searchURL.replace("%%",keyword);
        try{
            //��ȡhtml�ı�����
            String document = this.getHtml(search);
            result.put("keyword",keyword);
            //��ȡimgSrc
            List<String> imgSrc = this.getImage(document);
            //����Сͼ
            this.Download(imgSrc,num);
            //���ش�ͼ
            //this.DownloadFullImage(downloadURL,imgSrc.get(0));

        }catch(Exception e){
            System.out.println("Error");
        }
        System.out.println(result);
        return result;
    }
    //��ȡHTML����
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

    //��ȡIMG��ǩ����
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

    //��ȡImageSrc��ַ
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
    //����ͼƬ
    private void Download(List<String> listImgSrc,String num){
        Map<String, String> uploadImageMap  =  new HashMap<>();
        int number = Integer.parseInt(num);
        try {
            //��ʼʱ��
            Date beginDate = new Date();
            for (int i=0; i < number;i++) {
                //��ʼʱ��
                String url = listImgSrc.get(i);                                           //��ҳ·��
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
                System.out.println("��ʼ����:" + url);
                while ((length = in.read(buf, 0, buf.length)) != -1) {
                    fo.write(buf, 0, length);
                }
                in.close();
                fo.close();
                System.out.println(imageName + "�������");
                //����ʱ��
                Date overdate2 = new Date();
                double time = overdate2.getTime() - beginDate2.getTime();
                System.out.println("��ʱ��" + time / 1000 + "s");
                uploadImageMap.put("status","0");
                uploadImageMap.put("result","�ϴ��ɹ�");
                uploadImageMap.put("url","Image"+sep+imageName+".jpg");
                uploadImageMap.put("realPath",PATH+imageName+".jpg");
                uploadImageMap.put("picsize", Long.toString(file.length()));
                uploadImageMap.put("originalName",file.getName());
                resultList.add(uploadImageMap);
            }
            Date overdate = new Date();
            double time = overdate.getTime() - beginDate.getTime();
            System.out.println("�ܺ�ʱ��" + time / 1000 + "s");
        } catch (Exception e) {
            e.printStackTrace();
            uploadImageMap.put("status","-1");
            uploadImageMap.put("results","�ϴ�ʧ��");
            resultList.add(uploadImageMap);
        }
        this.result.put("resultList",resultList);
        this.result.getInt("number");
        this.result.put("total",number+result.getInt("total")+"");
        this.result.put("position","1");
        this.result.put("number",num);
        this.result.put("batch","0");
    }

    //�õ�ͼƬ�ڲ����
    private String Getnum(String str){
        String regEx="[^0-9]";
        Pattern p = Pattern.compile(regEx);
        Matcher m = p.matcher(str);
        System.out.println( m.replaceAll("").trim());
        return m.replaceAll("").trim();
    }


/**
 Method: onlineSearch
 ���������String keyword����������ͼƬ��Դ���õĹؼ��ʣ���String number�����󷵻�ͼƬ����������δʵ�֡�String batch (���󷵻�ͼƬ������) , �Լ�Httprequest��Httpsession��
 �������ͣ�JSONObject:result (������List����Ϊ��η��صĸ�ʽû�ж�Ӧ��ʵ����)
 result���ݣ�
 JSONArray: resultlist
             resultlist���ݣ�Map<String,String>
             Map���ݣ�
                url:����ͼ�����ڷ������������ַ
                origurl:ԭͼ��ַ
                path:ͼƬ�ڷ���������ʵ·��
                size:ͼƬ�ļ��Ĵ�С
 String:total ͼƬ����
 String:position ��ǰ���صĵ�һ��ͼƬ�����������λ��
 String:number ��ǰ����ͼƬ���������������Ҳ����ǰ�˵�����
 String:batch  ��ǰ����ͼƬ�����Σ��������Ҳ����ǰ�˵�����
 keyword����������ͼƬ��Դ���õĹؼ���
 **/
/**
 Method: DownloadFullImage��
 ���������String origurl(ԭͼ��ַ)  , ���Լ�Httprequest��Httpsession��δʵ��
 �������ͣ�Map<String,String>
 Map���ݣ�
     url:����ͼ�����ڷ������������ַ ����uploadreslover.uploadImgByStream�õ�
     origurl:ԭͼ��ַ
     path:ͼƬ�ڷ���������ʵ·�� ����uploadreslover.uploadImgByStream�õ�
     size:ͼƬ�ļ��Ĵ�С
 **/
    public Map<String,String> DownloadFullImage(String ImageSrc){
        Map<String, String> uploadImageMap  =  new HashMap<>();
        try {
            //��ʼʱ��
            String imageName = Getnum(ImageSrc);
            String url = downloadURL.replace("%%",imageName);
           //��ͼ��ҳ·��
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
                System.out.println("��ʼ����:" + ur2);
                while ((length = in.read(buf, 0, buf.length)) != -1) {
                    fo.write(buf, 0, length);
                }
                in.close();
                fo.close();
                uploadImageMap.put("picsize", Long.toString(file.length()));
                uploadImageMap.put("originalName",file.getName());
                //����ʱ��
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
            uploadImageMap.put("result","�ϴ��ɹ�");
            uploadImageMap.put("url","Image"+sep+imageName+".jpg");
            uploadImageMap.put("realPath",PATH+imageName+".jpg");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("����ʧ��");
        }
        return uploadImageMap;
    }
}
