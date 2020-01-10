package com.joinlabs.dao.gx;


import org.apache.ibatis.annotations.Mapper;

import com.joinlabs.entity.History;
@Mapper
public interface dmhistoryMapper {
	/*
	       插入浏览历史  传入History实体
	    
	*/
	int AddDmhistory(History history);
	
}
