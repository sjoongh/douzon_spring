package com.essence.erp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.essence.erp.dto.Criteria;
import com.essence.erp.dto.HospitalMemberDto;
import com.essence.erp.dto.MedicalDTO;
import com.essence.erp.dto.PatientDTO;
import com.essence.erp.dto.PrescriptionDTO;
import com.essence.erp.dto.Prescription_dateDTO;
import com.essence.erp.dto.TreatmentDTO;
import com.essence.erp.dto.Treatment_dateDTO;

public interface PatientDAO {

	public List<MedicalDTO> resList(@Param("c_name") String c_name, @Param("c_jumin1") String c_jumin1);

	public void patientAdd(PatientDTO dto);

	public List<PatientDTO> patientList();

	public List<PatientDTO> patientSelect(PatientDTO dto);

	public List<PatientDTO> patientView(PatientDTO dto);

	public List<TreatmentDTO> treatmentView(TreatmentDTO dto);

	public void patientUpdate(PatientDTO dto);

	public List<TreatmentDTO> treatmentList(TreatmentDTO dto);

	public void treatmentUpdate(String t_content_array);

	public void treatmentAdd(String r_no, String c_no, String t_code, String content);

	public List<PrescriptionDTO> prescriptionList(PrescriptionDTO dto);

	public List<PrescriptionDTO> prescriptionView(PrescriptionDTO dto);

	public List<Treatment_dateDTO> TreatmentDate(Treatment_dateDTO td_dto);

	public List<Prescription_dateDTO> PrescriptionDate(Prescription_dateDTO pd_dto);

	public void prescriptionAdd(String r_no, String c_no, String pre_code, String pre_name);

	public List<Treatment_dateDTO> tredate(String c_no);

	public int calcPay(String c_no);

	public List<TreatmentDTO> treatmentadmin(Criteria cri);

	public void treatmentinsert(TreatmentDTO t_dto);

	public TreatmentDTO treatment_update_list(TreatmentDTO t_Dto);

	public void treatmentupdate(TreatmentDTO t_Dto);

	public void treatmentdelete(TreatmentDTO t_Dto);

	public List<PrescriptionDTO> prescriptionadmin(Criteria cri);

	public void prescriptioninsert(PrescriptionDTO pre_dto);

	public PrescriptionDTO prescription_update_list(PrescriptionDTO pre_dto);

	public void prescriptionupdate(PrescriptionDTO pre_dto);

	public void prescriptiondelete(PrescriptionDTO pre_dto);

	public List<HospitalMemberDto> doctorList();

	public int prescriptionadminCount();

	public int treatmentadminCount();
}
