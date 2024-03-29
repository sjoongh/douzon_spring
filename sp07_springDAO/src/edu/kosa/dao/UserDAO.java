package edu.kosa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Scanner;

import edu.kosa.model.UserVO;

public abstract class UserDAO { // 추상클래스

	// 디비 연결 관련 메소드
	// 추상 메소드
	public abstract Connection getConnection() throws Exception;
	
	// 3. 사용(dml명령어)
	// insert
	public void insert(UserVO user) throws Exception {
		Connection conn = getConnection();
		String sql = "insert into users(id, name, password) values(?,?,?)";
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, user.getId());
		ps.setString(2, user.getName());
		ps.setString(3, user.getPassword());
		
		int result = ps.executeUpdate();
		System.out.println(result + "개 입력 성공");
		ps.close();
		conn.close();
	}
	// selectAll
	public void selectAll(UserVO user) throws Exception {
		Connection conn = getConnection();
		String sql = "select * from users";
		PreparedStatement ps = conn.prepareStatement(sql);
		
		int result = ps.executeUpdate();
		System.out.println(result);
		ps.close();
		conn.close();
	}
	
	// selectById - 조건에 맞는 레코드 select 하기
	public void selectById(UserVO user) throws Exception {
		Connection conn = getConnection();
		String sql = "select * from users where id = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, user.getId());
		
		int result = ps.executeUpdate();
		System.out.println(result + "select 결과값");
		ps.close();
		conn.close();
	}
	// update
	public void update(UserVO user) throws Exception {
		Connection conn = getConnection();
		Scanner sc = new Scanner(System.in);
		String sql = "update users set name=? where name = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		System.out.println("update user name = ");
		String name = sc.next();
//		ps.setString(1, user.getId());
		ps.setString(1, name);
		ps.setString(2, user.getName());
//		ps.setString(3, user.getPassword());
		
		int result = ps.executeUpdate();
		System.out.println(result + "개 변경 성공");
		ps.close();
		conn.close();
	}
	
	// delete
	public void delete(UserVO user) throws Exception {
		Connection conn = getConnection();
		String sql = "delete from users where id = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, user.getId());
		
		int result = ps.executeUpdate();
		System.out.println(result + "개 삭제 성공");
		ps.close();
		conn.close();
	}
	
	public void menu() {
		System.out.println("선택하세요 : \n1.insert");
		System.out.println("2.select\n3.selectAll\n4.update\n5.delete");
	}
}
