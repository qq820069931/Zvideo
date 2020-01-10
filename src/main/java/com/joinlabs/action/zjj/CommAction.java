package com.joinlabs.action.zjj;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.joinlabs.entity.User;
import com.joinlabs.service.UserService;

@Controller
@RequestMapping("dataup")
public class CommAction {
	@Resource
	private UserService useServ;
	
	@RequestMapping("run")
	public ModelAndView othervideo(){	
		return new ModelAndView("zjj/MydataUpd");	
	}
	
	
	@RequestMapping("data")
	public ModelAndView data(User user,HttpSession session){
	User us=	(User) session.getAttribute("user");
	User u= new User();
	  
	u.setUid( 1);	  //应该从session中获取
	u.setUname(user.getUname());	
	u.setUnname(user.getUnname());	
	u.setUemail(user.getUemail());
	u.setUsatement(user.getUsatement());
	useServ.upDateUse(u);
	
	
	
		return new ModelAndView("zjj/MydataUpd");}
	
	@RequestMapping("video")
	public ModelAndView video(){
		
		
		
		return new ModelAndView("zjj/Mydata");
		
		
		
		
	}
	

}
