package com.operatingSystem.Utils;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.*;

//初始化敏感词库
//将敏感词加入到HashMap中，构建DFA算法模型
public class SensitiveTxtInit {
	//字节编码
	private String ENCODING = "GBK";

	@SuppressWarnings("rawtypes")
	public HashMap sensitiveTxtMap;

	public SensitiveTxtInit(){
		super();
	}

	@SuppressWarnings("rawtypes")
	public Map initKeyTxt(){
		try {
			//读取敏感词库
			Set<String> keyTxtSet = readSensitiveWordFile();
			//将敏感词库加入到HashMap中
			addSensitiveWordToHashMap(keyTxtSet);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return sensitiveTxtMap;
	}
	@SuppressWarnings("resource")
	private Set<String> readSensitiveWordFile() throws Exception{
		Set<String> set = null;
		//String path = this.getClass().getClassLoader().getResource("").getPath()+"/static/library/CensorWords.txt";
//		File path = new File(ResourceUtils.getURL("classpath:").getPath());
//		if(!path.exists()) path = new File("");
//		System.out.println("path:"+path.getAbsolutePath());
////如果上传目录为/static/images/upload/，则可以如下获取：
//		File upload = new File(path.getAbsolutePath(),"static/library");
//		if(!upload.exists()) upload.mkdirs();
//		System.out.println(path.getAbsolutePath()+"/static/library/CensorWords.txt");
//		String path2=path.getAbsolutePath()+"/static/library/CensorWords.txt";
//		File file=new File(path2);
		Resource resource = new ClassPathResource("static/library/CensorWords.txt");
		BufferedReader br = new BufferedReader(new InputStreamReader(resource.getInputStream(),ENCODING));
		//InputStreamReader read = new InputStreamReader(new FileInputStream(file),ENCODING);
		try {
			{
				set = new HashSet<String>();
				String txt = null;
				while((txt = br.readLine()) != null){//读取文件，将文件内容放入到set中
					set.add(txt);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return set;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	private void addSensitiveWordToHashMap(Set<String> keyWordSet){
		sensitiveTxtMap = new HashMap(keyWordSet.size());//初始化敏感词容器，减少扩容操作
		String key = null;
		Map nowMap = null;
		Map<String, String> newWorMap = null;
		//迭代keyWordSet
		Iterator<String> iterator = keyWordSet.iterator();
		while(iterator.hasNext()){
			key = iterator.next();//关键字
			nowMap = sensitiveTxtMap;
			for(int i = 0 ; i < key.length() ; i++){
				char keyChar = key.charAt(i);//转换成char型
				Object wordMap = nowMap.get(keyChar);//获取
				if(wordMap != null){ //如果存在该key，直接赋值
					nowMap = (Map) wordMap;
				}else{//不存在则，则构建一个map，同时将isEnd设置为0，因为他不是最后一个
					newWorMap = new HashMap<String,String>();
					newWorMap.put("isEnd", "0"); //不是最后一个
					nowMap.put(keyChar, newWorMap);
					nowMap = newWorMap;
				}

				if(i == key.length() - 1){
					nowMap.put("isEnd", "1");    //最后一个
				}
			}
		}
	}
}