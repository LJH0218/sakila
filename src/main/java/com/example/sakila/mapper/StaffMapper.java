package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Staff;

@Mapper
public interface StaffMapper {
	
	int updateStaff(Staff staff); // 업뎃문 하나로 모든 컬럼을 개별수정할수있도록
	
	int selectStaffCount();
	
	List<Staff> selectStaffList(Map<String, Object> map);
	
	int insertStaff(Staff staff);
	
	// staffOne.jsp
	Map<String, Object> selectStaffOne(int staffId);
	
	// login.jsp
	Staff login(Staff staff);
}
