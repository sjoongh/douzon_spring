package com.essence.erp.dao;

import java.util.List;

import com.essence.erp.dto.BankDto;
import com.essence.erp.dto.Criteria;
import com.essence.erp.dto.DepartDto;
import com.essence.erp.dto.DutyDto;
import com.essence.erp.dto.HospitalMemberDto;

public interface HospitalMemberDao {
	// 멤버 등록
	public void sign(HospitalMemberDto dto);
	public void signFile(HospitalMemberDto dto);

	// 멤버 리스트
	public List<HospitalMemberDto> hospitallist(Criteria cri);

	// 멤버 리스트(개인)
	public List<HospitalMemberDto> hospitallist_personal(String emp_num);

	
	// 멤버 검색
	public List<HospitalMemberDto> hospitallist_search(String variable);

	// 멤버 검색(빈칸일시)
	public List<HospitalMemberDto> hospitallist_search2();

	// 멤버 정렬(전체)
	public List<HospitalMemberDto> hospital_content_array(Criteria cri);

	// 멤버 정렬(개인)
	public  List<HospitalMemberDto> hospital_content_array2(String array_variable, String emp_num);
	
	// 멤버 상세보기
	public HospitalMemberDto hospital_content_view(HospitalMemberDto dto);

	// 멤버 삭제
	public void hospital_delete(HospitalMemberDto dto);

	// 멤버 수정
	public void hospital_modify(HospitalMemberDto dto);
	public void hospital_modify_File(HospitalMemberDto dto);

	// 부서 등록
	public void department_sign(DepartDto dto);

	// 부서 리스트
	public List<DepartDto> department_list();

	// 부서 삭제
	public void department_delete(DepartDto dto);

	// 부서 상세보기
	public DepartDto department_content_view(DepartDto dto);

	// 부서 수정하기
	public void department_modify(DepartDto dto);

	// 부서 검색 뷰
	public List<DepartDto> depart_search_list();

	// 직책 등록
	public void duty_sign(DutyDto dto);

	// 직책 리스트
	public List<DutyDto> duty_list();

	// 직책 상세보기
	public DutyDto duty_content_view(DutyDto dto);

	// 직책 수정하기
	public void duty_modify(DutyDto dto);

	// 직책 삭제하기
	public void duty_delete(DutyDto dto);
   
	//은행 리스트 불러오기
	public List<BankDto> bank_search_list();
	
    //테스트
	public String test();
	
    //사원 리스트 불러오기(퇴사자포함)
	public List<HospitalMemberDto> emp_num_search();
	
	//사원 리스트 불러오기(퇴사자제외)
	public List<HospitalMemberDto> emp_num_search2();
	
    //중복 사번 검색 리스트
	public List<HospitalMemberDto> emp_num_search_overlap(String emp_num);
	
    //중복 사번 검색(아무것도 안넣엇을떄)
	public List<HospitalMemberDto> emp_num_search_overlap2();
	
    //퇴사자 리스트
	public List<HospitalMemberDto> resignation_list();
	
    //퇴사자 등록
	public void resignation_sign_up(HospitalMemberDto dto);
	
    //퇴사자 취소처리
	public void resignation_cancel_up(HospitalMemberDto dto);
	
	//인사 리스트 페이징
	public int hospital_list_count();

}
