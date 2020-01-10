package com.joinlabs.service.zjj;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.joinlabs.dao.UserMapper;
import com.joinlabs.dao.VideoMapper;
import com.joinlabs.entity.Video;
import com.joinlabs.entity.zjj.FilesBean;


@Service("uploadVideosImpl")
public class UploadVideosImpl {
	@Resource
	private VideoMapper videoMapper;
	/*
	 * 由于是内存保存,所以不能代表 所有的上传文件
	 */
	static List<Video> list = new ArrayList<Video>();
	
//	public int saveFileMessage(MultipartFile multipartFile, String finalName,int uid){
//		System.out.println(uid+"service");
//		FilesBean filesbean =new FilesBean();
//		Video video=new Video();
//		video.setV_cid(v_cid);
//		video.setV_click(v_click);
//		video.setV_content(v_content);
//		video.setV_id(1);
//		video.setV_name(v_name);
//		video.setV_photo(v_photo);
//		video.setV_tag(v_tag);
//		video.setV_time(v_time);
//		/*video.setV_uid(uid);
//		video.setV_url(finalName);*/
//		
//		list.add(video);
//		int row=usermapper.adduploadVido(video);
//		return row;	
//	}
//	  
   
	public int saveFileMessage(Video video) {
		// TODO Auto-generated method stub
		int row=videoMapper.adduploadVido(video);
		return row;
	}
}
