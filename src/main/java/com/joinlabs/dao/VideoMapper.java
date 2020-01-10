package com.joinlabs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.joinlabs.entity.PageBean;
import com.joinlabs.entity.Video;

@Mapper
public interface VideoMapper {
	//根据id查询video
	Video findVideo(int vid);
	//根据点击量查询所有video
	List<Video> findVideoByClick();
	//根据类型查询所有video
	List<Video> findVideoByCid(String cid);
	//根据类型和点击量排序查询video
	List<Video> findVideoByCidAndClick(String cid);
	//select * from video where cid = c101 and order by click desc
	//按视频名称或用户昵称模糊查询Video
	List<String> findVideoLikeName(String name);
	//根据电影的标签查询video
	List<Video> findMovieBytag(@Param("param1") String tag1, @Param("param2") String tag2, @Param("param3") String tag3);
	
	List<Video> findAllVideo();
	List<Video> findVideoByCidAndPage(int vid1, int vid2, String cid);
	int  FindeVideoLenT(String videoClass); //找到类型视频个数
	List<Video>  PageVideo(String VideoClass, Integer page, Integer pages);  //分页  不排除自己
	List<Video> TigrVideo(String tiger, Integer page, Integer pages);//根据标签得到视频

	
	//gx
	Video FindeVideo(int VideoID);   //根据传入的视频ID获得 电影详情  发布人 ID     类型
	int AdeeClick(int VideoID);      //把视频的点击数量加一
	List<Video> FindeVideoLen(String VideoClass, int videoId);   //找到同意类型的所以视频  并排除自己
	
	
	//zjj
	List<Video> selectCollectByUid(int uid);
	List<Video> selectMyVideoByUid(int uid);
	int adduploadVido(Video video);
	List<Video> PageUseVideo(int uid, int i, int j);
	List<Video> selectMyHistoryByUid(int uid);
}
