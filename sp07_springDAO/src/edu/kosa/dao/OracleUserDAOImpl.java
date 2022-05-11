package edu.kosa.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class OracleUserDAOImpl extends UserDAO {
	
	@Override
	public Connection getConnection() throws Exception {
		// 1. 드라이브 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");
		System.out.println("driver load success");
		// 2. 연결 및 오픈
		Connection conn = DriverManager.getConnection(
				// jdbc:oracle:thin:@192.168.2.36:1521:orcl
				"jdbc:oracle:thin:@kosadb_high?TNS_ADMIN=C:\\Oracle\\Wallet_kosaDB",
				"user04", "xxxxxxAt22cc");
		System.out.println("connect success!");
		
		return conn;
	}
	
//	public Connection getConnection(String dns) throws Exception {
//		
//		return null;
//	}
//	
//	public Connection getConnection(String dns, String user, String pwd) throws Exception {
//		
//		return null;
//	}
}
