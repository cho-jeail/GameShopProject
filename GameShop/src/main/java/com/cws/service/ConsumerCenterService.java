package com.cws.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.cws.dao.BoardDAO;
import com.cws.vo.NoticeBoardVO;

@Service
public class ConsumerCenterService {
	
	@Autowired private BoardDAO Bdao;
	
	public ModelAndView CCMain() {
		ModelAndView mav = new ModelAndView("consumerCenter");
		List<NoticeBoardVO> boardList = Bdao.SelectAllNoticeBoard();
		mav.addObject("BoardList", boardList);
		
		return mav;
	}
}
