package edu.kosa.view;

import java.sql.Connection;
import java.util.Scanner;

import edu.kosa.dao.OracleUserDAOImpl;
import edu.kosa.dao.UserDAO;
import edu.kosa.model.UserVO;

public class MainEntry {

	public static void main(String[] args) throws Exception {
		
		UserDAO dao = new OracleUserDAOImpl();
		Scanner sc = new Scanner(System.in);
		dao.menu();
		
		switch (sc.nextInt()) {
		case 1:
			UserVO user = new UserVO();
			System.out.println("user id = ");
			user.setId(sc.next());
			System.out.println("user name = ");
			user.setName(sc.next());
			System.out.println("user pwd = ");
			user.setPassword(sc.next());
			
			dao.insert(user);
			System.out.println(user.getId() + "추가 성공!!");
			break;
		case 2:
			UserVO user2 = new UserVO();
			dao.selectAll(user2);
			System.out.println("selectAll!!");
			break;
		case 3:
			UserVO user3 = new UserVO();
			System.out.println("user id = ");
			user3.setId(sc.next());
			
			dao.selectById(user3);
			System.out.println("selectbyid!!");
			break;
		case 4:
			UserVO user4 = new UserVO();
			System.out.println("old user name = ");
			user4.setName(sc.next());
			
			dao.update(user4);
			System.out.println("update 성공!!");
			break;
		default:
			break;
		}
		
		Connection conn = dao.getConnection();
	}

}
