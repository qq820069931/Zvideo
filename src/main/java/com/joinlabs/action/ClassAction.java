package com.joinlabs.action;


import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.joinlabs.entity.PageBean;
import com.joinlabs.entity.User;
import com.joinlabs.entity.Video;
import com.joinlabs.service.RecommendService;
import com.joinlabs.service.UserService;
import com.joinlabs.service.VideoService;

@Controller
@RequestMapping("/video")
@SessionAttributes(value={"video","videoList","pageBean"})
public class ClassAction {
	
	@Resource
	VideoService videoService;
	ModelAndView mv = null;
	
	@RequestMapping("/infoMovie")
	public ModelAndView infoMovie(HttpServletRequest request,HttpServletResponse reponse,HttpSession session,Integer uid,ModelMap modelmap){
			modelmap.addAttribute("uid", uid);
			PageBean pageBean = new PageBean();
			//初始界面
			List<Video> videoList = videoService.findVideoByCid("C101");
			//System.out.println(videoList.size());
			//设置总条数
			pageBean.setTotalCount(videoList.size());
			//设置当前页码
			pageBean.setCurPage(1);
			//设置一页数量
			pageBean.setPageCount(25);
			//初始化分页实体中： 开始下标和结束下标
			//总条数，当前页码，一页多少个 --> 总页数,当前页的开始下标和结束下标
			pageBean.initData();
			//总条数    当前页   一页显示的数量,总页数 
			//videoList = videoService.findVideoByCidAndPage(pageBean,"C101");
			System.out.println(videoList.toString());
			modelmap.addAttribute("videoList", videoList);
			//System.out.println(pageBean.toString());
			modelmap.addAttribute("pageBean", pageBean);
			List<Video> videoTopList = videoService.findVideoByCidAndClick("C101");
			modelmap.addAttribute("videoTopList", videoTopList);
			mv = new ModelAndView("/fxz/classMovie");
			return mv;
	}
	@RequestMapping("/change")
	public ModelAndView change(HttpServletRequest request,HttpServletResponse reponse,HttpSession session,ModelMap modelmap,String cid){
		//初始化搜索框
		//设置字符编码格式
		try {
			
			request.setCharacterEncoding("utf-8");

			
			PageBean pageBean = new PageBean();
			//设置当前页码
			pageBean.setCurPage(1);
			//设置一页数量
			pageBean.setPageCount(25);
			//初始化分页实体中： 开始下标和结束下标
			//总条数，当前页码，一页多少个 --> 总页数,当前页的开始下标和结束下标
			pageBean.initData();
			//总条数    当前页   一页显示的数量,总页数 
			System.out.println("分页----------------"+pageBean.toString());
			
			//首先获得客户端发送来的数据(keyword)
			String tag1,tag2,tag3;
			tag1 = request.getParameter("tag1");
			tag2 = request.getParameter("tag2");
			tag3 = request.getParameter("tag3");
			System.out.println(tag1+"-----"+tag2+"------"+tag3);
			//获得关键字之后进行处理，得到关联数据
			//测试方法
			//List<String> listData = getData(keyword);
			//获取数据库数据
			List<Video> listData = videoService.findMovieBytag(tag1, tag2, tag3);
			System.out.println(listData.toString());
			pageBean.setTotalCount(listData.size());
			modelmap.addAttribute("pageBean", pageBean);
			modelmap.addAttribute("videoList", listData);
			mv = new ModelAndView("/fxz/videoview");
			
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	}
	@RequestMapping("/videoview")
	public void videoview(HttpServletRequest request,HttpServletResponse reponse,HttpSession session,ModelMap modelmap,@ModelAttribute("pageBean")PageBean pageBean,Integer page){
		//初始化搜索框
		//设置字符编码格式
		System.out.println(pageBean.toString()+"-------"+page);
		try {
			request.setCharacterEncoding("utf-8");
			reponse.setCharacterEncoding("utf-8");
			
			List<Video> videoList = videoService.findVideoByCid("C101");
			System.out.println("分页"+videoList.size());
			//设置总条数
			pageBean.setTotalCount(pageBean.getTotalCount());
			//设置当前页码
			pageBean.setCurPage(page);
			//设置一页数量
			pageBean.setPageCount(pageBean.getPageCount());
			//初始化分页实体中： 开始下标和结束下标
			//总条数，当前页码，一页多少个 --> 总页数,当前页的开始下标和结束下标
			pageBean.initData();
			//总条数    当前页   一页显示的数量,总页数 
			System.out.println("分页----------------"+pageBean.toString());
			//查询本页数据
			//videoList = videoService.findVideoByCidAndPage(pageBean,"C101");
			
			System.out.println(videoList.toString());
			modelmap.addAttribute("videoList", videoList);
			//mv = new ModelAndView("/fxz/videoview");
			
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//return mv;
	}
	@RequestMapping("/newvideoview")
	public ModelAndView newvideoview(HttpServletRequest request,HttpServletResponse reponse,HttpSession session,ModelMap modelmap,@ModelAttribute("pageBean")PageBean pageBean){
		//初始化搜索框
		//设置字符编码格式
		//System.out.println(session.toString());
		//System.out.println(pageBean.toString());
		try {
			request.setCharacterEncoding("utf-8");
			reponse.setCharacterEncoding("utf-8");
			List<Video> videoList = videoService.findVideoByCid("C101");
			//System.out.println("分页"+videoList.size());
			//设置总条数
			pageBean.setTotalCount(pageBean.getTotalCount());
			//设置当前页码
			pageBean.setCurPage(pageBean.getCurPage());
			//设置一页数量
			pageBean.setPageCount(pageBean.getPageCount());
			//初始化分页实体中： 开始下标和结束下标
			//总条数，当前页码，一页多少个 --> 总页数,当前页的开始下标和结束下标
			pageBean.initData();
			//总条数    当前页   一页显示的数量,总页数 
			//System.out.println("分页----------------"+pageBean.toString());
			//查询本页数据
			//videoList = videoService.findVideoByCidAndPage(pageBean,"C101");
			
			//System.out.println(videoList.toString());
			modelmap.addAttribute("videoList", videoList);
			mv = new ModelAndView("/fxz/videoview");
			
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	}
}
