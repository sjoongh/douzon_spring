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

import com.essence.erp.dao.NoticeDAO;
import com.essence.erp.dto.NoticeDTO;

@Controller
public class NoticeController {

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/noticeList")
	public String list(Model model) {

		NoticeDAO dao = sqlSession.getMapper(NoticeDAO.class);
		model.addAttribute("list", dao.list());

		return "board.noticeList";
	}

	@RequestMapping(value = "/noticeWrite", method = RequestMethod.GET)
	public String write() {

		return "board.noticeWrite";
	}

	@RequestMapping(value = "/noticeWrite", method = RequestMethod.POST)
	public String write(HttpServletRequest request, MultipartFile file, NoticeDTO dto) {
		
		List<CommonsMultipartFile> files = dto.getFiles();
		List<String> fileNames = new ArrayList<String>();

		NoticeDAO dao = sqlSession.getMapper(NoticeDAO.class);
		
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

						dto.setN_filesrc(fileNames.get(0));
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

		return "redirect:noticeList";
	}

	@RequestMapping("/noticeView")
	public String view(HttpServletRequest request, Model model) {

		NoticeDAO dao = sqlSession.getMapper(NoticeDAO.class);

		String n_id = request.getParameter("n_id");
		dao.hit(n_id);

		model.addAttribute("list", dao.view(n_id));

		return "board.noticeView";
	}

	@RequestMapping(value = "/noticeModify", method = RequestMethod.GET)
	public String modify(HttpServletRequest request, Model model) {

		String n_id = request.getParameter("n_id");

		NoticeDAO dao = sqlSession.getMapper(NoticeDAO.class);
		model.addAttribute("list", dao.view(n_id));

		return "board.noticeModify";
	}

	@RequestMapping(value = "/noticeModify", method = RequestMethod.POST)
	public String modify(HttpServletRequest request, MultipartFile file, NoticeDTO dto) {
		
		List<CommonsMultipartFile> files = dto.getFiles();
		List<String> fileNames = new ArrayList<String>();
		
		String n_id = request.getParameter("n_id");

		NoticeDAO dao = sqlSession.getMapper(NoticeDAO.class);
		
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

						dto.setN_filesrc(fileNames.get(0));
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

		return "redirect:noticeView?n_id=" + n_id;
	}

	@RequestMapping("/noticeDelete")
	public String delete(HttpServletRequest request) {

		String n_id = request.getParameter("n_id");

		NoticeDAO dao = sqlSession.getMapper(NoticeDAO.class);
		dao.delete(n_id);

		return "redirect:noticeList";
	}

}
