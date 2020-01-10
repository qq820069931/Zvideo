package com.joinlabs.service.zy;

import org.springframework.web.multipart.MultipartFile;

import com.joinlabs.entity.Admin;
import com.joinlabs.entity.Video;

public interface IUploadFileService {
	
	/*
	 * 上传电影
	 */
	int saveFile(MultipartFile file, String fileName, String fileUrl, Admin admin);
	
	/*
	 * 通过影片名查找电影
	 */
	Video findMovieByName(String vname);
	
	/*
	 * 补全电影信息
	 */
	int updateMovieInfo(Video video);
	
	/*
	 * 通过影片id查找电影
	 */
	Video findVideoById(int vid);
	
}
