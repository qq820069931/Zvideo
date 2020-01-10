package com.joinlabs.entity;


public class Dmclass {
	private String cid;
	private String cname;
	private String cphoto;
	private String cnull1;
	public Dmclass() {
		super();
	}
	public Dmclass(String cid, String cname, String cphoto, String cnull1) {
		super();
		this.cid = cid;
		this.cname = cname;
		this.cphoto = cphoto;
		this.cnull1 = cnull1;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCphoto() {
		return cphoto;
	}
	public void setCphoto(String cphoto) {
		this.cphoto = cphoto;
	}
	public String getCnull1() {
		return cnull1;
	}
	public void setCnull1(String cnull1) {
		this.cnull1 = cnull1;
	}
	@Override
	public String toString() {
		return "dmclass [cid=" + cid + ", cname=" + cname + ", cphoto="
				+ cphoto + ", cnull1=" + cnull1 + "]";
	}
	
}
