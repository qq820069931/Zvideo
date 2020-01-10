package com.joinlabs.entity;

import java.util.Date;

public class Barrage {
	private int bid;
	private int buid;
	private String bcontent;
	private Date btime;
	public Barrage() {
		super();
	}
	public Barrage(int bid, int buid, String bcontent, Date btime) {
		super();
		this.bid = bid;
		this.buid = buid;
		this.bcontent = bcontent;
		this.btime = btime;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public int getBuid() {
		return buid;
	}
	public void setBuid(int buid) {
		this.buid = buid;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public Date getBtime() {
		return btime;
	}
	public void setBtime(Date btime) {
		this.btime = btime;
	}
	@Override
	public String toString() {
		return "barrage [bid=" + bid + ", buid=" + buid + ", bcontent="
				+ bcontent + ", btime=" + btime + "]";
	}
	
}
