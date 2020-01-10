package com.joinlabs.dao.zy;

import org.apache.ibatis.annotations.Mapper;

import com.joinlabs.entity.Video;
@Mapper
public interface UploadMapper {
	
	/*
	 * 上传电影文件
	 */
	int saveFile(Video video);
	
	/*
	 * 通过影片名查找电影
	 */
	Video findMovieByName(String mname);
	
	/*
	 * 补全电影信息
	 */
	int updateMovieInfo(Video video);
	
	/*
	 * 通过影片id查找电影
	 */
	Video findVideoById(int vid);
	
}
