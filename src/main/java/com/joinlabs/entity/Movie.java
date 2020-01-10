package com.joinlabs.entity;


public class Movie {
	private int mid;
	private int maid;
	private String mname;
	private int mclick;
	private String mphoto;
	private String murl;
	private String mcontent;
	private String mtag1;
	private String mtag2;
	private String mtag3;
	private String msize;
	private String unull1;
	public Movie() {
		super();
	}
	public Movie(int mid, int maid, String mname, int mclick, String mphoto,
			String murl, String mcontent, String mtag1, String mtag2,
			String mtag3, String msize, String unull1) {
		super();
		this.mid = mid;
		this.maid = maid;
		this.mname = mname;
		this.mclick = mclick;
		this.mphoto = mphoto;
		this.murl = murl;
		this.mcontent = mcontent;
		this.mtag1 = mtag1;
		this.mtag2 = mtag2;
		this.mtag3 = mtag3;
		this.msize = msize;
		this.unull1 = unull1;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public int getMaid() {
		return maid;
	}
	public void setMaid(int maid) {
		this.maid = maid;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public int getMclick() {
		return mclick;
	}
	public void setMclick(int mclick) {
		this.mclick = mclick;
	}
	public String getMphoto() {
		return mphoto;
	}
	public void setMphoto(String mphoto) {
		this.mphoto = mphoto;
	}
	public String getMurl() {
		return murl;
	}
	public void setMurl(String murl) {
		this.murl = murl;
	}
	public String getMcontent() {
		return mcontent;
	}
	public void setMcontent(String mcontent) {
		this.mcontent = mcontent;
	}
	public String getMtag1() {
		return mtag1;
	}
	public void setMtag1(String mtag1) {
		this.mtag1 = mtag1;
	}
	public String getMtag2() {
		return mtag2;
	}
	public void setMtag2(String mtag2) {
		this.mtag2 = mtag2;
	}
	public String getMtag3() {
		return mtag3;
	}
	public void setMtag3(String mtag3) {
		this.mtag3 = mtag3;
	}
	public String getMsize() {
		return msize;
	}
	public void setMsize(String msize) {
		this.msize = msize;
	}
	public String getUnull1() {
		return unull1;
	}
	public void setUnull1(String unull1) {
		this.unull1 = unull1;
	}
	@Override
	public String toString() {
		return "Movie [mid=" + mid + ", maid=" + maid + ", mname=" + mname
				+ ", mclick=" + mclick + ", mphoto=" + mphoto + ", murl="
				+ murl + ", mcontent=" + mcontent + ", mtag1=" + mtag1
				+ ", mtag2=" + mtag2 + ", mtag3=" + mtag3 + ", msize=" + msize
				+ ", unull1=" + unull1 + "]";
	}
	
}
