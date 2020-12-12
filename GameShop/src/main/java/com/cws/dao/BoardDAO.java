package com.cws.dao;

import java.util.HashMap;
import java.util.List;

import com.cws.vo.FAQBoardVO;
import com.cws.vo.NoticeBoardVO;
import com.cws.vo.PagingParamsVO;
import com.cws.vo.QABoardVO;

public interface BoardDAO {

	List<NoticeBoardVO> SelectAllNoticeBoard();
	
	List<NoticeBoardVO> SelectPageNoticeBoard(HashMap<String, String> searchMap);

	NoticeBoardVO SelectOneNotice(int id);
	
	int SelectNoticeCount(HashMap<String, String> searchMap);

	List<FAQBoardVO> SelectFAQBoardList(String flag);

	int InsertQna(QABoardVO qAVO);
}
