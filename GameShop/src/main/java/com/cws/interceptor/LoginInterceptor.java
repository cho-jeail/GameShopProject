package com.cws.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	// 1. request가 발생한 이후 컨트롤러의 메서드를 수행하기 전에 개입 
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// referer에서  와서 RequestURI로 향한다
		// 어디서 왔는지 주소를 알려준다.
//		System.out.println("referer : " + request.getHeader("referer"));
		// 이동할 주소(목적지)
//		System.out.println("RequestURI : " + request.getRequestURI());
		// 기존 세션이 있다면 그 세션을 리턴하고, 세션이 존재하지 않으면 null을 리턴한다
		HttpSession session = request.getSession(false);
		if(session != null && session.getAttribute("signin") != null) {
			return true;
		}
		
		request.setAttribute("msg", "로그인이 필요합니다.");
		request.setAttribute("url", "signin");
		System.out.println(request.getContextPath()+"/redirect/");
		RequestDispatcher dip =  request.getRequestDispatcher("/WEB-INF/views/redirect.jsp");
		dip.forward(request, response);

		return false;
	}

	// 2. 컨트롤러의 메서드가 수행된 이후, view로 넘어가기 전에 개입
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

	// 3. view가  전달된 이후 개입
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		super.afterCompletion(request, response, handler, ex);
	}
}
