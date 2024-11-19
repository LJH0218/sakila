package com.example.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.CustomerMapper;
import com.example.sakila.vo.Customer;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class CustomerService {
	@Autowired CustomerMapper customerMapper;
	
	public Integer getLastPage(Integer rowPerPage) {
		
		int	count = customerMapper.selectCustomerCount();
		int lastPage = count / rowPerPage;
		if(count % rowPerPage != 0) {
			lastPage++;
		}
		
		return lastPage; 
	}
	
	public Map<String, Object> getCustomerList(Integer currentPage, Integer rowPerPage){
		Integer beginRow = (currentPage - 1) * rowPerPage;
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		
		
		
		// 페이징 첫번째 페이지 넘버
		Integer startPagingNum = (currentPage - 1)/10*10+1; // 1-10까지 전부 0나옴
		// 한 페이지 당 페이징 갯수가 10개씩이라 가정할때
		Integer numPerPage = 10;
		// 페이징 마지막 페이지 넘버
		Integer endPagingNum = startPagingNum + (numPerPage - 1);

		Integer lastPage = this.getLastPage(rowPerPage);
		if(lastPage < endPagingNum) {
			endPagingNum = lastPage;
		}
	
		
		List<Customer> customerList = customerMapper.selectCustomerList(paramMap);
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("startPagingNum", startPagingNum);
		resultMap.put("endPagingNum", endPagingNum);
		resultMap.put("customerList", customerList);
		// 여러개를 넘겨야할땐 Map을 쓸수도 있다 (필수는 아님)
		
		return resultMap;
	}
	
	public Integer addCustomer(Customer customer) {
		return customerMapper.insertCustomer(customer);
	}
}