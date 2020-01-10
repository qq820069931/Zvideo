package com.joinlabs.action.gx;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.joinlabs.entity.Comment;
import com.joinlabs.service.gx.replyService;

@RequestMapping("pages")
@Controller
public class videoRunAction {
	
	@Resource
    private  replyService reply;
	
	@ResponseBody
	@RequestMapping("replyPage")
	public int GetPage(int page ,HttpServletRequest request,HttpSession session){

	//	List<Comment> commentsa=new ArrayList<Comment>();
	//	   commentsa=	reply.getRrplys(viedoCommtAction.Vid);                  //获得评论详情
	//	List<Comment> commentsab=new ArrayList<Comment>();



		/*获得当前页数的内容
		* if(viedoCommtAction.commentsa.size()>5*(page-1))         {commentsab.add(commentsa.get(   5*(page-1))   );}
		if(viedoCommtAction.commentsa.size()>5*(page-1)+1)       {commentsab.add(commentsa.get(   5*(page-1)+1 ));}
		if(viedoCommtAction.commentsa.size()>5*(page-1)+2)       {commentsab.add(commentsa.get(   5*(page-1)+2 ));}
		if(viedoCommtAction.commentsa.size()>5*(page-1)+3)       {commentsab.add(commentsa.get(   5*(page-1)+3 ));}
		if(viedoCommtAction.commentsa.size()>5*(page-1)+4)       {commentsab.add(commentsa.get(   5*(page-1)+4 ));}
		* */


		session.setAttribute("reply", reply.PageReply(page,viedoCommtAction.Vid)); //参数 当前页数  视频ID
		
		 return page;
	}
}
