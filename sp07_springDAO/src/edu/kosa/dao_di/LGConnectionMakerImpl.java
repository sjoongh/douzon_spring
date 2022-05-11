package edu.kosa.dao_di;

import java.sql.Connection;
import java.sql.DriverManager;

public class LGConnectionMakerImpl implements ConnectionMaker {

	@Override
	public Connection makeConnection() throws Exception {
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

}
