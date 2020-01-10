package com.joinlabs.service.zy;

import java.util.List;

import com.joinlabs.entity.Inform;
import com.joinlabs.entity.PageBean;
import com.joinlabs.entity.Video;

public interface ICheckFileService {
	
	/*
	 * 查询所有需要审核的视频
	 */
	List<Video> findAllCheckMovie(PageBean pageBean);
	
	/*
	 * 查询需要审核的视频的数量
	 */
	int findCheckMovieCount();
	
	/*
	 * 视频驳回通知
	 */
	int addRejectInform(Inform inform);
	
	/*
	 * 删除被驳回的视频
	 */
	int deleteRejectVideo(int vid);
	
	/*
	 * 修改通过的视频的状态
	 */
	int passVideo(int vid);
	
	/*
	 * 通过id查找视频
	 */
	Video findVideoById(int vid);
	
}
