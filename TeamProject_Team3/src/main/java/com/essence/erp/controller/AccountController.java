package com.essence.erp.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.essence.erp.dao.AccountDAO;
import com.essence.erp.dto.AccountDTO;
import com.essence.erp.dto.AcctypeDTO;
import com.essence.erp.dto.Criteria;
import com.essence.erp.dto.PaymentDTO;

@Controller
public class AccountController {

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/accountList", method = RequestMethod.GET)
	public String list(HttpServletRequest request, Model model, AccountDTO dto) throws Exception {

		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);

		String date1 = request.getParameter("date1");
		String date2 = request.getParameter("date2");
		String ac_typename = request.getParameter("ac_typename");

		model.addAttribute("type_code", dao.type_code());

		model.addAttribute("list", dao.list());
		model.addAttribute("list2", dao.list2(date1, date2, ac_typename));

		return "account.accountList";
	}

	@RequestMapping(value = "/accountList2", method = RequestMethod.POST)
	public @ResponseBody Map<?, ?> list_search(HttpServletRequest request, Model model, AccountDTO dto)
			throws Exception {

		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);

		String date1 = request.getParameter("date1");
		String date2 = request.getParameter("date2");
		String ac_typename = request.getParameter("ac_typename");

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("list2", dao.list2(date1, date2, ac_typename));
		map.put("list3", dao.list3(date1, date2, ac_typename));

		return map;
	}

	@RequestMapping(value = "/accountWrite", method = RequestMethod.GET)
	public String write_view(Model model) {

		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		model.addAttribute("type_code", dao.type_code());

		return "account.accountWrite";
	}

	@RequestMapping(value = "/accountWrite", method = RequestMethod.POST)
	public String write(HttpServletRequest request, Model model, AccountDTO dto) throws Exception {

		dto.setAc_date(request.getParameter("ac_date"));
		dto.setAc_typename(request.getParameter("ac_typename"));

		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		dao.write(dto);

		return "redirect:accountList";
	}

	@RequestMapping(value = "/accountModify", method = RequestMethod.GET)
	public String modify_form(Model model, AccountDTO dto) throws Exception {

		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		model.addAttribute("modify_form", dao.modifyForm(dto));
		model.addAttribute("type_code", dao.type_code());
		return "accountModify";
	}

	@RequestMapping(value = "/accountModify", method = RequestMethod.POST)
	public String modify(HttpServletRequest request, Model model, AccountDTO dto) throws Exception {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);

		String ac_typename2 = request.getParameter("ac_typename");
		System.out.println("ac_typename2" + ac_typename2);
		String ac_typename = dto.getAc_typename();
		String ac_cont = dto.getAc_cont();
		String ac_date = dto.getAc_date();
		int ac_imp = dto.getAc_imp();
		int ac_exp = dto.getAc_exp();
		int ac_seq = dto.getAc_seq();
		System.out.println("ac_typename : " + ac_typename);
		System.out.println("ac_cont" + ac_cont);
		System.out.println("ac_date" + ac_date);
		System.out.println("ac_imp" + ac_imp);
		System.out.println("ac_exp" + ac_exp);
		System.out.println("ac_seq" + ac_seq);
		dao.modify(dto);
		System.out.println("들어옴3");
		return "redirect:test";
	}

	@RequestMapping("/accountDelete")
	public String delete(AccountDTO dto) {

		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		dao.delete(dto);

		return "redirect:accountList";
	}

/*	@RequestMapping("/paymentList")
	public String paymentList(Model model) {

		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		model.addAttribute("list", dao.payList());

		return "account.paymentList";
	}*/

	@RequestMapping("/paymentDelete")
	public String paymentDelete(HttpServletRequest request, PaymentDTO dto) {

		AccountDTO adto = new AccountDTO();
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);

		adto.setAc_date(dao.currDate());
		adto.setAc_typename(request.getParameter("type_name"));
		adto.setAc_cont(request.getParameter("c_name") + "(" + request.getParameter("c_no") + ")");
		adto.setAc_imp(Integer.valueOf(request.getParameter("t_pay")));
		adto.setAc_exp(0);

		dao.write(adto);
		dao.payDel(dto);

		return "redirect:receptionList";
	}

	@RequestMapping(value = "/acctypeAdd", method = RequestMethod.GET)
	public String acctypeAdd(Model model) {
		System.out.println("acctypeAdd");
		return "account.acctypeAdd";
	}

	@RequestMapping(value = "/acctypeAdd", method = RequestMethod.POST)
	public String acctypeWrite(Model model, AcctypeDTO dto) {
		System.out.println("acctypeWrite");
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		dao.acctypeAdd(dto);
		return "redirect:acctypeList";
	}

	
	@RequestMapping(value="/acctypeList", method=RequestMethod.GET)
	public String acctypeList(Model model,Criteria cri){
		
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		cri.setPageSize(5);
		model.addAttribute("cri", cri);
		model.addAttribute("count", dao.acctypeListCount());
		model.addAttribute("typelist", dao.acctypeList(cri));
		return "account.acctypeList";
	}

	@RequestMapping(value = "/acctypeModify", method = RequestMethod.GET)
	public String acctypeModify(HttpServletRequest request, Model model, AcctypeDTO dto) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		dto.setType_code(request.getParameter("type_code"));
		model.addAttribute("acctypeMo", dao.acctypeModifyList(dto));
		return "account.acctypeModify";
	}

	@RequestMapping(value = "/acctypeModify", method = RequestMethod.POST)
	public String acctypeModifyList(HttpServletRequest request, Model model, AcctypeDTO dto) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		dto.setType_code(request.getParameter("type_code"));
		dao.acctypeModify(dto);
		return "redirect:acctypeList";
	}

	@RequestMapping(value = "/acctypeDelete", method = RequestMethod.GET)
	public String acctypeDelete(HttpServletRequest request, Model model, AcctypeDTO dto) {
		AccountDAO dao = sqlSession.getMapper(AccountDAO.class);
		dto.setType_code(request.getParameter("type_code"));
		dao.acctypeDelete(dto);
		return "redirect:acctypeList";
	}

}
