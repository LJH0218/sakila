package com.example.sakila.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Country;

@Mapper //mapper 기능을 쓰면 안에 SpringBeans라는 객체를 따로 생성해둔다
public interface CountryMapper {
	List<Country> selectCountryList(); // 비어있는값
	
}
