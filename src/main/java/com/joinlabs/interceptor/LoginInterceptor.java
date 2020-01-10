package com.joinlabs.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {
	
	/**
	 * 在请求访问Controller之前调用此方法
	 * 
	 * 加入一些登录验证，权限验证等
	 * 
	 * @return true  继续调用controller的方法
	 * @return false 不放行，终止请求
	 */
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub
		
		return false;
	}
	
	/**
	 * controller执行完 但是 未返回 视图前调用的方法
	 * 
	 * 	在这里可以对 返回给浏览器的 视图模型数据进行加工处理 ，比如加入一些公共信息显示
	 */
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	/**
	 * controller执行后并且视图返回后 调用的方法
	 * 
	 * 	在这里可以 获取 controller在执行时出现的异常
	 * 
	 * 	可以 记录异常日志 ，操作日志 ，资源清理等
	 */
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
