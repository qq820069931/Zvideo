package com.joinlabs.service.zy.impl;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.joinlabs.dao.zy.UploadMapper;
import com.joinlabs.entity.Admin;
import com.joinlabs.entity.Video;
import com.joinlabs.service.zy.IUploadFileService;

@Service("uploadFileService")
public class UploadFileService implements IUploadFileService {
	
	@Resource
	UploadMapper uploadMapper;
	
	public int saveFile(MultipartFile file, String fileName,String fileUrl,Admin admin) {   
		
		Video video = new Video();
		video.setVuid(1);
		video.setVname(fileName);
		video.setVclick(0);
		video.setVurl(fileUrl);
		video.setVpower(1);
		video.setVaid(admin.getAid());
		//System.out.println(video);
		int row = uploadMapper.saveFile(video);
		return video.getVid();
	}
	
	public Video findMovieByName(String vname) {
		return uploadMapper.findMovieByName(vname);
	}

	public int updateMovieInfo(Video video) {
		
		return uploadMapper.updateMovieInfo(video);
	}
	
	public Video findVideoById(int vid) {
		
		return uploadMapper.findVideoById(vid);
	}
	
}
