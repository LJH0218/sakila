package com.example.sakila.vo;

import lombok.Data;

@Data
public class BoardFile {
	private int fileNo; //PK
	private String originFilename;
	private String fileName;
	private String fileExt;
	private String createDate;
}
