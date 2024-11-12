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
import com.example.sakila.mapper.FilmMapper;
import com.example.sakila.mapper.InventoryMapper;
import com.example.sakila.service.ActorService;
import com.example.sakila.service.CategoryService;
import com.example.sakila.service.FilmCategoryService;
import com.example.sakila.service.FilmService;
import com.example.sakila.service.InventoryService;
import com.example.sakila.service.LanguageService;
import com.example.sakila.vo.Actor;
import com.example.sakila.vo.Category;
import com.example.sakila.vo.Film;
import com.example.sakila.vo.FilmForm;
import com.example.sakila.vo.Language;
import com.example.sakila.vo.Staff;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class FilmController {
	@Autowired FilmService filmService;
	@Autowired ActorService actorService;
	@Autowired LanguageService languageService;
	@Autowired CategoryService categoryService;
	@Autowired InventoryService inventoryService;
	@Autowired FilmCategoryService filmCategoryService;
	
	
	@PostMapping("/on/modifyFilm")
	public String modifyFilm(Film film){
		
		
		log.debug(film.toString());
		int row = filmService.modifyFilm(film);
		
		return "redirect:/on/filmOne?filmId="+film.getFilmId();
		
	}

	@GetMapping("/on/modifyFilm")
	public String modifyFilm(Model model ,@RequestParam Integer filmId) {
		Map<String, Object> modifyFilm = filmService.getFilmOne(filmId);
		
		
		List<Language> languageList = languageService.getLanguageList();
		model.addAttribute("languageList",languageList);
		model.addAttribute("modifyFilm",modifyFilm);
		return "on/modifyFilm";
	}
	
	
	@GetMapping("/on/removeFilm")
	public String removeFilm(Model model
							, @RequestParam Integer filmId) {
		// 필름이 인벤토리에 등록되어 있다면 삭제 불가
		Integer count = inventoryService.getCountInventoryByFilm(filmId);
		if(count != 0) {
			/* 메세지 추가 할려면 ...  but 중복코드 리팩토링 이슈발생 */
			Map<String, Object> film = filmService.getFilmOne(filmId);

		
			List<Actor> actorList = actorService.getActorListByFilm(filmId);
		
			
			model.addAttribute("film",film);
			model.addAttribute("actorList", actorList);
			model.addAttribute("removeFilmMsg", "film이 inventory에 존재합니다");
			return "on/filmOne";
		}
		//디버깅용
		filmService.removeFilmByKey(filmId);
		// 필름 삭제
		
		
		
		return "redirect:/on/filmList";
	}
	
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
			, @RequestParam int filmId
			, @RequestParam (required  = false) String searchName
				) {
	
		/*
		 * + 1. 현재 필름 정보
		 * 2. 전체 카테고리 리스트
		 * 3. 현재 필름의 카테고리 리스트
		 * 4. 검색 배우 리스트(searchName이 null이 아닐때)
		 * + 5. 현재필름의 배우 리스트
		 * 
		 * 
		 * */		
		// 1.
		Map<String, Object> film = filmService.getFilmOne(filmId);
		log.debug(film.toString());
		List<Film> filmList = filmService.getFilmList(filmId);
		// 2.
		List<Category> allCategoryList = categoryService.getCategoryList();
		// 3.
		List<Map<String, Object>> filmCategoryList = filmCategoryService.getFilmCategoryListByFilm(filmId);
		
		// 5.
		List<Actor> actorList = actorService.getActorListByFilm(filmId);
		log.debug(filmList.toString());
		
		model.addAttribute("film",film);
		model.addAttribute("filmCategoryList",filmCategoryList);
		model.addAttribute("allCategoryList",allCategoryList);
		model.addAttribute("filmList", filmList);
		model.addAttribute("actorList", actorList);
		
		
		return "/on/filmOne";
	}
	
	
}
