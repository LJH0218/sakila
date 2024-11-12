package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Film;

@Mapper
public interface FilmMapper {
	Integer updateFilm(Film film);
	
	Integer deleteFilmByKey(Integer filmId);
	
	int selectFilmCount(Integer categoryId);
	

	
	//categoryID가 null이거나 0이 아닐때
	List<Map<String,Object>> selectFilmListByCategory(Map<String,Object> paramMap);	
	
	//categoryID가 null이 아니거나 0일때
	List<Map<String,Object>> selectFilmList(Map<String,Object> paramMap);
	
	// /on/actorOne에서 필름 검색시
	List<Film> selectFilmListByTitle(String searchTitle);
	
	// /on/filmOne
	List<Film> filmList(int FilmId);
	
	// film x language
	Map<String, Object> selectFilmOne (int FilmId);
	
	// /on/actorOne
	List<Film> selectFilmTitleListByActor(int actorId);

	int insertFilm(Film film);
	
}
