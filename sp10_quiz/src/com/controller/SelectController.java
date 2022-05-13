package com.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.DeptDAO;

@Controller
public class SelectController {
	
	private DeptDAO deptDAO;
	
	public void setDeptDAO(DeptDAO deptDAO) {
		this.deptDAO = deptDAO;
	}
	
	@RequestMapping("/list.do")
	public String list(Model model) {
		
		List list = deptDAO.listDept();
	}
}
