package com.essence.erp.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.essence.erp.dao.MinutesDAO;
import com.essence.erp.dto.MinutesDTO;

@Controller
public class MinutesController {
	
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/minutesList")
	public String list(Model model) {

		MinutesDAO dao = sqlSession.getMapper(MinutesDAO.class);
		model.addAttribute("list", dao.list());

		return "board.minutesList";
	}

	@RequestMapping(value = "/minutesWrite", method = RequestMethod.GET)
	public String write() {

		return "board.minutesWrite";
	}

	@RequestMapping(value = "/minutesWrite", method = RequestMethod.POST)
	public String write(HttpServletRequest request, MultipartFile file, MinutesDTO dto) {
		
		List<CommonsMultipartFile> files = dto.getFiles();
		List<String> fileNames = new ArrayList<String>();

		MinutesDAO dao = sqlSession.getMapper(MinutesDAO.class);
		
		if (files != null && files.size() > 0) {

			for (CommonsMultipartFile multipartFile : files) {

				String originalFile = multipartFile.getOriginalFilename();
				String fname = multipartFile.getOriginalFilename();

				String path = request.getSession().getServletContext().getRealPath("resources/upload/");
				String fullpath = path + "\\" + fname;

				if (!originalFile.equals("")) {

					try {

						FileOutputStream fs1 = new FileOutputStream(fullpath);
						fs1.write(multipartFile.getBytes());
						fs1.close();

						fileNames.add(fname);

						dto.setM_filesrc(fileNames.get(0));
						dao.writeFile(dto);
					}
					catch (IOException e) {
						e.printStackTrace();
					}
				} else {
					dao.write(dto);
				}
			}
		}

		return "redirect:minutesList";
	}

	@RequestMapping("/minutesView")
	public String view(HttpServletRequest request, Model model) {

		MinutesDAO dao = sqlSession.getMapper(MinutesDAO.class);

		String m_id = request.getParameter("m_id");
		dao.hit(m_id);

		model.addAttribute("list", dao.view(m_id));

		return "board.minutesView";
	}

	@RequestMapping(value = "/minutesModify", method = RequestMethod.GET)
	public String modify(HttpServletRequest request, Model model) {

		String m_id = request.getParameter("m_id");

		MinutesDAO dao = sqlSession.getMapper(MinutesDAO.class);
		model.addAttribute("list", dao.view(m_id));

		return "board.minutesModify";
	}

	@RequestMapping(value = "/minutesModify", method = RequestMethod.POST)
	public String modify(HttpServletRequest request, MultipartFile file, MinutesDTO dto) {
		
		List<CommonsMultipartFile> files = dto.getFiles();
		List<String> fileNames = new ArrayList<String>();
		
		String m_id = request.getParameter("m_id");

		MinutesDAO dao = sqlSession.getMapper(MinutesDAO.class);
		
		if (files != null && files.size() > 0) {

			for (CommonsMultipartFile multipartFile : files) {

				String originalFile = multipartFile.getOriginalFilename();
				String fname = multipartFile.getOriginalFilename();

				String path = request.getSession().getServletContext().getRealPath("resources/upload/");
				String fullpath = path + "\\" + fname;

				if (!originalFile.equals("")) {

					try {

						FileOutputStream fs1 = new FileOutputStream(fullpath);
						fs1.write(multipartFile.getBytes());
						fs1.close();

						fileNames.add(fname);

						dto.setM_filesrc(fileNames.get(0));
						dao.modifyFile(dto);
					}
					catch (IOException e) {
						e.printStackTrace();
					}
				} else {
					dao.modify(dto);
				}
			}
		}

		return "redirect:minutesView?m_id=" + m_id;
	}

	@RequestMapping("/minutesDelete")
	public String delete(HttpServletRequest request) {

		String m_id = request.getParameter("m_id");

		MinutesDAO dao = sqlSession.getMapper(MinutesDAO.class);
		dao.delete(m_id);

		return "redirect:minutesList";
	}

}
