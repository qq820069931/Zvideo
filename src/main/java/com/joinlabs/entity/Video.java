package com.joinlabs.entity;

public class Video {
	private User use;
	private int vid;
	private String vcid;
	private int vaid;
	private int vuid;
	private String vname;
	private String vtime;
	private int vclick;
	private String vphoto;
	private String vurl;
	private String vcontent;
	private String vtag;
	private int vpower;
	private String vsize;
	private String vnull3;
	private String vtag1;
	private String vtag2;
	private String vtag3;
	private Dmclass dmclass;
	public User getUse() {
		return use;
	}
	public void setUse(User use) {
		this.use = use;
	}
	public int getVid() {
		return vid;
	}
	public void setVid(int vid) {
		this.vid = vid;
	}
	public String getVcid() {
		return vcid;
	}
	public void setVcid(String vcid) {
		this.vcid = vcid;
	}
	public int getVuid() {
		return vuid;
	}
	public void setVuid(int vuid) {
		this.vuid = vuid;
	}
	public String getVname() {
		return vname;
	}
	public void setVname(String vname) {
		this.vname = vname;
	}
	public String getVtime() {
		return vtime;
	}
	public void setVtime(String vtime) {
		this.vtime = vtime;
	}
	public int getVclick() {
		return vclick;
	}
	public void setVclick(int vclick) {
		this.vclick = vclick;
	}
	public String getVphoto() {
		return vphoto;
	}
	public void setVphoto(String vphoto) {
		this.vphoto = vphoto;
	}
	public String getVurl() {
		return vurl;
	}
	public void setVurl(String vurl) {
		this.vurl = vurl;
	}
	public String getVcontent() {
		return vcontent;
	}
	public void setVcontent(String vcontent) {
		this.vcontent = vcontent;
	}
	public String getVtag() {
		return vtag;
	}
	public void setVtag(String vtag) {
		this.vtag = vtag;
	}
	public int getVpower() {
		return vpower;
	}
	public void setVpower(int vpower) {
		this.vpower = vpower;
	}
	public String getVsize() {
		return vsize;
	}
	public int getVaid() {
		return vaid;
	}
	public void setVaid(int vaid) {
		this.vaid = vaid;
	}
	public void setVsize(String vsize) {
		this.vsize = vsize;
	}
	public String getVnull3() {
		return vnull3;
	}
	public void setVnull3(String vnull3) {
		this.vnull3 = vnull3;
	}
	public String getVtag1() {
		return vtag1;
	}
	public void setVtag1(String vtag1) {
		this.vtag1 = vtag1;
	}
	public String getVtag2() {
		return vtag2;
	}
	public void setVtag2(String vtag2) {
		this.vtag2 = vtag2;
	}
	public String getVtag3() {
		return vtag3;
	}
	public void setVtag3(String vtag3) {
		this.vtag3 = vtag3;
	}
	public Dmclass getDmclass() {
		return dmclass;
	}
	public void setDmclass(Dmclass dmclass) {
		this.dmclass = dmclass;
	}
	@Override
	public String toString() {
		return "Video [use=" + use + ", vid=" + vid + ", vcid=" + vcid + ", vuid=" + vuid + ", vname=" + vname
				+ ", vtime=" + vtime + ", vclick=" + vclick + ", vphoto=" + vphoto + ", vurl=" + vurl + ", vcontent="
				+ vcontent + ", vtag=" + vtag + ", vpower=" + vpower + ", vsize=" + vsize + ", vnull3=" + vnull3
				+ ", vtag1=" + vtag1 + ", vtag2=" + vtag2 + ", vtag3=" + vtag3 + ", dmclass=" + dmclass + "]";
	}
	public Video(User use, int vid, String vcid, int vaid, int vuid, String vname, String vtime, int vclick, String vphoto,
				 String vurl, String vcontent, String vtag, int vpower, String vsize, String vnull3, String vtag1,
				 String vtag2, String vtag3, Dmclass dmclass) {
		super();
		this.use = use;
		this.vid = vid;
		this.vcid = vcid;
		this.vuid = vuid;
		this.vaid = vaid;
		this.vname = vname;
		this.vtime = vtime;
		this.vclick = vclick;
		this.vphoto = vphoto;
		this.vurl = vurl;
		this.vcontent = vcontent;
		this.vtag = vtag;
		this.vpower = vpower;
		this.vsize = vsize;
		this.vnull3 = vnull3;
		this.vtag1 = vtag1;
		this.vtag2 = vtag2;
		this.vtag3 = vtag3;
		this.dmclass = dmclass;
	}
	public Video() {
		super();
	}



}
