package com.cws.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cws.service.ConsumerCenterService;

@Controller
public class ConsumerCenterController {

	@Autowired private ConsumerCenterService ccs;
	
	@RequestMapping(value = "/CCNotice/", method = RequestMethod.GET)
	public ModelAndView NoticeBoard() {
		return ccs.CCNotice(1);
	}
	@RequestMapping(value = "/CCNotice/{page}/", method = RequestMethod.GET)
	public ModelAndView NoticeBoard(@PathVariable("page") int page) {
		return ccs.CCNotice(page);
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
