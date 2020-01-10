package com.joinlabs.entity;

public class Attention {
	private int aid;
	private int auid;
	private int auuid;
	public Attention() {
		super();
	}
	public Attention(int aid, int auid, int auuid) {
		super();
		this.aid = aid;
		this.auid = auid;
		this.auuid = auuid;
	}
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public int getAuid() {
		return auid;
	}
	public void setAuid(int auid) {
		this.auid = auid;
	}
	public int getAuuid() {
		return auuid;
	}
	public void setAuuid(int auuid) {
		this.auuid = auuid;
	}
	@Override
	public String toString() {
		return "attention [aid=" + aid + ", auid=" + auid + ", auuid=" + auuid
				+ "]";
	}
	
}
