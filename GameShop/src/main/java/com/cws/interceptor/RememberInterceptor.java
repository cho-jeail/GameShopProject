package com.cws.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.cws.dao.UserDAO;
import com.cws.vo.UserVO;

public class RememberInterceptor extends HandlerInterceptorAdapter {

	@Autowired private UserDAO udao;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		Cookie[] cookieBox = request.getCookies();
		String signinCookie = null;
		boolean cookieFlag = false;

		if(session != null && session.getAttribute("signin") != null) {
			return true;
		}
		else if(cookieBox != null) {
			for (Cookie cookie : cookieBox) {
				if(cookie.getName().equals("signin_Cookie")) {
					signinCookie = cookie.getValue();
					System.out.println("signinCookie : " + signinCookie);
					cookieFlag = true;
				}
			}
				
			if(cookieFlag) {
				signinCookie = signinCookie.toLowerCase();
				UserVO vo = udao.selectUser(signinCookie);
				session.setAttribute("signin", vo);
				session.setMaxInactiveInterval(60*60); // 세션유지시간 1시간(초 * 분)
				return true;
			}
			else return true;
		}
		else
			return true;
//			return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		super.afterCompletion(request, response, handler, ex);
	}
	
}
