package com.example.sakila;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Component
public class OffInterceptor implements HandlerInterceptor {

	@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
				throws Exception {
			
		
		log.debug(request.getRequestURL().toString() + "요청 Interceptor");
		
		
		// 로그인이 되어있다면
		
		HttpSession session = request.getSession(); // 세션값을 받고
		if(session.getAttribute("loginStaff") != null) { // 만약 세션안에 loginStaff가 없다면
			response.sendRedirect(request.getContextPath() + "/on/main"); // /off/login.jsp / 로그인 페이지로 보내버림
			return false; // 그리고 false를 써서 식을 여기서 종료시킴
		}
		
			return HandlerInterceptor.super.preHandle(request, response, handler);
		}
}
