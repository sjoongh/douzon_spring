package com.essence.erp.dao;

import java.util.List;

import com.essence.erp.dto.MinutesDTO;

public interface MinutesDAO {
	
	public List<MinutesDTO> list();

	public void write(MinutesDTO dto);
	
	public void writeFile(MinutesDTO dto);

	public void hit(String n_id);

	public List<MinutesDTO> view(String n_id);

	public void modify(MinutesDTO dto);
	
	public void modifyFile(MinutesDTO dto);

	public void delete(String n_id);

}
