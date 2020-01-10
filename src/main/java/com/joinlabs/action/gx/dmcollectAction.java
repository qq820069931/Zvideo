package com.joinlabs.action.gx;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joinlabs.service.gx.dmcollectService;


@RequestMapping("dmcollect")
@Controller
public class dmcollectAction {
@Resource 
private dmcollectService dmco;


    @ResponseBody
	@RequestMapping("addDmcollect")
	public String add(String txt,HttpSession session){
    	try {
			if(txt.equals("收藏视频")){
				
				
				dmco.AddDmcollect(viedoCommtAction.use.getUid(), viedoCommtAction.videos.getVid());
				
						
				return "取消收藏";
			}
			else{
				dmco.DeleDmcollect(viedoCommtAction.use.getUid(), viedoCommtAction.videos.getVid());
				
				return "收藏视频";}
		} catch (Exception e) {
			return -1+"";
		}
		
    	
    	
    	
    	
		
		
		
		
	}
	
}
