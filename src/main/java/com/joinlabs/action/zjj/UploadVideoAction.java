package com.joinlabs.action.zjj;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.joinlabs.entity.Video;
import com.joinlabs.entity.zjj.FilesBean;
import com.joinlabs.exception.CustomException;
import com.joinlabs.exception.FileContentTypeException;
import com.joinlabs.service.zjj.UploadVideosImpl;
import com.joinlabs.util.FileUploadUtils;


@Controller
@RequestMapping("/uploades")
@SessionAttributes("newvideo")
public class UploadVideoAction {
   @Resource
   UploadVideosImpl uploadvideoslmpl;
   @Resource
	private FileUploadUtils fileUploadUtil;
   @RequestMapping("/show")
	public String show(){
		return "/file_load";
	}
   
    //上传视频
	@RequestMapping("/uploades")
	@ResponseBody
	public Object upload(MultipartFile file,ModelMap modelMap) throws CustomException{
		System.out.println("action");
		int uid=1;
		//将file表单直接封装成MultipartFile对象
		String fileName = file.getName();
		String realName = file.getOriginalFilename();
		
		String contentType = file.getContentType(); //文件类型
		long size = file.getSize();	 
		
		System.out.println("input的name属性:"+fileName);
		System.out.println("文件名:"+realName);
		System.out.println("文件类型:"+contentType);
		System.out.println("文件大小:"+size);
		
		
		   
		
//		//判断用户上传的文件的类型
//		if(!contentType.contains("image")){
//			//抛出一个业务异常
//			throw new FileContentTypeException("只能上传图片类型");
//		}
		//用户上传一个文件,后台把文件保存到服务器
		Map<String, String> json = new HashMap<String, String>();
		try {
			Date datetime=new Date();
			 java.sql.Timestamp time=new java.sql.Timestamp(datetime.getTime());
			 SimpleDateFormat sdf =  new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			 System.out.println(sdf.format(time));
			  System.out.println(time);
			FileUtils.copyInputStreamToFile(file.getInputStream(), new File("D:/testdata/server/"+realName));
			//把s
			modelMap.addAttribute("message", "文件上传成功");
			modelMap.addAttribute("filename","D:/testdata/server/"+realName);
			
			json = new HashMap<String, String>();
			
			json.put("time",sdf.format(time));
			json.put("statu", "success");
			json.put("path", realName);
			
			return json;
			
		} catch(Exception e){
			
			e.printStackTrace();
		}
		
		json.put("statu", "error");

		return json;
	}
	
	
	
	//上传图片
		@RequestMapping("/uploadimage")
		@ResponseBody
		public Object uploadimage(MultipartFile file,ModelMap modelMap) throws CustomException{
			System.out.println("action");
			int uid=1;
			//将file表单直接封装成MultipartFile对象
			String fileName = file.getName();
			String realName = file.getOriginalFilename();
			
			String contentType = file.getContentType(); //文件类型
			long size = file.getSize();	 
			
			System.out.println("input的name属性:"+fileName);
			System.out.println("文件名:"+realName);
			System.out.println("文件类型:"+contentType);
			System.out.println("文件大小:"+size);
			
			
			   
			
			//判断用户上传的文件的类型
			if(!contentType.contains("image")){
				//抛出一个业务异常
				throw new FileContentTypeException("只能上传图片类型");
			}
			//用户上传一个文件,后台把文件保存到服务器
			Map<String, String> json = new HashMap<String, String>();
			try {
				 Date datetime=new Date();
				 java.sql.Timestamp time=new java.sql.Timestamp(datetime.getTime());
				 SimpleDateFormat sdf =  new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				 System.out.println(sdf.format(time));
				  System.out.println(time);
				FileUtils.copyInputStreamToFile(file.getInputStream(), new File("D:/testdata/server/"+realName));
				//把s
				modelMap.addAttribute("message", "文件上传成功");
				modelMap.addAttribute("filename",realName);
				
				json = new HashMap<String, String>();
				
				json.put("time",sdf.format(time));
				json.put("statu", "success");
				json.put("path",realName);
				
				return json;
				
			} catch(Exception e){
				
				e.printStackTrace();
			}
			
			json.put("statu", "error");

			return json;
		}
	
	@RequestMapping("/uploadone")
	public ModelAndView uploadone(Video video){
		
		System.out.println(video);
		//SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		Date date = new Date(); //获取当前的系统时间。
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss") ; //使用了默认的格式创建了一个日期格式化对象。
		String time = dateFormat.format(date); //可以把日期转换转指定格式的字符串


		video.setVtime(time);
		
		int  row = uploadvideoslmpl.saveFileMessage(video);
		
		System.out.println("serviceone");
		return new ModelAndView("/zjj/Personindex");
	}
	/**
	 * 
	 * 限制了文件上传的 大小,
	 * 在核心控制器 那边 封装MultipartFile 对象的时候，就会判断文件是否超过限制
	 * 如果超过限制，直接报错
	 * 
	 * 必须要去配置 全局的异常处理器
	 * 
	 * 
	 * @param uploadfile
	 * @param modelMap
	 * @return
	 * @throws CustomException 
	 */
//   @RequestMapping("/uploads")
//	public ModelAndView uploads(FilesBean fileBean,int uid){
//		System.out.println(uid+"servicesssss");
//		int xuid=1;
//		String name="不才";
//		//System.out.println(fileBean.getUploadfiles().length);
//		//取出内容
//		MultipartFile[] files = fileBean.getUploadfiles();
//		
//		//文件保存到服务器中,把文件信息保存到"数据库"中
//		for (MultipartFile multipartFile : files) {
//			//System.out.println(multipartFile.getSize());
//			if(multipartFile.getSize() > 0){
//				//保存文件
//				String finalName = fileUploadUtil.uploadFile(multipartFile);
//				//文件信息保存到数据库中
//				int row = uploadvideoslmpl.saveFileMessage(multipartFile,finalName,uid);
//				
//			}
//		}
//		
//		
//		//显示上传的所有的文件
//		return new ModelAndView("redirect:/upload/success.action");
//	}
   
//   @RequestMapping("/success")
//	public ModelAndView success(ModelMap modelMap){
//		
//		/*
//		 * 
//		 * 读取到 数据库中 的所有 上传的文件信息
//		 * 显示到 界面上 ，提供下载按钮
//		 * 
//		 */
//		List<Video> list = uploadvideoslmpl.findAllUploadFiles();
//		
//		modelMap.addAttribute("uploadFiles", list);
//		
//		return new ModelAndView("");
//		
//
//	}
	/*
	 * 文件下载
	 * 
	 * 
	 */
   
//   @RequestMapping("/down")
//	public ResponseEntity<byte[]> down(int uploadId) throws CustomException, IOException{
//		
//		Video downBean = uploadvideoslmpl.findUploadFileById(uploadId);
//		
//		//获取 本地服务器文件的输入流 ，写 给 浏览器
//		if(downBean == null){
//			throw new CustomException("您要下载的文件不存在");
//		}
//		
//		String downPath = fileUploadUtil.getDocBase()
//								+File.separator 
//								+ downBean.getV_url();	//  5/7/UUID.png
//	
//		File downFile = new File(downPath);
//		
//		HttpHeaders headers = new HttpHeaders();
//		
//		headers.setContentDispositionFormData("attachment", downBean.getV_name());
//		
//		//告诉浏览器，以二进制的方式处理响应 (下载)
//		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
//		
//		return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(downFile),headers,HttpStatus.CREATED);
//	}
}
