package com.joinlabs.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.joinlabs.dao.VideoMapper;
import com.joinlabs.entity.PageBean;
import com.joinlabs.entity.Video;
import com.joinlabs.service.UserService;
import com.joinlabs.service.VideoService;
@Service("VideoService")
public class VideoServiceImpl implements VideoService {

	@Resource
	VideoMapper VideoMapper;
	@Resource
	UserService UserService;
	

	public List<Video> findVideoByClick() {
		// TODO Auto-generated method stub
		List<Video> videoList = VideoMapper.findVideoByClick();
		return videoList;
	}
	
	public List<Video> findVideoByCid(String cid) {
		List<Video> videoList = VideoMapper.findVideoByCid(cid);
		return videoList;
	}
	//从某一类型中随机抽取
	public List<Video> randomFindVideoByCid(String cid) {
		List<Video> videoList = VideoMapper.findVideoByCid(cid);
		//打乱元素顺序
		Collections.shuffle(videoList);
		return videoList;
	}
	public List<Video> findVideoByCidAndClick(String cid) {
		List<Video> videoList = VideoMapper.findVideoByCidAndClick(cid);
		return videoList;
	}

	public Video findVideo(int vid) {
		// TODO Auto-generated method stub
		Video video = VideoMapper.findVideo(vid);
		return video;
	}

	public List<String> findVideoLikeName(String name) {
		// TODO Auto-generated method stub
		List<String> videoList = VideoMapper.findVideoLikeName(name);
		List<String> userList = UserService.findUserLikeName(name);
		List<String> list = new ArrayList<String>();
		list.addAll(videoList);
		list.addAll(userList);
		return list;
	}

	public List<Video> findMovieBytag(String tag1, String tag2, String tag3) {
		// TODO Auto-generated method stub
		
		List<Video> videoList = VideoMapper.findMovieBytag(tag1,tag2,tag3);
		return null;
	}

	public List<Video> findAllVideo() {
		// TODO Auto-generated method stub
		List<Video> videoList = VideoMapper.findAllVideo();
		return videoList;
	}

	public List<Video> findVideoByCidAndPage(PageBean pageBean, String cid) {
		// TODO Auto-generated method stub
		int vid1 = pageBean.getStartIndex();
		int vid2 = pageBean.getEndIndex();
		List<Video> videoList = VideoMapper.findVideoByCidAndPage(vid1,vid2,cid);
		return videoList;
	}
	
	
	   //得到视频的详细信息
	public Video FindeVideo(int VideoID) {
		
		return VideoMapper.FindeVideo(VideoID);
	}
	 //添加视频的观看数量
	public int AdeeClick(int VideoID) {
		      
		return VideoMapper.AdeeClick(VideoID);
	}
	
	public List<Video> FindeVideoLen(String VideoClass,int videoId) {
		// TODO Auto-generated method stub
		return VideoMapper.FindeVideoLen(VideoClass,videoId);
	}

	public int FindeVideoLenT(String videoClass) {
		// TODO Auto-generated method stub
		int i =  VideoMapper.FindeVideoLenT(videoClass); //找到类型视频个数
		return i;
	}

	public List<Video> PageVideo(String VideoClass, Integer page, Integer pages) {
		// TODO Auto-generated method stub
		List<Video> videoList = VideoMapper.PageVideo(VideoClass, page, pages);
		return videoList;
	}

	public List<Video> TigrVideo(String tiger, Integer page, Integer pages) {
		// TODO Auto-generated method stub
		List<Video> videoList = VideoMapper.TigrVideo(tiger, page, pages);
		return videoList;
	}

	
	
	//zjj
	
	
	public List<Video> selectCollectByUid(int uid) {
		// TODO Auto-generated method stub
		List<Video> videoList = VideoMapper.selectCollectByUid(uid);
		return videoList;
	}

	public List<Video> selectMyVideoByUid(int uid) {
		// TODO Auto-generated method stub
		return VideoMapper.selectMyVideoByUid(uid);
	}

	public List<Video> PageUseVideo(int uid, int i, int j) {
		// TODO Auto-generated method stub
		return VideoMapper.PageUseVideo(uid,i,j);
	}

	public List<Video> selectMyHistoryByUid(int uid) {
		// TODO Auto-generated method stub
		return VideoMapper.selectMyHistoryByUid(uid);
	}

}
