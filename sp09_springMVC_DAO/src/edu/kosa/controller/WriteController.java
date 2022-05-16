package edu.kosa.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.kosa.model.GuestDAO;
import edu.kosa.model.GuestDTO;

@Controller
public class WriteController {
	
	private GuestDAO guestDAO;
	
	@Autowired
	public void setGuestDAO(GuestDAO guestDAO) { // DI
		this.guestDAO = guestDAO;
	}

	@RequestMapping("/write.do")
	// Controller의 메서드는 Model 이라는 타입의 객체를 파라미터로 받을 수 있음
	public String write(Model model, HttpServletRequest request) { // request로 응답받음
		
		// request로 받은 변수들
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String home = request.getParameter("home");
		String contents = request.getParameter("contents");
		int num = Integer.parseInt(request.getParameter("no"));
		System.out.println(name+"plz");
		GuestDTO dto = new GuestDTO();
		dto.setName(name);
		dto.setEmail(email);
		dto.setContents(contents);
		dto.setHome(home);
		dto.setNum(num);
		
		guestDAO.insertGuest(dto);
				
		return "redirect:list.do"; // /WEB-INF/views/ + list + .jsp
	}
}
