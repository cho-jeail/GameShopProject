package com.cws.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cws.service.UserService;
import com.cws.vo.UserVO;

@RestController
public class JoinController {
	
	@Autowired private UserService us;	
	
	@RequestMapping(value = "/checkNickname/{jk}/", produces = "application/text; charset=UTF-8")
	public String checkNickname(@PathVariable("jk")String checking) {
		UserVO result = us.checkNickname(checking);
		return result != null ? "사용중" : "생성가능";
	}
	
	@RequestMapping(value = "/checkEmail/{jk}/", produces = "application/text; charset=UTF-8")
	public String checkEmail(@PathVariable("jk")String checking) {
		UserVO result =  us.checkEmail(checking);
		return result != null ? "사용중" : "생성가능";
	}
	
}
