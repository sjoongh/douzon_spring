package edu.kosa.model;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;

public class GuestDAOImpl implements GuestDAO {
	
	private JdbcTemplate jdbcTemplate; // DML - insert, update, delete, select 등등의 명령어를 가지고 있음
	
	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) { // DI주입
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public List listGuest() { // select
		String sql = "SELECT * FROM GUESTBOOK ORDER BY NAME DESC";
		// 반환받는건 앞에 query가 들어가야함 --> select 같은
		return jdbcTemplate.queryForList(sql);
	}

	@Override
	public void insertGuest(GuestDTO dto) { // insert
		String sql = "INSERT INTO GUESTBOOK (NUM, NAME, EMAIL, HOME, CONTENTS) VALUES(?,?,?,?,?)";
		Object[] arr = { dto.getNum(), dto.getName(), dto.getEmail(), dto.getHome(), dto.getContents() };
		
		this.jdbcTemplate.update(sql, arr);
		
	}

}
