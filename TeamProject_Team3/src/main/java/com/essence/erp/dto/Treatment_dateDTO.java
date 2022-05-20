package com.essence.erp.dto;

public class Treatment_dateDTO {
	private String c_no;
	private String t_code;
	private String t_content;
	private String t_date;
	private String t_name;
	private String patient_treatment_no;

	public Treatment_dateDTO() {

	}

	public Treatment_dateDTO(String c_no, String t_code, String t_content, String t_date, String t_name,
			String patient_treatment_no) {
		this.c_no = c_no;
		this.t_code = t_code;
		this.t_content = t_content;
		this.t_date = t_date;
		this.t_name = t_name;
		this.patient_treatment_no = patient_treatment_no;
	}

	public String getPatient_treatment_no() {
		return patient_treatment_no;
	}

	public void setPatient_treatment_no(String patient_treatment_no) {
		this.patient_treatment_no = patient_treatment_no;
	}

	public String getT_name() {
		return t_name;
	}

	public void setT_name(String t_name) {
		this.t_name = t_name;
	}

	public String getC_no() {
		return c_no;
	}

	public void setC_no(String c_no) {
		this.c_no = c_no;
	}

	public String getT_code() {
		return t_code;
	}

	public void setT_code(String t_code) {
		this.t_code = t_code;
	}

	public String getT_content() {
		return t_content;
	}

	public void setT_content(String t_content) {
		this.t_content = t_content;
	}

	public String getT_date() {
		return t_date;
	}

	public void setT_date(String t_date) {
		this.t_date = t_date;
	}

}
