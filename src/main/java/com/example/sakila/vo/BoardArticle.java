package com.example.sakila.vo;

import lombok.Data;

@Data
public class BoardArticle {
	private int articleNo; //PK
	private String memberId;
	private String articleTitle;
	private String articleContent;
	private String createdate;
}
