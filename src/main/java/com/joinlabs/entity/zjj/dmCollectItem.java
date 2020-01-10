package com.joinlabs.entity.zjj;

import java.util.List;

import com.joinlabs.entity.Video;

public class dmCollectItem {
    private int c_id;
    private int v_uid;
    private List<Video> video;
	public dmCollectItem() {
		super();
	}
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	public int getV_uid() {
		return v_uid;
	}
	public void setV_uid(int v_uid) {
		this.v_uid = v_uid;
	}
	public List<Video> getVideo() {
		return video;
	}
	public void setVideo(List<Video> video) {
		this.video = video;
	}
	@Override
	public String toString() {
		return "dmCollectItem [c_id=" + c_id + ", v_uid=" + v_uid + ", video="
				+ video + "]";
	}

	
    
}
//c_id number,
//c_uid number,
//c_vid number