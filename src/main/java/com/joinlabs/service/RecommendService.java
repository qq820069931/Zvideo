package com.joinlabs.service;

import java.util.List;

import com.joinlabs.entity.Recommend;

public interface RecommendService {
		//修改user的各个分类的点击量
		int updateRecommendClick(int uid, String cid);
		//查询user各个分类点击量
		Recommend selectRecommendToCid(int uid, String cid);
		//查询user所有分类点击量
		List<Recommend> selectRecommend(int uid);
		//查询user所有分类点击量最高的cid
		List<Recommend> selectRecommendMaxClick(int uid);
		//给新用户创建推荐表
		int addNewUserRecommend();

		
		//gx
		int AddClick(String CID, String CID1, int UseID);
}
