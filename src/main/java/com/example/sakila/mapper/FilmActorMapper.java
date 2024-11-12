package com.example.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.FilmActor;

@Mapper
public interface FilmActorMapper {
	
	// 필름 삭제 시 film_actor 삭제
	Integer deleteFilmActorByFilm(int filmId);
	
	
	
	// 배우 삭제시 filmactor삭제
	int deleteFileByActor(int actorId);
	
	int deleteFilmActor(FilmActor filmActor);
	
	int insertFilmActor(FilmActor filmActor);
}
