package com.cws.service;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.cws.dao.UserDAO;
import com.cws.mail.MailUtil;
import com.cws.vo.CouponBoxVO;
import com.cws.vo.CouponVO;
import com.cws.vo.OutReasonVO;
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
		String result = rltInt == 0 ? "회원가입에 실패하셨습니다. 잠시 후 다시 시도해주세요." : "회원가입에 성공하셨습니다.";
		
		mav.addObject("msg", result);
		mav.addObject("url", "");
	
		return mav;
	}

	// 로그인
	public ModelAndView signinUser(UserVO vo, HttpSession session, HttpServletRequest request, HttpServletResponse response) {		
		ModelAndView mav = new ModelAndView("redirect");
//		System.out.println("받은 email확인 : " + vo.getEmail());
		try {
			UserVO evo = udao.checkEmail(vo.getEmail());
			String pw = vo.getPassword();
//			System.out.println("실행 후 email확인 : " + evo.getEmail());
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
				String checking = request.getParameter("regCk");
				System.out.println("체크 확인 : " + "on".equals(checking));
				
				if("on".equals(checking)) {
					Cookie signinCookie = new Cookie("signin_Cookie", pvo.getId().toUpperCase());
					signinCookie.setMaxAge(60*60*24*7);
					signinCookie.setPath("/"); // 쿠키 저장위치 
					response.addCookie(signinCookie);
				}
				
				System.out.println("로그인 성공!");
				session.setAttribute("signin", pvo);
				session.setMaxInactiveInterval(60*60); // 세션유지시간 1시간(초 * 분)
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
	
	// 로그아웃
	public ModelAndView signOutUser(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("redirect:/");
		
		Cookie[] cookieBox = request.getCookies();

		for (Cookie cookie : cookieBox) {
			if(cookie.getName().equals("signin_Cookie")) {
				cookie.setMaxAge(0);
				cookie.setPath("/");
				response.addCookie(cookie);
				break;
			}
		}
		
		System.out.println("로그아웃 완료");
		session.invalidate();
		return mav;
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
			mav.addObject("msg", svo.getEmail() + "로 메일이 발송되었습니다.");
			mav.addObject("url", "signin");
			
		}
		else {
			System.out.println("등록된 계정이 없습니다.");
			mav.addObject("msg", vo.getEmail() + "로 메일이 발송되었습니다.");
			mav.addObject("url", "signin");
		}
		return mav;
	}
	
	// 닉네임 중복확인
	public UserVO checkNickname(String checking) {
//		System.out.println("닉네임 checking : " + checking);
		UserVO result  = udao.checkNickname(checking);
		if(result != null) { return result; }			
		else { return null; }
	}
	
	// 이메일 중복확인
	public UserVO checkEmail(String checking) {
//		System.out.println("이메일 checking : " + checking);
		UserVO result  = udao.checkEmail(checking);
		if(result != null) { return result; }				
		else { return null; }
	}

	//회원정보 수정
	@Transactional(timeout = 5)
	public ModelAndView updateUser(UserVO vo, HttpSession session) {
		ModelAndView mav = new ModelAndView("redirect");
		UserVO uvo = udao.selectUser(vo.getId());
		if(!(vo.getPassword().equals(""))) {
			try {
				MessageDigest md = MessageDigest.getInstance("SHA-256");
				md.update(vo.getId().getBytes());
				md.update(vo.getPassword().getBytes());
				vo.setPassword(String.format("%064x", new BigInteger(1, md.digest())));
			} catch (NoSuchAlgorithmException e) {
				System.out.println("NoSuchAlgorithmException 오류");
				e.printStackTrace();
			}
		}
		else {
			vo.setPassword(uvo.getPassword());
		}
		
		int rltInt = udao.updateUser(vo);
		System.out.println(rltInt == 0 ? "정보수정실패" : "정보수정성공");
		String result = rltInt == 0 ? "회원정보 수정이 실패했습니다." : "회원정보가 수정되었습니다.";
		UserVO rvo = udao.selectUser(vo.getId());
		System.out.println("세션 시간 : " + session.getMaxInactiveInterval());
		session.setAttribute("signin", rvo);
		mav.addObject("msg", result);
		mav.addObject("url", "mypage");
		
		return mav;
	}

	//비밀번호 확인
	public String checkPwd(HashMap<String, String> param) {
		UserVO vo = new UserVO();
		vo.setId(param.get("id"));
		UserVO uvo = udao.selectUser(vo.getId());
		String pwd;
		if(uvo != null) {
			try {
				MessageDigest md = MessageDigest.getInstance("SHA-256");
				md.update(uvo.getId().getBytes());
				md.update(param.get("password").getBytes());
				pwd = String.format("%064x", new BigInteger(1, md.digest()));	
				if(uvo.getPassword().equals(pwd)) {
					return "인증완료";
				}
				else {
					return "인증실패";
				}
			} catch (NoSuchAlgorithmException e) {
				System.out.println("NoSuchAlgorithmException 오류");
				e.printStackTrace();
			}
		}
		return null;
	}

	// 회원 탈퇴
	@Transactional(timeout = 5)
	public ModelAndView memberOut(OutReasonVO vo, HttpSession session, HttpServletRequest req, HttpServletResponse resp) {
		ModelAndView mav = new ModelAndView("redirect");
		Cookie[] cookies = req.getCookies();
		
		if(!(vo.getOutreason().equals(""))) {
			int reg = udao.insertOutReason(vo);
			if(reg != 0) {
				System.out.println("사유 등록 완료");
			}
		}
		System.out.println("id확인 : " + vo.getId());
		int result = udao.deleteUser(vo.getId());
		
		if(result != 0) {
			System.out.println("유저 삭제 완료");
			for(Cookie c : cookies) {
				if(c.getName().equals("signin_Cookie")) {
					c.setMaxAge(0);
					c.setPath("/"); // 쿠키 저장위치 
					resp.addCookie(c);
				}
			}
			session.removeAttribute("signin");
			mav.addObject("msg", "회원탈퇴가 완료되었습니다. 이용해주셔서 감사합니다.");
			mav.addObject("url", "");
		}
		else {
			System.out.println("삭제 실패");
			mav.addObject("msg", "오류로 인하여 탈퇴가 실패되었습니다.");
			mav.addObject("url", "mypage");
		}
		return mav;
	}

	// 사용자 쿠폰들
	public ModelAndView selectCoupons(String userId) {
		ModelAndView mav = new ModelAndView("mypageCoupon");
		List<CouponVO> couponValidityList = udao.selectCouponValidity(userId);
		if(!(couponValidityList.isEmpty())) {
			int rel = udao.deleteExpiredCoupon(userId);
			System.out.println("지움 유무 : " + (rel == 0 ? "안지워짐" : "지워짐"));
			mav.addObject("couponMsg", "유효기간이 끝난 쿠폰이 삭제되었습니다.");
		}
		
		List<CouponVO> cList = udao.selectCoupons(userId);
		for(CouponVO c : cList) {
			c.setStrDate(new SimpleDateFormat("yyyy년 MM월 dd일").format(c.getValidity()));
		}
		
		mav.addObject("userCoupons", cList);
		return mav;
	}

	// 쿠폰등록
	@Transactional(timeout = 5)
	public ModelAndView insertCoupon(CouponVO vo) {
		ModelAndView mav = new ModelAndView("redirect");
		CouponBoxVO cBox = udao.selectCouponBox(vo.getId()); // 관리자 쿠폰박스
		CouponVO uvo = udao.havingCoupon(vo);	// 사용자 쿠폰함
		Date today = new Date();
		
		if(cBox == null) {	// 쿠폰박스에 쿠폰이 있는가?
			System.out.println("쿠폰없음");
			mav.addObject("msg", "쿠폰번호가 존재하지 않습니다.");
			mav.addObject("url", "mypage/mypageCoupon/");	
		}
		else if(cBox.getValidity().before(today)) {	// 쿠폰 유효기간이 지났는가?
			System.out.println("쿠폰기간 만료");
			mav.addObject("msg", "유효기간이 만료된 쿠폰입니다.");
			mav.addObject("url", "mypage/mypageCoupon/");
		}
		else if(uvo != null) {	// 사용자에게 쿠폰이 등록되어 있는가?
			System.out.println("쿠폰중복");
			mav.addObject("msg", "이미 등록된 쿠폰입니다. 쿠폰함을 확인하세요.");
			mav.addObject("url", "mypage/mypageCoupon/");	
		}
		else {
			vo.setName(cBox.getName());
			vo.setSalePrice(cBox.getSalePrice());
			vo.setValidity(cBox.getValidity());
			vo.setFileUrl(cBox.getFileUrl());
			System.out.println("입력 완료");
			int result = udao.insertCoupon(vo);
			System.out.println("등록 완료");
			if(result != 0) {
				mav.addObject("msg", "쿠폰이 등록되었습니다. 쿠폰함을 확인해주세요.");
				mav.addObject("url", "mypage/mypageCoupon/");
			}
			else {
				mav.addObject("msg", "오류로 인하여 쿠폰등록이 실패하였습니다. 잠시후 다시 시도해주세요.");
				mav.addObject("url", "mypage/mypageCoupon/");
			}
		}
		return mav;
	}
	
}
