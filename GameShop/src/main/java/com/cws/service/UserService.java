package com.cws.service;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cws.dao.UserDAO;
import com.cws.vo.UserVO;

@Service
public class UserService {

	@Autowired UserDAO udao;
	
	public void joinUser(UserVO vo) {
		
//		UUID.randomUUID().toString().replace("-", "");
		String id =  UUID.randomUUID().toString().replace("-", "");
		vo.setId(id);
		udao.joinUser(vo);	
	}
	
	
	
}
