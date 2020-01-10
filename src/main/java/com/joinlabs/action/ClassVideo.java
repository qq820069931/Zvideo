package com.joinlabs.action;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.joinlabs.entity.Video;
import com.joinlabs.service.VideoService;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

@Controller
@RequestMapping("getvideo")
public class ClassVideo {
	private static String cla;
	
	@Resource
    private  VideoService video;
	
	 static String tiegrs=null;
	
	@RequestMapping("getvideo")
	public ModelAndView get(HttpServletRequest request){
		 cla=request.getParameter("cid");
		
	    int videocSize=video.FindeVideoLenT(cla);  //得到同一类型所有视频
	   
	    request.setAttribute("videocSize", videocSize);
		
		
		request.setAttribute("videC", video.PageVideo(cla, 1,1));   //初始化当前所有视频  类型确定
		
		List<String> tiger=new ArrayList<String>();
		
		if(cla.equals("C102")){ tiger.add("科学"); tiger.add("文史");tiger.add("生活");    }
		else if(cla.equals("C103")){tiger.add("网络游戏"); tiger.add("单机游戏");tiger.add("手机游戏"); }
		else if(cla.equals("C104")){tiger.add("原创"); tiger.add("明星");tiger.add("搞笑");}
		request.setAttribute("tiger", tiger);   //初始化当前所有视频  类型确定
		tiegrs=null;
		
		//加载排行榜
		List<Video> videoTopList = video.findVideoByCidAndClick(cla);
		request.setAttribute("videoTopList",videoTopList);
		return new ModelAndView("/fxz/classVideo");
		
	}
	@ResponseBody
	@RequestMapping("runPage")
	public String pages(int page,HttpSession session){
		
	
		
		
		if(tiegrs==null){
			session.setAttribute("videC", video.PageVideo(cla, page,page));   
			
		}
		else{
			
			
			if(tiegrs.equals("全部")){
				session.setAttribute("videC", video.PageVideo(cla, page,page)); 
				
			}
			else{
				//System.out.println(tiegrs+"tigers1111不为空---------------------------------------"+video.TigrVideo(tiegrs, page, page));
				session.setAttribute("videC", video.TigrVideo(tiegrs, page,page));   //初始化当前所有视频  类型确定
			//	System.out.println(tiegrs+"tigers不为空---------------------------------------"+video.TigrVideo(tiegrs, page, page));
			}
			
		}
		
		return page+"";
		
	}
	
	@RequestMapping("Page")
	public ModelAndView pages(HttpSession session){
		
		return new ModelAndView("/fxz/pageVide");
		
	}
	
	@ResponseBody
	@RequestMapping("tiger")
	public String getTiger(String tiger,HttpSession session){
		tiegrs=tiger;
		
		if(tiger.equals("全部")){
			session.setAttribute("videC", video.PageVideo(cla, 1,1));   //初始化当前所有视频  类型确定
			System.out.println("全部------------------");
		}
		
		
		else{
			
			session.setAttribute("videC", video.TigrVideo(tiger, 1,1));   //初始化当前所有视频  类型确定
			System.out.println("标签-----------------");
		
		}
		
		return 1+"";	
	}
	

}
