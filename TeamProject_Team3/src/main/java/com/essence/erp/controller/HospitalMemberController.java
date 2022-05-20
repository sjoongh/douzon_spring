package com.essence.erp.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.text.ParseException;
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

import com.essence.erp.dao.HospitalMemberDao;
import com.essence.erp.dto.Criteria;
import com.essence.erp.dto.DepartDto;
import com.essence.erp.dto.DutyDto;
import com.essence.erp.dto.HospitalMemberDto;

@Controller
public class HospitalMemberController { // FrontController

	@Autowired
	private SqlSession sqlSession;
	
	
	// 홈 화면
	@RequestMapping("/")
	public String home(Model model) {
		System.out.println("home()");
		return "human_resources.home"; // /WEB-INF/views/write_view.jsp
	}// write_view() end

	// 테스트 때 씀
	@RequestMapping("/testtest")
	public String testtest(Model model) {
		System.out.println("test()");
		//HospitalMemberDao dao = sqlSession.getMapper(HospitalMemberDao.class);
		//model.addAttribute("test", dao.test());
		return "human_resources.test";
	}

	// 자식창 바로 꺼주는 코드
	@RequestMapping("/test")
	public String test(Model model) {
		System.out.println("test()");
		return "human_resources.sign_up_succesc";
	}
	
	//퇴사자 리스트 뷰이동
	@RequestMapping("/resignation_list")
	public String resignation_list(Model model) throws ParseException {
		System.out.println("resignation_list()");
		HospitalMemberDao dao = sqlSession.getMapper(HospitalMemberDao.class);
		//List<HospitalMemberDto> list = dao.resignation_list();
		/*List<String> end_date_list = new ArrayList<String>();
		List<Date> end_date_list2 = new ArrayList<Date>();
		List<Long> diff = new ArrayList<Long>();
		List<Long> diffdays = new ArrayList<Long>();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat formatter2 = new SimpleDateFormat("yyyy/MM/dd");
		Date currentTime = new Date();		
		String mTime = formatter.format (currentTime);
		System.out.println("현재날짜 스트링타입 : "+mTime);
		Date mTime2 = formatter.parse(mTime);
		System.out.println("현재날짜 데이터타입 : "+mTime2);
		for(int i=0; i<list.size(); i++){
			end_date_list.add(i,list.get(i).getRetire_date());
			end_date_list2.add(i, formatter2.parse(end_date_list.get(i)));
			diff.add(i, end_date_list2.get(i).getTime()-mTime2.getTime());
			diffdays.add(i, diff.get(i) / (24 * 60 * 60 * 1000));
			System.out.println("diffdays : "+diffdays.get(i));
		}*/
		
		model.addAttribute("resignation_list", dao.resignation_list());
		return "human_resources.resignation_list";
	}
	//퇴사자 등록 뷰이동
	@RequestMapping("/resignation_sign")
	public String resignation_sign(Model model, Criteria cri) {
		System.out.println("resignation_sign()");
		HospitalMemberDao dao = sqlSession.getMapper(HospitalMemberDao.class);
		model.addAttribute("resignation_list", dao.hospitallist(cri));
		model.addAttribute("cri", cri);
		model.addAttribute("count", dao.hospital_list_count());
		
		return "resignation_sign";
	}
	// 퇴사자 등록 처리
		@RequestMapping("/resignation_sign_up")
		public String resignation_sign_up(HttpServletRequest request, Model model, HospitalMemberDto dto,Principal principal) {
			System.out.println("resignation_sign_up()");
			HospitalMemberDao dao = sqlSession.getMapper(HospitalMemberDao.class);
			dao.resignation_sign_up(dto);
			return "redirect:test";
		}
		
		//퇴사자 취소 처리 뷰이동
		@RequestMapping("/resignation_cancel")
		public String resignation_cancel(Model model) {
			System.out.println("resignation_cancel()");
			HospitalMemberDao dao = sqlSession.getMapper(HospitalMemberDao.class);
			model.addAttribute("resignation_list", dao.resignation_list());
			return "resignation_cancel";
		}
		// 퇴사자 취소 처리
		@RequestMapping("/resignation_cancel_up")
		public String resignation_cancel_up(HttpServletRequest request, Model model, HospitalMemberDto dto,Principal principal) {
			System.out.println("resignation_cancel_up()");
			HospitalMemberDao dao = sqlSession.getMapper(HospitalMemberDao.class);
			dao.resignation_cancel_up(dto);
			return "redirect:test";
				}
		
		
		
