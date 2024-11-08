package com.example.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.FilmActor;

@Mapper
public interface FilmActorMapper {
	//배우 삭제시 filmactor삭제
	int deleteFileByActor(int actorId);
	
	int deleteFilmActor(FilmActor filmActor);
	
	int insertFilmActor(FilmActor filmActor);
}
