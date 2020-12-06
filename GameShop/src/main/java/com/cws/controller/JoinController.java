package com.cws.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cws.service.UserService;

@RestController
public class JoinController {
	
	@Autowired private UserService us;	
	
	@RequestMapping(value = "join/checkNickname/{jk}/")
	public String checkNickname(@PathVariable("jk")String checking) {
		return us.checkNickname(checking);
	}
	
	@RequestMapping(value = "join/checkEmail/{jk}/")
	public String checkEmail(@PathVariable("jk")String checking) {
		return us.checkEmail(checking);
	}
	
}
