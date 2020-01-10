package com.joinlabs.entity.zjj;


//信息表
public class LyInfo {
     private int iid;
     private int i_uid;//留言人id
     private int u_id;//被留言人id
     private String icontent;//留言信息
     private String itime;
	public LyInfo() {
		super();
	}
	public int getIid() {
		return iid;
	}
	public void setIid(int iid) {
		this.iid = iid;
	}
	public int getI_uid() {
		return i_uid;
	}
	public void setI_uid(int i_uid) {
		this.i_uid = i_uid;
	}
	public int getU_id() {
		return u_id;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	public String getIcontent() {
		return icontent;
	}
	public void setIcontent(String icontent) {
		this.icontent = icontent;
	}
	public String getItime() {
		return itime;
	}
	public void setItime(String itime) {
		this.itime = itime;
	}
	@Override
	public String toString() {
		return "LyInfo [iid=" + iid + ", i_uid=" + i_uid + ", u_id=" + u_id
				+ ", icontent=" + icontent + ", itime=" + itime + "]";
	}
	
     
}
