package com.example.jpaBoard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Service;

import com.example.jpaBoard.model.Board;
import com.example.jpaBoard.repository.BoardRepository;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardRepository boardRepository;
	
	// 게시판 리스트 보기, 한페이지에 5개씩
	// curPage : 요청하는 페이지, 첫페이지는 0
	@Override
	public Page<Board> findAll(Integer curPage) {
		
		PageRequest pr = new PageRequest(curPage, 5, 
				new Sort(
						new Order(Direction.DESC, "reply"), 
						new Order(Direction.ASC, "replystep")));
		
		return boardRepository.findAll(pr);
	}
}
