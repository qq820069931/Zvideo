package com.joinlabs.exception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

/**
 * 全局的异常处理器
 * 
 * @author GL
 *
 */
public class CustomExceptionResolver implements HandlerExceptionResolver{

	/**
	 * 
	 * SpringMVC所抛出来的所有异常 都 交到这里来处理
	 *
	 */
	public ModelAndView resolveException(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex) {
		
		ModelAndView model = new ModelAndView("/error/500");
		//打印异常的栈信息
		ex.printStackTrace();	
		
		return model;
	}

}
