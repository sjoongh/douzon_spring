package com.essence.erp.dao;

import java.util.List;

import com.essence.erp.dto.CommuteAbsenceDto;
import com.essence.erp.dto.CommuteDto;
import com.essence.erp.dto.Criteria;
import com.essence.erp.dto.EmpAbsenceListDto;

public interface CommuteDao {
	//출근체크
	public void commute_check(String status,String emp_no);

	//출근한 일자 불러옴
	public List<CommuteDto> commute_day_gotowork(String emp_num);
	
	//출근한 일자 불러옴
	public List<CommuteDto> commute_day_gotowork2(String emp_num);
		
	//퇴근한 일자 불러옴
	public List<CommuteDto> commute_day_outtowork();
   
	//오늘날짜 가져옴
	public List<CommuteDto> compare_commute_date(String emp_num);
	
	//오늘자 출근 데이터만 뽑아오기
	public List<CommuteDto> commute_day_gotowork3(String emp_num);
	
	//오늘자 퇴근 데이터만 뽑아오기
	public List<CommuteDto> commute_day_gotowork4(String emp_num);

	//달력에 공휴일 등등 넣기
	public List<CommuteDto> commute_day_gotowork_absence();
	
    //결근 사유 불러옴
	public List<CommuteAbsenceDto> absence_list();
	
    //결근 사유 삭제
	public void absence_delete(String absence_code);
   
	//결근 사유 등록
	public void absence_sign_up(CommuteAbsenceDto dto);
	
    //공휴일 등등 처리
	public void commute_holyday_process(String emp_num, String status, int year, int month, int day);
	 
	//공휴일 등등 처리
	public void commute_holyday_process(String emp_num, String status, String year2, String month2, String day2);
	
	//결근 사유자 리스트 등록
	public void emp_absence_list(String emp_num, String status, String start_day, String end_day);
	
	//휴가 및 결근 관리자에게 신청
	public void emp_absence_list_wait_approval(String emp_num, String status, String start_day, String end_day);
	
    //결근 사유자 리스트 얻어오기
	public List emp_absence_list_get(Criteria cri);
	
	//결근 사유자 리스트 얻어오기
	public List emp_absence_list_get2();
		
	//결근 사유자 리스트 삭제
	public void emp_absence_list_delete(String emp_absence_list_code);

	//결근 사유자 리스트 삭제2
	public void emp_absence_list_delete2(String emp_num,String status);
    
	//사용자 이름 가져오기
	public String getName(String emp_num);
	
	//휴가  신청자 리스트 삭제
	public void emp_absence_list_delete3(String emp_num, String status);

	
   // 페이지 카운트
	public int emp_absence_list_get_count(String year, String month);

	
}
