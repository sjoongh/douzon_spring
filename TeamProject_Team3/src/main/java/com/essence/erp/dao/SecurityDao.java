package com.essence.erp.dao;

import java.util.List;

import com.essence.erp.dto.Role_InsertDto;
import com.essence.erp.dto.SecurityDto;
import com.essence.erp.dto.UserDto;

public interface SecurityDao {
	public String roll_check();
	public void role_insert(Role_InsertDto dto);
	public String get_id();
	
	public void deleteRoleAuthority(UserDto userDto);
	public int selectCount(UserDto userDto);
	public List<SecurityDto> authority();
	public String authority_check(String p, String c_id);

	public String authority2();
	public String authority3();
}
