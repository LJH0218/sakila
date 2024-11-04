package com.example.sakila.vo;

import lombok.Data;

@Data
public class BoardComment {
	private int commentNo; //PK
	private String articleNo; //FK
	private String memberId; 
	private String comment;
	private String createdate;
}
