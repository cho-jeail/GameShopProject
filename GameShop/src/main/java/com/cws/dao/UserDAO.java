package com.cws.dao;

import com.cws.vo.UserVO;

public interface UserDAO {

	UserVO checkNickname(String checking);

	UserVO checkEmail(String checking);

	UserVO checkPw(String pw);

	int joinUser(UserVO vo);

	void updatePw(UserVO svo);
	
}
