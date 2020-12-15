package com.cws.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.cws.dao.BoardDAO;
import com.cws.vo.FAQBoardVO;
import com.cws.vo.NoticeBoardVO;
import com.cws.vo.PagingParamsVO;
import com.cws.vo.QABoardVO;

@Service
public class ConsumerCenterService {
	
	@Autowired private BoardDAO Bdao;
	private final String filePath = "D:\\upload\\";
	
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
		mav.addObject("TitleName", "Error Page");
		mav.addObject("PopupText", "로그인 이후 이용해주세요.");
		mav.addObject("UriPath", "/signin/");
		return mav;
	}

	public ModelAndView UploadQnaBoard(MultipartHttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		QABoardVO QAVO = new QABoardVO();
		QAVO.setCategory(req.getParameter("category"));
		QAVO.setTitle(req.getParameter("title"));
		QAVO.setContent(req.getParameter("content"));
		QAVO.setWriter(req.getParameter("writer"));
		QAVO.setImage1(req.getFile("imgFile1").getSize() == 0 ? "null" : ImageUpload(req.getFile("imgFile1")));
		QAVO.setImage2(req.getFile("imgFile2").getSize() == 0 ? "null" : ImageUpload(req.getFile("imgFile2")));
		QAVO.setImage3(req.getFile("imgFile3").getSize() == 0 ? "null" : ImageUpload(req.getFile("imgFile3")));
		
		int result = Bdao.InsertQna(QAVO);
		
		if(result != 1) {
			mav.setViewName("errorPage");
			mav.addObject("TitleName", "문의 실패");
			mav.addObject("PopupText", "문제가 발생하여 실패하였습니다. 다시 문의해주세요.");
			mav.addObject("UriPath", "/CCQnA/");
		}
		else {
			mav.setViewName("errorPage");
			mav.addObject("TitleName", "문의 성공");
			mav.addObject("PopupText", "정상적으로 처리되었습니다.");
			mav.addObject("UriPath", "/");
		}
		
		return mav;
	}
	
	public String ImageUpload(MultipartFile MpFile) {
		String fileName = MpFile.getOriginalFilename();
		String ExtName = fileName.substring(fileName.lastIndexOf("."));
		String SaveFileName = UUID.randomUUID().toString().replace("-", "") + ExtName;
		
		File file = new File(filePath + SaveFileName);
		
		try {
			MpFile.transferTo(file);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return SaveFileName;
	}

	public ModelAndView MypageQna(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("mypageQna");
		return mav;
	}
}