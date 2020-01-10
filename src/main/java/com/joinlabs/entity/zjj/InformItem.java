package com.joinlabs.entity.zjj;



import com.joinlabs.entity.User;
//信息表
public class InformItem {
	 private int iid;
     private int i_uid;//被留言人id
     private String icontent;//留言信息
     private String itime;
     private User user;//留言人id
	public InformItem() {
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
//	public int getU_id() {
//		return u_id;
//	}
//	public void setU_id(int u_id) {
//		this.u_id = u_id;
//	}
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
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "InformItem [iid=" + iid + ", i_uid=" + i_uid + ", icontent="
				+ icontent + ", itime=" + itime + ", user=" + user + "]";
	}
	
}
