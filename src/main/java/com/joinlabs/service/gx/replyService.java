package com.joinlabs.service.gx;

import java.util.List;

import com.joinlabs.entity.Comment;
import com.joinlabs.entity.Recommend;

public interface replyService {
	//根据视频ID获得所有评论   
	List<Comment> getRrplys(int vdieoId);
	
	//插入评论
	int AddReply(Comment comment);
		

	//插入评论视频
	int AddReplyT(Comment comment);
	
	//根据id 把内容替换  (该内容已经删除/内容违规)
    int DeletReply(String ccontent, int replyId);
	//分页查询
	List<Recommend> PageReply(int page ,int Vid);
    
  //获得该视频的所有评论
  	List<Comment> FindAllReply(int VideoID);
}
