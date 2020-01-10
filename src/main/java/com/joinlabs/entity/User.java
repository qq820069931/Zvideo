package com.joinlabs.entity;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;

public class User {
	private int uid;// 用户id
	@NotBlank
	private String uaccount;// 用户账号
	@NotBlank
	private String uname;// 用户姓名
	@NotBlank

	private String unname;// 用户昵称
	@NotBlank
	private String upassword;// 用户密码
	@NotBlank
	private String uemail;// 用户邮箱
	private String usatement;// "该用户很懒，什么都没设置" 用户简介
	private int upower;// 用户权限
	private String usex;// 用户性别
	private int ucolor;// 用户界面选择的颜色
	private String uphoto;// 用户头像
	private String unull1;
	private String unull2;
	private String unull3;
	
	private int vid;
	
	

	public int getVid() {
		return vid;
	}

	public void setVid(int vid) {
		this.vid = vid;
	}

	public User() {
		super();
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getUaccount() {
		return uaccount;
	}

	public void setUaccount(String uaccount) {
		this.uaccount = uaccount;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUnname() {
		return unname;
	}

	public void setUnname(String unname) {
		this.unname = unname;
	}

	public String getUpassword() {
		return upassword;
	}

	public void setUpassword(String upassword) {
		this.upassword = upassword;
	}

	public String getUemail() {
		return uemail;
	}

	public void setUemail(String uemail) {
		this.uemail = uemail;
	}

	public String getUsatement() {
		return usatement;
	}

	public void setUsatement(String usatement) {
		this.usatement = usatement;
	}

	public int getUpower() {
		return upower;
	}

	public void setUpower(int upower) {
		this.upower = upower;
	}

	public String getUsex() {
		return usex;
	}

	public void setUsex(String usex) {
		this.usex = usex;
	}

	public int getUcolor() {
		return ucolor;
	}

	public void setUcolor(int ucolor) {
		this.ucolor = ucolor;
	}

	public String getUphoto() {
		return uphoto;
	}

	public void setUphoto(String uphoto) {
		this.uphoto = uphoto;
	}

	public String getUnull1() {
		return unull1;
	}

	public void setUnull1(String unull1) {
		this.unull1 = unull1;
	}

	public String getUnull2() {
		return unull2;
	}

	public void setUnull2(String unull2) {
		this.unull2 = unull2;
	}

	public String getUnull3() {
		return unull3;
	}

	public void setUnull3(String unull3) {
		this.unull3 = unull3;
	}

	@Override
	public String toString() {
		return "User [uid=" + uid + ", uaccount=" + uaccount + ", uname="
				+ uname + ", unname=" + unname + ", upassword=" + upassword
				+ ", uemail=" + uemail + ", usatement=" + usatement
				+ ", upower=" + upower + ", usex=" + usex + ", ucolor="
				+ ucolor + ", uphoto=" + uphoto + ", unull1=" + unull1
				+ ", unull2=" + unull2 + ", unull3=" + unull3 + "]";
	}


}
