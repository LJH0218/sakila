package com.example.sakila.vo;

import lombok.Data;

@Data
public class Film {
	private int filmId; // PK
	private String title; // 초록키
	private String description; //기본값 null
	private Integer releaseYear; //기본값 null
	private int languageId; // FK
	private Integer originalLanguageId; // FK 기본값 null
	private int rentalDuration;
	private double rentalRate;
	private Integer length; //기본값 null
	private double replacementCost;
	private String rating;
	private String specialFeatures; //기본값 null
	private String lastUpdate;
	//숫자임에도 null값을 받으려면 Integer을 쓰도록하자
}
