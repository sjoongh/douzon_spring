package com.essence.erp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.essence.erp.dto.PatientDTO;
import com.essence.erp.dto.PaymentDTO;
import com.essence.erp.dto.ReceptionDTO;

public interface ReceptionDAO {

	public List<ReceptionDTO> reservationList();

	public void reservationAdd(ReceptionDTO dto);

	public void reservationDelete(ReceptionDTO dto);

	public List<ReceptionDTO> receptionList();

	public void receptionAdd(ReceptionDTO dto);

	public void receptionNew(ReceptionDTO dto);

	public void receptionDelete(String r_no);

	public List<ReceptionDTO> reservationToday();
	
	public List<PatientDTO> patientSearch(@Param("c_name") String c_name, @Param("c_jumin1") String c_jumin1);
	
	public int receptionNo(String c_no);
	
	public String checkName(String c_no);
	
	public void inputPay(PaymentDTO dto);
	
	public int patientCheck(@Param("c_name") String c_name, @Param("c_jumin1") String c_jumin1);
	
	public List<ReceptionDTO> resultDate(String res_date);

}
