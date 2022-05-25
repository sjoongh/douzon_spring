package com.example.jpaBoard.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.jpaBoard.model.Board;

public interface BoardRepository extends JpaRepository<Board, Integer> {

}
