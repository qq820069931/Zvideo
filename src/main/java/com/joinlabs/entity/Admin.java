package com.joinlabs.entity;

public class Admin {
	private int aid;
	private String aname;
	private String aemail;
	
	public Admin() {
		super();
	}

	public int getAid() {
		return aid;
	}

	public String getAname() {
		return aname;
	}

	public String getAemail() {
		return aemail;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	public void setAemail(String aemail) {
		this.aemail = aemail;
	}

	@Override
	public String toString() {
		return "Admin [aid=" + aid + ", aname=" + aname + ", aemail=" + aemail
				+ "]";
	}
	
	
	
}
