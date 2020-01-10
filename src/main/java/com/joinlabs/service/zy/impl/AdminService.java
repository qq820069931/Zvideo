package com.joinlabs.service.zy.impl;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.apache.log4j.Logger;
import org.apache.log4j.spi.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.joinlabs.dao.zy.AdminMapper;
import com.joinlabs.entity.Admin;
import com.joinlabs.exception.VerifyException;
import com.joinlabs.service.zy.IAdminService;
import com.joinlabs.util.EmailUtil;

@Service("adminService")
public class AdminService implements IAdminService {
	
	@Resource
	private AdminMapper adminMapper;
	
	public Admin isAdminExist(String email) {
		Admin admin = adminMapper.isExist(email);
		return admin;
	}
	
    public String getCode(String email) throws AddressException, MessagingException {

		String code = EmailUtil.verificationCode(email);
		
		return code;
	}
    
	public void checkCode(String codeT,String code) throws AddressException, MessagingException, VerifyException {

		if(!codeT.equals(code)) {

			throw new VerifyException("验证码错误,请重新输入");

		}

	}
	
	public int updateAdminInfo(Admin admin) {
		return adminMapper.updateAdminInfo(admin);
	}
	
	

    
}
