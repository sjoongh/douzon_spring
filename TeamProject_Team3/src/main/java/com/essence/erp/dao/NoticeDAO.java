package com.essence.erp.dao;

import java.util.List;

import com.essence.erp.dto.NoticeDTO;

public interface NoticeDAO {

	public List<NoticeDTO> list();

	public void write(NoticeDTO dto);
	
	public void writeFile(NoticeDTO dto);

	public void hit(String n_id);

	public List<NoticeDTO> view(String n_id);

	public void modify(NoticeDTO dto);
	
	public void modifyFile(NoticeDTO dto);

	public void delete(String n_id);

}
