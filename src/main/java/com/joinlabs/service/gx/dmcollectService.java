package com.joinlabs.service.gx;

import java.util.List;

import com.joinlabs.entity.Collect;

public interface dmcollectService {
	/*
	 * 收藏表的添加收藏修改  UseID(用户ID)   VideoID(视频ID)
	 */
	
	
	//判断是否收藏
	List<Collect> FindDmcollect(int UseID, int VideoID);
	//取消收藏
	int DeleDmcollect(int UseID, int VideoID);
	//收藏
	int AddDmcollect(int UseID, int VideoID);
	//收藏总数
	List<Collect> FindAllDmcollect(int VideoID);
	
}
