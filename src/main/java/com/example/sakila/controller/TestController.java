package com.example.sakila.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class TestController {
	@GetMapping("/on/staff/staffList")
	public String staffList(){
		// OninterCeptor 호출
		return "/on/staff/staffList";
	}
	
	@GetMapping("/on/film/addfilm")
	public String addFilm(){
		// OninterCeptor 호출
		return "/on/film/addFilm";
	}
	
}
