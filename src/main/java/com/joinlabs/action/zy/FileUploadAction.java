package com.joinlabs.action.zy;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.joinlabs.app;
import com.joinlabs.entity.Admin;
import com.joinlabs.entity.Video;
import com.joinlabs.service.zy.IUploadFileService;
import com.joinlabs.util.FileUploadUtils;

@Controller
@RequestMapping("/upload")
public class FileUploadAction {
	
	@Resource
    private IUploadFileService uploadFileService;
	
	@Resource
	private FileUploadUtils fileUploadUtil;
	
	
	@RequestMapping("/uploads")
	@ResponseBody
	public JSONObject uploads(
			@RequestParam("file")MultipartFile file,
			@RequestParam("cate")String cate,
			ModelMap modelMap,
			HttpServletRequest request,
			HttpServletResponse response,
			@ModelAttribute("admin")Admin admin
			) {
		HttpSession session = request.getSession();
		String fileName = file.getOriginalFilename().toLowerCase();
		//fileName = fileName.substring(0, fileName.lastIndexOf("."));
		String objectName = cate + "/" + fileName;
		
		long size = file.getSize();
		String fileUrl = fileUploadUtil.uploadFile(file);
		JSONObject resp = new JSONObject();
		resp.put("code", 0);
		resp.put("msg", "success");
		resp.put("fileUrl",fileUrl);
		resp.put("fileName", fileName);
		resp.put("fileSize", size);
		//Admin admin = (Admin) session.getAttribute("admin");
		int vid = uploadFileService.saveFile(file,fileName,fileUrl,admin);
		//线程锁
		synchronized (app.class) {
			
			//System.out.println(video);
			Map<Integer, Integer> vids = (Map<Integer, Integer>) session.getAttribute("vids");
			if(vids == null) {
				vids = new HashMap<Integer, Integer>();
			}
			vids.put(vids.size(), vid);
			//System.out.println(vids);
			session.setAttribute("vids", vids);
		}
		return resp;
		
	}
	
	@RequestMapping("/showMovieInfo")
	public ModelAndView showMovieInfo(ModelMap modelMap,
			HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		Map<Integer, Integer> vids = (Map<Integer, Integer>) session.getAttribute("vids");
		Map<Integer, Video> uploadFiles =(Map<Integer, Video>) session.getAttribute("uploadFiles");
		if(uploadFiles == null) {
			uploadFiles = new HashMap<Integer, Video>();
		}
		for (Integer key : vids.keySet()) {
			int vid = vids.get(key);
			Video movie = uploadFileService.findVideoById(vid);
			//System.out.println(movie);
			uploadFiles.put(uploadFiles.size(),movie);
		}
		//System.out.println(uploadFiles);
		session.setAttribute("uploadFiles", uploadFiles);
		session.removeAttribute("vids");
		return new ModelAndView("redirect:/upload/showMovie");
	}
	
	@RequestMapping("/showMovie")
	public ModelAndView showMovie(){
		return new ModelAndView("/admin/movieInfo");
	}
	
	
	@RequestMapping("/getPicUrl")
	@ResponseBody
	public JSONObject getPicUrl(@RequestParam("file")MultipartFile file,
			HttpServletRequest request,
			HttpServletResponse response
			) {
		String fileName = file.getOriginalFilename();
		String photoUrl = fileUploadUtil.uploadFile(file);
		JSONObject resp = new JSONObject();
		resp.put("code", 0);
		resp.put("msg", "success");
		resp.put("photoUrl",photoUrl);
		return resp;
	}
	
	
	@RequestMapping("/addMovieInfo")
	@ResponseBody
	public String addMovieInfo(Video video,String filename,String introduce,String timeTag,String movietypes,String country,String photoUrl) {
		video.setVname(filename);
		video.setVcontent(introduce);
		video.setVphoto(photoUrl);
		video.setVtag1(timeTag);
		video.setVtag2(movietypes);
		video.setVtag3(country);
		int row = uploadFileService.updateMovieInfo(video);
		JSONObject resp = new JSONObject();
		resp.put("msg", "修改成功");
		//String resp = "{\"code\":0, \"msg\":\"success\", \"msg\":\"" + msg + "\" }";
		return resp.toJSONString();
	}
	
	
}
