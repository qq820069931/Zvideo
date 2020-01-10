package com.joinlabs.service.zy;

import java.util.List;

import com.joinlabs.entity.PageBean;
import com.joinlabs.entity.Video;

public interface IMovieService {
	
	/*
	 * 查询所有的电影信息
	 */
	List<Video> findAllMovie(PageBean pageBean);
	
	/*
	 * 电影下架
	 */
	int underMovie(int movieId);
	
	/*
	 * 通过影片名模糊查询电影
	 */
	List<Video> selectMovieByName(String mname, PageBean pageBean);
	
}
