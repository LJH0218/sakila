package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FilmCategoryMapper {
	List<Map<String, Object>> selectFilmCategoryListByFilm(Integer filmId);
	
	Integer deleteFilmCategoryByFilm(Integer filmId);
	
	// 11/12 과제
	//카테고리가 삭제됐을때 삭제
	Integer deleteFilmCategoryByCategory(Integer categoryId);
}
