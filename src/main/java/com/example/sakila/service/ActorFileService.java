package com.example.sakila.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.example.sakila.mapper.ActorFileMapper;
import com.example.sakila.vo.ActorFile;
import com.example.sakila.vo.ActorForm;
import com.example.sakila.vo.Film;

@Service
@Transactional
public class ActorFileService {
	@Autowired ActorFileMapper actorFileMapper;
	
	public void addActorFile(ActorForm actorForm, String path) {
		if (actorForm.getActorFile() != null) {
			// 파일 입력, actorFile 입력
			List<MultipartFile> list = actorForm.getActorFile();
			for (MultipartFile mf : list) {
				ActorFile actorFile = new ActorFile();

				actorFile.setActorId(actorForm.getActorId());
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
	
	public List<ActorFile> getActorFileListByActor(int actorId){
		return actorFileMapper.selectActorFileListByActor(actorId);
	}
}
