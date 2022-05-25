package com.example.jpaBoard.controller;

import java.awt.print.Pageable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.jpaBoard.model.Board;
import com.example.jpaBoard.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	BoardService boardService;
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String index() {
		return "redirect:/board/list/0";
	}
	
	@RequestMapping(value="/list/{curPage}", method=RequestMethod.GET)
	public String findAll(Model model, Pageable pageable, @PathVariable Integer curPage) {
		
		Page<Board> page = boardService.findAll(curPage);
		model.addAttribute("page", page);
		
		return "list";
	}
}
