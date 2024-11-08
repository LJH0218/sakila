package com.example.sakila.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.ActorFile;

@Mapper
public interface ActorFileMapper {
	// /on/removeActor
	int deleteActorFileByActor(int actorId);
	
	ActorFile selectActorFileOne(int actorFileId);
	// /on/removeActorFile:Service
	int deleteActorFile(int actorFileId);
	
	List<ActorFile> selectActorFileListByActor(int actorId);
	
	int insertActorFile(ActorFile actorFile);
}
