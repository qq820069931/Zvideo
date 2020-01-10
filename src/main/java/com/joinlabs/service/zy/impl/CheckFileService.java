package com.joinlabs.service.zy.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.joinlabs.dao.zy.CheckMapper;
import com.joinlabs.entity.Inform;
import com.joinlabs.entity.PageBean;
import com.joinlabs.entity.Video;
import com.joinlabs.service.zy.ICheckFileService;

@Service("checkFileService")
public class CheckFileService implements ICheckFileService {
	
	@Resource
	CheckMapper checkMapper;
	
	public List<Video> findAllCheckMovie(PageBean pageBean) {
		//查询所有需要审核的视频
		List<Video> list = checkMapper.findAllCheckMovie();
		for (int i = 0; i < list.size(); i++) {
			int vid = list.get(i).getVid();
			String userName = checkMapper.selectUserNameByVid(vid);
			list.get(i).setVnull3(userName);
		}
		//设置一页显示多少个
		pageBean.setPageCount(4);
		//设置总个数
		pageBean.setTotalCount(list.size());
		pageBean.initData();
		
		return list;
	}
	
	public int findCheckMovieCount() {
		return checkMapper.findCheckMovieCount();
	}

	public int addRejectInform(Inform inform) {
		// TODO Auto-generated method stub
		return checkMapper.addRejectInform(inform);
	}
	
	public int deleteRejectVideo(int vid) {
		return checkMapper.deleteRejectVideo(vid);
	}
	
	public int passVideo(int vid) {
		// TODO Auto-generated method stub
		return checkMapper.passVideo(vid);
	}

	public Video findVideoById(int vid) {
		// TODO Auto-generated method stub
		return checkMapper.findVideoById(vid);
	}
	
}
