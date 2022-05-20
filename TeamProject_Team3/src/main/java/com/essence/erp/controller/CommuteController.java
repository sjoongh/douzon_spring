package com.essence.erp.controller;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.essence.erp.dao.CommuteDao;
import com.essence.erp.dto.CommuteAbsenceDto;
import com.essence.erp.dto.CommuteDto;
import com.essence.erp.dto.Criteria;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class CommuteController { // FrontController
	@Autowired 
	ObjectMapper mapper;

	@Autowired
	private SqlSession sqlSession;
	// 출근 뷰 이동
	@RequestMapping("/commute")
	public String commute(Model model, HttpServletRequest request,Principal principal) throws JsonProcessingException {
		CommuteDao dao = sqlSession.getMapper(CommuteDao.class);
		String emp_num=principal.getName();
		System.out.println("emp_num : "+emp_num);
	    List <CommuteDto> list2=dao.compare_commute_date(emp_num); //출근
	    String name = dao.getName(emp_num);                                    
	    String jsonStr = mapper.writeValueAsString(list2);
	    model.addAttribute("json", jsonStr);
	    model.addAttribute("name", name);
	    model.addAttribute("emp_num", emp_num);
		return "human_resources.commute";
	}
	// 출근 테스트 뷰 이동
	@RequestMapping("/commute2")
	public String commute2(Model model, HttpServletRequest request,Principal principal) throws JsonProcessingException {
		/*CommuteDao dao = sqlSession.getMapper(CommuteDao.class);
		String emp_num=principal.getName();
	    List <CommuteDto> list2=dao.compare_commute_date(emp_num); //출근
	    String jsonStr = mapper.writeValueAsString(list2);
	    model.addAttribute("json", jsonStr);*/
		return "human_resources.commute_whole";
	}
	// 출근,퇴근 버튼 처리
	   @RequestMapping("/commute_check")
	   @ResponseBody
	   public TestObject commute_check(Model model, HttpServletRequest request,Principal principal) {
	      System.out.println("commute_check()");
	      CommuteDao dao = sqlSession.getMapper(CommuteDao.class);
	      String status = request.getParameter("status");
	      String emp_no= principal.getName();
	      if ("0".equals(status)) {
	         status = "출근";
	      }
	      if ("1".equals(status)) {
	         status = "퇴근";
	      }
	      System.out.println(status);
	      dao.commute_check(status,emp_no);
	      System.out.println(request.getParameter("param1"));
	      System.out.println(request.getParameter("param2"));
	      return new TestObject(200, "");
	   }
	
		// 출퇴근 공휴일 등등 처리 뷰
	@RequestMapping("/commute_holyday_process_view")
	public String commute_holyday_process_view(Model model,HttpServletRequest request, Criteria cri) {
		CommuteDao dao = sqlSession.getMapper(CommuteDao.class);		
		cri.setPageSize(4);
		System.out.println("commute_holyday_process_view()");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		cri.setYear(year);
		cri.setMonth(month);
		model.addAttribute("emp_absence_list_get", dao.emp_absence_list_get(cri));
		model.addAttribute("emp_absence_list_get2", dao.emp_absence_list_get2());
		model.addAttribute("cri", cri);
		model.addAttribute("count", dao.emp_absence_list_get_count(year,month));
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		return "human_resources.commute_holyday_process_view";
	}
	
	// 출퇴근 공휴일 등등 처리
	@RequestMapping("/commute_holyday_process")
	public String commute_holyday_process(Model model,HttpServletRequest request,CommuteDto dto) throws ParseException {
		System.out.println("commute_holyday_process()");
		CommuteDao dao = sqlSession.getMapper(CommuteDao.class);
		String emp_num = request.getParameter("emp_num");
		String status = request.getParameter("status");
		String start_day=request.getParameter("start_day");
		String end_day=request.getParameter("end_day");
		dao.emp_absence_list(emp_num,status,start_day,end_day);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date start_date = formatter.parse(start_day);
		Date end_date = formatter.parse(end_day);
	    long diff = end_date.getTime() - start_date.getTime();
	    long diffDays = diff / (24 * 60 * 60 * 1000);
		System.out.println("두 날짜간 날짜 차이 : "+diffDays);
		Calendar cal = Calendar.getInstance();
		Calendar cal2 = Calendar.getInstance();
		for(int i=0; i<diffDays+1; i++){
			int compare=start_date.compareTo(end_date);
		 if ( compare > 0 )
	        {			 
	            System.out.println( "start_date > end_date");	            
	        }
	        else if ( compare <= 0 )
	        {
	            cal.setTime(start_date);
	            cal2.setTime(end_date);
	            int year = cal.get(Calendar.YEAR);
	            int month = cal.get((Calendar.MONTH)) + 1;
	            int day = cal.get(Calendar.DAY_OF_MONTH);
	            Integer a = Integer.valueOf(month);
	            Integer b = Integer.valueOf(day);
	            String format = "%1$02d";
	            String month2 = String.format(format, a);
	            String day2 = String.format(format, b);
	            String year2 = String.valueOf(year);
	            System.out.println("year : "+year2+" month : "+month2+" day : "+day2);
	            cal.add(Calendar.DATE, 1);
	            start_day = formatter.format(cal.getTime());
	            start_date = formatter.parse(start_day);
	            dao.commute_holyday_process(emp_num,status,year2,month2,day2);
	        }
	        else
	        {
	            System.out.println( "여긴뜰일없다" );
	        }
		}
		return "redirect:commute_holyday_process_view?year=2016&month=06";
	}
	
	
	//결근 사유 리스트
		@RequestMapping("/absence_search")
		public String absence_search(Model model) {
			System.out.println("absence_search()");
			CommuteDao dao = sqlSession.getMapper(CommuteDao.class);
			model.addAttribute("absence_list", dao.absence_list());
			return "commute_absence";
		}
		//결근 사유 리스트 삭제
		@RequestMapping("/emp_absence_list_delete")
		public String emp_absence_list_delete(Model model,HttpServletRequest request) {
			CommuteDao dao = sqlSession.getMapper(CommuteDao.class);		
			System.out.println("emp_absence_list_delete()");
			String emp_absence_list_code = request.getParameter("emp_absence_list_code");
			String emp_num = request.getParameter("emp_num");
			String status = request.getParameter("status");
			System.out.println("emp_absence_list_code : "+emp_absence_list_code);
			System.out.println("emp_num : "+emp_num);
			System.out.println("status : "+status);
			dao.emp_absence_list_delete(emp_absence_list_code);
			dao.emp_absence_list_delete2(emp_num,status);
			return "redirect:commute_holyday_process_view?year=2016&month=06";
		}
		
		
		
		//결근 사유 등록 뷰 이동
		@RequestMapping("/emp_absence_list_approval_input")
		public String emp_absence_list_approval_input(Model model,HttpServletRequest request, CommuteAbsenceDto dto) throws ParseException {
			System.out.println("emp_absence_list_approval_input()");
			String emp_absence_list_code = request.getParameter("emp_absence_list_code");
			String emp_name = request.getParameter("emp_name");
			String emp_num = request.getParameter("emp_num");
			String status = request.getParameter("status");
			String start_day = request.getParameter("start_date");
			String end_day = request.getParameter("end_date");
			CommuteDao dao = sqlSession.getMapper(CommuteDao.class);
			dao.emp_absence_list_delete3(emp_num,status);
			System.out.println("결근 사유 등록"+emp_num+status+start_day+end_day);
			dao.emp_absence_list(emp_num,status,start_day,end_day);
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date start_date = formatter.parse(start_day);
			Date end_date = formatter.parse(end_day);
		    long diff = end_date.getTime() - start_date.getTime();
		    long diffDays = diff / (24 * 60 * 60 * 1000);
			System.out.println("두 날짜간 날짜 차이 : "+diffDays);
			Calendar cal = Calendar.getInstance();
			Calendar cal2 = Calendar.getInstance();
			for(int i=0; i<diffDays+1; i++){
				int compare=start_date.compareTo(end_date);
			 if ( compare > 0 )
		        {			 
		            System.out.println( "start_date > end_date");	            
		        }
		        else if ( compare <= 0 )
		        {
		            cal.setTime(start_date);
		            cal2.setTime(end_date);
		            int year = cal.get(Calendar.YEAR);
		            int month = cal.get((Calendar.MONTH)) + 1;
		            int day = cal.get(Calendar.DAY_OF_MONTH);
		            Integer a = Integer.valueOf(month);
		            Integer b = Integer.valueOf(day);
		            String format = "%1$02d";
		            String month2 = String.format(format, a);
		            String day2 = String.format(format, b);
		            String year2 = String.valueOf(year);
		            System.out.println("year : "+year2+" month : "+month2+" day : "+day2);
		            cal.add(Calendar.DATE, 1);
		            start_day = formatter.format(cal.getTime());
		            start_date = formatter.parse(start_day);
		            dao.commute_holyday_process(emp_num,status,year2,month2,day2);
		        }
		        else
		        {
		            System.out.println( "여긴뜰일없다" );
		        }
			}
			return "redirect:commute_holyday_process_view?year=2016&month=06";
		}
		
		//신청 사유 리스트 삭제
				@RequestMapping("/emp_absence_list_delete3")
				public String emp_absence_list_delete3(Model model,HttpServletRequest request) {
					CommuteDao dao = sqlSession.getMapper(CommuteDao.class);		
					System.out.println("emp_absence_list_delete3()");
					String emp_absence_list_code = request.getParameter("emp_absence_list_code");
					String emp_num = request.getParameter("emp_num");
					String status = request.getParameter("status");
					System.out.println("emp_absence_list_code : "+emp_absence_list_code);
					System.out.println("emp_num : "+emp_num);
					System.out.println("status : "+status);
					dao.emp_absence_list_delete3(emp_num,status);
					return "redirect:commute_holyday_process_view?year=2016&month=06";
				}
		
		//결근 사유 등록 뷰 이동
				@RequestMapping("/absence_sign_up_view")
				public String absence_sign_up_view(Model model,HttpServletRequest request, CommuteAbsenceDto dto) {
					System.out.println("absence_sign_up_view()");
					return "absence_sign_up";
				}
				
		//결근 사유 등록
			@RequestMapping("/absence_sign_up")
			public String absence_sign_up(Model model,HttpServletRequest request, CommuteAbsenceDto dto) {
				System.out.println("absence_sign_up()");
				CommuteDao dao = sqlSession.getMapper(CommuteDao.class);
				dao.absence_sign_up(dto);
				return "redirect:test";
			}
			
			//결근 사유 신청 팝업 이동
			@RequestMapping("/commute_holy_day_process_popup")
			public String commute_holy_day_process_popup(Model model,HttpServletRequest request, CommuteAbsenceDto dto) {
				System.out.println("commute_holy_day_process_popup()");
				String emp_num=request.getParameter("emp_num");
				String emp_name=request.getParameter("emp_name");
				System.out.println(emp_num+" , "+emp_name);
				model.addAttribute("emp_num", emp_num);
				model.addAttribute("emp_name", emp_name);
				return "commute_holyday_process_popup";
			}
		
			//결근 사유 신청
			@RequestMapping("/commute_holyday_process_emp_sign_up")
			public String commute_holyday_process_emp_sign_up(Model model,HttpServletRequest request,CommuteDto dto) throws ParseException {
				System.out.println("commute_holyday_process_emp_sign_up()");
				CommuteDao dao = sqlSession.getMapper(CommuteDao.class);
				String emp_num = request.getParameter("emp_num");
				String status = request.getParameter("status");
				String start_day=request.getParameter("start_day");
				String end_day=request.getParameter("end_day");
				dao.emp_absence_list_wait_approval(emp_num,status,start_day,end_day);
				/*SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
				Date start_date = formatter.parse(start_day);
				Date end_date = formatter.parse(end_day);
			    long diff = end_date.getTime() - start_date.getTime();
			    long diffDays = diff / (24 * 60 * 60 * 1000);
				System.out.println("두 날짜간 날짜 차이 : "+diffDays);
				Calendar cal = Calendar.getInstance();
				Calendar cal2 = Calendar.getInstance();
				for(int i=0; i<diffDays+1; i++){
					int compare=start_date.compareTo(end_date);
				 if ( compare > 0 )
			        {			 
			            System.out.println( "start_date > end_date");	            
			        }
			        else if ( compare <= 0 )
			        {
			            cal.setTime(start_date);
			            cal2.setTime(end_date);
			            int year = cal.get(Calendar.YEAR);
			            int month = cal.get((Calendar.MONTH)) + 1;
			            int day = cal.get(Calendar.DAY_OF_MONTH);
			            Integer a = Integer.valueOf(month);
			            Integer b = Integer.valueOf(day);
			            String format = "%1$02d";
			            String month2 = String.format(format, a);
			            String day2 = String.format(format, b);
			            String year2 = String.valueOf(year);
			            System.out.println("year : "+year2+" month : "+month2+" day : "+day2);
			            cal.add(Calendar.DATE, 1);
			            start_day = formatter.format(cal.getTime());
			            start_date = formatter.parse(start_day);
			            dao.commute_holyday_process(emp_num,status,year2,month2,day2);
			        }
			        else
			        {
			            System.out.println( "여긴뜰일없다" );
			        }
				}*/
			 return "redirect:test";
			}
			
			
			
		//결근 사유 삭제
		@RequestMapping("/absence_delete")
		public String absence_delete(Model model,HttpServletRequest request) {
			System.out.println("absence_delete()");
			CommuteDao dao = sqlSession.getMapper(CommuteDao.class);
			String absence_code =request.getParameter("absence_code");
			dao.absence_delete(absence_code);
			return "redirect:commute_absence";
		}
		
	//ajax  달력에 데이터넣기
	@RequestMapping("/get_events")
	@ResponseBody
	public List<CalendarEvent> get_events(Model model,HttpServletRequest request,Principal principal) throws ParseException {
		CommuteDao dao = sqlSession.getMapper(CommuteDao.class);
		List<CalendarEvent> list = new ArrayList<CalendarEvent>();
		CalendarEvent ce;
		 String emp_num=principal.getName();
		 List <Date> day = new ArrayList<Date>();
	     List <CommuteDto>list2=dao.commute_day_gotowork(emp_num); //출근,퇴근
	     List <CommuteDto>list3=dao.commute_day_gotowork2(emp_num); //공휴일,휴가등
	     for (int i = 0; i<list2.size(); i++) {
	    	  ce = new CalendarEvent(list2.get(i).getStatus(), list2.get(i).getDay());
	    	  list.add(ce);
	     }
	     for (int i = 0; i<list3.size(); i++) {
	    	  ce = new CalendarEvent(list3.get(i).getStatus(), list3.get(i).getDay());
	    	  list.add(ce);
	     }
	  
		return list;
	}
	
	//ajax  달력에 오늘 출근 데이터넣기
		@RequestMapping("/get_events2")
		@ResponseBody
		public List<CalendarEvent> get_events2(Model model,HttpServletRequest request) throws ParseException {
			CommuteDao dao = sqlSession.getMapper(CommuteDao.class);
			List<CalendarEvent> list = new ArrayList<CalendarEvent>();
			CalendarEvent ce;	
			String emp_num="00001";
			 List <Date> day = new ArrayList<Date>();
		     List <CommuteDto>list2=dao.commute_day_gotowork3(emp_num); //오늘 출근 데이터만
		     for (int i = 0; i<list2.size(); i++) {
		    	  ce = new CalendarEvent(list2.get(i).getStatus(), list2.get(i).getDay());
		    	  list.add(ce);
		     }
		  
			return list;
		}
		
		//ajax  달력에 오늘 퇴근 데이터넣기
				@RequestMapping("/get_events3")
				@ResponseBody
				public List<CalendarEvent> get_events3(Model model,HttpServletRequest request) throws ParseException {
					CommuteDao dao = sqlSession.getMapper(CommuteDao.class);
					List<CalendarEvent> list = new ArrayList<CalendarEvent>();
					CalendarEvent ce;
					String emp_num="00001";
					 List <Date> day = new ArrayList<Date>();
				     List <CommuteDto>list2=dao.commute_day_gotowork4(emp_num); //오늘 퇴근 데이터만
				     for (int i = 0; i<list2.size(); i++) {
				    	  ce = new CalendarEvent(list2.get(i).getStatus(), list2.get(i).getDay());
				    	  list.add(ce);
				     }
				  
					return list;
				}
				//ajax  달력에 결근날짜(공휴일 등등 넣기)
				@RequestMapping("/get_events_absence")
				@ResponseBody
				public List<CalendarEvent> get_events_absence	(Model model,HttpServletRequest request) throws ParseException {
					CommuteDao dao = sqlSession.getMapper(CommuteDao.class);
					List<CalendarEvent> list = new ArrayList<CalendarEvent>();
					CalendarEvent ce;		
				     List <CommuteDto>list2=dao.commute_day_gotowork_absence(); //공휴일 등등
				     for (int i = 0; i<list2.size(); i++) {
				    	  ce = new CalendarEvent(list2.get(i).getStatus(), list2.get(i).getDay());
				    	  list.add(ce);
				     }
				  
					return list;
				}
				
	static class CalendarEvent {
		public String title;
		public String start;
		public CalendarEvent(String title, String start) {
			this.title = title;
			this.start = start;			
		}
	}
	
	@RequestMapping("/ajax_test")
	@ResponseBody
	public TestObject ajax_test(Model model,HttpServletRequest request) {
		System.out.println(request.getParameter("param1"));
		System.out.println(request.getParameter("param2"));
		return new TestObject(200, "desc test!");
	}
	static class TestObject {
		public int code;
		public String desc;
		
		public TestObject(int code, String desc) {
			this.code = code;
			this.desc = desc;
		}
	}
	
    
	
	
}
