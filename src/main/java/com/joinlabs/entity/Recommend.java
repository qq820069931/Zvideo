package com.joinlabs.entity;

public class Recommend {
	private int rid;
	private int ruid;
	private String rcid;
	private int rclick;
	public Recommend() {
		super();
	}
	public Recommend(int rid, int ruid, String rcid, int rclick) {
		super();
		this.rid = rid;
		this.ruid = ruid;
		this.rcid = rcid;
		this.rclick = rclick;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public int getRuid() {
		return ruid;
	}
	public void setRuid(int ruid) {
		this.ruid = ruid;
	}
	public String getRcid() {
		return rcid;
	}
	public void setRcid(String rcid) {
		this.rcid = rcid;
	}
	public int getRclick() {
		return rclick;
	}
	public void setRclick(int rclick) {
		this.rclick = rclick;
	}
	@Override
	public String toString() {
		return "Recommend [rid=" + rid + ", ruid=" + ruid + ", rcid=" + rcid
				+ ", rclick=" + rclick + "]";
	}
	
	
	
}
