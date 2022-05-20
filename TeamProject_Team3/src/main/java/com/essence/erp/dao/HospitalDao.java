package com.essence.erp.dao;

import com.essence.erp.dto.HospitalDto;

public interface HospitalDao {
	
	public HospitalDto list();

	public void modify_nofile(HospitalDto dto);
	
	public void modify(HospitalDto dto);

	public void delete(HospitalDto dto);

	public int count();

	public void insert(HospitalDto dto);
	
	public void insert_nofile(HospitalDto dto);
	
	public String logo();
}
