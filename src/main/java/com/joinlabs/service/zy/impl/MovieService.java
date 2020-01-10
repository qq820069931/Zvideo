package com.joinlabs.service.zy.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.joinlabs.dao.zy.MovieMapper;
import com.joinlabs.entity.PageBean;
import com.joinlabs.entity.Video;
import com.joinlabs.service.zy.IMovieService;

@Service("movieService")
public class MovieService implements IMovieService {
	
	@Resource
	MovieMapper movieMapper;
	
	public List<Video> findAllMovie(PageBean pageBean) {
		List<Video> list = movieMapper.findAllMovie();
		//设置一页显示多少个
		pageBean.setPageCount(7);
		//设置总个数
		pageBean.setTotalCount(list.size());
		pageBean.initData();
		return list;
	}
	
	public int underMovie(int movieId) {
		return movieMapper.underMovie(movieId);
	}

	public List<Video> selectMovieByName(String mname,PageBean pageBean) {
		List<Video> list = movieMapper.selectMovieByName(mname);
		//设置一页显示多少个
		pageBean.setPageCount(7);
		//设置总个数
		pageBean.setTotalCount(list.size());
		pageBean.initData();
		return list;
	}
	
}
