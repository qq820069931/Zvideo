package com.joinlabs.service.gx;

import java.util.List;

import com.joinlabs.entity.Inform;

public interface dminformService {
	//插入评论视频的通知
	   int AddDminform(Inform infrrm);
	   List<Inform> selectMyInformByUid(int uid);
}