	// 멤버 리스트 뷰이동
	@RequestMapping("/hospital_list")
	public String hospital_list(Model model,Principal principal, Criteria cri) {
		System.out.println("hospital_list()");
		//System.out.println("principal get name : "+principal.getName());
		HospitalMemberDao dao = sqlSession.getMapper(HospitalMemberDao.class);
		System.out.println("principal get name : "+principal.getName());
		String emp_num=principal.getName();

		model.addAttribute("hospital_list", dao.hospitallist(cri));
		model.addAttribute("hospital_list2", dao.hospitallist_personal(emp_num));

		model.addAttribute("cri", cri);
		model.addAttribute("count", dao.hospital_list_count());
		
		return "human_resources.hospital_list";
	}

	// 정렬
	@RequestMapping("/hospital_content_array")
	public String hospital_content_array(HttpServletRequest request, Model model, Criteria cri,Principal principal) {
		System.out.println("hospital_content_array()");
		String array_variable = request.getParameter("array_variable");
		cri.setArray_variable(request.getParameter("array_variable"));
		System.out.println("array_variable : " + cri.getArray_variable());
		HospitalMemberDao dao = sqlSession.getMapper(HospitalMemberDao.class);
		String emp_num=principal.getName();

		model.addAttribute("hospital_list", dao.hospital_content_array(cri));
		model.addAttribute("hospital_list2", dao.hospital_content_array2(array_variable, emp_num));

		model.addAttribute("cri", cri);
		model.addAttribute("count", dao.hospital_list_count());
		return "human_resources.hospital_list";
	}

	// 사번 검색
	@RequestMapping("/hospital_search")
	public String hospital_search(HttpServletRequest request, Model model, Criteria cri) {
		System.out.println("hospital_search()");
		String variable = request.getParameter("variable");
		System.out.println("variable : " + variable);
		HospitalMemberDao dao = sqlSession.getMapper(HospitalMemberDao.class);

		if (variable == null || "".equals(variable)) {
			model.addAttribute("hospital_list", dao.hospitallist_search2());
		} else {
			model.addAttribute("hospital_list", dao.hospitallist_search(variable));
		}

		
		return "human_resources.hospital_list";
	}// list() end

	// 멤버 등록 뷰 이동
	@RequestMapping("/sign_up")
	public String write_view(Model model) {
		System.out.println("sign_up()");
		return "sign_up";
	}// write_view() end

