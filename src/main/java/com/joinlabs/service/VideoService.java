package com.joinlabs.service;

import java.util.List;

import com.joinlabs.entity.PageBean;
import com.joinlabs.entity.Video;

public interface VideoService {
	//根据vid查询video
	Video findVideo(int vid);
	//根据点击量查询所有video
	List<Video> findVideoByClick();
	//按分类及排序查询video
	List<Video> findVideoByCid(String cid);
	//按分类和点击量查询video
	List<Video> findVideoByCidAndClick(String cid);
	//按分类及排序查询video
	List<Video> randomFindVideoByCid(String cid);
	//按视频名称或用户昵称模糊查询Video
	List<String> findVideoLikeName(String name);
	//根据电影的标签查询video
	List<Video> findMovieBytag(String tag1, String tag2, String tag3);
	List<Video> findAllVideo();
	List<Video> findVideoByCidAndPage(PageBean pageBean, String cid);
	int  FindeVideoLenT(String videoClass); //找到类型视频个数
	List<Video>  PageVideo(String VideoClass, Integer page, Integer pages);  //分页  不排除自己
	List<Video> TigrVideo(String tiger, Integer page, Integer pages);//根据标签得到视频
	
	
	//gx
	Video FindeVideo(int VideoID);   //根据传入的视频ID获得 电影详情  发布人      类型
	int AdeeClick(int VideoID);      //把视频的点击数量加一
	 List<Video> FindeVideoLen(String VideoClass, int videoId);   //找到同意类型的所以视频  并排除自己
	 
	 //zjj
	 List<Video> selectCollectByUid(int uid);
	 List<Video> selectMyVideoByUid(int uid);
	 List<Video> PageUseVideo(int uid, int i, int j);
	 List<Video> selectMyHistoryByUid(int uid);
}
