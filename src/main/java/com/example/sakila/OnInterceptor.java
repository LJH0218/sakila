package com.example.sakila;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Component // spring이 알아서 객체를 만든다음 bean에 자동적으로 저장해줌
public class OnInterceptor implements HandlerInterceptor{
	// 반환타입이 boolean이기에 true를 리턴하면 controller로 보내고 false를 리턴하면 거기서 식을 끝내버림
	// 특정 컨트롤러 실행전에 request와 response를 가로쳐서 실행시킴
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		log.debug(request.getRequestURL().toString() + "요청 Interceptor");
		
		
		// 로그인을 하지 않았다면 session.setAttribute("loginStaff")
		HttpSession session = request.getSession(); // 세션값을 받고
		if(session.getAttribute("loginStaff") == null) { // 만약 세션안에 loginStaff가 없다면
			response.sendRedirect(request.getContextPath() + "/off/login"); // /off/login.jsp / 로그인 페이지로 보내버림
			return false; // 그리고 false를 써서 식을 여기서 종료시킴
		}
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
}

