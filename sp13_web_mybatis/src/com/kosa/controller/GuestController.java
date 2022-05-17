package com.kosa.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosa.dao.GuestDAO;
import com.kosa.model.GuestDTO;

@WebServlet("/guest.do")
public class GuestController extends HttpServlet {

	public GuestController() {}
	
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String cmd = request.getParameter("cmd");
		System.out.println("cmd : "+cmd);
		
		if (cmd.equals("list")) {
			System.out.println("List gogo");
			list(request, response);
		} else if (cmd.equals("write")) {
			System.out.println("write");
		}
	}

	private void list(
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		GuestDAO dao = new GuestDAO();
		List<GuestDTO> list = dao.getAllList();
		
		if (list != null) {
			request.setAttribute("list", list);
			request.getRequestDispatcher("/views/list.jsp").forward(request, response);
		} else {
			response.sendRedirect("/views/error.jsp");
		}
	}
}
