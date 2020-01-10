package com.joinlabs.action;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.joinlabs.exception.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.joinlabs.entity.User;
import com.joinlabs.service.RecommendService;
import com.joinlabs.service.UserService;

@Controller
@RequestMapping("/user")
@SessionAttributes("user")
public class UserAction {
	
	@Resource
	private UserService userService;
	@Resource
	private RecommendService recommendService;
	@Resource
	private IndexAction indexAction;
	ModelAndView mv = null;
	@Resource
	private IndexAction index;
	@RequestMapping("/welcome")
	public ModelAndView welcome(){
		return new ModelAndView("/wjr/logreg");
	}
	
	@RequestMapping("/reg")
	public ModelAndView reg(HttpServletRequest request,HttpServletResponse reponse,HttpSession session,User user,ModelMap modelmap){


		try {

			userService.checkUserExist(user.getUaccount());  //用户已经存在 //判断

			userService.register(user);                 //判断是否成功
			session.setAttribute("use", user);   //user存入session
			recommendService.addNewUserRecommend();  //用户创建推荐表
			return index.info(session,modelmap);

		} catch (RegisterException e) {
			modelmap.addAttribute("regerrormessage", e.getMessage());
			return new ModelAndView("/wjr/logreg");
			//出错调回注册页面 ?   未解决
		} catch (UserAlreadyExistException e) {
			modelmap.addAttribute("regerrormessage", e.getMessage());
			return new ModelAndView("/wjr/logreg");

		}



		
	}


	@RequestMapping("/login")
	public ModelAndView login(HttpServletRequest request,HttpServletResponse reponse,HttpSession session,User user,ModelMap modelmap){
		
		try {
			User usernow = userService.login(user);
			System.out.println(usernow.toString());
			//保存user到session
			session.setAttribute("use", usernow);
			modelmap.addAttribute("user", usernow);
			//跳转到 主界面 
			indexAction.infoindex( session, modelmap);
			modelmap.remove("logerrormessage");
			return index.info(session,modelmap);
		} catch (LoginException e) {
			// TODO Auto-generated catch block
			modelmap.addAttribute("logerrormessage", e.getMessage());
			mv = new ModelAndView("/wjr/logreg");
		}

		return mv;
		
	}
	
	@RequestMapping("/changepassword")
	public ModelAndView changepassword(HttpServletRequest request,
			HttpServletResponse reponse, HttpSession session) {
		mv = new ModelAndView("/wjr/RePwd1");
		return mv;

	}

	@RequestMapping("/repwd1")
	public ModelAndView rePwd1(HttpServletRequest request,
			HttpServletResponse reponse, HttpSession session, String account,
			ModelMap modelmap) {
		try {
			userService.checkAccount(account);
			modelmap.addAttribute("account", account);
			session.setAttribute("account", account);
			mv = new ModelAndView("/wjr/RePwd2");
		} catch (AccountNotFoundException e) {
			// TODO Auto-generated catch block
			modelmap.addAttribute("errormessage", e.getMessage());
			mv = new ModelAndView("/wjr/RePwd1");
		}

		return mv;

	}

	@RequestMapping("/repwd2")
	public ModelAndView rePwd2(HttpServletRequest request,
			HttpServletResponse reponse, HttpSession session,
			String code, ModelMap modelmap) {
		String codeT = (String) session.getAttribute("code");
		String email = (String) session.getAttribute("email");
		try {
			modelmap.addAttribute("email", email);
			userService.checkCode(codeT, code);
			mv = new ModelAndView("/wjr/RePwd3");
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (VerifyException e) {
			// TODO Auto-generated catch block
			modelmap.addAttribute("errormessage", e.getMessage());
			mv = new ModelAndView("/wjr/RePwd2");
		}
		return mv;

	}

	@RequestMapping("/repwd3")
	public ModelAndView rePwd3(HttpServletRequest request,
			HttpServletResponse reponse, HttpSession session, String password,
			ModelMap modelmap) {
		String account = (String) session.getAttribute("account");
		session.removeAttribute("email");
		try {
			userService.rePwd(account, password);
		} catch (RePasswordException e) {
			// TODO Auto-generated catch block
			modelmap.addAttribute("errormessage", e.getMessage());
			mv = new ModelAndView("/wjr/RePwd3");
		}
		mv = new ModelAndView("/wjr/RePwdSuccess");

		return mv;

	}
	
	
	@RequestMapping("/sendcode")
	@ResponseBody
	public Object sendCode(HttpServletRequest request,
			HttpServletResponse reponse, HttpSession session, String email,
			ModelMap modelmap) {
		
		Map<String, String> map = new HashMap<String, String>();
		String account = (String) session.getAttribute("account");
		try {
			String codeT = userService.checkEmail(account, email);
			session.setAttribute("code",codeT);
			session.setAttribute("email", email);

		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (EmailException e) {			
			map.put("statu", "error");
			map.put("message", e.getMessage());
			return map;
			
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		map.put("statu", "success");
		return map;
	}

}
