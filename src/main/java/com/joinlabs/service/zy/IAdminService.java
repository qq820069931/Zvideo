package com.joinlabs.service.zy;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import com.joinlabs.entity.Admin;
import com.joinlabs.exception.VerifyException;

public interface IAdminService {
	/*
	 * 判断管理员邮箱是否存在
	 */
	Admin isAdminExist(String email);
	
	/*
	 * 获取验证码
	 */
	String getCode(String email) throws AddressException, MessagingException;
	
	/*
	 * 验证验证码
	 */
	void checkCode(String codeT, String code) throws AddressException, MessagingException, VerifyException;
	
	/*
	 * 修改管理员信息
	 */
	int updateAdminInfo(Admin admin);
}
