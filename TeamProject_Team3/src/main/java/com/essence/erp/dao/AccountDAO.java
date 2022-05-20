package com.essence.erp.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.essence.erp.dto.AccountDTO;
import com.essence.erp.dto.AcctypeDTO;
import com.essence.erp.dto.Criteria;
import com.essence.erp.dto.PaymentDTO;

public interface AccountDAO {

	public ArrayList<AccountDTO> list();

	public List<AccountDTO> list2(@Param("date1") String date1, @Param("date2") String date2, @Param("ac_typename") String ac_typename);
	
	public List<AccountDTO> list3(@Param("date1") String date1, @Param("date2") String date2, @Param("ac_typename") String ac_typename);
	
	public void write(AccountDTO dto);
	
	public List<AcctypeDTO> type_code();

	public AccountDTO modifyForm(AccountDTO dto);

	public void modify(AccountDTO dto);

	public void delete(AccountDTO dto);
	
	public String ac_seq(AccountDTO dto);
	
	public List<PaymentDTO> payList();
	
	public void payDel(PaymentDTO dto);
	
	public String currDate();

	public List<AcctypeDTO> acctypeList(Criteria cri);

	public List<AcctypeDTO> acctypeModifyList(AcctypeDTO dto);
	
	public void acctypeAdd(AcctypeDTO dto);
	
	public void acctypeModify(AcctypeDTO Dto);

	public void acctypeDelete(AcctypeDTO dto);

	public int acctypeListCount();

}
