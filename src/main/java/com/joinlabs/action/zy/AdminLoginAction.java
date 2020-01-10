package com.joinlabs.action.zy;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.joinlabs.entity.Admin;
import com.joinlabs.exception.VerifyException;
import com.joinlabs.service.zy.IAdminService;

@Controller
@RequestMapping("/admin")
@SessionAttributes("admin")
public class AdminLoginAction {
	
	@Autowired
    private IAdminService adminService;
	
	
	@RequestMapping("/showAdminLogin")
	public ModelAndView showAdminLogin() {
		return new ModelAndView("/admin/admin_login");
	}
	
	@RequestMapping("/showAdminIndex")
	public ModelAndView showAdminIndex(HttpServletRequest request,
			HttpServletResponse reponse) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if(admin == null) {
			return new ModelAndView("/admin/admin_login");
		}
		return new ModelAndView("/admin/admin_index");
	}
	
	@RequestMapping("/checkCode")
	@ResponseBody
	public String checkCode(HttpServletRequest request,
			HttpServletResponse reponse,
			HttpSession session,
			String code) {
		
		JSONObject resp = new JSONObject();
		String codeT = (String) session.getAttribute("code");
		
		try {
			adminService.checkCode(codeT, code);
			resp.put("msg", "验证码正确");
			return resp.toJSONString();

		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		} catch (VerifyException e) {
			// TODO Auto-generated catch block
			resp.put("msg", "验证码有误");
			
		}
		
		return resp.toJSONString();
	}
	
	@RequestMapping("/showFileUpload")
	public ModelAndView showFileUpload() {
		
		return new ModelAndView("/admin/file_upload");
	}
	
	@RequestMapping("/showAdminInfo")
	public ModelAndView showAdminInfo() {
		return new ModelAndView("/admin/admin_info");
	}
	
	@RequestMapping("/sendCode")
	@ResponseBody
	public Object sendCode(HttpServletRequest request,
			HttpServletResponse reponse, 
			HttpSession session,
			String email,
			ModelMap modelmap) {
		
		JSONObject resp = new JSONObject();
		
		Admin admin = adminService.isAdminExist(email);
		
		if(admin == null) {
			//modelmap.addAttribute("errormessage", "邮箱有误");
			resp.put("msg", "邮箱有误");
			//return new ModelAndView("/admin/showAdminLogin");
			return resp.toJSONString();
		}
		
		modelmap.addAttribute("admin", admin);
		session.setAttribute("admin", admin);
		
		String codeT;
		try {
			codeT = adminService.getCode(email);
			session.setAttribute("code",codeT);
			modelmap.addAttribute("code",codeT);
			resp.put("msg", "发送成功");
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			resp.put("msg", "发送失败");
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			resp.put("msg", "发送失败");
		}
		
		
		return resp.toJSONString();

	}
	
	@RequestMapping("/updateAdminInfo")
	@ResponseBody
	public Object updateAdminInfo(String aname,String aemail,@ModelAttribute("admin")Admin loginAdmin) {
		
		System.out.println(aname);
		
		JSONObject resp = new JSONObject();
		Admin admin = new Admin();
		admin.setAid(loginAdmin.getAid());
		admin.setAname(aname);
		admin.setAemail(aemail);
		
		int row = adminService.updateAdminInfo(admin);
		//int row = 1;
		
		if(row > 0) {
			resp.put("msg", "修改成功");
		} else {
			resp.put("msg", "修改失败");
		}
		
		return resp.toJSONString();
	}
	
	@RequestMapping("/showTest")
	public ModelAndView showTest() {
		return new ModelAndView("/admin/test");
	}
	
	
}
