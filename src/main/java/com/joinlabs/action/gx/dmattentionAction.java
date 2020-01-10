package com.joinlabs.action.gx;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joinlabs.service.gx.dmattentionService;
//关注功能
@RequestMapping("dmatten")
@Controller
public class dmattentionAction {
	
	@Resource
	private dmattentionService dmre;
	
	@ResponseBody
	@RequestMapping("add")
	public String addDmatten(String txt){
		
		try {
			if(txt.equals("关注作者")){
				dmre.AddDmattention(viedoCommtAction.use.getUid(), viedoCommtAction.videos.getVuid());			
				return "取消关注";
			}
			else{
				dmre.DeleDmattention(viedoCommtAction.use.getUid(), viedoCommtAction.videos.getVuid());
				return "关注作者";}
		} catch (Exception e) {
			return -1+"";
		}
		
			

	}
}
