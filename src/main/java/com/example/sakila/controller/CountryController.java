package com.example.sakila.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.sakila.mapper.CountryMapper;
import com.example.sakila.vo.Country;



@Controller
public class CountryController {
	@Autowired CountryMapper countryMapper; // 2. 대신 @Autowired를 써서 호출할수있다 / null은 안됌 : Spring DI 다형성
	// 다형성 구조를 스프링이 자동으로 만들어준것
	
	@GetMapping("/countryList")
	public String countryList(Model model){
		List<Country> list = countryMapper.selectCountryList();
		System.out.println(list);
		model.addAttribute("list", list);
		
		return "countryList"; // countryList.jsp 포워딩 / 리다이렉트해야할 경우엔 "redirect:countryList"로 입력하면된다.
		// 1. CountryMapper countryMapper = new CountryMapper(); 인터페이스는 추상적인 객체라서 기존에 쓰던 이런식의 호출이 불가능
	}
	
}
