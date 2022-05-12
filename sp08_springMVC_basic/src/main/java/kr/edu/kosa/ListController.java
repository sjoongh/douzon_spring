package kr.edu.kosa;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ListController { // Controller
	
//	@RequestMapping("/list.do")
	@RequestMapping(value="/list.do", method=RequestMethod.GET)
	public String list(Model model) {
		
		model.addAttribute("list", "List page입니다.");
		model.addAttribute("title", "Title 입니다.");
		model.addAttribute("content", "Content 입니다.");
		return "list"; // WEB-INF/views/ + list + .jsp
	}

}
