package com.joinlabs.entity;

public class Collect {
	private int cid;
	private int cuid;
	private int cvid;
	public Collect() {
		super();
	}
	public Collect(int cid, int cuid, int cvid) {
		super();
		this.cid = cid;
		this.cuid = cuid;
		this.cvid = cvid;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getCuid() {
		return cuid;
	}
	public void setCuid(int cuid) {
		this.cuid = cuid;
	}
	public int getCvid() {
		return cvid;
	}
	public void setCvid(int cvid) {
		this.cvid = cvid;
	}
	@Override
	public String toString() {
		return "collect [cid=" + cid + ", cuid=" + cuid + ", cvid=" + cvid
				+ "]";
	}
	
}
