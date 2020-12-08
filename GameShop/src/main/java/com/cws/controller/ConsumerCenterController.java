package com.cws.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cws.service.ConsumerCenterService;

@Controller
public class ConsumerCenterController {

	@Autowired private ConsumerCenterService ccs;
	
	@RequestMapping(value = "/CCNotice/")
	public ModelAndView NoticeSearchBoard(HttpServletRequest req) {
		String SearchType = req.getParameter("NoticeSearchType");
		String SearchWord = req.getParameter("NoticeSearchWord");
		String page = req.getParameter("page");
		
		HashMap<String, String> SearchMap = new HashMap<String, String>();
		SearchMap.put("type", SearchType);
		SearchMap.put("word", SearchWord);
		return page != null ? ccs.CCNotice(Integer.parseInt(page), SearchMap) : ccs.CCNotice(1, SearchMap);
	}
	
	@RequestMapping(value = "/CCNotice/Board/", method = RequestMethod.GET)
	public ModelAndView NoticeBoardView(@Param("id") int id) {
		return ccs.NoticeViewPage(id);
	}
	
	@RequestMapping(value = "/CCFAQ/", method = RequestMethod.GET)
	public ModelAndView FAQBoard(@Param("flag") String flag) {
		return ccs.CCFAQ(flag);
	}
	
	@RequestMapping(value = "/CCQnA/", method = RequestMethod.GET)
	public ModelAndView QnABoard() {
		return ccs.CCQnA();
	}
}
