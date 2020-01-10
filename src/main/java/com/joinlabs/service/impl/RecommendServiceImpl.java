package com.joinlabs.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.joinlabs.dao.RecommendMapper;
import com.joinlabs.entity.Recommend;
import com.joinlabs.service.RecommendService;

@Service("RecommendService")
public class RecommendServiceImpl implements RecommendService {
	
	@Resource
	RecommendMapper recommendMapper;
	
	public int updateRecommendClick(int uid,String cid) {
		// TODO Auto-generated method stub
		//当user点击时调用该方法，增加当前用户某一点击量
		Recommend recommend = recommendMapper.selectRecommendToCid(uid, cid);
		Recommend newRecommend = new Recommend(recommend.getRid(),recommend.getRuid(),recommend.getRcid(),recommend.getRclick());
		newRecommend.setRclick(newRecommend.getRclick()+1);
		int row = recommendMapper.updateRecommendClick(newRecommend);
		return row;
	}

	public Recommend selectRecommendToCid(int uid, String cid) {
		// TODO Auto-generated method stub
		Recommend recommend = recommendMapper.selectRecommendToCid(uid, cid);
		return recommend;
	}

	public List<Recommend> selectRecommend(int uid) {
		// TODO Auto-generated method stub
		List<Recommend> recommendList = recommendMapper.selectRecommend(uid);
		return recommendList;
	}

	public List<Recommend> selectRecommendMaxClick(int uid) {
		// TODO Auto-generated method stub
		List<Recommend> cidList = recommendMapper.selectRecommendMaxClick(uid);
		return cidList;
	}

	public int addNewUserRecommend() {
		// TODO Auto-generated method stub
		String cid = null;
		int flag = 0;
		for(int i=0;i<4;i++){
			if(i==0){
				cid = "C101";
			}else if(i==1){
				cid = "C102";
			}else if(i==2){
				cid = "C103";
			}else if(i==3){
				cid = "C104";
			}
			int row = recommendMapper.addNewUserRecommend(cid);
			flag += row;
		}
		return flag;
	}



	public int AddClick(String CID,String CID1,int UseID) {
		
		return recommendMapper.AddClick(CID,CID1,UseID);
	}

}
