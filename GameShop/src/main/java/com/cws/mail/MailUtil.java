package com.cws.mail;

import java.util.UUID;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;

public class MailUtil {
	public void sendMail(String email, String subject, String msg) {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; 		// smtp 서버명
		String hostSMTPid = "project0235";			// 아이디
		String hostSMTPpwd = "pro@0235jet";  		// 비밀번호
		System.out.println("아이디 : " + hostSMTPid);
		System.out.println("비밀번호 : " + hostSMTPpwd);
		
		// 보내는 사람
		String formEmail = "project0235@gmail.com"; 	// 보내는사람@메일.com
		String formName = "GameShop매니저";		 	// 보내는사람 이름
		
		// email 전송
		try {
			HtmlEmail mail = new HtmlEmail();
			mail.setDebug(true);
			mail.setCharset(charSet);
			mail.setSSLOnConnect(true);				// SSL 사용 ( TLS가 없는경우  SSL 사용)
			
			mail.setHostName(hostSMTP);
			mail.setSmtpPort(465);					// SMTP 포트번호 (일일 확인)
			
			mail.setAuthentication(hostSMTPid, hostSMTPpwd); // 사용자 인증
			mail.setStartTLSEnabled(false);			// TLS 사용
			mail.addTo(email);						// 받는 사람 이메일 주소
			mail.setFrom(formEmail, formName, charSet);
			mail.setSubject(subject);				// 제목
			mail.setHtmlMsg(msg);					// 내용
			mail.send();
			System.out.println("email 발송완료");
		} catch (EmailException e) {
			System.out.println("email 오류 ");
			e.printStackTrace();
		}
	}
	
	public String createKey() {
		String key = UUID.randomUUID().toString().replace("-", "");
		key = key.substring(0, 11);
		return key;
	}
}