package com.model;

import java.util.List;

public interface DeptDAO {
	
	public List listDept();
	public void insertDept(DeptDTO dto);
	public int updateDept(DeptDTO dto);
	public int deleteDept(DeptDTO dto);
	
}
