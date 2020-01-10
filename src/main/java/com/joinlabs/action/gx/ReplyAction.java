package com.joinlabs.action.gx;




import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joinlabs.entity.Comment;
import com.joinlabs.entity.Inform;
import com.joinlabs.service.gx.dminformService;
import com.joinlabs.service.gx.replyService;
@RequestMapping("reply")
@Controller
public class ReplyAction {
         @Resource
         private  replyService reply;
          
       
         @Resource
         private dminformService dmin;
         
      
         static public Inform infrrm=new Inform(); //信息通知实体
         
         @ResponseBody
         @RequestMapping("addReply")
         public String  AddReply(HttpSession session,HttpServletRequest request,HttpServletResponse response,String txt){    //评论视频功能
        	
        	 txt = txt.trim();   //去前后空格
       
        if(txt.equals("")){
        	
        	return -1+"";
        	
        }	
        
        else{
        	
        	Comment comment =new Comment();
         	comment.setCvid(viedoCommtAction.Vid);
        	comment.setCuid(viedoCommtAction.use.getUid());
         	comment.setCcontent(txt);
         	
        	Date date = new Date(); //获取当前的系统时间。
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss") ; //使用了默认的格式创建了一个日期格式化对象。
            String time = dateFormat.format(date); //可以把日期转换转指定格式的字符串
        	comment.setCtime(time);
         	comment.setCcid(null);
         	
         	infrrm.setIstate(0);
         	infrrm.setIuid(viedoCommtAction.use.getUid());
         	infrrm.setIuuid(viedoCommtAction.videos.getVuid());
         	infrrm.setIvid(viedoCommtAction.videos.getVid());
         	
         	
         	
         	infrrm.setItime(new Date());
         	infrrm.setIcontent("您的视频有新的评论");
         	
         	try {
         		int a= reply.AddReplyT(comment);     //评论视频内容插入  无问题
         		a=dmin.AddDminform(infrrm);
         		
         		
         		return a+"";
			} catch (Exception e) {
				return 0+"";
			}
			
        	 
         }
         }
         
         
         
         
         
         
         
         
         
         
         
         
         
         @ResponseBody
         @RequestMapping("ReplyPuls")
         public String ReplyPuls(String cont,Integer txt){
        	
        	 cont = cont.trim();   //去前后空格
        if(txt.equals("")){
        	
        	return -1+"";
        }	 
        else{ 
        	
        		 Comment comment =new Comment();
              	comment.setCvid(viedoCommtAction.Vid);
             	comment.setCuid(viedoCommtAction.use.getUid());
              	comment.setCcontent(cont);
              
              	Date date = new Date(); //获取当前的系统时间。
               SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss") ; //使用了默认的格式创建了一个日期格式化对象。
               String time = dateFormat.format(date); //可以把日期转换转指定格式的字符串
               System.out.println(time+"time----------------------------");
           	   comment.setCtime(time);
              	
              	comment.setCcid(txt);
              	int a= reply.AddReply(comment);
         	
         	 
 			    return a+"";
			
        		
        }
        	 
        	 
         }
	
}
