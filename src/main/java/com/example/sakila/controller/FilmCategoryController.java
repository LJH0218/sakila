package com.example.sakila.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import lombok.extern.slf4j.Slf4j;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.example.sakila.service.FilmCategoryService;
import com.example.sakila.vo.FilmCategory;


@Slf4j
@Controller
public class FilmCategoryController {
	@Autowired FilmCategoryService filmCategoryService;
	
	// 카테고리 삭제
	@GetMapping("/on/removeFilmCategory")
	public String removeFilmCategory(FilmCategory filmCategory) {
		
		log.debug("FILMCATEGORY---->"+filmCategory.toString());
		
		int row = filmCategoryService.removeFilmCategory(filmCategory);
		return "redirect:/on/filmOne?filmId="+filmCategory.getFilmId();
	}
	
	// 카테고리 추가
	@PostMapping("/on/addFilmCategory")
	public String addFilmCategory(FilmCategory filmCategory) {
		
		log.debug("FILMCATEGORY---->"+filmCategory.toString());
		
		int row = filmCategoryService.addFilmCategory(filmCategory);
		return "redirect:/on/filmOne?filmId="+filmCategory.getFilmId();
	}
	
}
