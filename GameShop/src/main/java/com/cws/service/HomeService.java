package com.cws.service;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.cws.dao.HomeDAO;
import com.cws.vo.UserVO;

@Service
public class HomeService {
	
	@Autowired
	private HomeDAO HDAO;
	
	public ModelAndView joinUser(UserVO vo) {
		ModelAndView mav = new ModelAndView();
		String id =  UUID.randomUUID().toString().replace("-", "");
		vo.setId(id);
		
		int result = HDAO.joinUser(vo);
		System.out.println(result == 0 ? "회원가입 실패 ㅠㅠ" : "회원가입 성공 !!");
		
		mav.setViewName("redirect:/");
		
		return mav;
	}
	
}
