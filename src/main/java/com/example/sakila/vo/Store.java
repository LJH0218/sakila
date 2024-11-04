package com.example.sakila.vo;

import lombok.Data;

@Data
public class Store {
	private int storeId; //PK
	private int managerStaffId; //UK
	private int addressId; //FK
	private String lastUpdate;
}