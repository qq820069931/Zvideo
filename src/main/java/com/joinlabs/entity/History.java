package com.joinlabs.entity;

import java.util.Date;

public class History {
	private int hid;
	private int huid;
	private int hvid;
	private Date ctime;
	public History() {
		super();
	}
	public History(int hid, int huid, int hvid, Date ctime) {
		super();
		this.hid = hid;
		this.huid = huid;
		this.hvid = hvid;
		this.ctime = ctime;
	}
	public int getHid() {
		return hid;
	}
	public void setHid(int hid) {
		this.hid = hid;
	}
	public int getHuid() {
		return huid;
	}
	public void setHuid(int huid) {
		this.huid = huid;
	}
	public int getHvid() {
		return hvid;
	}
	public void setHvid(int hvid) {
		this.hvid = hvid;
	}
	public Date getCtime() {
		return ctime;
	}
	public void setCtime(Date ctime) {
		this.ctime = ctime;
	}
	@Override
	public String toString() {
		return "history [hid=" + hid + ", huid=" + huid + ", hvid=" + hvid
				+ ", ctime=" + ctime + "]";
	}
	
}
