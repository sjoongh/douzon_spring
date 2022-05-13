package edu.kosa.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.kosa.model.GuestDAO;

@Controller
//@RequestMapping("list.do") // 1. list를 타고 들어와서 ex) localhost:8080/list
public class ListController {
	
	private GuestDAO guestDAO;
	
	public void setGusetDAO(GuestDAO guestDAO) {
		this.guestDAO = guestDAO;
	}
	
//	@RequestMapping("/aa.do") // 2. 여기서 또 받음, ex) localhost:8080/list/aa.do
	@RequestMapping("/list.do")
	public String list(Model model) {
		
		List list = guestDAO.listGuest();
		model.addAttribute("list", list);
		
		return "list";
	}
}
