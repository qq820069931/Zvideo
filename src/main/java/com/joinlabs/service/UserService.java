package com.joinlabs.service;

import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import com.joinlabs.entity.User;
import com.joinlabs.exception.AccountNotFoundException;
import com.joinlabs.exception.EmailException;
import com.joinlabs.exception.LoginException;
import com.joinlabs.exception.RePasswordException;
import com.joinlabs.exception.RegisterException;
import com.joinlabs.exception.UserAlreadyExistException;
import com.joinlabs.exception.VerifyException;

public interface UserService {
	void register(User user) throws RegisterException;
	User login(User user) throws LoginException;
	void checkAccount(String account)  throws AccountNotFoundException;
	void rePwd(String account, String password) throws RePasswordException;
	String checkEmail(String account, String email) throws EmailException, AddressException, MessagingException;
	void checkCode(String codeT, String code) throws AddressException, MessagingException, VerifyException;
	void checkUserExist(String account) throws UserAlreadyExistException;
	//按视频名称或用户昵称模糊查询Video
	List<String> findUserLikeName(String name);


	int addUser(User user); //增加用户
	//zjj

	User selectUserByUid(int uid);
	void upDateUse(User user);
	void updateUserPower(int uid);
}
