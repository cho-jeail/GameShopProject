package com.cws.service;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.cws.dao.HomeDAO;
import com.cws.dao.UserDAO;
import com.cws.vo.UserVO;

@Service
public class HomeService {
	
	@Autowired private HomeDAO HDAO;
	@Autowired private UserDAO UDAO;
	
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
		
		int rltInt = HDAO.joinUser(vo);
		System.out.println(rltInt == 0 ? "회원가입 실패" : "회원가입 성공");
		String result = rltInt == 0 ? "회원가입 실패" : "회원가입 성공";
		
		mav.addObject("msg", result);
		mav.addObject("url", "");
	
		return mav;
	}

	// 로그인
	public ModelAndView signinUser(UserVO vo, HttpSession session) {		
		ModelAndView mav = new ModelAndView();
		System.out.println("받은 email확인 : " + vo.getEmail());
		try {
			UserVO evo = UDAO.checkEmail(vo.getEmail());
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
		
			UserVO pvo = UDAO.checkPw(pw);
			System.out.println("password확인 : " + pvo);
			if(pvo == null) {
				mav.setViewName("signin");
				mav.addObject("signResult", "계정이 없거나 비밀번호가 틀렸습니다.");
				return mav;
			}
			else {
				session.setAttribute("signin", pvo);
				mav.setViewName("redirect");
				mav.addObject("msg", "로그인성공");
				mav.addObject("url", "");
				return mav;	
			}
			
		} catch (NullPointerException e) {
			System.out.println("null 오류");
			mav.setViewName("signin");
			mav.addObject("signResult", "계정이 없거나 비밀번호가 틀렸습니다.");
			return mav;
		}
	}

		

		
	
}
