package com.joinlabs.service.gx.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;




import com.joinlabs.dao.UserMapper;
import com.joinlabs.entity.Attention;
import com.joinlabs.entity.User;
@Service
public class dmattentionServiceImpl implements com.joinlabs.service.gx.dmattentionService{
@Resource
private com.joinlabs.dao.gx.dmattentionMapper damtten;
@Resource
UserMapper userMapper;
	  ///根据useid 和anutID查找是否关注作者
	public List<Attention> FindDmattention(int UseID, int anutID) {
		// TODO Auto-generated method stub
		return damtten.FindDmattention(UseID, anutID);
	}

	//根据useid 和anutID删除关注
	public int DeleDmattention(int UseID, int anutID) {
		// TODO Auto-generated method stub
		return damtten.DeleDmattention(UseID, anutID);
	}

	//根据useid 和anutID添加关注
	public int AddDmattention(int UseID, int anutID) {
		// TODO Auto-generated method stub
		return damtten.AddDmattention(UseID, anutID);
	}

	
	public List<Attention> FindAllDmattention(int anutID) {
		// TODO Auto-generated method stub
		return damtten.FindAllDmattention(anutID);
	}

	
	
	
	//zjj
	
	public List<User> selectMyAttentionByUid(int uid) {
		// TODO Auto-generated method stub
		return userMapper.selectMyAttentionByUid(uid);
	}

}
