package com.essence.erp.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.essence.erp.dao.SupplierDAO;
import com.essence.erp.dto.SupplierDTO;

@Controller
public class SupplierController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/supplierList", method = RequestMethod.GET)
	public String supplierList(Model model) throws Exception {

		SupplierDAO dao = sqlSession.getMapper(SupplierDAO.class);
		model.addAttribute("list", dao.supplierList());

		return "stock.supplierList";
	}

	@RequestMapping(value = "/supplierAdd", method = RequestMethod.GET)
	public String supplierAdd() {

		return "stock.supplierAdd";
	}

	@RequestMapping(value = "/supplierAdd", method = RequestMethod.POST)
	public String supplierAdd(HttpServletRequest request, SupplierDTO dto) throws Exception {

		dto.setSu_fndt(request.getParameter("su_fndt"));

		SupplierDAO dao = sqlSession.getMapper(SupplierDAO.class);
		dao.supplierAdd(dto);

		return "redirect:supplierList";
	}
	
	@RequestMapping("/supplierDelete")
	public String supplierDelete(HttpServletRequest request) throws Exception {
		
		SupplierDAO dao = sqlSession.getMapper(SupplierDAO.class);
		dao.supplierDelete(request.getParameter("su_taxid"));

		return "redirect:supplierList";
	}
	
	@RequestMapping("/supplierView")
	public String supplierView(Model model, SupplierDTO dto) throws Exception {
		
		SupplierDAO dao = sqlSession.getMapper(SupplierDAO.class);
		model.addAttribute("list", dao.supplierView(dto));

		return "stock.supplierView";
	}
	
	@RequestMapping("/supplierModify")
	public String supplierModify(SupplierDTO dto) throws Exception {

		SupplierDAO dao = sqlSession.getMapper(SupplierDAO.class);
		dao.supplierModify(dto);
		
		return "redirect:supplierList";
	}
	
	// 검색
	@RequestMapping(value = "/supplierList", method = RequestMethod.POST)
	public String invoiceSearch(Model model, HttpServletRequest request) throws Exception {
		
		String su_name = request.getParameter("su_name");
		
		SupplierDAO dao = sqlSession.getMapper(SupplierDAO.class);
		model.addAttribute("list", dao.supplierSearch(su_name));
		
		return "stock.supplierList";
	}

}
