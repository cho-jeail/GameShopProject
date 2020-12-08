package com.cws.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cws.service.HomeService;
import com.cws.vo.UserVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private HomeService HServ;
	
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
	
	@RequestMapping(value = "join/", method = RequestMethod.POST)
	public ModelAndView joinForm(UserVO vo) {
		return HServ.joinUser(vo);
	}
	
	@RequestMapping(value = "signin/", method = RequestMethod.POST)
	public ModelAndView signinForm(UserVO vo, HttpSession session) {
		return HServ.signinUser(vo, session);
	}
	
	@RequestMapping(value = "/signout")
	public ModelAndView signOut(HttpSession session){
		ModelAndView mav = new ModelAndView("redirect:/");
		System.out.println("로그아웃 완료");
		session.invalidate();
		return mav;
	}
	
	
}
