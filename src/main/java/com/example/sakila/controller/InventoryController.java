package com.example.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.FilmService;
import com.example.sakila.service.InventoryService;
import com.example.sakila.vo.Film;
import com.example.sakila.vo.Inventory;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;


@Slf4j
@Controller
public class InventoryController {
	@Autowired InventoryService inventoryService;
	@Autowired FilmService filmService;
	
	
	

	@GetMapping("/on/removeInventoryByKey")
	public String removeInventoryByKey(Inventory inventory) {
		inventoryService.removeInventoryByKey(inventory.getInventoryId());
		return "redirect:/on/inventoryList?storeId="+inventory.getStoreId();
	}
	
	@PostMapping("/on/addInventory")
	public String addInventory(Inventory inventory) {
		inventoryService.addInventory(inventory);
		
		return "redirect:/on/inventoryList?storeId="+inventory.getStoreId();
	}
	
	
	@GetMapping("/on/addInventory")
	public String addInventory(Model model
							, @RequestParam Integer storeId
							, @RequestParam(required = false) String searchTitle) { // 검색용 searchTitle을 넘겨받음

		
		// 편의 상 storeId를 모델에 담아서 넘겨줌
		model.addAttribute("storeId", storeId);
		
		
		// 검색 기능 / btnSearchTitle로 들어왔다면
		if(searchTitle != null && !searchTitle.equals("")) {
			//영화 검색 목록 모델에 추가(배우에 영화추가할때 이미 구현)
			log.debug("searchTitle : "+ searchTitle);
			List<Film> filmList = filmService.getFilmListByTitle(searchTitle);
			model.addAttribute("filmList",filmList);
			model.addAttribute("searchTitle",searchTitle);
		}			
		
		return "on/addInventory";
	}
	
	
	@GetMapping("/on/inventoryList")
	public String inventoryList(Model model
			, @RequestParam Integer storeId 
			, @RequestParam(defaultValue = "1") int currentPage
			, @RequestParam(defaultValue = "10") int rowPerPage ) {// 10개씩 넘기기 20개씩 넘기기용으로 rowPerPage를 받아온다
 		
		int lastPage = inventoryService.getTotalCount(rowPerPage, storeId);
		log.debug("lastPage"+lastPage);
		
		List<Map<String, Object>> inventoryList = inventoryService.getInventoryListByStore(storeId, currentPage, rowPerPage);
		model.addAttribute("inventoryList", inventoryList);
		model.addAttribute("storeId", storeId);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("lastPage", lastPage);
		
		
		return "on/inventoryList";
	}
}
