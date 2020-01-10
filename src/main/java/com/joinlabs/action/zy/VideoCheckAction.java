package com.joinlabs.action.zy;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.joinlabs.entity.Admin;
import com.joinlabs.entity.Inform;
import com.joinlabs.entity.PageBean;
import com.joinlabs.entity.Video;
import com.joinlabs.service.zy.ICheckFileService;

@Controller
@RequestMapping("/check")
@SessionAttributes(value={"checkFiles","pageBean"})
public class VideoCheckAction {
	
	@Resource
	private ICheckFileService checkFileService;
	
	@RequestMapping("/showFileCheck")
	public ModelAndView showFileCheck(ModelMap modelMap,PageBean pageBean) {
		//System.out.println(pageBean);
		List<Video> list = checkFileService.findAllCheckMovie(pageBean);
		//System.out.println(pageBean);
		modelMap.addAttribute("checkFiles", list);
		modelMap.addAttribute("pageBean", pageBean);
		//System.out.println(pageBean);
		return new ModelAndView("/admin/file_check");
	}
	
	@RequestMapping("/showFileCheckCount")
	@ResponseBody
	public Integer showFileCheckCount(ModelMap modelMap) {
		
		int row = checkFileService.findCheckMovieCount();
		
		return row;
	}
	
	@RequestMapping("/rejectVideo")
	@ResponseBody
	public Integer rejectVideo(ModelMap modelMap,int uid,int vid,String rejectmsg,Inform inform,@ModelAttribute("pageBean")PageBean pageBean) {
		inform.setIid(0);
		inform.setIuid(uid);
		
		inform.setIvid(vid);
		inform.setIcontent(rejectmsg);
		inform.setItime(new Date());
		inform.setIstate(0);
		
		int row = checkFileService.addRejectInform(inform);
		row = checkFileService.deleteRejectVideo(vid);
		if(row == 1) {
			//session中数据有更改，重新更新视频集合及分页实体
			List<Video> list = checkFileService.findAllCheckMovie(pageBean);
			//添加到域对象
			modelMap.addAttribute("checkFiles", list);
			modelMap.addAttribute("pageBean", pageBean);
		}
		
		return row;
	}
	
	@RequestMapping("/passVideo")
	@ResponseBody
	public Integer passVideo(int vid,ModelMap modelMap,@ModelAttribute("pageBean")PageBean pageBean) {
		
		int row = checkFileService.passVideo(vid);
		if(row == 1) {
			//session中数据有更改，重新更新视频集合及分页实体
			List<Video> list = checkFileService.findAllCheckMovie(pageBean);
			//添加到域对象
			modelMap.addAttribute("checkFiles", list);
			modelMap.addAttribute("pageBean", pageBean);
		}
		return row;
	}
	
	@RequestMapping("/showPlay")
	public ModelAndView showPlay(int vid,ModelMap modelMap) {
		//System.out.println(vid);
		Video video = checkFileService.findVideoById(vid);
		modelMap.addAttribute("checkfilePlay", video);
		return new ModelAndView("/admin/test");
	}
	
	@RequestMapping("/showCheckFile")
	public ModelAndView showCheckFile(ModelMap modelMap,@ModelAttribute("pageBean")PageBean pageBean) {
		
		//pageBean.setCurPage(page);
		//pageBean.initData();
		List<Video> list = checkFileService.findAllCheckMovie(pageBean);
		modelMap.addAttribute("checkFiles", list);
		//System.out.println(list);
		//modelMap.addAttribute("pageBean", pageBean);
		//System.out.println(pageBean);
		return new ModelAndView("/admin/showCheckFile");
	}
	
	@RequestMapping("/pageRefresh")
	@ResponseBody
	public Object pageRefresh(ModelMap modelMap,@ModelAttribute("pageBean")PageBean pageBean,int page) {
		
		pageBean.setCurPage(page);
		pageBean.initData();
		modelMap.addAttribute("pageBean", pageBean);
		Map<String, Object> map = new HashMap<String, Object>();
		return map;
	}
	
}
