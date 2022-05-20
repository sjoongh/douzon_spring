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
import com.essence.erp.dao.PatientDAO;
import com.essence.erp.dao.ReceptionDAO;
import com.essence.erp.dto.ReceptionDTO;
import com.essence.erp.service.TransService;

@Controller
public class ReceptionController {

	@Autowired
	private SqlSession sqlSession;

	@Autowired
	private TransService transService;

	@RequestMapping("/reservationList")
	public String reservationList(Model model, HttpServletRequest request) throws Exception {

		String c_no = request.getParameter("c_no");
		String c_name = request.getParameter("c_name");

		ReceptionDAO dao = sqlSession.getMapper(ReceptionDAO.class);
		model.addAttribute("list", dao.reservationList());

		model.addAttribute("c_no", c_no);
		model.addAttribute("c_name", c_name);

		return "reception.reservationList";
	}

	@RequestMapping("/reservationPatient")
	public String reservationPatient(Model model, HttpServletRequest request) throws Exception {

		String c_no = request.getParameter("c_no");
		String c_name = request.getParameter("c_name");

		ReceptionDAO dao = sqlSession.getMapper(ReceptionDAO.class);
		model.addAttribute("list", dao.reservationList());

		model.addAttribute("c_no", c_no);
		model.addAttribute("c_name", c_name);

		return "reservationList";
	}

	@RequestMapping(value = "/reservationAdd", method = RequestMethod.POST)
	public String reservationAdd(HttpServletRequest request, ReceptionDTO dto) throws Exception {

		return transService.reservationAdd(request, dto);
	}

	@RequestMapping(value = "/reservationAddP", method = RequestMethod.POST)
	public String reservationAddP(HttpServletRequest request, ReceptionDTO dto) throws Exception {

		return transService.reservationAddP(request, dto);
	}

	@RequestMapping("/reservationDelete")
	public String reservationDelete(HttpServletRequest request, ReceptionDTO dto) throws Exception {

		ReceptionDAO dao = sqlSession.getMapper(ReceptionDAO.class);
		dao.reservationDelete(dto);

		return "redirect:reservationList";
	}

	@RequestMapping("/receptionList")
	public String receptionList(Model model) throws Exception {

		ReceptionDAO dao = sqlSession.getMapper(ReceptionDAO.class);
		model.addAttribute("list", dao.receptionList());
		model.addAttribute("today", dao.reservationToday());

		AccountDAO adao = sqlSession.getMapper(AccountDAO.class);
		model.addAttribute("payment", adao.payList());
		model.addAttribute("type", adao.type_code());

		return "reception.receptionList";
	}

	@RequestMapping(value = "/receptionNew", method = RequestMethod.POST)
	public String receptionNew(ReceptionDTO dto) throws Exception {

		ReceptionDAO dao = sqlSession.getMapper(ReceptionDAO.class);
		dao.receptionNew(dto);

		return "redirect:receptionList";
	}

	@RequestMapping("/receptionAdd")
	public String receptionAdd(ReceptionDTO dto) throws Exception {

		ReceptionDAO dao = sqlSession.getMapper(ReceptionDAO.class);
		dao.receptionAdd(dto);

		return "redirect:receptionList";
	}

	@RequestMapping("/receptionDelete")
	public String receptionDelete(HttpServletRequest request) throws Exception {

		ReceptionDAO dao = sqlSession.getMapper(ReceptionDAO.class);
		dao.receptionDelete(request.getParameter("r_no"));

		return "redirect:receptionList";
	}

	@RequestMapping(value = "/patientSearch", method = RequestMethod.GET)
	public String patientSearch() {

		return "reception.patientSearch";
	}

	@RequestMapping(value = "/patientSearch", method = RequestMethod.POST)
	public String patientSearch(Model model, HttpServletRequest request) throws Exception {

		String c_name = request.getParameter("c_name");
		String c_jumin1 = request.getParameter("c_jumin1");

		ReceptionDAO dao = sqlSession.getMapper(ReceptionDAO.class);
		PatientDAO pdao = sqlSession.getMapper(PatientDAO.class);

		int check = dao.patientCheck(c_name, c_jumin1);

		if (check == 0) {
			model.addAttribute("medical", pdao.resList(c_name, c_jumin1));
			model.addAttribute("doctor", pdao.doctorList());
		}

		model.addAttribute("list", dao.patientSearch(c_name, c_jumin1));

		model.addAttribute("check", check);
		model.addAttribute("c_name", c_name);
		model.addAttribute("c_jumin1", c_jumin1);

		return "reception.patientSearch";
	}

	@RequestMapping("/reservationResult")
	public @ResponseBody Map<?, ?> checkDate(Model model, HttpServletRequest request) throws Exception {

		String res_date = request.getParameter("res_data");

		ReceptionDAO dao = sqlSession.getMapper(ReceptionDAO.class);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", dao.resultDate(res_date));

		return map;
	}

}
