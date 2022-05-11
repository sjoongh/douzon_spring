package edu.kosa.dao;

import java.sql.Connection;

import edu.kosa.model.UserVO;

public abstract class UserDAO { // 추상클래스

	// 디비 연결 관련 메소드
	// 추상 메소드
	public abstract Connection getConnection() throws Exception;
	
	// 3. 사용(dml명령어)
	// insert
	public void insert(UserVO user) throws Exception {
		Connection conn = getConnection();
	}
	// selectAll
	
	// selectById - 조건에 맞는 레코드 select 하기
}
