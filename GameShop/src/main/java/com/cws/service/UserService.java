package com.cws.service;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.cws.dao.UserDAO;
import com.cws.mail.MailUtil;
import com.cws.vo.UserVO;

@Service
public class UserService {

	@Autowired private UserDAO udao;
	
	// 회원가입
	public ModelAndView joinUser(UserVO vo) {
		ModelAndView mav = new ModelAndView("redirect");
		String id =  UUID.randomUUID().toString().replace("-", "");
		System.out.println("id : " + id);
		vo.setId(id);
		
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");	
			String pw = vo.getPassword();
			md.update(id.getBytes());
			md.update(pw.getBytes());
			pw = String.format("%064x", new BigInteger(1, md.digest()));
			System.out.println("pw : " + pw);
			vo.setPassword(pw);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		int rltInt = udao.joinUser(vo);
		System.out.println(rltInt == 0 ? "회원가입 실패" : "회원가입 성공");
		String result = rltInt == 0 ? "회원가입 실패" : "회원가입 성공";
		
		mav.addObject("msg", result);
		mav.addObject("url", "");
	
		return mav;
	}

	// 로그인
	public ModelAndView signinUser(UserVO vo, HttpSession session) {		
		ModelAndView mav = new ModelAndView("redirect");
		System.out.println("받은 email확인 : " + vo.getEmail());
		try {
			UserVO evo = udao.checkEmail(vo.getEmail());
			String pw = vo.getPassword();
			System.out.println("실행 후 email확인 : " + evo.getEmail());
			try {
				MessageDigest md = MessageDigest.getInstance("SHA-256");
				String id = evo.getId();
				System.out.println("id : " + id);
				md.update(id.getBytes());
				md.update(pw.getBytes());
				pw = String.format("%064x", new BigInteger(1, md.digest()));	
			} catch (NoSuchAlgorithmException e) {
				System.out.println("NoSuchAlgorithmException 오류");
				e.printStackTrace();
			}
		
			UserVO pvo = udao.checkPw(pw);
			System.out.println("password확인 : " + pvo);
			if(pvo == null) {
				mav.setViewName("signin");
				mav.addObject("signEmail", vo.getEmail());
				mav.addObject("signResult", "계정이 없거나 비밀번호가 틀렸습니다.");
				return mav;
			}
			else {
				System.out.println("로그인 성공!");
				session.setAttribute("signin", pvo);
				mav.addObject("msg", "로그인성공");
				mav.addObject("url", "");
				return mav;	
			}
			
		} catch (NullPointerException e) {
			System.out.println("null 오류, 로그인 실패");
			mav.setViewName("signin");
			mav.addObject("signEmail", vo.getEmail());
			mav.addObject("signResult", "계정이 없거나 비밀번호가 틀렸습니다.");
			return mav;
		}
	}

	// 임시 비밀번호 발급
	public ModelAndView issuePwd(UserVO vo) {
		ModelAndView mav = new ModelAndView("redirect");
		System.out.println("임시 비밀번호 발급을 위한 이메일 확인 : " + vo.getEmail());
		UserVO svo = checkEmail(vo.getEmail());
		if(svo != null) {
			MailUtil mailUtil = new MailUtil();
			String tmpkey = mailUtil.createKey();
			System.out.println("임시 비밀번호 생성 : " + tmpkey);	
			String subject = "GameShop에서 보낸 임시 비밀번호입니다.";
			String msg = "";
			
			msg += "<div align='center' style='border: 1px solid black; font-family: verdana;'>";
			msg += "<h3 style='color: blue;'>임시 비밀번호입니다.</h3>";
			msg += "<div style='font-size: 130%;'>";
			msg += "인증코드 : <strong>" + tmpkey + "</strong></div><br>";
			
			mailUtil.sendMail(vo.getEmail(), subject, msg);
			
			try {
				MessageDigest md = MessageDigest.getInstance("SHA-256");
				md.update(svo.getId().getBytes());
				md.update(tmpkey.getBytes());
				svo.setPassword(String.format("%064x", new BigInteger(1, md.digest())));
			} catch (NoSuchAlgorithmException e) {
				System.out.println("NoSuchAlgorithmException 오류");
				e.printStackTrace();
			}		
			
			udao.updatePw(svo);
			mav.addObject("msg", "메일발송");
			mav.addObject("url", "signin");
			
		}
		else {
			mav.setViewName("findpwd");
			mav.addObject("NFE", "등록된 계정이 없습니다.");
			mav.addObject("NFEval", vo.getEmail());
		}
		return mav;
	}
	
	// 닉네임 중복확인
	public UserVO checkNickname(String checking) {
		System.out.println("닉네임 checking : " + checking);
		UserVO result  = udao.checkNickname(checking);
		if(result != null) { return result; }			
		else { return null; }
	}
	
	// 이메일 중복확인
	public UserVO checkEmail(String checking) {
		System.out.println("이메일 checking : " + checking);
		UserVO result  = udao.checkEmail(checking);
		if(result != null) { return result; }				
		else { return null; }
	}

	
	
}
