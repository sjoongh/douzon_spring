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

import com.essence.erp.dao.BizReportDAO;
import com.essence.erp.dto.BizReportDTO;

@Controller
public class BizReportController {

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/bizList")
	public String list(Model model) {

		BizReportDAO dao = sqlSession.getMapper(BizReportDAO.class);
		model.addAttribute("list", dao.list());

		return "board.bizList";
	}

	@RequestMapping(value = "/bizWrite", method = RequestMethod.GET)
	public String write() {

		return "board.bizWrite";
	}

	@RequestMapping(value = "/bizWrite", method = RequestMethod.POST)
	public String write(HttpServletRequest request, MultipartFile file, BizReportDTO dto) {

		List<CommonsMultipartFile> files = dto.getFiles();
		List<String> fileNames = new ArrayList<String>();

		BizReportDAO dao = sqlSession.getMapper(BizReportDAO.class);

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

						dto.setB_filesrc(fileNames.get(0));
						dao.writeFile(dto);
					} catch (IOException e) {
						e.printStackTrace();
					}
				} else {
					dao.write(dto);
				}
			}
		}

		return "redirect:bizList";
	}

	@RequestMapping("/bizView")
	public String view(HttpServletRequest request, Model model) {

		BizReportDAO dao = sqlSession.getMapper(BizReportDAO.class);

		String b_id = request.getParameter("b_id");
		dao.hit(b_id);

		model.addAttribute("list", dao.view(b_id));

		return "board.bizView";
	}

	@RequestMapping(value = "/bizModify", method = RequestMethod.GET)
	public String modify(HttpServletRequest request, Model model) {

		String b_id = request.getParameter("b_id");

		BizReportDAO dao = sqlSession.getMapper(BizReportDAO.class);
		model.addAttribute("list", dao.view(b_id));

		return "board.bizModify";
	}

	@RequestMapping(value = "/bizModify", method = RequestMethod.POST)
	public String modify(HttpServletRequest request, MultipartFile file, BizReportDTO dto) {

		List<CommonsMultipartFile> files = dto.getFiles();
		List<String> fileNames = new ArrayList<String>();

		String b_id = request.getParameter("b_id");

		BizReportDAO dao = sqlSession.getMapper(BizReportDAO.class);

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

						dto.setB_filesrc(fileNames.get(0));
						dao.modifyFile(dto);
					} catch (IOException e) {
						e.printStackTrace();
					}
				} else {
					dao.modify(dto);
				}
			}
		}

		return "redirect:bizView?b_id=" + b_id;
	}

	@RequestMapping("/bizDelete")
	public String delete(HttpServletRequest request) {

		String b_id = request.getParameter("b_id");

		BizReportDAO dao = sqlSession.getMapper(BizReportDAO.class);
		dao.delete(b_id);

		return "redirect:bizList";
	}

	@RequestMapping(value = "/bizReply", method = RequestMethod.GET)
	public String reply(HttpServletRequest request, Model model) {

		String b_id = request.getParameter("b_id");

		BizReportDAO dao = sqlSession.getMapper(BizReportDAO.class);
		model.addAttribute("list", dao.view(b_id));

		return "board.bizReply";
	}

	@RequestMapping(value = "/bizReply", method = RequestMethod.POST)
	public String reply(HttpServletRequest request, BizReportDTO dto) {

		BizReportDAO dao = sqlSession.getMapper(BizReportDAO.class);
		dao.replyUp(dto);

		dto.setB_group(dto.getB_group());
		dto.setB_step(dto.getB_step() + 1);
		dto.setB_indent(dto.getB_indent() + 1);

		dao.reply(dto);

		return "redirect:bizList";
	}

}
