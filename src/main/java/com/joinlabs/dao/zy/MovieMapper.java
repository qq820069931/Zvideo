package com.joinlabs.dao.zy;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.joinlabs.entity.Video;
@Mapper
public interface MovieMapper {
	
	/*
	 * 查询所有的电影信息
	 */
	List<Video> findAllMovie();
	
	/*
	 * 电影下架
	 */
	int underMovie(int movieId);
	
	/*
	 * 通过影片名模糊查询电影
	 */
	List<Video> selectMovieByName(String mname);
}
