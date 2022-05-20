package com.essence.erp.dto;

public class Prescription_dateDTO {

	private String c_no;
	private String pre_code;
	private String pre_name;
	private String t_date;
	private String patient_prescription_no;

	public Prescription_dateDTO() {

	}

	public Prescription_dateDTO(String c_no, String pre_code, String pre_name, String t_date,
			String patient_prescription_no) {
		this.c_no = c_no;
		this.pre_code = pre_code;
		this.pre_name = pre_name;
		this.t_date = t_date;
		this.patient_prescription_no = patient_prescription_no;
	}

	public String getPatient_prescription_no() {
		return patient_prescription_no;
	}

	public void setPatient_prescription_no(String patient_prescription_no) {
		this.patient_prescription_no = patient_prescription_no;
	}

	public String getC_no() {
		return c_no;
	}

	public void setC_no(String c_no) {
		this.c_no = c_no;
	}

	public String getPre_code() {
		return pre_code;
	}

	public void setPre_code(String pre_code) {
		this.pre_code = pre_code;
	}

	public String getPre_name() {
		return pre_name;
	}

	public void setPre_name(String pre_name) {
		this.pre_name = pre_name;
	}

	public String getT_date() {
		return t_date;
	}

	public void setT_date(String t_date) {
		this.t_date = t_date;
	}

}
