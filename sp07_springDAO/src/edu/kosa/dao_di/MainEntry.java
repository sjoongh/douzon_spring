package edu.kosa.dao_di;

import edu.kosa.model.UserVO;

public class MainEntry {

	public static void main(String[] args) throws Exception {
		
		// 공통
//		ConnectionMaker conn = new SConnectionMakerImpl();
//		UserDAO dao = new UserDAO(conn) {}
		
		// 공통 한번에 부르기
		UserDAO dao = new UserDAO(new SConnectionMakerImpl());
		UserVO vo = new UserVO();
		
//		vo.setId("이상윤 commit");
//		vo.setName("잘생긴");
//		vo.setPassword("멋쟁이");
		dao.insert(vo);
		dao.selectAll();
		
	}

}
