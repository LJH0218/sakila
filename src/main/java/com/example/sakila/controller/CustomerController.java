package com.example.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.AddressService;
import com.example.sakila.service.CustomerService;
import com.example.sakila.service.StoreService;
import com.example.sakila.vo.Address;
import com.example.sakila.vo.Customer;
import com.example.sakila.vo.Store;

import org.springframework.web.bind.annotation.PostMapping;



@Slf4j
@Controller
public class CustomerController {
	@Autowired CustomerService customerService;
	@Autowired StoreService storeService;
	@Autowired AddressService addressService;
	
	
	
	@GetMapping("/on/customerOne")
	public String customerOneList(Model model
							, @RequestParam Integer customerId) {
		
		List<Map<String, Object>> customerOneList = customerService.getcustomerOneList(customerId);
		model.addAttribute("customerOneList", customerOneList);
		
		
		return "on/customerOne";
	}
	
	
	
	@GetMapping("/on/customerList")
	public String customerList(Model model
							, @RequestParam(defaultValue = "1") Integer currentPage
							, @RequestParam(defaultValue = "10") Integer rowPerPage) {
	
		int lastPage = customerService.getLastPage(rowPerPage);
		
		Map<String, Object> resultMap = customerService.getCustomerList(currentPage, rowPerPage);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("lastPage",lastPage);
		
		//resultMap을 풀어서 넣을수도있다 / 대신 코드가 복잡해짐 = 가독성 하락
		model.addAttribute("startPagingNum",resultMap.get("startPagingNum"));
		model.addAttribute("endPagingNum",resultMap.get("endPagingNum"));
		model.addAttribute("customerList",resultMap.get("customerList"));
		
	
		
		
		return "on/customerList";
	}
	
	@GetMapping("/on/addCustomer")
	public String addCustomer(Model model
			, @RequestParam(required = false) String searchAddress) { // searchAddress를 넘겨받음
		// storeList <= 사전작업 x
		// addressList <= 검색(백엔드 구현완료) searchAddress != null
		
		List<Store> storeList = storeService.getStoreList();
		model.addAttribute("storeList",storeList);
		
		// addressList <-- 검색 searchAddress != null
		if(searchAddress != null && !searchAddress.equals("")) {
			List<Address> addressList = addressService.getAddressListByWord(searchAddress);
			model.addAttribute("addressList",addressList);
		}
		return "on/addCustomer";
	}
	
	@PostMapping //("/on/addCustomer")
	public String addCustomer(Customer customer) {
		// 고객 추가
		
		Integer row = customerService.addCustomer(customer);
		//log.debug(row);
		
		return "redirect:/on/customerList";
	}
	
}
