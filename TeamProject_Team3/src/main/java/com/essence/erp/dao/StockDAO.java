package com.essence.erp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.essence.erp.dto.InvoiceDTO;
import com.essence.erp.dto.StockDTO;

public interface StockDAO {

	public List<StockDTO> stockList();
	
	public List<InvoiceDTO> invoiceList();

	public int check(InvoiceDTO dto);
	
	public void invoiceAdd(InvoiceDTO dto);
	
	public void qtyAdd(InvoiceDTO dto);
	
	public void stockAdd(InvoiceDTO dto);
	
	public void stockSub(InvoiceDTO dto);
	
	public void invoiceDelete(InvoiceDTO dto);
	
	public List<InvoiceDTO> invoiceView(InvoiceDTO dto);
	
	public int stockQty(InvoiceDTO dto);
	
	public void stockModify(InvoiceDTO dto);
	
	public void invoiceModify(InvoiceDTO dto);
	
	public List<InvoiceDTO> 
		invoiceSearch(@Param("st_vendor") String st_vendor, @Param("start") String start, @Param("end") String end);
	
	public List<StockDTO> stockView(String st_code);
	
	public void stockModi(StockDTO dto);
	
	public void stockDelete(String st_code);
	
	public int st_code_check(String st_code);
	
	public int su_taxid_check(String su_taxid);

}
