package edu.kosa.view;

import java.sql.Connection;

import edu.kosa.dao.OracleUserDAOImpl;
import edu.kosa.dao.UserDAO;

public class MainEntry {

	public static void main(String[] args) throws Exception {
		
		UserDAO dao = new OracleUserDAOImpl();
		
		Connection conn = dao.getConnection();
	}

}
