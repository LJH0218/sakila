package com.example.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.mapper.CategoryMapper;
import com.example.sakila.service.ActorService;
import com.example.sakila.service.CategoryService;
import com.example.sakila.service.FilmService;
import com.example.sakila.service.LanguageService;
import com.example.sakila.vo.Actor;
import com.example.sakila.vo.Category;
import com.example.sakila.vo.Film;
import com.example.sakila.vo.FilmForm;
import com.example.sakila.vo.Language;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class FilmController {
	@Autowired FilmService filmService;
	@Autowired ActorService actorService;
	@Autowired LanguageService languageService;
	@Autowired CategoryService categoryService;
	
	
	@GetMapping("/on/filmList")
	public String filmList(Model model
			, @RequestParam(required = false) Integer categoryId
			, @RequestParam(defaultValue = "1") int currentPage
			, @RequestParam(defaultValue = "10") int rowPerPage) {// null이 넘어올수도있고 category가 넘어올수도 있으면 requestMapping을 쓴다
		
		
		int lastPage = filmService.getTotalCount(rowPerPage, categoryId);
		// 디버깅
		log.debug("categoryId :" + categoryId);
		log.debug("currentPage :" + currentPage);
		log.debug("rowPerPage :" + rowPerPage);
		
		List<Map<String, Object>> filmList = filmService.getFilmList(categoryId, currentPage, rowPerPage);
		//디버깅
		log.debug("filmList :" + filmList);
		model.addAttribute("filmList", filmList);
		model.addAttribute("lastPage", lastPage);
		
		// model에 category List 출력
		
		
		
		List<Category> categoryList = categoryService.getCategoryList();
		log.debug("categoryList :" + categoryList);
		
		model.addAttribute("categoryList",categoryList);
		// 같이 넘겨야할 모델값 현재페이지, 현재 카테고리아이디
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("currentCategoryId", categoryId); // 이름이 복잡해지니 currentCategoryId로 변경
		
		return "/on/filmList";
	}
	
	
	@PostMapping("/on/addFilm")
	public String addFilm(FilmForm filmForm) {
		log.debug(filmForm.toString());
		// filmService : filmForm > film
		filmService.addFilm(filmForm);
		
		return "redirect:/on/filmList";
		
	}
	
	@GetMapping("/on/addFilm")
		public String addFilm(Model model){
			// languageList
			List<Language> languageList = languageService.getLanguageList();
			log.debug(languageList.toString());
			model.addAttribute("languageList",languageList);
			return "on/addFilm";
		}
	
	
	@GetMapping("/on/filmOne")
	public String filmOne(Model model
			, @RequestParam int filmId) {
		Map<String, Object> film = filmService.getFilmOne(filmId);
		log.debug(film.toString());
		List<Film> filmList = filmService.getFilmList(filmId);
		List<Actor> actorList = actorService.getActorListByFilm(filmId);
		log.debug(filmList.toString());
		
		model.addAttribute("film",film);
		model.addAttribute("filmList", filmList);
		model.addAttribute("actorList", actorList);
		
		
		return "/on/filmOne";
	}
	
	
}
