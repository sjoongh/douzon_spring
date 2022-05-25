package com.example.jpaBoard.service;

import org.springframework.data.domain.Page;

import com.example.jpaBoard.model.Board;

public interface BoardService {

	// 게시판 리스트 보기
	public Page<Board> findAll(Integer curPage);
}
