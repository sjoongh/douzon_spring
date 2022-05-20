package com.essence.erp.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.essence.erp.dao.AccountDAO;
import com.essence.erp.dao.PayDao;
import com.essence.erp.dao.StockDAO;
import com.essence.erp.dto.BasicPayDto;

@Controller
public class PayController { // FrontController
	
	@Autowired
	private SqlSession sqlSession;
    //급여 리스트 
	@RequestMapping("/hospital_pay_list")
	public String list(Model model,HttpServletRequest request,Principal principal){
		System.out.println("hospital_pay_list()");
		String emp_num=principal.getName();
		String month = request.getParameter("month");
		String year = request.getParameter("year");
		System.out.println("month : "+month);
		System.out.println("year : "+year);
		PayDao dao = sqlSession.getMapper(PayDao.class);
		String check= dao.pay_month_check(year,month);
		System.out.println("check : "+check);
		int sum = dao.get_total_sum(year, month);
		System.out.println("총합계는 = "+sum);
		if(emp_num.equals("admin")){
			model.addAttribute("hospital_pay_list", dao.hospital_pay_list(year,month));
			model.addAttribute("month", month);
			model.addAttribute("year", year);
			model.addAttribute("check", check);
			model.addAttribute("sum", sum);
		}
		
		else{
			System.out.println("emp_num"+emp_num);
			model.addAttribute("hospital_pay_list",dao.hospital_pay_list_personal(year,month,emp_num));
			model.addAttribute("month", month);
			model.addAttribute("year", year);
		}
		
		return "human_resources.hospital_pay_list";	
	}
	
	
	//회계에 집어넣기
	@RequestMapping("/insert_account")
	public String insert_account(Model model,HttpServletRequest request){
		PayDao dao = sqlSession.getMapper(PayDao.class);
		System.out.println("insert_account()");
		String month = request.getParameter("month");
		String year = request.getParameter("year");
		String sum2 = request.getParameter("sum");
		int sum=Integer.parseInt(sum2);
		System.out.println("month : "+month+"year : "+year+" sum : "+sum);
		dao.insert_account(year,month);
		dao.write_total_pay(sum,month);
		return "redirect:hospital_pay_list?year=2016&month=06";
		
	}
	//기본급 리스트
	@RequestMapping("/basic_pay_list")
	public String basic_pay_list(Model model){
		PayDao dao = sqlSession.getMapper(PayDao.class);
		System.out.println("basic_pay_list()");
		model.addAttribute("basic_pay_list",dao.basic_pay_list());
		return "basic_pay_list";	
	}
	//기본급 등록 뷰 이동
	@RequestMapping("/basic_pay_sign_view")
	public String basic_pay_sign_view(Model model){
		System.out.println("basic_pay_sign_view()");
		return "basic_pay_sign_view";	
	}
	//기본급 등록
	@RequestMapping("/basic_pay_sign")
	public String basic_pay_sign(Model model, BasicPayDto dto){
		System.out.println("basic_pay_sign()");
		PayDao dao = sqlSession.getMapper(PayDao.class);
		dao.basic_pay_sign(dto);
		return "redirect:test";
	}
	//기본급 삭제
	@RequestMapping("/basic_pay_delete")
	public String basic_pay_delete(Model model, BasicPayDto dto){
		System.out.println("basic_pay_delete()");
		PayDao dao = sqlSession.getMapper(PayDao.class);
		dao.basic_pay_delete(dto);
		return "redirect:basic_pay_list";
	}
	//기본급 상세보기
	@RequestMapping("/basic_pay_content_view")
	public String basic_pay_content_view(HttpServletRequest request, Model model) {
		System.out.println("basic_pay_content_view()");
		PayDao dao = sqlSession.getMapper(PayDao.class);
		String duty_responsibility_code = request.getParameter("duty_responsibility_code");
		model.addAttribute("basic_pay_content_view", dao.basic_pay_content_view(duty_responsibility_code));
		return "basic_pay_content_view";
	}
	//기본급 수정하기
		@RequestMapping("/basic_pay_modify")
		public String basic_pay_modify(HttpServletRequest request, Model model) {
			System.out.println("basic_pay_modify()");
			PayDao dao = sqlSession.getMapper(PayDao.class);
			String duty_responsibility_code = request.getParameter("duty_responsibility_code");
			int basic_pay = Integer.parseInt(request.getParameter("basic_pay"));
			System.out.println("직책 코드 : "+duty_responsibility_code+" 기본급 : "+basic_pay);
			dao.basic_pay_modify(basic_pay,duty_responsibility_code);
			return "redirect:basic_pay_list";
		}
	
}
