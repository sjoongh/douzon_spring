package com.essence.erp.dto;

import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class HospitalMemberDto {

	String emp_num;
	String emp_name;
	String telephone;
	String telephone10;
	String telephone11;
	String telephone2;
	String telephone20;
	String telephone21;
	String address, address_number;
	String department;
	String department_code;
	String jumin_number;
	String jumin_number2;
	String gender;
	String join_date;
	String retire_date;
	String email;
	String duty_responsibility;
	String duty_responsibility_code;
	String rank_position;
	String continuous_service_date;
	String marital_status;
	String bank_name;
	String account_holder;
	String account_number;
	String picture;
	String attach_file;
	String join_company_division;
	String diffdays;

	public String getDiffdays() {
		return diffdays;
	}

	public void setDiffdays(String diffdays) {
		this.diffdays = diffdays;
	}

	public String getDepartment_code() {
		return department_code;
	}

	public void setDepartment_code(String department_code) {
		this.department_code = department_code;
	}

	public String getJumin_number2() {
		return jumin_number2;
	}

	public void setJumin_number2(String jumin_number2) {
		this.jumin_number2 = jumin_number2;
	}

	public String getTelephone10() {
		return telephone10;
	}

	public void setTelephone10(String telephone10) {
		this.telephone10 = telephone10;
	}

	public String getTelephone11() {
		return telephone11;
	}

	public void setTelephone11(String telephone11) {
		this.telephone11 = telephone11;
	}

	public String getTelephone20() {
		return telephone20;
	}

	public void setTelephone20(String telephone20) {
		this.telephone20 = telephone20;
	}

	public String getTelephone21() {
		return telephone21;
	}

	public void setTelephone21(String telephone21) {
		this.telephone21 = telephone21;
	}

	// public List<PDto> hospital_pay_list;
	public String getDuty_responsibility_code() {
		return duty_responsibility_code;
	}

	public void setDuty_responsibility_code(String duty_responsibility_code) {
		this.duty_responsibility_code = duty_responsibility_code;
	}

	public String getAddress_number() {
		return address_number;
	}

	public void setAddress_number(String address_number) {
		this.address_number = address_number;
	}

	public String getDuty_responsibility() {
		return duty_responsibility;
	}

	public void setDuty_responsibility(String duty_responsibility) {
		this.duty_responsibility = duty_responsibility;
	}

	public String getEmp_num() {
		return emp_num;
	}

	public void setEmp_num(String emp_num) {
		this.emp_num = emp_num;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getTelephone2() {
		return telephone2;
	}

	public void setTelephone2(String telephone2) {
		this.telephone2 = telephone2;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getJumin_number() {
		return jumin_number;
	}

	public void setJumin_number(String jumin_number) {
		this.jumin_number = jumin_number;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getJoin_date() {
		return join_date;
	}

	public void setJoin_date(String join_date) {
		this.join_date = join_date;
	}

	public String getRetire_date() {
		return retire_date;
	}

	public void setRetire_date(String retire_date) {
		this.retire_date = retire_date;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRank_position() {
		return rank_position;
	}

	public void setRank_position(String rank_position) {
		this.rank_position = rank_position;
	}

	public String getContinuous_service_date() {
		return continuous_service_date;
	}

	public void setContinuous_service_date(String continuous_service_date) {
		this.continuous_service_date = continuous_service_date;
	}

	public String getMarital_status() {
		return marital_status;
	}

	public void setMarital_status(String marital_status) {
		this.marital_status = marital_status;
	}

	public String getBank_name() {
		return bank_name;
	}

	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}

	public String getAccount_holder() {
		return account_holder;
	}

	public void setAccount_holder(String account_holder) {
		this.account_holder = account_holder;
	}

	public String getAccount_number() {
		return account_number;
	}

	public void setAccount_number(String account_number) {
		this.account_number = account_number;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getAttach_file() {
		return attach_file;
	}

	public void setAttach_file(String attach_file) {
		this.attach_file = attach_file;
	}

	public String getJoin_company_division() {
		return join_company_division;
	}

	public void setJoin_company_division(String join_company_division) {
		this.join_company_division = join_company_division;
	}

	private List<CommonsMultipartFile> files;

	public List<CommonsMultipartFile> getFiles() {

		return files;
	}

	public void setFiles(List<CommonsMultipartFile> files) {

		this.files = files;
	}

}
