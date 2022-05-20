package com.essence.erp.dto;

import java.security.Timestamp;
import java.util.Date;

public class CommuteAbsenceDto {

	String absence_code;
	String absence_name;
	
	public String getAbsence_code() {
		return absence_code;
	}
	public void setAbsence_code(String absence_code) {
		this.absence_code = absence_code;
	}
	public String getAbsence_name() {
		return absence_name;
	}
	public void setAbsence_name(String absence_name) {
		this.absence_name = absence_name;
	}
	
}
