package com.cws.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.cws.dao.BoardDAO;
import com.cws.vo.FAQBoardVO;
import com.cws.vo.NoticeBoardVO;
import com.cws.vo.PagingParamsVO;

@Service
public class ConsumerCenterService {
	
	@Autowired private BoardDAO Bdao;	
	
	public ModelAndView CCNotice(int page, HashMap<String, String> searchMap) {
		ModelAndView mav = new ModelAndView("CC_NoticeBoard");
		mav.addObject("BoardMainName", "공지사항");
		
		int AllCount = Bdao.SelectNoticeCount(searchMap);
		
		PagingParamsVO ppv = new PagingParamsVO(page, AllCount);
		searchMap.put("first", ppv.getFirst() + "");
		searchMap.put("last", ppv.getLast() + "");
		
		List<NoticeBoardVO> boardList = Bdao.SelectPageNoticeBoard(searchMap);
		
		mav.addObject("NoticeSearchWord", searchMap.get("word"));
		mav.addObject("NoticeSearchType", searchMap.get("type"));
		mav.addObject("BoardList", boardList);
		mav.addObject("PageParam", ppv);	
		return mav;
	}

	public ModelAndView CCFAQ(String flag) {
		ModelAndView mav = new ModelAndView("CC_FAQBoard");
		mav.addObject("BoardMainName", "자주 묻는 질문");
		List<FAQBoardVO> FAQBoardList = Bdao.SelectFAQBoardList(flag);
		
		mav.addObject("FAQList", FAQBoardList);
		
		return mav;
	}

	public ModelAndView CCQnA() {
		ModelAndView mav = new ModelAndView("CC_QnABoard");
		mav.addObject("BoardMainName", "문의하기");
		
		return mav;
	}

	public ModelAndView NoticeViewPage(int id) {
		ModelAndView mav = new ModelAndView("CC_NoticeView");
		
		NoticeBoardVO nbvo = Bdao.SelectOneNotice(id);
		mav.addObject("NoticeVO", nbvo);
		
		return mav;
	}

	public ModelAndView DonLoginReturn() {
		ModelAndView mav = new ModelAndView("errorPage");
		mav.addObject("errorText", "로그인 이후 이용해주세요.");
		mav.addObject("UriPath", "/signin/");
		return mav;
	}

	public ModelAndView UploadQnaBoard(HttpServletRequest req) {
		
		return null;
	}
}
