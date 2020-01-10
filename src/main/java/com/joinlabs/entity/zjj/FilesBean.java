package com.joinlabs.entity.zjj;

import org.springframework.web.multipart.MultipartFile;

public class FilesBean {

	
	private MultipartFile[] uploadfiles;
	public FilesBean() {
		super();
	}
	
	public MultipartFile[] getUploadfiles() {
		return uploadfiles;
	}
	public void setUploadfiles(MultipartFile[] uploadfiles) {
		this.uploadfiles = uploadfiles;
	}
	

	
	
	
}
