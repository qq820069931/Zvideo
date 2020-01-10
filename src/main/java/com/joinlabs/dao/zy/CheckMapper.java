package com.joinlabs.dao.zy;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.joinlabs.entity.Inform;
import com.joinlabs.entity.Video;
@Mapper
public interface CheckMapper {
	
	/*
	 * 查询数据库中所有需要审核的视频
	 */
	List<Video> findAllCheckMovie();
	
	/*
	 * 查询数据库中需要审核的视频的数量
	 */
	int findCheckMovieCount();
	
	/*
	 * 将视频驳回的通知信息添加到信息表
	 */
	int addRejectInform(Inform inform);
	
	/*
	 * 将审核未通过的视频删除
	 */
	int deleteRejectVideo(int vid);
	
	/*
	 * 将审核通过的视频状态改为1
	 */
	int passVideo(int vid);
	
	/*
	 * 通过视频id查询视频 
	 */
	Video findVideoById(int vid);
	
	/*
	 * 查询用户姓名
	 */
	String selectUserNameByVid(int vid);
	
}
