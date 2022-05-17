package com.kosa.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Component;

import com.kosa.config.SqlSessionFactoryService;
import com.kosa.model.GuestDTO;

@Component
public class GuestDAO {
	
	private SqlSessionFactory sqlSessionFactory;
	
	public GuestDAO() {
		sqlSessionFactory = SqlSessionFactoryService.getSqlSessionFactory();
	}
	
	public List<GuestDTO> getAllList() {
		SqlSession session = null;
		
		try {
			session = sqlSessionFactory.openSession();
			// return에서만 잘 부르면됨
			return session.selectList("GUEST.getAllList"); 
		} catch (Exception e) {
			return null;
		} finally {
			if (session != null) { session.close(); }
		} // try end
	}
}
