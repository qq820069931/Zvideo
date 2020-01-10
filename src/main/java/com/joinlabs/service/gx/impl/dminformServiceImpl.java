package com.joinlabs.service.gx.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.joinlabs.dao.gx.dminformMapper;
import com.joinlabs.entity.Inform;
import com.joinlabs.service.gx.dminformService;
@Service
public class dminformServiceImpl implements dminformService{
@Resource
 private dminformMapper dminform;
	
	public int AddDminform(Inform infrrm) {
		// TODO Auto-generated method stub
		return dminform.AddDminform(infrrm);
	}

	public List<Inform> selectMyInformByUid(int uid) {
		// TODO Auto-generated method stub
		return dminform.selectMyInformByUid(uid);
	}

}
