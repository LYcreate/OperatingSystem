package com.operatingSystem.Utils;

import com.operatingSystem.model.User;
import net.coobird.thumbnailator.Thumbnails;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import sun.misc.BASE64Decoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.util.Formatter;
import java.util.HashMap;
import java.util.Map;

@Service
public class UploadResolver {

    //@Value("${upload.dir}")
//    @Value("${uploadpath}")
    public final static  String ImgBase = "D:\\ImgBase\\";

    /**
     * 上传文件，基于文件存储，springmvc以及本地测试可用
     * @param file
     * @return
     */
    public @ResponseBody Map<String, String> uploadImgByTypical(MultipartFile file, HttpServletRequest request) {
        Map<String, String> uploadImageMap  =  new HashMap<>();
        String id = ((User)request.getSession().getAttribute(User.CURRENT_USER)).getUid();
        System.out.println("开始执行文件上传");
        System.out.println(file.getOriginalFilename());
        String str1 = file.getOriginalFilename();
        String kuozhanname = str1.substring(str1.lastIndexOf(".") + 1);// 扩展名
        System.out.println(kuozhanname);
        NetResult result = new NetResult();
        //            User user = (User) session.getAttribute(User.CURRENT_USER);
        //            String id= user.getUid();
        // 判断文件是否为空
        if (!file.isEmpty()) {
            try {
                // 保存文件到临时目录
                System.out.println("id = " + id);
                System.out.println("fileName = " + file.getOriginalFilename());
                String path = request.getSession().getServletContext().getRealPath("/images") + "/" + id;
                System.out.println(path);
                File targetFile = new File(path, file.getOriginalFilename());
                String realpath = "/images/" + id + file.getOriginalFilename();
                // 永久保存
                String directoryPath = path + file.getOriginalFilename();
                file.transferTo(new File(directoryPath));
                uploadImageMap.put("status","0");
                uploadImageMap.put("result","上传成功");
                uploadImageMap.put("url",realpath);
                uploadImageMap.put("realPath",directoryPath);
                uploadImageMap.put("originalName",file.getOriginalFilename());
            } catch (Exception e) {
                e.printStackTrace();
                uploadImageMap.put("status","-1");
                uploadImageMap.put("result","上传失败");
            }
        } else {
            System.out.println("文件为空");
            uploadImageMap.put("status","0");
            uploadImageMap.put("result","文件为空");
        }
        return uploadImageMap;
    }

    /**
     * 上传文件，基于流存储，springboot需要，也兼容其他文件操作
     * @param file
     * @return
     */
    public @ResponseBody  Map<String, String> uploadImgByStream(MultipartFile file,  String id) {
        System.out.println("处理开始！");
        Map<String, String> uploadImageMap  =  new HashMap<>();
        String path = ImgBase+id;
        System.out.println("开始执行文件上传");
        System.out.println(file.getOriginalFilename());
        String str1 = file.getOriginalFilename();
        String kuozhanname = str1.substring(str1.lastIndexOf(".") + 1);// 扩展名
        System.out.println(kuozhanname);
        if (!file.isEmpty()) {
            try {
                // 目标文件不存在就创建
                File tarfile = new File(path);
                if (!tarfile.exists()) {
                    tarfile.mkdirs();
                }
                System.out.println("id = " +id);
                System.out.println("fileName = " + file.getOriginalFilename());
                System.out.println("ImgBase:"+ImgBase);
                System.out.println(path);
                String directoryPath = path + File.separator + file.getOriginalFilename();
                FileOutputStream out = new FileOutputStream(directoryPath);
                System.out.println("directoryPath:"+directoryPath);
                System.out.println("size:"+file.getSize());
                // 目标文件创建输出流
                out.write(file.getBytes());
                out.flush();
                out.close();
                String url = "/imgs/" + id + "/"+file.getOriginalFilename();//访问路径
                uploadImageMap.put("status","0");
                uploadImageMap.put("result","上传成功");
                if(file.getSize()>500000) {
                    //String rate = Float.toString(1000000/file.getSize()).substring(0,2);
                    double rate = 500000.0/file.getSize();
                    System.out.println(rate);
                    System.out.println("图片太大正在优化");
                    BigDecimal b   =   new   BigDecimal(rate);
                    float   f1   =   b.setScale(1,   BigDecimal.ROUND_HALF_UP).floatValue();
                    System.out.println(f1);
                    String resizedDirectorypath = path + File.separator + "resized" + file.getOriginalFilename();
                    FileOutputStream out2 = new FileOutputStream(resizedDirectorypath);
                    Thumbnails.of(directoryPath).size(750, 425).outputQuality(1f).toOutputStream(out2);
//                    Thumbnails.of(directoryPath).size(750, 425).outputQuality(f1).toOutputStream(out2);
                    System.out.println(resizedDirectorypath);
                    String resizedurl = "/imgs/" + id + "/resized" + file.getOriginalFilename();
                    uploadImageMap.put("url",resizedurl);
                    uploadImageMap.put("realPath",resizedDirectorypath);
                    try {
                        uploadImageMap.put("picsize", Long.toString(out2.getChannel().size()));
                    }catch (Exception e){
                        uploadImageMap.put("picsize", "0");
                    }
                    uploadImageMap.put("originalName","resized"+file.getOriginalFilename());
                }else{
                    uploadImageMap.put("url",url);
                    uploadImageMap.put("realPath",directoryPath);
                    uploadImageMap.put("picsize", Long.toString(file.getSize()));
                    uploadImageMap.put("originalName",file.getOriginalFilename());
                }
            } catch (Exception e) {
                e.printStackTrace();
                uploadImageMap.put("status","-1");
                uploadImageMap.put("result","上传出错");
            }
        } else {
            System.out.println("文件为空");
            uploadImageMap.put("status","-1");
            uploadImageMap.put("result","文件为空");
        }
        System.out.println("处理结果！"+uploadImageMap.toString());
        return uploadImageMap;
    }

