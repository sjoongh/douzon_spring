package com.essence.erp.dao;

import java.util.List;

import com.essence.erp.dto.BasicPayDto;
import com.essence.erp.dto.HospitalMemberDto;

public interface PayDao {
	
	//급여 리스트(전체)
	public List hospital_pay_list(String year,String month);
	
	//기본급 등록
	public void basic_pay_sign(BasicPayDto dto);
	
	//기본급 리스트
	public List basic_pay_list();
	
	//기본급 삭제
	public void basic_pay_delete(BasicPayDto dto);
	
	//기본급 상세보기
	public Object basic_pay_content_view(String duty_responsibility_code);
	
	//기본급 수정하기
	public void basic_pay_modify( int basic_pay, String duty_responsibility_code);
	
	//급여 리스트(개인)
	public List hospital_pay_list_personal(String year,String month,String emp_num);

	//급여 리스트 보낸적있는지 체크하기
	public String pay_month_check(String year, String month);

	//회계에 급여 집어넣기
	public void insert_account(String year, String month);
	
	//토탈 급여 얻어오기
	public int get_total_sum(String year, String month);

	//토탈 급여 회계에 저장하기
	public void write_total_pay(int sum, String month);
	
	
	
	
}
