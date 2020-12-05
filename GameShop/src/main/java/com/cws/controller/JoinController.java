package com.cws.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cws.service.UserService;
import com.cws.vo.UserVO;

@Controller
public class JoinController {
	
	@Autowired UserService us;
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public ModelAndView joinForm(UserVO vo) {
		ModelAndView mav = new ModelAndView("home");
		
		us.joinUser(vo);
		
		return mav;
	}
}
