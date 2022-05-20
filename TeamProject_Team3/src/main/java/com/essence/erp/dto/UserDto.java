package com.essence.erp.dto;

public class UserDto {
	
	private String u_id, u_pwd, u_authority, u_name, u_phone, u_team;
	private String u_joindate, u_modifydate;
	private String role_check;
	private String r_id, r_authority;
	private String u_position;
	private String u_email;
	
	


	
	
	
	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public String getRole_check() {
		return role_check;
	}

	public void setRole_check(String role_check) {
		this.role_check = role_check;
	}

	public String getU_position() {
		return u_position;
	}

	public void setU_position(String u_position) {
		this.u_position = u_position;
	}

	public String getR_id() {
		return r_id;
	}

	public void setR_id(String r_id) {
		this.r_id = r_id;
	}

	public String getR_authority() {
		return r_authority;
	}

	public void setR_authority(String r_authority) {
		this.r_authority = r_authority;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_pwd() {
		return u_pwd;
	}

	public void setU_pwd(String u_pwd) {
		this.u_pwd = u_pwd;
	}

	public String getU_authority() {
		return u_authority;
	}

	public void setU_authority(String u_authority) {
		this.u_authority = u_authority;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_phone() {
		return u_phone;
	}

	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}

	public String getU_team() {
		return u_team;
	}

	public void setU_team(String u_team) {
		this.u_team = u_team;
	}

	public String getU_joindate() {
		return u_joindate;
	}

	public void setU_joindate(String u_joindate) {
		this.u_joindate = u_joindate;
	}

	public String getU_modifydate() {
		return u_modifydate;
	}

	public void setU_modifydate(String u_modifydate) {
		this.u_modifydate = u_modifydate;
	}

	public UserDto(String u_id, String u_pwd, String u_authority, String u_name, String u_phone, String u_team,
			String u_joindate, String u_modifydate) {
		super();
		this.u_id = u_id;
		this.u_pwd = u_pwd;
		this.u_authority = u_authority;
		this.u_name = u_name;
		this.u_phone = u_phone;
		this.u_team = u_team;
		this.u_joindate = u_joindate;
		this.u_modifydate = u_modifydate;
	}

	public UserDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "UserDto [u_id=" + u_id + ", u_pwd=" + u_pwd + ", u_authority=" + u_authority + ", u_name=" + u_name
				+ ", u_phone=" + u_phone + ", u_team=" + u_team + ", u_joindate=" + u_joindate + ", u_modifydate="
				+ u_modifydate + "]";
	}

}
