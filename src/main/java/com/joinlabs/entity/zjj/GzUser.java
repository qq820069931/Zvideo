package com.joinlabs.entity.zjj;

import java.util.List;

import com.joinlabs.entity.User;

public class GzUser {
   private int a_id;
   private int a_uid;
   private List<User> user;
public GzUser() {
	super();
}
public int getA_id() {
	return a_id;
}
public void setA_id(int a_id) {
	this.a_id = a_id;
}
public int getA_uid() {
	return a_uid;
}
public void setA_uid(int a_uid) {
	this.a_uid = a_uid;
}
public List<User> getUser() {
	return user;
}
public void setUser(List<User> user) {
	this.user = user;
}
@Override
public String toString() {
	return "GzUser [a_id=" + a_id + ", a_uid=" + a_uid + ", user=" + user + "]";
}
   
} 