	// 멤버 등록
	@RequestMapping("/sign")
	public String write(HttpServletRequest request, Model model, MultipartFile file, HospitalMemberDto dto) {

		List<CommonsMultipartFile> files = dto.getFiles();
		List<String> fileNames = new ArrayList<String>();
		
		HospitalMemberDao dao = sqlSession.getMapper(HospitalMemberDao.class);
		
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
						
						dto.setPicture(fileNames.get(0));
						dao.signFile(dto);
						
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				else {
					dao.sign(dto);
				}
			}
		}

		return "redirect:test";
	}

	// 멤버상세보기(큰화면)
	@RequestMapping("/hospital_content_view")
	public String hospital_content_view(HttpServletRequest request, Model model, HospitalMemberDto dto) {
		System.out.println("hospital_content_view()");
		HospitalMemberDao dao = sqlSession.getMapper(HospitalMemberDao.class);
		model.addAttribute("hospital_content_view", dao.hospital_content_view(dto));
		return "human_resources.hospital_content_view";
	}
	// 멤버상세보기(팝업)
	@RequestMapping("/hospital_content_view_popup")
	public String hospital_content_view_popup(HttpServletRequest request, Model model, HospitalMemberDto dto) {
		System.out.println("hospital_content_view_popup()");
		HospitalMemberDao dao = sqlSession.getMapper(HospitalMemberDao.class);
		model.addAttribute("hospital_content_view", dao.hospital_content_view(dto));
		return "hospital_content_view_popup";
	}
	// 멤버상세보기(퇴사자)
		@RequestMapping("/hospital_content_view_resignation")
		public String hospital_content_view_resignation(HttpServletRequest request, Model model, HospitalMemberDto dto) {
			System.out.println("hospital_content_view_resignation()");
			HospitalMemberDao dao = sqlSession.getMapper(HospitalMemberDao.class);
			model.addAttribute("hospital_content_view", dao.hospital_content_view(dto));
			return "hospital_content_view_resignation";
		}
	
	// 멤버수정
	@RequestMapping(value = "/hospital_modify", method = RequestMethod.POST)
	public String hospital_modify(HttpServletRequest request, Model model, MultipartFile file, HospitalMemberDto dto) {
		
		List<CommonsMultipartFile> files = dto.getFiles();
		List<String> fileNames = new ArrayList<String>();
		
		HospitalMemberDao dao = sqlSession.getMapper(HospitalMemberDao.class);
		
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
						
						dto.setPicture(fileNames.get(0));
						dao.hospital_modify_File(dto);
						
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				else {
					dao.hospital_modify(dto);
				}
			}
		}

		return "redirect:hospital_list";
	}

	// 멤버삭제
	@RequestMapping("/hospital_delete")
	public String hospital_delete(HttpServletRequest request, Model model, HospitalMemberDto dto) {
		System.out.println("hospital_delete()");
		HospitalMemberDao dao = sqlSession.getMapper(HospitalMemberDao.class);
		dao.hospital_delete(dto);
		return "redirect:resignation_list";
	}

	// 직책 리스트 뷰이동
	@RequestMapping("/duty_list")
	public String duty_list(Model model) {
		System.out.println("duty_list()");
		HospitalMemberDao dao = sqlSession.getMapper(HospitalMemberDao.class);
		model.addAttribute("duty_list", dao.duty_list());
		return "duty_list";
	}

	// 직책 등록 뷰이동
	@RequestMapping("/duty_sign_up")
	public String duty_sign_up(Model model) {
		System.out.println("duty_sign_up()");
		return "duty_sign_up";
	}

	// 직책 등록
	@RequestMapping("/duty_sign")
	public String duty_sign(HttpServletRequest request, Model model, DutyDto dto) {
		System.out.println("duty_sign()");
		HospitalMemberDao dao = sqlSession.getMapper(HospitalMemberDao.class);
		dao.duty_sign(dto);
		return "redirect:test";
	}

	// 직책 리스트 검색창 이동
	@RequestMapping("/duty_search_list")
	public String duty_search_list(Model model) {
		System.out.println("duty_search_list()");
		HospitalMemberDao dao = sqlSession.getMapper(HospitalMemberDao.class);
		model.addAttribute("duty_search_list", dao.duty_list());
		return "duty_search_list";
	}

	// 직책 리스트 값 반환하기
	@RequestMapping("/duty_code_pick")
	public String duty_code_pick(Model model, HttpServletRequest request) {
		System.out.println("duty_code_pick()");
		HospitalMemberDao dao = sqlSession.getMapper(HospitalMemberDao.class);

		model.addAttribute("duty_search_list", dao.duty_list());
		return "duty_search_list";
	}

	// 부서 리스트 뷰 이동
	@RequestMapping("/department_list")
	public String department_list(Model model) {
		System.out.println("department_list()");
		HospitalMemberDao dao = sqlSession.getMapper(HospitalMemberDao.class);
		model.addAttribute("department_list", dao.department_list());
		return "department_list";
	}

	// 부서 검색 뷰 이동
	@RequestMapping("/depart_search_list")
	public String depart_search_list(Model model) {
		System.out.println("depart_search_list()");
		HospitalMemberDao dao = sqlSession.getMapper(HospitalMemberDao.class);
		model.addAttribute("depart_search_list", dao.depart_search_list());
		return "depart_search_list";
	}

	// 부서 등록 뷰이동
	@RequestMapping("/department_sign_up")
	public String department_sign_up(Model model) {
		System.out.println("department_sign_up()");
		return "department_sign_up";
	}

	// 부서 등록
	@RequestMapping("/department_sign")
	public String department_sign(HttpServletRequest request, Model model, DepartDto dto) {
		System.out.println("department_sign()");
		HospitalMemberDao dao = sqlSession.getMapper(HospitalMemberDao.class);
		dao.department_sign(dto);
		return "redirect:test";
	}

	// 부서 삭제
	@RequestMapping("/department_delete")
	public String department_delete(HttpServletRequest request, Model model, DepartDto dto) {
		System.out.println("department_delete()");
		HospitalMemberDao dao = sqlSession.getMapper(HospitalMemberDao.class);
		dao.department_delete(dto);
		return "redirect:department_list";
	}

	// 부서 상세보기
	@RequestMapping("/department_content_view")
	public String department_content_view(HttpServletRequest request, Model model, DepartDto dto) {
		System.out.println("department_content_view()");
		// String duty_responsibility_code =
		// request.getParameter("duty_responsibility_code");
		HospitalMemberDao dao = sqlSession.getMapper(HospitalMemberDao.class);
		model.addAttribute("department_content_view", dao.department_content_view(dto));
		return "department_content_view";
	}

	// 부서 수정하기
	@RequestMapping(value = "/department_modify", method = RequestMethod.POST)
	public String department_modify(HttpServletRequest request, Model model, DepartDto dto) {
		System.out.println("department_modify()");
		HospitalMemberDao dao = sqlSession.getMapper(HospitalMemberDao.class);
		dao.department_modify(dto);
		return "redirect:department_list";
	}

	// 직책 상세보기
	@RequestMapping("/duty_content_view")
	public String duty_content_view(HttpServletRequest request, Model model, DutyDto dto) {
		System.out.println("duty_content_view()");
		String duty_responsibility_code = request.getParameter("duty_responsibility_code");
		HospitalMemberDao dao = sqlSession.getMapper(HospitalMemberDao.class);
		model.addAttribute("duty_content_view", dao.duty_content_view(dto));
		return "duty_content_view";
	}

	// 직책 수정
	@RequestMapping(value = "/duty_modify", method = RequestMethod.POST)
	public String duty_modify(HttpServletRequest request, Model model, DutyDto dto) {
		System.out.println("duty_modify()");
		HospitalMemberDao dao = sqlSession.getMapper(HospitalMemberDao.class);
		dao.duty_modify(dto);
		return "redirect:duty_list";
	}

	// 직책 삭제
	@RequestMapping("/duty_delete")
	public String duty_delete(HttpServletRequest request, Model model, DutyDto dto) {
		System.out.println("duty_delete()");
		HospitalMemberDao dao = sqlSession.getMapper(HospitalMemberDao.class);
		dao.duty_delete(dto);
		return "redirect:duty_list";
	}

	// 은행 검색 뷰 이동
	@RequestMapping("/bank_search_list")
	public String bank_search_list(Model model) {
		System.out.println("bank_search_list()");
		HospitalMemberDao dao = sqlSession.getMapper(HospitalMemberDao.class);
		model.addAttribute("bank_search_list", dao.bank_search_list());
		return "bank_search_list";
	}

	// 사원 검색 리스트 뷰 이동(퇴사자포함)
	@RequestMapping("/emp_num_search")
	public String emp_num_search(Model model) {
		System.out.println("emp_num_search()");
		HospitalMemberDao dao = sqlSession.getMapper(HospitalMemberDao.class);
		model.addAttribute("emp_num_search_list", dao.emp_num_search());
		return "emp_num_search_list";
	}
	
	// 사원 검색 리스트 뷰 이동(퇴사자포함)
		@RequestMapping("/emp_num_search2")
		public String emp_num_search2(Model model) {
			System.out.println("emp_num_search2()");
			HospitalMemberDao dao = sqlSession.getMapper(HospitalMemberDao.class);
			model.addAttribute("emp_num_search2_list", dao.emp_num_search2());
			return "emp_num_search_list2";
		}
	
	// 중복 사원 검색 리스트 뷰 이동
		@RequestMapping("/emp_num_search_overlap_view")
		public String emp_num_search_overlap_view(Model model) {
			System.out.println("emp_num_search_overlap_view()");
			HospitalMemberDao dao = sqlSession.getMapper(HospitalMemberDao.class);
			model.addAttribute("emp_num_search_list", dao.emp_num_search());
			return "emp_num_search_overlap_view";
		}
		
		// 중복 사번 검색
		@RequestMapping("/emp_num_search_overlap")
		public String emp_num_search_overlap(HttpServletRequest request, Model model) {
			System.out.println("emp_num_search_overlap()");
			String emp_num = request.getParameter("emp_num");
			System.out.println("emp_num : "+emp_num);
			HospitalMemberDao dao = sqlSession.getMapper(HospitalMemberDao.class);
			//model.addAttribute("emp_num_search_list", dao.emp_num_search_overlap(emp_num));
			if (emp_num == null || "".equals(emp_num)) {
				model.addAttribute("emp_num_search_list", dao.emp_num_search_overlap2());
			} else {
				model.addAttribute("emp_num_search_list", dao.emp_num_search_overlap(emp_num));
			}
			model.addAttribute("emp_num", emp_num);
			return "emp_num_search_overlap_view";
		}// list() end
		
		
		
}
