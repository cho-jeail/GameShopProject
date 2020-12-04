package com.cws.dao;

import java.util.List;

import com.cws.vo.NoticeBoardVO;

public interface BoardDAO {

	List<NoticeBoardVO> SelectAllNoticeBoard();
}
