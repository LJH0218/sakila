package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Film;

@Mapper
public interface FilmMapper {
	// /on/filmOne
	List<Film> filmList(int FilmId);
	
	// film x language
	Map<String, Object> selectFilmOne (int FilmId);
	
	// /on/actorOne
	List<Film> selectFilmTitleListByActor(int actorId);

	int insertFilm(Film film);
	
}
