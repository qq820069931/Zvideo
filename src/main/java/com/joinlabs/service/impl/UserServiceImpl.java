package com.joinlabs.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.joinlabs.dao.UserMapper;
import com.joinlabs.entity.User;
import com.joinlabs.exception.AccountNotFoundException;
import com.joinlabs.exception.EmailException;
import com.joinlabs.exception.LoginException;
import com.joinlabs.exception.RePasswordException;
import com.joinlabs.exception.RegisterException;
import com.joinlabs.exception.UserAlreadyExistException;
import com.joinlabs.exception.VerifyException;
import com.joinlabs.service.impl.UserServiceImpl;
import com.joinlabs.service.UserService;
import com.joinlabs.util.EmailUtil;

@Service("UserService")
public class UserServiceImpl implements UserService {

	@Resource
	UserMapper userMapper;
	
	@Resource
	EmailUtil emailUtil;
	
	static Logger logger = Logger.getLogger(UserServiceImpl.class);
	

	public void register(User user) throws RegisterException {
		int row = userMapper.addUser(user);
		if (row != 1) {
			logger.info("用户注册失败");
			throw new RegisterException("注册失败");
		}
		
		logger.info("用户注册成功:"+user);
	}

	public User login(User user) throws LoginException {
		User usernow = userMapper.checkUser(user);
		if (usernow == null) {
			logger.info("用户登录失败:"+user);
			throw new LoginException("用户名或密码错误");
			
		}
		logger.info("用户登录成功:"+usernow);
		return usernow;
	}

	
	public void rePwd(String account, String password) throws RePasswordException {
		int row = userMapper.updatePwd(account, password);
		if (row == 0) {
			logger.info("用户密码修改失败");
			throw new RePasswordException("密码修改失败,请重试");
		}
		logger.info("用户密码修改成功");
	}

	
	public void checkAccount(String account) throws AccountNotFoundException {
		// TODO Auto-generated method stub
		User user = userMapper.findUserByAccount(account);
		if (user == null) {
			logger.info("找回密码("+account+ ")——输入账号不存在");
			throw new AccountNotFoundException("账号不存在,请重新输入");
		}
		logger.info("找回密码("+account+ ")——账号输入正确");

	}

	
	public String checkEmail(String account,String email) throws EmailException, AddressException, MessagingException {
		String email2 = userMapper.findUserEmailByAccount(account);
		String code = null;
		if(!email.equals(email2)) {
			logger.info("邮箱输入错误");
			throw new EmailException("邮箱错误,请重新输入");
		}else{
			code = emailUtil.verificationCode(email);
			logger.info("邮箱输入正确");
		}
		return code;
	}

	
	public void checkCode(String codeT,String code) throws AddressException, MessagingException, VerifyException {
		if(!codeT.equals(code)) {
			logger.info("验证码输入错误");
			throw new VerifyException("验证码错误,请重新输入");
		}
		logger.info("验证码输入正确");
	}

	
	public void checkUserExist(String account) throws UserAlreadyExistException {
		User user = userMapper.findUserByAccount(account);
		if(user != null){
			throw new UserAlreadyExistException("用户已存在,请重新输入");
		}
		
	}


	public List<String> findUserLikeName(String name) {
		// TODO Auto-generated method stub
		List<String> userList = userMapper.findUserLikeName(name);
		return userList;
	}

	@Override
	public int addUser(User user) {
		return userMapper.addUser(user);
	}

	public User selectUserByUid(int uid) {
		// TODO Auto-generated method stub
		
		return userMapper.selectUserByUid(uid);
	}

	public void upDateUse(User user) {
		// TODO Auto-generated method stub
		userMapper.upDateUse(user);
	}

	public void updateUserPower(int uid) {
		// TODO Auto-generated method stub
		userMapper.updateUserPower(uid);
	}



}
