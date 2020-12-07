package com.cws.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cws.dao.UserDAO;
import com.cws.vo.UserVO;

@Service
public class UserService {

	@Autowired private UserDAO udao;
	
	public String checkNickname(String checking) {
		System.out.println("checking : " + checking);
		UserVO result  = udao.checkNickname(checking);
		if(result != null) {
			return "0";
		}
		else {
			return "1";
		}
	}
	
	
	public String checkEmail(String checking) {
		System.out.println("checking : " + checking);
		UserVO result  = udao.checkEmail(checking);
		if(result != null) {
			return "0";
		}
		else {
			return "1";
		}
	}

	
}
