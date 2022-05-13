package com.model;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;

public class DeptDAOImpl implements DeptDAO {
	
	private JdbcTemplate jdbcTemplate;
	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	@Override
	public List listDept() {
		String sql = "SELECT * FROM DEPT2";
		
		return jdbcTemplate.queryForList(sql);
	}
	
	@Override
	public void insertDept(DeptDTO dto) {
		String sql = "INSERT INTO DEPT2 (DCODE, DNAME, PDEPT, AREA) VALUES(?,?,?,?)";
		Object[] arr = { dto.getDcode(), dto.getDname(), dto.getPdept(), dto.getArea() };
		
		this.jdbcTemplate.update(sql, arr);
		
	}
	
	@Override
	public int updateDept(DeptDTO dto) {
		
		return 1;
	}
	
	@Override
	public int deleteDept(DeptDTO dto) {
		
		return 1;
	}

}
