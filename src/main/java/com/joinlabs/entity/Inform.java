package com.joinlabs.entity;

import java.util.Date;

public class Inform {
	private int iid;
	private int iuid;
	private int iuuid;
	private int ivid;
	private String icontent;
	private Date itime;
	private int istate;
	public Inform() {
		super();
	}
	public Inform(int iid, int iuid, int iuuid, int ivid, String icontent,
			Date itime, int istate) {
		super();
		this.iid = iid;
		this.iuid = iuid;
		this.iuuid = iuuid;
		this.ivid = ivid;
		this.icontent = icontent;
		this.itime = itime;
		this.istate = istate;
	}
	public int getIid() {
		return iid;
	}
	public void setIid(int iid) {
		this.iid = iid;
	}
	public int getIuid() {
		return iuid;
	}
	public void setIuid(int iuid) {
		this.iuid = iuid;
	}
	public int getIuuid() {
		return iuuid;
	}
	public void setIuuid(int iuuid) {
		this.iuuid = iuuid;
	}
	public int getIvid() {
		return ivid;
	}
	public void setIvid(int ivid) {
		this.ivid = ivid;
	}
	public String getIcontent() {
		return icontent;
	}
	public void setIcontent(String icontent) {
		this.icontent = icontent;
	}
	public Date getItime() {
		return itime;
	}
	public void setItime(Date itime) {
		this.itime = itime;
	}
	public int getIstate() {
		return istate;
	}
	public void setIstate(int istate) {
		this.istate = istate;
	}
	@Override
	public String toString() {
		return "inform [iid=" + iid + ", iuid=" + iuid + ", iuuid=" + iuuid
				+ ", ivid=" + ivid + ", icontent=" + icontent + ", itime="
				+ itime + ", istate=" + istate + "]";
	}
	
}
