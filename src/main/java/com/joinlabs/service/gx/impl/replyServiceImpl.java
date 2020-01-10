package com.joinlabs.service.gx.impl;

import java.util.List;

import javax.annotation.Resource;

import com.joinlabs.entity.Recommend;
import org.springframework.stereotype.Service;

import com.joinlabs.dao.gx.replyMapper;
import com.joinlabs.entity.Comment;
import com.joinlabs.service.gx.replyService;
@Service
public class replyServiceImpl implements replyService{
@Resource
private replyMapper reply;
	//根据视频ID获得所有评论   根据page获得当前页数
	public List<Comment> getRrplys(int vdieoId) {
		
		 
		 return reply.getRrplys(vdieoId);
	}
	//插入评论
	public int AddReply(Comment comment) {
		// TODO Auto-generated method stub
		return reply.AddReply(comment);
	}
	//根据id 把内容替换  (该内容已经删除/内容违规)
	public int DeletReply(String ccontent, int replyId) {
		// TODO Auto-generated method stub
		return reply.DeletReply(ccontent, replyId);
	}

	@Override
	public List<Recommend> PageReply(int page,int Vid) {
		return reply.PageReply(page,Vid);
	}

	// //获得该视频的所有评论
	public List<Comment> FindAllReply(int VideoID) {
		
		return reply.FindAllReply(VideoID);
	}
	
	public int AddReplyT(Comment comment) {
		// TODO Auto-generated method stub
		return reply.AddReplyT(comment);
	}

}
