package com.essence.erp.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.essence.erp.dao.PatientDAO;
import com.essence.erp.dto.Criteria;
import com.essence.erp.dto.HospitalMemberDto;
import com.essence.erp.dto.PatientDTO;
import com.essence.erp.dto.PaymentDTO;
import com.essence.erp.dto.PrescriptionDTO;
import com.essence.erp.dto.Prescription_dateDTO;
import com.essence.erp.dto.TreatmentDTO;
import com.essence.erp.dto.Treatment_dateDTO;
import com.essence.erp.service.TransService;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class PatientController {

	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	ObjectMapper mapper;
	
	@Autowired
	private TransService transService;

	// 환자추가
	@RequestMapping("/patientAdd")
	public String patientAdd(PatientDTO dto) throws Exception {

		PatientDAO dao = sqlSession.getMapper(PatientDAO.class);
		dao.patientAdd(dto);

		return "redirect:patientList";
	}

	// 환자 리스트
	@RequestMapping(value = "/patientList", method = RequestMethod.GET)
	public String patientList(Model model) throws Exception {

		PatientDAO dao = sqlSession.getMapper(PatientDAO.class);
		model.addAttribute("customer_list", dao.patientList());

		return "patient.patientList";
	}

	// 환자 리스트
	@RequestMapping(value = "/patientList", method = RequestMethod.POST)
	public String patientList(Model model, PatientDTO dto) throws Exception {

		PatientDAO dao = sqlSession.getMapper(PatientDAO.class);
		model.addAttribute("customer_list", dao.patientSelect(dto));

		return "patient.patientList";
	}

	// 환자 상세보기
	@RequestMapping(value = "/patientView", method = RequestMethod.GET)
	public String patientView(HttpServletRequest request, Model model, PatientDTO p_dto, Treatment_dateDTO td_dto,
			Prescription_dateDTO pd_dto,HospitalMemberDto hm_dto) throws Exception {

//		PatientDAO dao = sqlSession.getMapper(PatientDAO.class);
//		
//		String c_no = request.getParameter("c_no");
//		String t_date = request.getParameter("t_date");
//
//		p_dto.setC_no(c_no);
//		td_dto.setC_no(c_no);
//
//		model.addAttribute("customer_view", dao.patientView(p_dto));
//		model.addAttribute("doctor", dao.doctorList());
//		
//		// 환자 상세보기 하단 진료일자 출력 부분
//		model.addAttribute("date", dao.tredate(c_no));
//		
//		if (request.getParameter("t_date").equals("")) {
//			
//		} else {
//			
//			td_dto.setPatient_treatment_no(request.getParameter("patient_treatment_no"));
//			td_dto.setT_date(t_date);
//			td_dto.setC_no(c_no);
//			
//			pd_dto.setPatient_prescription_no(request.getParameter("patient_treatment_no"));
//			pd_dto.setT_date(t_date);
//			pd_dto.setC_no(c_no);
//
//			model.addAttribute("treatment_date", dao.TreatmentDate(td_dto));
//			model.addAttribute("prescription_date", dao.PrescriptionDate(pd_dto));
//		}
//
//		return "patient.patientView";
		
		return transService.patientView(request, model, p_dto, td_dto, pd_dto, hm_dto);
	}

	@RequestMapping(value = "/patientView", method = RequestMethod.POST)
	public String patientUpdate(HttpServletRequest request, PatientDTO dto) throws Exception {

		String c_no = request.getParameter("c_no");
		dto.setC_no(c_no);
		
		PatientDAO dao = sqlSession.getMapper(PatientDAO.class);
		dao.patientUpdate(dto);

		return "redirect:patientView?t_date=&c_no=" + c_no;
	}

	// 진료 기록 DB에 저장
	@RequestMapping("/treatment_prescriptionAdd")
	public String treatmentAdd(HttpServletRequest request, TreatmentDTO t_dto, PatientDTO p_dto, PaymentDTO pay)
			throws Exception {

//		PatientDAO dao = sqlSession.getMapper(PatientDAO.class);
//
//		String c_no = request.getParameter("c_no");
//		
//		// 접수 테이블 연동
//		ReceptionDAO rdao = sqlSession.getMapper(ReceptionDAO.class);
//		String r_no = rdao.receptionNo(c_no) + "";
//
//		String str = request.getParameter("treatment_send_list");
//		String str2 = request.getParameter("prescription_send_list");
//
//		List<HashMap<String, Object>> list = mapper.readValue(str, List.class);
//		List<HashMap<String, Object>> list2 = mapper.readValue(str2, List.class);
//
//		for (int i = 0; i < list.size(); i++) {
//
//			HashMap<String, Object> row = list.get(i);
//
//			String t_code = (String) row.get("code");
//			String content = (String) row.get("content");
//
//			dao.treatmentAdd(r_no, c_no, t_code, content);
//		}
//		for (int i = 0; i < list2.size(); i++) {
//
//			HashMap<String, Object> row2 = list2.get(i);
//
//			String pre_name = (String) row2.get("name2");
//			String pre_code = (String) row2.get("code2");
//
//			dao.prescriptionAdd(r_no, c_no, pre_code, pre_name);
//		}
//
//		// 접수 테이블 연동 : 진료, 처방 내역 저장시 접수 목록에서 삭제
//		rdao.receptionDelete(r_no);
//
//		// & 결제 대기 테이블에 진료비 추가
//		pay.setC_no(c_no);
//		pay.setC_name(rdao.checkName(c_no));
//		pay.setT_pay(dao.calcPay(c_no));
//		
//		rdao.inputPay(pay);
//
//		return "redirect:patientView?t_date=&c_no=" + c_no;
		
		return transService.treatmentAdd(request, t_dto, p_dto, pay);
	}

	// 진료 기록 리스트
	@RequestMapping("/treatment_list")
	public String treatment(Model model, TreatmentDTO t_dto) {
		
		PatientDAO dao = sqlSession.getMapper(PatientDAO.class);
		model.addAttribute("customer_list", dao.treatmentList(t_dto));
		
		return "treatment_list";
	}

	@RequestMapping("/prescription_list")
	public String prescription(Model model, PrescriptionDTO pre_dto) {
		
		PatientDAO dao = sqlSession.getMapper(PatientDAO.class);
		model.addAttribute("prescription_list", dao.prescriptionList(pre_dto));

		return "prescription_list";
	}

	@RequestMapping(value = "/treatment_date", method = RequestMethod.POST)
	public String treatmentDate(HttpServletRequest request) {
		
		String c_no = request.getParameter("c_no");
		String t_date = request.getParameter("t_date");
		String patient_treatment_no = request.getParameter("patient_treatment_no");

		return "redirect:patientView?t_date=" + t_date + "&c_no=" + c_no + "&patient_treatment_no=" + patient_treatment_no;
	}
	
	
	@RequestMapping("/treatment_admin")
	public String treatmentadmin(Model model,Criteria cri,TreatmentDTO t_dto){
		cri.setPageSize(5);
		PatientDAO dao = sqlSession.getMapper(PatientDAO.class);
		
		model.addAttribute("t_dto", dao.treatmentadmin(cri));
		model.addAttribute("cri", cri);
		model.addAttribute("count", dao.treatmentadminCount());
		
		return "patient.treatment_admin";
	}
	
	@RequestMapping("/treatment_insert")
	public String treatmentinsert(){
		
		return "patient.treatment_insert";
	}
	
	@RequestMapping("/treatment_insert2")
	public String treatmentinsert2(TreatmentDTO t_dto,HttpServletRequest request){
		PatientDAO dao = sqlSession.getMapper(PatientDAO.class);
		String t_name=request.getParameter("t_name");
		System.out.println(t_name);
		dao.treatmentinsert(t_dto);
		return "redirect:treatment_admin";
	}
	
	@RequestMapping(value = "/treatment_update", method = RequestMethod.GET)
	public String treatmentupdate(Model model, HttpServletRequest request, TreatmentDTO t_dto) {

		t_dto.setT_code(request.getParameter("t_code"));

		PatientDAO dao = sqlSession.getMapper(PatientDAO.class);
		model.addAttribute("update", dao.treatment_update_list(t_dto));

		return "patient.treatment_update";
	}

	@RequestMapping(value = "/treatment_update", method = RequestMethod.POST)
	public String treatmentupdate2(HttpServletRequest request, TreatmentDTO t_dto) {

		PatientDAO dao = sqlSession.getMapper(PatientDAO.class);
		dao.treatmentupdate(t_dto);

		return "redirect:treatment_admin?pageNum=1";
	}
	
	@RequestMapping(value = "/treatment_delete", method = RequestMethod.GET)
	public String treatmentdelete(HttpServletRequest request, TreatmentDTO t_dto) {

		t_dto.setT_code(request.getParameter("t_code"));

		PatientDAO dao = sqlSession.getMapper(PatientDAO.class);

		dao.treatmentdelete(t_dto);
		

		return "redirect:treatment_admin?pageNum=1";
	}
	
	@RequestMapping("/prescription_admin")
	public String prescriptionadmin(Model model,Criteria cri,PrescriptionDTO pre_dto){
		cri.setPageSize(5);
		PatientDAO dao = sqlSession.getMapper(PatientDAO.class);
		
		model.addAttribute("pre_dto", dao.prescriptionadmin(cri));
		model.addAttribute("cri", cri);
		model.addAttribute("count", dao.prescriptionadminCount());
		
		return "patient.prescription_admin";
	}
	
	@RequestMapping("/prescription_insert")
	public String prescriptioninsert(){
		
		return "patient.prescription_insert";
	}
	
	@RequestMapping("/prescription_insert2")
	public String prescriptioninsert2(PrescriptionDTO pre_dto,HttpServletRequest request){
		PatientDAO dao = sqlSession.getMapper(PatientDAO.class);
		String pre_name=request.getParameter("pre_name");
		System.out.println(pre_name);
		dao.prescriptioninsert(pre_dto);
		
		return "redirect:prescription_admin?pageNum=1";
	}
	
	@RequestMapping(value = "/prescription_update", method = RequestMethod.GET)
	public String prescriptionupdate(Model model, HttpServletRequest request, PrescriptionDTO pre_dto) {

		pre_dto.setPre_code(request.getParameter("pre_code"));

		PatientDAO dao = sqlSession.getMapper(PatientDAO.class);
		model.addAttribute("update", dao.prescription_update_list(pre_dto));

		return "patient.prescription_update";
	}

	@RequestMapping(value = "/prescription_update", method = RequestMethod.POST)
	public String prescriptionupdate2(HttpServletRequest request, PrescriptionDTO pre_dto) {

		PatientDAO dao = sqlSession.getMapper(PatientDAO.class);
		dao.prescriptionupdate(pre_dto);

		return "redirect:prescription_admin?pageNum=1";
	}
	
	@RequestMapping(value = "/prescription_delete", method = RequestMethod.GET)
	public String prescriptiondelete(HttpServletRequest request, PrescriptionDTO pre_dto) {

		pre_dto.setPre_code(request.getParameter("pre_code"));

		PatientDAO dao = sqlSession.getMapper(PatientDAO.class);

		dao.prescriptiondelete(pre_dto);
		

		return "redirect:prescription_admin?pageNum=1";
	}
}
