package board.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import board.model.BoardVO;
import config.SqlSessionFactoryBean;

public class BoardDAO {
	
	private SqlSession mybatis;
	
	public BoardDAO() {
		mybatis = SqlSessionFactoryBean.getSqlSessionInstance();
	}
	
	public void insertBoard(BoardVO vo) {
		mybatis.insert("insertBoard", vo);
		mybatis.commit();
	}
	
	public BoardVO getBoard(BoardVO vo) {
		return mybatis.selectOne("BoardDAO.getBoard", vo);
	}
}
