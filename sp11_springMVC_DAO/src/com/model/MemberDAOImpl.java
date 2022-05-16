package com.model;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate; // DML 명령 처리

	@Override
	public MemberVO selectMemberById(String id) throws SQLException {

		String sql = "SELECT * FROM USERMEMBER WHERE ID = ?";
		
		try {
			return this.jdbcTemplate.queryForObject(sql, 
					new BeanPropertyRowMapper<MemberVO>(MemberVO.class), id);
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
		
	}

	@Override
	public boolean memberCheck(String id, String pwd) throws SQLException {
		String sql = "SELECT * FROM USERMEMBER WHERE ID = ? AND PWD = ?";
		boolean result = false;
		Object[] params = { id, pwd };
		
		if (this.jdbcTemplate.queryForList(sql, params).size() > 0) {
			return true;
		}
		
		return result;
	}

	@Override
	public boolean memberInsert(String id, String name, String pwd, String email, int age) throws SQLException {
		String sql = "INSERT INTO USERMEMBER VALUES(?, ?, ?, ?, ?)";
		boolean result = false;
		Object[] params = { id, name, pwd, email, age };
		
		if (this.jdbcTemplate.update(sql, params) > 0) {
			return true;
		}
		
		return result;
	}

}
