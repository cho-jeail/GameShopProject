package com.cws.dao;

import java.util.List;

import com.cws.vo.FAQBoardVO;
import com.cws.vo.NoticeBoardVO;
import com.cws.vo.PagingParamsVO;

public interface BoardDAO {

	List<NoticeBoardVO> SelectAllNoticeBoard();
	
	List<NoticeBoardVO> SelectPageNoticeBoard(PagingParamsVO ppv);

	NoticeBoardVO SelectOneNotice(int id);
	
	int SelectNoticeCount();

	List<FAQBoardVO> SelectFAQBoardList(String flag);
}