    /**
     * 上传图片，基于Base64转码，以String类型传输
     * @param id
     * @return
     */
    @ResponseBody
    public Map<String, String> uploadImgBase(
            @RequestParam(value="imgBase64",defaultValue="") String imgBase64,
            @RequestParam(value="fileName",defaultValue="") String fileName,
            String userUid, HttpServletResponse response){
//        String userUid = "16124400";
//        try {
//            userUid = ((User) request.getSession().getAttribute(User.CURRENT_USER)).getUid();
//            if (userUid.equals("") || userUid == null)
//                userUid = "16124400";
//        }catch (Exception e)
//        {
//            userUid = "16124400";
//        }
        String TrueDirectory = "myBase64Files";
        String inventedDirectory = "ImgFiles/"+"backgroundImg";
        String directory = TrueDirectory+"-"+inventedDirectory;
        System.out.println("imgBase64");
        System.out.println(imgBase64);
        System.out.println("filename");
        System.out.println(fileName);
        Map<String, String> map = uploadImgBase64(imgBase64, directory, fileName,userUid);
        return map;
    }

    /**
     * 上传base64 单个图片工具类
     * @param imgBase64 图片base64
     * @param fileName 图片名称
     * @return
     */
    public Map<String, String> uploadImgBase64(
            String imgBase64,
            String Directory,
            String oldFileName,
            String userUid){
        System.out.println(Directory);
        Map<String, String> uploadImageMap  =  new HashMap<>();
        String oldFileName2 = oldFileName.substring(0,oldFileName.lastIndexOf("."));
        String lastFileName = oldFileName.substring(oldFileName.lastIndexOf("."),oldFileName.length());
        String fileName =  oldFileName2+System.currentTimeMillis()+lastFileName;// 重命名上传后的文件名
        uploadImageMap.put("oldFileName", oldFileName);
        //上传本地tomcat路径
        String filePath = ImgBase+ Directory.split("-")[0]+File.separator+userUid;
        String path = filePath + File.separator+ fileName;
        //上传服务器路径
        String phoUrl = "/" + Directory.split("-")[1]+"/" +userUid+ File.separator+fileName;
        System.out.println("path:"+path);
        System.out.println("filepath:"+filePath);
        System.out.println("phoUrl:"+phoUrl);
        String header ="data:image";
        String[] imageArr=imgBase64.split(",");
        if(imageArr[0].contains(header)){//是img的
            // 去掉头部
            imgBase64=imageArr[1];
            //image = image.substring(header.length());
            // 写入磁盘
            BASE64Decoder decoder = new BASE64Decoder();
            try{
                byte[] decodedBytes = decoder.decodeBuffer(imgBase64);        //将字符串格式的image转为二进制流（biye[])的decodedBytes
                File targetFile = new File(filePath);
                if(!targetFile.exists()){
                    targetFile.mkdirs();
                }

                FileOutputStream out = new FileOutputStream(path);        //新建一个文件输出器，并为它指定输出位置imgFilePath
                out.write(decodedBytes); //利用文件输出器将二进制格式decodedBytes输出
                out.flush();
                out.close();                        //关闭文件输出器
                uploadImageMap.put("success", "上传文件成功！");
//                uploadImageMap.put("picsize", Long.toString(out.getChannel().size()));
                uploadImageMap.put("path", path);
                uploadImageMap.put("phoUrl", phoUrl);
                uploadImageMap.put("picsize", "0");
                System.out.println(uploadImageMap.toString());
                System.out.println("status:0");
                return uploadImageMap;
            }catch(Exception e){
                System.out.println("错误");
                System.out.println(e);
                uploadImageMap.put("err", "上传文件失败！"+"1");
                System.out.println(uploadImageMap.toString());
                System.out.println("status:1");
                return uploadImageMap;
            }
        }else{
            uploadImageMap.put("err", "上传文件失败！");
            System.out.println(uploadImageMap.toString());
            System.out.println("status:2");
            return uploadImageMap;
        }
    }
}

