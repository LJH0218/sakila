package com.example.sakila.vo;

import java.util.List;

import lombok.Data;

@Data
public class FilmForm {
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
	private List<String> specialFeatures;
	// 원칙 : private String[] specialFeatures;

}
