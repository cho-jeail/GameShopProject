package com.cws.dao;

import com.cws.vo.UserVO;

public interface UserDAO {

	UserVO checkNickname(String checking);

	UserVO checkEmail(String checking);
	
}
