package com.joinlabs.util;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

//在ioc容器中注入
@Component(value="fileUploadUtils")
public class FileUploadUtils {
	
	/*
	 * 
	 * #{} 为 spel语言
	 * 
	 * uploadProperties ioc中的一个对象
	 * 读取 指定的 配置文件 
	 * 
	 * docBase 为 properties文件中的一个键
	 * 
	 */
	
	/*	@Value("${file.uploadFolder}")
	private String uploadFolder;*/
	
	
	
	@Value("${file.uploadFolder}")
	private String docBase;
	
	public String getDocBase(){
		return docBase;
	}
	
	
	@Value("${file.path}")
	private String path;

	
	//上传文件
	public String uploadFile(MultipartFile file){
		
		//根路径		e://testdata/server/
		
		String fileName = file.getOriginalFilename();
		
		//重新构建文件名: UUID.后缀名
		String saveName = getSaveName(fileName);
		// UUID.png
		//随机生成两层目录	5/7
		String subDir = makeSubDir(saveName);
		
		//最终要保存的 绝对路径    D:/testdata/server/5/7
		String finalDir = docBase + File.separator + subDir;
		
		//创建目录
		createFinalDir(finalDir);
		
		//System.out.println(finalDir);
		
		String finalName = finalDir + File.separator + saveName;
		
		//上传文件
		//FileUtils.copyInputStreamToFile(arg0, arg1)
		
		try {
			file.transferTo(new File(finalName));
			return subDir+File.separator+saveName;
			
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "aa";
	}

	//创建目录
	private void createFinalDir(String finalDir) {
		
		File file = new File(finalDir);
		if(!file.exists()){
			file.mkdirs();

		}
		
	}

	//随机生成两层目录       return  first/second/UUID.png
	//生成两层目录结构的
	private String makeSubDir(String saveName) {
		StringBuffer sb = new StringBuffer();
		//1)得到文件名的code值
		int code = saveName.hashCode();
		//2)计算第一层目录
		int first = code & 0XF;
		//3)计算第二层目录
		int second = code &(0XF >> 1);
		//			10/4/34fg34gf35tg43tgfdg35gb.png
		return ""+first+"/"+second;
	}

	//UUID
	private String getSaveName(String fileName) {
		
		return UUID.randomUUID().toString().replace("-", "")+"."+getExtName(fileName);
		
	
	}

	//后缀名
	private String getExtName(String fileName) {
	
		return FilenameUtils.getExtension(fileName);
	}
	

}
