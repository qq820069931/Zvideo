package com.joinlabs.util;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Component;


@Component("EmailUtil")
public class EmailUtil {

	public static String verificationCode(String email) throws AddressException,
			MessagingException {
		// 发送邮件服务器
		String host = "smtp.qq.com";
		// 发件邮箱
		String from = "820069931@qq.com";
		// 收件邮箱
		String to = email;
		// new properties
		Properties props = new Properties();
		// Setup mail server
		props.put("mail.smtp.host", host);// 设置smtp主机
		props.put("mail.smtp.auth", "true");// 使用smtp身份验证
		// Get session (获取邮箱服务器会话)
		Session session = Session.getDefaultInstance(props, null);
		// Define message
		MimeMessage message = new MimeMessage(session);
		message.setFrom(new InternetAddress(from));
		message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
		// 邮件标题
		message.setSubject("验证码");// 标题
		String str = "1234567890";
		Random random = new Random();
		String code = "";
		for (int i = 0; i <= 5; i++) {
			code += str.charAt(random.nextInt(str.length())) + "";
		}
		// 邮件内容
		message.setText("您的验证码是"+code);// 内容
		// http协议部分会自动转换成超链接
		message.saveChanges();
		// Send message
		Transport transport = session.getTransport("smtp");
		// 建立连接(注意不是邮箱密码,是SMTP服务的密码)
		transport.connect(host, "820069931@qq.com", "fkqmmeqevvfjbdie");
		// 发送信息
		transport.sendMessage(message, message.getAllRecipients());
		return code;

	}

}
