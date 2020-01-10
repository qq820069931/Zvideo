package com.joinlabs.dao.zy;

import org.apache.ibatis.annotations.Mapper;

import com.joinlabs.entity.Admin;

@Mapper
public interface AdminMapper {
	
	/*
	 * 判断管理员邮箱是否存在
	 */
	Admin isExist(String email);
	
	/*
	 * 修改管理员信息
	 */
	int updateAdminInfo(Admin admin);
	
}
