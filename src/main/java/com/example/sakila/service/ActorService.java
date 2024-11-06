package com.example.sakila.service;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.example.sakila.mapper.ActorFileMapper;
import com.example.sakila.mapper.ActorMapper;
import com.example.sakila.vo.Actor;
import com.example.sakila.vo.ActorFile;
import com.example.sakila.vo.ActorForm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class ActorService {
	@Autowired ActorMapper actorMapper;
	@Autowired ActorFileMapper actorFileMapper;

	public List<Actor> getActorListByFilm(int filmId ){
		return actorMapper.selectActorListByFilm(filmId);
	}
	
	// /on/actor/One
	public Actor getActorOne(int actorId) {
		return actorMapper.selectActorOne(actorId);
	}

	
	  
	public int getTotalCount(int rowPerPage, String searchWord) {
		int count = actorMapper.selectActorCount(searchWord);
		int lastPage = count / rowPerPage;
		if(count % rowPerPage != 0) {
			lastPage ++; 
		}
	return lastPage;
	  
	}

	
	public List<Actor> getActorList(int currentPage, int rowPerPage, String searchWord) {
		Map<String, Object> paramMap = new HashMap<>();
		int beginRow = (currentPage - 1) * rowPerPage;
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);

		return actorMapper.selectActorList(paramMap);

	}

	public void addActor(ActorForm actorForm, String path) {
		Actor actor = new Actor();
		actor.setFirstName(actorForm.getFirstName());
		actor.setLastName(actorForm.getLastName());

		int row1 = actorMapper.insertActor(actor);
		// mybatis selectkey값
		int actorId = actor.getActorId();

		if (row1 == 1 && actorForm.getActorFile() != null) {
			// 파일 입력, actorFile 입력
			List<MultipartFile> list = actorForm.getActorFile();
			for (MultipartFile mf : list) {
				ActorFile actorFile = new ActorFile();

				actorFile.setActorId(actorId);
				actorFile.setType(mf.getContentType());
				actorFile.setSize(mf.getSize());
				String filename = UUID.randomUUID().toString().replace("-", "");
				actorFile.setFilename(filename);
				int dotIdx = mf.getOriginalFilename().lastIndexOf(".");
				String origninname = mf.getOriginalFilename().substring(0, dotIdx);
				String ext = mf.getOriginalFilename().substring(dotIdx + 1);
				actorFile.setOriginname(origninname);
				actorFile.setExt(ext);

				int row2 = actorFileMapper.insertActorFile(actorFile);
				if (row2 == 1) {
					try {
						mf.transferTo(new File(path + filename + "." + ext));
					} catch (Exception e) {
						e.printStackTrace();
						// 예외 발생하고 예외처리 하지 않아야지 @transactional 작동한다
						// so runtime Exception을 인위적으로 발생
						throw new RuntimeException();
					}
				}
			}
		}

	}
}
