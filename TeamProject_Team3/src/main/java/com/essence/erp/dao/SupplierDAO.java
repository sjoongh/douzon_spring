package com.essence.erp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.essence.erp.dto.InvoiceDTO;
import com.essence.erp.dto.SupplierDTO;

public interface SupplierDAO {

	public List<SupplierDTO> supplierList();

	public void supplierAdd(SupplierDTO dto);
	
	public void supplierDelete(String su_taxid);
	
	public List<SupplierDTO> supplierView(SupplierDTO dto);
	
	public void supplierModify(SupplierDTO dto);
	
	public List<InvoiceDTO> supplierSearch(@Param("su_name") String su_name);

}
