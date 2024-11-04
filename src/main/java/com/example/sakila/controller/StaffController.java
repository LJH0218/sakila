package com.example.sakila.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.mapper.AddressMapper;
import com.example.sakila.mapper.StaffMapper;
import com.example.sakila.mapper.StoreMapper;
import com.example.sakila.vo.Address;
import com.example.sakila.vo.Staff;
import com.example.sakila.vo.Store;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class StaffController {
	@Autowired StaffMapper staffMapper;
	@Autowired StoreMapper storeMapper;
	@Autowired AddressMapper addressMapper;
	
	
	//active 수정
	@GetMapping("/on/modifyStaffActive")
	public String modifyStaffActive(Staff staff) {
		if(staff.getActive() == 1) {
			staff.setActive(2);
		}else {
			staff.setActive(1);
		}
		int row = staffMapper.updateStaff(staff);
		// 어떤 컬럼을 수정하던 수정하기 위한 식을 이거하나로 통합
		return "redirect:/on/staffList";
	}
	
	
	
	//addStaff
	// leftmenu a태그 = '공백', addStaff.주소검색 = searchAddress값
	@GetMapping("/on/addStaff")
	public String addStaff(Model model
						, @RequestParam(defaultValue = "") String searchAddress) {
		//model(storeList)
		log.debug("searchAddress : " + searchAddress);
		
		List<Store> storeList = storeMapper.selectStoreList();
		model.addAttribute("storeList", storeList);
		
		//model(addressList) <= searchAddress가 공백이 아니면 검색 후
		if(searchAddress.equals("") == false) {
			List<Address> addressList = addressMapper.selectAddressListByWord(searchAddress);
			//디버깅
			log.debug(addressList.toString());
			model.addAttribute("addressList", addressList);
		}
		return "on/addStaff";
	}
	
	@PostMapping("/on/addStaff")
	public String addStaff(Staff staff) { // 커맨드 객체 생성 > 커맨드객체.set(request.getParameter()) >
		// insert 호출
		log.debug(staff.toString());
		int row = staffMapper.insertStaff(staff);
		log.debug("row" + row);
		if (row == 0) { // 입력실패시 입력페이지로 포워딩
			return "on/addStaff";
		}
		return "redirect:/on/staffList";
	}
	
	//staffList
	@GetMapping("/on/staffList")
	public String staffList(Model model
							, @RequestParam(defaultValue = "1") int currentPage
							, @RequestParam(defaultValue = "10") int rowPerPage) { //뒤에붙는 값이 같으면 requestparam()에 값을 생략해도된다 / defaultValue은 문자열만 받을수있다
		//model(StaffList)
		Map<String, Object> map = new HashMap<>();
		int beginRow = (currentPage-1) * rowPerPage;
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		log.debug(map.toString());
		
		
		
		List<Staff> staffList = staffMapper.selectStaffList(map);
		log.debug(staffList.toString());
		
		int count = staffMapper.selectStaffCount();
		int lastPage = count / rowPerPage;
		if(count % rowPerPage != 0) {
			lastPage += 1;
		}
		
		model.addAttribute("staffList", staffList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		
		return "on/staffList";
	}
	
	@GetMapping("/on/staffOne")
	public String staffOne(HttpSession session, Model model) {
		int staffId = ((Staff)(session.getAttribute("loginStaff"))).getStaffId();
		Map<String, Object> staff = staffMapper.selectStaffOne(staffId);
		model.addAttribute("staff", staff);
		log.debug(staff.toString());
		return "on/staffOne";
	}
}


