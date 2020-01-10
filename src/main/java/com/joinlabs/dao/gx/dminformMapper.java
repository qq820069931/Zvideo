package com.joinlabs.dao.gx;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.joinlabs.entity.Inform;
@Mapper
public interface dminformMapper {
	
	
	//插入评论视频的通知
   int AddDminform(Inform infrrm);
   List<Inform> selectMyInformByUid(int uid);
   
   
}
