package com.joinlabs.service.gx.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;




import com.joinlabs.dao.gx.dmcollectMapper;
import com.joinlabs.entity.Collect;
import com.joinlabs.service.gx.dmcollectService;

@Service
public class dmcollectServiceImpl implements dmcollectService{
@Resource
 private dmcollectMapper dmcollect;
//根据useid 和videoid查找是否存在
	   
	public List<Collect> FindDmcollect(int UseID, int VideoID) {
		// TODO Auto-generated method stub
		return dmcollect.FindDmcollect(UseID, VideoID);
	}
	//根据useid 和videoid删除收藏
	
	public int DeleDmcollect(int UseID, int VideoID) {
		// TODO Auto-generated method stub
		return dmcollect.DeleDmcollect(UseID, VideoID);
	}
	//根据useid 和videoid添加收藏
	 
	public int AddDmcollect(int UseID, int VideoID) {
		// TODO Auto-generated method stub
		return dmcollect.AddDmcollect(UseID, VideoID);
	}
	
	public List<Collect> FindAllDmcollect(int VideoID) {
		// TODO Auto-generated method stub
		return dmcollect.FindAllDmcollect(VideoID);
	}

}
