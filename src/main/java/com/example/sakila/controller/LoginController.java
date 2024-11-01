package com.example.sakila.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.mapper.StaffMapper;
import com.example.sakila.vo.Staff;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;




@Slf4j
@Controller
public class LoginController {
	@Autowired private StaffMapper staffMapper;
	// 메소드에 직접 매핑 = 다중요청 가능 / 매핑주소 중복 조심(인터페이스 설계에 집중!)
	// @Autowired private ; 
	

	
	@GetMapping("/on/logout")
		public String logout(HttpSession session) { // 가장 효과적인 서블릿인 동시에 많이 쓰이는 방식 (세션부여)
			session.invalidate(); // 세션종료
			log.debug("로그아웃 성공");
			return "redirect:/off/login";
		}
	
	
	// 로그인 폼
	
	@GetMapping("/off/login")
	public String login() {
		log.debug("/off/login 실행됨.");
		return "off/login";
	}
	// 로그인 액션
	@PostMapping("/off/login")
	public String login(Model model
			, HttpSession session
			, @RequestParam(name = "staffId" ) int staffId
			, @RequestParam(name = "password") String password) {
			// defaultValue = 1 기존 디폴트값을 1로
			// int staffId = integer.parseInt(request.getParameter("staffId"))
			// String password = request.getParameter("password")
				
			Staff paramStaff = new Staff();
			paramStaff.setStaffId(staffId);
			paramStaff.setPassword(password);
			
			Staff loginStaff = staffMapper.login(paramStaff);
			if(loginStaff == null) {
				model.addAttribute("msg", "로그인실패");
				return "/off/login";
			}
			session.setAttribute("loginStaff", loginStaff);
			log.debug("로그인성공, 세션 loginstaff속성 추가 ");
		return "redirect:/on/main";
	}
	
	// 로그아웃 폼
}
