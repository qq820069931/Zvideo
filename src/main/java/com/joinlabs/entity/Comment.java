package com.joinlabs.entity;

import java.util.List;

public class Comment {
	private User use;
	private int cid;
	private int cvid;
	private int cuid;
	private Integer ccid;
	private String ccontent;
	private String ctime;
	private String cnull1;
	private String cnull2;
	private String cnull3;
	private List<Comment> comment;
	public User getUse() {
		return use;
	}
	public void setUse(User use) {
		this.use = use;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getCvid() {
		return cvid;
	}
	public void setCvid(int cvid) {
		this.cvid = cvid;
	}
	public int getCuid() {
		return cuid;
	}
	public void setCuid(int cuid) {
		this.cuid = cuid;
	}
	public Integer getCcid() {
		return ccid;
	}
	public void setCcid(Integer ccid) {
		this.ccid = ccid;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	public String getCtime() {
		return ctime;
	}
	public void setCtime(String ctime) {
		this.ctime = ctime;
	}
	public String getCnull1() {
		return cnull1;
	}
	public void setCnull1(String cnull1) {
		this.cnull1 = cnull1;
	}
	public String getCnull2() {
		return cnull2;
	}
	public void setCnull2(String cnull2) {
		this.cnull2 = cnull2;
	}
	public String getCnull3() {
		return cnull3;
	}
	public void setCnull3(String cnull3) {
		this.cnull3 = cnull3;
	}
	public List<Comment> getComment() {
		return comment;
	}
	public void setComment(List<Comment> comment) {
		this.comment = comment;
	}
	@Override
	public String toString() {
		return "Comment [use=" + use + ", cid=" + cid + ", cvid=" + cvid + ", cuid=" + cuid + ", ccid=" + ccid
				+ ", ccontent=" + ccontent + ", ctime=" + ctime + ", cnull1=" + cnull1 + ", cnull2=" + cnull2
				+ ", cnull3=" + cnull3 + ", comment=" + comment + "]";
	}
	public Comment(User use, int cid, int cvid, int cuid, Integer ccid, String ccontent, String ctime, String cnull1,
			String cnull2, String cnull3, List<Comment> comment) {
		super();
		this.use = use;
		this.cid = cid;
		this.cvid = cvid;
		this.cuid = cuid;
		this.ccid = ccid;
		this.ccontent = ccontent;
		this.ctime = ctime;
		this.cnull1 = cnull1;
		this.cnull2 = cnull2;
		this.cnull3 = cnull3;
		this.comment = comment;
	}
	public Comment() {
		super();
	}



}
