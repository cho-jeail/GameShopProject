package com.cws.dao;

import java.util.List;

import com.cws.vo.CouponBoxVO;
import com.cws.vo.CouponVO;
import com.cws.vo.OutReasonVO;
import com.cws.vo.UserVO;

public interface UserDAO {

	UserVO checkNickname(String checking);

	UserVO checkEmail(String checking);

	UserVO checkPw(String pw);

	int joinUser(UserVO vo);

	void updatePw(UserVO svo);

	int updateUser(UserVO vo);

	UserVO selectUser(UserVO vo);

	int insertOutReason(OutReasonVO vo);

	int deleteUser(String id);

	List<CouponVO> selectCoupons(String userId);

	CouponBoxVO selectCouponBox(String id);

	int insertCoupon(CouponVO vo);

	CouponVO havingCoupon(CouponVO vo);

	List<CouponVO> selectCouponValidity(String userId);

	int deleteExpiredCoupon(String userId);
	
}
