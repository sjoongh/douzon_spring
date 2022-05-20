package com.essence.erp.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.essence.erp.dao.AccountDAO;
import com.essence.erp.dao.StockDAO;
import com.essence.erp.dto.AccountDTO;
import com.essence.erp.dto.InvoiceDTO;
import com.essence.erp.dto.StockDTO;
import com.essence.erp.service.TransService;

@Controller
public class StockController {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private TransService transService;

	@RequestMapping("/stockList")
	public String stockList(Model model, Principal principal) throws Exception {

		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		model.addAttribute("list", dao.stockList());

		return "stock.stockList";
	}
	
	@RequestMapping(value = "/invoiceList", method = RequestMethod.GET)
	public String invoiceList(Model model) throws Exception {

		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		model.addAttribute("list", dao.invoiceList());

		return "stock.invoiceList";
	}

	@RequestMapping(value = "/invoiceAdd", method = RequestMethod.GET)
	public String stockAdd(Model model) {
		
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		model.addAttribute("type", dao.type_code());

		return "stock.invoiceAdd";
	}

	@RequestMapping(value = "/invoiceAdd", method = RequestMethod.POST)
	public String stockAdd(HttpServletRequest request, InvoiceDTO dto, AccountDTO a_dto) throws Exception {

//		dto.setIn_date(request.getParameter("in_date"));
//
//		StockDAO dao = sqlSession.getMapper(StockDAO.class);
//
//		int ck = dao.check(dto);
//		
//		if( ck != 1 )
//			dao.stockAdd(dto);
//		else
//			dao.qtyAdd(dto);
//		
//		dao.invoiceAdd(dto);
//		
//		// 회계 연동
//		String cont = request.getParameter("st_man") + " / " + request.getParameter("st_model");
//		int total = Integer.parseInt(request.getParameter("st_qty")) * Integer.parseInt(request.getParameter("in_price"));
//		
//		a_dto.setAc_date(request.getParameter("in_date"));
//		a_dto.setAc_typename("MEDI");
//		a_dto.setAc_cont(cont);
//		a_dto.setAc_exp(total);
//		
//		AccountDAO a_dao = sqlSession.getMapper(AccountDAO.class);
//		a_dao.write(a_dto);
//		
//		return "redirect:invoiceList";
		
		return transService.stockAdd(request, dto, a_dto);
	}
	
	@RequestMapping("/invoiceDelete")
	public String invoiceDelete(InvoiceDTO dto) throws Exception {

		StockDAO dao = sqlSession.getMapper(StockDAO.class);

		dao.stockSub(dto);
		dao.invoiceDelete(dto);

		return "redirect:invoiceList";
	}
	
	@RequestMapping("/invoiceView")
	public String invoiceView(Model model, InvoiceDTO dto) throws Exception {
		
		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		model.addAttribute("list", dao.invoiceView(dto));

		return "stock.invoiceView";
	}

	@RequestMapping("/invoiceModify")
	public String invoiceModify(HttpServletRequest request, InvoiceDTO dto, AccountDTO a_dto) throws Exception {
		
//		dto.setIn_date(request.getParameter("in_date"));
//		
//		int st_qty = Integer.parseInt(request.getParameter("st_qty"));
//		int st_qty_org = Integer.parseInt(request.getParameter("st_qty_org"));
//
//		StockDAO dao = sqlSession.getMapper(StockDAO.class);
//		
//		dao.invoiceModify(dto);
//		
//		int org = dao.stockQty(dto);
//		int temp = org - st_qty_org + st_qty;
//		
//		dto.setSt_qty(temp);
//		dao.stockModify(dto);
//		
//		// 회계 연동
//		String cont = request.getParameter("st_man") + " / " + request.getParameter("st_model");
//		int total = Integer.parseInt(request.getParameter("st_qty")) * Integer.parseInt(request.getParameter("in_price"));
//
//		a_dto.setAc_date(request.getParameter("in_date"));
//		a_dto.setAc_typename("MEDI");
//		a_dto.setAc_cont(cont);
//		a_dto.setAc_exp(total);
//
//		AccountDAO a_dao = sqlSession.getMapper(AccountDAO.class);
//		
//		a_dto.setAc_seq(Integer.parseInt(a_dao.ac_seq(a_dto)));
//		a_dao.modify(a_dto);
//
//		return "redirect:invoiceList";
		return transService.invoiceModify(request, dto, a_dto);
	}
	
	// 검색
	@RequestMapping(value = "/invoiceList", method = RequestMethod.POST)
	public String invoiceSearch(Model model, HttpServletRequest request) throws Exception {
		
		String st_vendor = request.getParameter("st_vendor");
		
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		
		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		model.addAttribute("list", dao.invoiceSearch(st_vendor, start, end));
		
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		
		return "stock.invoiceList";
	}
	
	@RequestMapping(value = "/stockModify", method = RequestMethod.GET)
	public String stockModify(Model model, HttpServletRequest request, StockDTO dto) throws Exception {

		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		model.addAttribute("list", dao.stockView(request.getParameter("st_code")));

		return "stock.stockModify";
	}
	
	@RequestMapping(value = "/stockModify", method = RequestMethod.POST)
	public String stockModify(StockDTO dto) throws Exception {

		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		dao.stockModi(dto);

		return "redirect:stockList";
	}
	
	@RequestMapping("/stockDelete")
	public String stockDelete(HttpServletRequest request, StockDTO dto) throws Exception {

		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		dao.stockDelete(request.getParameter("st_code"));

		return "redirect:stockList";
	}
	
	@RequestMapping(value = "/st_code_check", method = RequestMethod.GET)
	public String st_code_check() {

		return "st_code_check";
	}

	@RequestMapping(value = "/st_code_check", method = RequestMethod.POST)
	public String st_code_check(HttpServletRequest request, Model model) {

		String st_code = request.getParameter("st_code");
		StockDAO dao = sqlSession.getMapper(StockDAO.class);

		if (st_code == null || "".equals(st_code)) {
			model.addAttribute("result", -1);
		}
		else {
			model.addAttribute("result", dao.st_code_check(st_code));
		}
		model.addAttribute("st_code", st_code);
		
		return "st_code_check";
	}
	
	@RequestMapping(value = "/su_taxid_check", method = RequestMethod.GET)
	public String su_taxid_check() {

		return "su_taxid_check";
	}
	
	@RequestMapping(value = "/su_taxid_check", method = RequestMethod.POST)
	public String su_taxid_check(HttpServletRequest request, Model model) {

		String su_taxid = request.getParameter("su_taxid");
		StockDAO dao = sqlSession.getMapper(StockDAO.class);

		if (su_taxid == null || "".equals(su_taxid)) {
			model.addAttribute("result", -1);
		}
		else {
			model.addAttribute("result", dao.su_taxid_check(su_taxid));
		}
		model.addAttribute("su_taxid", su_taxid);
		
		return "su_taxid_check";
	}

}
