package com.joinlabs.action.zjj;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.joinlabs.entity.Attention;
import com.joinlabs.entity.Inform;
import com.joinlabs.entity.User;
import com.joinlabs.entity.Video;
import com.joinlabs.entity.zjj.GzUser;
import com.joinlabs.entity.zjj.InformItem;
import com.joinlabs.entity.zjj.dmCollectItem;
import com.joinlabs.service.UserService;
import com.joinlabs.service.VideoService;
import com.joinlabs.service.gx.dmattentionService;
import com.joinlabs.service.gx.dminformService;

@Controller
@RequestMapping("/common")
public class CommonPageAction {
      @Resource
      UserService userService;
      @Resource
      VideoService videoService;
      @Resource
      dmattentionService dmattentionService;
      @Resource
      dminformService dminformService;
//    MyworksServiceImpl myworksServiceImpl;
//    @Resource
//    MyGuanZhuService myGuanZhuService;
//    @Resource
//    MyInfoService myInfoService;
	@RequestMapping("/video")
	public ModelAndView runs(ModelMap modelMap,int uid){

		//登录用户
		User user = userService.selectUserByUid(uid);
		//收藏的视频
		List<Video> collect = videoService.selectCollectByUid(uid);
		//用户发布的视频
		List<Video> myVideo = videoService.selectMyVideoByUid(uid);
		//用户关注的人
		List<User> myAttention = dmattentionService.selectMyAttentionByUid(uid);
		//观看历史
		List<Video> myHistory = videoService.selectMyHistoryByUid(uid);
		//信息通知
		List<Inform> myInform = dminformService.selectMyInformByUid(uid);
		
		System.out.println(user.toString());
		System.out.println(collect.toString());
		System.out.println(myVideo.toString());
		System.out.println(myAttention.toString());
		System.out.println(myHistory.toString());
		System.out.println(myInform.toString());
		
		modelMap.addAttribute("user",user);
		modelMap.addAttribute("collect",collect);
		modelMap.addAttribute("myVideo",myVideo);
		modelMap.addAttribute("myAttention",myAttention);
		modelMap.addAttribute("myHistory",myHistory);
		modelMap.addAttribute("myInform",myInform);
		
		return new ModelAndView("/zjj/Personindex");
	}
	
	@RequestMapping("/othervideo")
	public ModelAndView runss(HttpServletRequest request,HttpSession session){
		
        String uid=request.getParameter("uid");
       
        int uids=Integer.parseInt(uid);
       User us= (User) session.getAttribute("user");
     	List<Attention> dmres= dmattentionService.FindDmattention(us.getUid(), uids);     
     	List<Attention> allDmres=dmattentionService.FindAllDmattention(uids);  
     	System.out.println(userService.selectUserByUid(uids).getUnname());
     	request.setAttribute("user",  userService.selectUserByUid(uids));        //用户详细
     	request.setAttribute("dmres", dmres.size());        //判断是否关注
     	request.setAttribute("allDmres", allDmres.size()); //所有关注作者的人
     //	System.out.println(video.PageUseVideo(uids, 1, 1));
     	session.setAttribute("useVideo",videoService.PageUseVideo(uids, 1, 1));//找到某一个人的所有视频 并分页
     	 
		return new ModelAndView("zjj/Hisvideo");
	}
	@ResponseBody
	@RequestMapping("/huiyuan")
	public String huiyuan(HttpServletRequest request,HttpSession session){
		
				try {
					request.setCharacterEncoding("utf-8");
					
					String uid = request.getParameter("uid");
					
					userService.updateUserPower(Integer.parseInt(uid));
					
					
				} catch (UnsupportedEncodingException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return "1";
	}
}
