package com.example.sakila.vo;

import lombok.Data;

@Data
public class City {
	private int cityId; //PK
	private String city;
	private String countryId; //FK
	private String lastUpdate;
}
