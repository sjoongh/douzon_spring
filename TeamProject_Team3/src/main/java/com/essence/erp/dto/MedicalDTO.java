package com.essence.erp.dto;

public class MedicalDTO {

	private int m_no;
	private String m_name, m_gender, m_jumin1, m_jumin2, m_address, m_phone;

	public MedicalDTO() {

	}

	public MedicalDTO(int m_no, String m_name, String m_gender, String m_jumin1, String m_jumin2, String m_address,
			String m_phone) {
		this.m_no = m_no;
		this.m_name = m_name;
		this.m_gender = m_gender;
		this.m_jumin1 = m_jumin1;
		this.m_jumin2 = m_jumin2;
		this.m_address = m_address;
		this.m_phone = m_phone;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_gender() {
		return m_gender;
	}

	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}

	public String getM_jumin1() {
		return m_jumin1;
	}

	public void setM_jumin1(String m_jumin1) {
		this.m_jumin1 = m_jumin1;
	}

	public String getM_jumin2() {
		return m_jumin2;
	}

	public void setM_jumin2(String m_jumin2) {
		this.m_jumin2 = m_jumin2;
	}

	public String getM_address() {
		return m_address;
	}

	public void setM_address(String m_address) {
		this.m_address = m_address;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

}
