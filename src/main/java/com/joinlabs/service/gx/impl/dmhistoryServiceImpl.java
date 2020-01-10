package com.joinlabs.service.gx.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.joinlabs.dao.gx.dmhistoryMapper;
import com.joinlabs.entity.History;
import com.joinlabs.service.gx.dmhistoryService;
@Service
public class dmhistoryServiceImpl implements dmhistoryService{
@Resource
  private dmhistoryMapper dmre;
	
	public int AddDmhistory(History history) {
		// TODO Auto-generated method stub
		return dmre.AddDmhistory(history);
	}

}
