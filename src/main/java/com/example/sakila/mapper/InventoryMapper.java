package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Inventory;

@Mapper
public interface InventoryMapper {
	
	// /on/removeInventoryByKey
	Integer deleteInventoryByKey(Integer inventoryId);
	
	// /on/addInventory
	Integer insertInventory(Inventory inventory);
	
	
	int selectInventoryCount(Integer storeId);
	
	// /on/inventoryList
	List<Map<String, Object>> selectInventoryListByStore(Map<String, Object> paramMap);
	
	// /on/removeFilm
	Integer selectCountInventoryByFilm(Integer filmId);
}
