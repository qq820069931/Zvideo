package com.joinlabs.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.joinlabs.entity.Recommend;
import com.joinlabs.entity.User;
import com.joinlabs.entity.Video;
import com.joinlabs.exception.LoginException;
import com.joinlabs.service.RecommendService;
import com.joinlabs.service.UserService;
import com.joinlabs.service.VideoService;

@Controller
@RequestMapping("/index")
@SessionAttributes("index")
public class IndexAction {
	@Resource
	UserService userService;
	@Resource
	VideoService videoService;
	@Resource
	RecommendService recommendService;
	@Resource
	AdminAction adminAction;
	ModelAndView mv = null;




	//初始化方法
	public void infoindex(HttpSession session,ModelMap modelmap){
		
					//初始化头部轮播图
					//方案1
//					List<Integer> idList =  adminAction.getVideoId();
//					List<Video> vList = new ArrayList<Video>();
//					for(int i=0;i<idList.size();i++){
//						Video video = videoService.findVideo(idList.get(i));
//						vList.add(video);
//					}


					//方案2
		//		 List<Video> topFive = new ArrayList<Video>();
		//			 List<Video> VListTop = videoService.findVideoByCid("C101");
		//			 for(int i=0; i<5; i++){
		//				topFive.add(VListTop.get(i));
		//				System.out.println("数据到这里啦"+i);
		//			 }
		//			 modelmap.addAttribute("TopFive", topFive);
					 
					//用户已登录
					//获取用户板块最高的点击量信息
				//	System.out.println("数据到这里啦---------uid"+uid);
				//	if(session.getAttribute("user")==null){
				//		//默认未登录为管理员
			//			uid = 2;
			//		}
			//		List<Recommend> rcidList = recommendService.selectRecommendMaxClick(uid);
			//		System.out.println("数据到这里啦"+rcidList.get(0));
			//		List<Video> recommendVideo = videoService.randomFindVideoByCid(rcidList.get(0).getRcid());
			///		List<Video> newRecommendVideo = new ArrayList<Video>();
			//		for(int i=0;i<6;i++){
				//		newRecommendVideo.add(recommendVideo.get(i));
				//	}
				//	modelmap.addAttribute("newRecommendVideo", newRecommendVideo);
					//初始化页面（左侧图文列表）
					List<Video> VListC101 = videoService.findVideoByCid("C101");
					modelmap.addAttribute("vListC101", VListC101);
					List<Video> VListC102 = videoService.findVideoByCid("C102");
					modelmap.addAttribute("vListC102", VListC102);
					List<Video> VListC103 = videoService.findVideoByCid("C103");
					modelmap.addAttribute("vListC103", VListC103);
					List<Video> VListC104 = videoService.findVideoByCid("C104");
					modelmap.addAttribute("vListC104", VListC104);
					System.out.println("数据到这里啦VList"+VListC101.size()+"-"+VListC102.size()+"-"+VListC103.size()+"-"+VListC104.size());
					//初始化页面（右侧排行,取前10）
					
					List<Video> VListTopC101 = videoService.findVideoByCidAndClick("C101");
					modelmap.addAttribute("vListTopC101", VListTopC101);
					
					List<Video> VListTopC102 = videoService.findVideoByCidAndClick("C102");
					modelmap.addAttribute("vListTopC102", VListTopC102);
					
					List<Video> VListTopC103 = videoService.findVideoByCidAndClick("C103");
					modelmap.addAttribute("vListTopC103", VListTopC103);
					
					List<Video> VListTopC104 = videoService.findVideoByCidAndClick("C104");
					modelmap.addAttribute("vListTopC104", VListTopC104);
					
					System.out.println("数据到这里啦"+VListTopC101.size()+"-"+VListTopC102.size()+"-"+VListTopC103.size()+"-"+VListTopC104.size());
	}
	
	//进入主界面
	@RequestMapping("/info")
	public ModelAndView info(HttpSession session,ModelMap modelmap){
			infoindex(session,modelmap);  //初始化方法
			System.out.println("Sssssssssssssssssssss");
			mv = new ModelAndView("forward:/jsp/index.jsp");
		return mv;
	}
	@RequestMapping("/ajax")
	public void ajax(HttpServletRequest request,HttpServletResponse reponse,HttpSession session,User user,ModelMap modelmap) throws IOException{
			//初始化搜索框
			//设置字符编码格式
			try {
				request.setCharacterEncoding("utf-8");

				//首先获得客户端发送来的数据(keyword)
				String keyword = request.getParameter("keyword");
				System.out.println(keyword);
				//获得关键字之后进行处理，得到关联数据
				//测试方法
				List<String> listData = getData(keyword);
				//获取数据库数据
				//List<String> listData = videoService.findVideoLikeName(keyword);
				//返回json格式
				//reponse.getWriter().write(JSONArray.fromObject(listData).toString());
				String json = JSONObject.toJSONString(listData);
				//数据回传
				reponse.getWriter().write(json.toString());
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
	}
	
	
	//获得关联数据的方法
			public List<String> getData(String keyword){
				List<String> list = new ArrayList<String>();
				for (String data : datas) {
					if(data.contains(keyword)){
						list.add(data);
					}
				}
				return list;
			}
			//定义一个容器,存放模拟数据
			static List<String> datas = new ArrayList<String>();
			static{
				datas.add("ajax");
				datas.add("ajax提交form表单");
				datas.add("ajax教程");
				datas.add("baidu");
				datas.add("bt");
				datas.add("byte");
			}
}
