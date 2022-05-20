package com.essence.erp.dao;

import java.util.List;

import com.essence.erp.dto.BizReportDTO;

public interface BizReportDAO {
	
	public List<BizReportDTO> list();

	public void write(BizReportDTO dto);
	
	public void writeFile(BizReportDTO dto);

	public void hit(String b_id);

	public List<BizReportDTO> view(String b_id);

	public void modify(BizReportDTO dto);
	
	public void modifyFile(BizReportDTO dto);

	public void delete(String b_id);
	
	public void reply(BizReportDTO dto);
	
	public void replyUp(BizReportDTO dto);

}
