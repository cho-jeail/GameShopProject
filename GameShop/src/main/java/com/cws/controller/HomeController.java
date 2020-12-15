package com.cws.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cws.service.ConsumerCenterService;
import com.cws.service.UserService;
import com.cws.vo.OutReasonVO;
import com.cws.vo.UserVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired private UserService UServ;
	@Autowired private ConsumerCenterService CCS;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/signin")
	public void signInMain() {}
	
	@RequestMapping(value = "/policy")
	public void policyMain() {}
	
	@RequestMapping(value = "/join")
	public void joinMain() {}
	
	@RequestMapping(value = "/jusoPopup")
	public void jusoPopupMain() {}
	
	@RequestMapping(value = "/findpwd")
	public void findpwd() {}
	
	@RequestMapping(value = "/mypage")
	public void mypage() {}
	
	@RequestMapping(value = "join/", method = RequestMethod.POST)
	public ModelAndView joinForm(UserVO vo) {
		return UServ.joinUser(vo);
	}
	
	@RequestMapping(value = "updateInfo/", method = RequestMethod.POST)
	public ModelAndView updateInfo(UserVO vo, HttpSession session) {
		return UServ.updateUser(vo, session);
	}
		
	@RequestMapping(value = "/mypage/mypQna/", method = RequestMethod.GET)
	public ModelAndView MypageQna(HttpServletRequest req) {
		return CCS.MypageQna(req);
	}
	
	@RequestMapping(value = "/mypage/mypQna/{id}/", method = RequestMethod.GET)
	public ModelAndView QnaBoardView(@PathVariable("id") int id) {
		return CCS.QnaBoardView(id);
	}
	
	@RequestMapping(value = "memberOut/", method = RequestMethod.POST)
	public ModelAndView memberOut(OutReasonVO vo, HttpSession session, HttpServletRequest req, HttpServletResponse resp) {
		return UServ.memberOut(vo, session, req, resp);
	}
}
