package com.cws.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cws.service.UserService;
import com.cws.vo.UserVO;

@Controller
public class LoginController {
	
	@Autowired private UserService us;
	
	@RequestMapping(value = "signin/", method = RequestMethod.POST)
	public ModelAndView signinForm(UserVO vo, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		return us.signinUser(vo, session, request, response);
	}
	
	@RequestMapping(value = "/signout")
	public ModelAndView signOut(HttpSession session, HttpServletRequest request, HttpServletResponse response){
		return us.signOutUser(session, request, response);
	}
	
	@RequestMapping(value = "findPwd/", method = RequestMethod.POST)
	public ModelAndView findPwd(UserVO vo) {
		return us.issuePwd(vo);
	}

}
