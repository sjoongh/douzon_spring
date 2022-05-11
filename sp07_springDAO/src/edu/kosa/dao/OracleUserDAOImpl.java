package edu.kosa.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class OracleUserDAOImpl extends UserDAO {

	@Override
	public Connection getConnection() throws Exception {
		// 1. 드라이브 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");
		//System.out.println("cloud driver load success");
		// 2. 연결 및 오픈
		Connection conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@192.168.2.36:1521:orcl", 
				"kingsmile", "1234");
				
		//System.out.println("cloud connect success!!");
		return conn;
	}
	
/*	@Override
	public Connection getConnection() throws Exception {
		// cloud 사용할 경우 project package에 라이브러리 추가한다.
		Class.forName("oracle.jdbc.driver.OracleDriver");
		System.out.println("cloud drvier load");
		Connection conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@kosadb_high?TNS_ADMIN=C:\\app\\Oracle\\Wallet_kosaDB",
                "kingsmile",
                "xxxxxxAt22cc");
		System.out.println("cloud connect success!!");
		
		return conn;
	}*/

}
