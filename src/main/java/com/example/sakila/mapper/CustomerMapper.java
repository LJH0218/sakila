package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Customer;

@Mapper
public interface CustomerMapper {
	
	List<Map<String, Object>> selectCustomerOneList(Integer customerId);
	
	List<Customer> selectCustomerListByName(String searchName);
	
	Integer selectCustomerCount();
	
	List<Customer> selectCustomerList(Map<String, Object> paramMap);
	
	Integer insertCustomer(Customer customer);
}