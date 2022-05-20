package com.essence.erp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.essence.erp.dto.Criteria;
import com.essence.erp.dto.PassSearchDTO;
import com.essence.erp.dto.UserDto;

public interface UserDao {
	
	public List<UserDto> list();
	
	public void insert(UserDto userDto);
	
	public void delete(UserDto userDto);
	
	public UserDto update_list(UserDto userDto);
	
	public void update(UserDto userDto);
	
	public int userListCount();
	
	public List<UserDto> list2(Criteria cri);
	
	public void roleInsert(UserDto userDto);
	
	public void deleteRole(UserDto userDto);
	
	public void roleDelete(UserDto userDto);

	public int roleSelect(UserDto userDto);
	
	public List<UserDto> user_search();
	
	public List<UserDto> user_search_detail(String u_name);
	
	public UserDto list3(UserDto userDto);
	
	public List<String> dutyCall();
	
	public List<UserDto> list4(String u_id);
	
	public int pass_search(PassSearchDTO ps_dto);
	
	public void pass_update(@Param("u_pwd") String u_pwd, @Param("u_name") String u_name);
}
