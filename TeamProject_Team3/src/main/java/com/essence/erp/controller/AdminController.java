package com.essence.erp.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.essence.erp.dao.HospitalDao;
import com.essence.erp.dao.SecurityDao;
import com.essence.erp.dao.UserDao;
import com.essence.erp.dto.Criteria;
import com.essence.erp.dto.HospitalDto;
import com.essence.erp.dto.PassSearchDTO;
import com.essence.erp.dto.Role_InsertDto;
import com.essence.erp.dto.SecurityDto;
import com.essence.erp.dto.UserDto;

@Controller
public class AdminController {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired 
	   private JavaMailSender mailSender;

	@RequestMapping("/hospital_info")
	public String list(Model model) {

		HospitalDao dao = sqlSession.getMapper(HospitalDao.class);

		model.addAttribute("hospital", dao.list());
		model.addAttribute("check", dao.count());

		return "admin.hospital_info";
	}

	@RequestMapping(value = "/hospital_info_modify", method = RequestMethod.GET)
	public String modify_view(Model model) {

		HospitalDao dao = sqlSession.getMapper(HospitalDao.class);
		model.addAttribute("hospital", dao.list());

		return "admin.hospital_info_modify";
	}

	@RequestMapping(value = "/hospital_info_modify", method = RequestMethod.POST)
	public String modify(HospitalDto dto, MultipartFile file, Model model, HttpServletRequest request) {

		List<CommonsMultipartFile> files = dto.getFiles();
		List<String> fileNames = new ArrayList<String>();
		HospitalDao dao = sqlSession.getMapper(HospitalDao.class);

		if (files != null && files.size() > 0) {

			for (CommonsMultipartFile multipartFile : files) {

				String originalFile = multipartFile.getOriginalFilename();
				String fname = multipartFile.getOriginalFilename();

				String path = request.getSession().getServletContext().getRealPath("resources/upload/");
				String fullpath = path + "\\" + fname;

				if (!originalFile.equals("")) {

					try {

						FileOutputStream fs1 = new FileOutputStream(fullpath);
						fs1.write(multipartFile.getBytes());
						fs1.close();

						fileNames.add(fname);

						dto.setH_logo(fileNames.get(0));
						dao.modify(dto);
					} catch (IOException e) {
						e.printStackTrace();
					}
				} else {
					dao.modify_nofile(dto);
				}
			}
		}

		return "redirect:hospital_info";
	}

	@RequestMapping(value = "/hospital_info_delete", method = RequestMethod.GET)
	public String hospital_info_delete(HospitalDto dto, Model model) {

		HospitalDao dao = sqlSession.getMapper(HospitalDao.class);
		dao.delete(dto);

		return "redirect:hospital_info";
	}

	@RequestMapping(value = "/hospital_info_new", method = RequestMethod.GET)
	public String new_view(Model model) {

		return "admin.hospital_info_new";
	}

	@RequestMapping(value = "/hospital_info_new", method = RequestMethod.POST)
	public String new_insert(HospitalDto dto, HttpServletRequest request, MultipartFile file, Model model) {

		List<CommonsMultipartFile> files = dto.getFiles();
		List<String> fileNames = new ArrayList<String>();

		HospitalDao dao = sqlSession.getMapper(HospitalDao.class);

		if (files != null && files.size() > 0) {

			for (CommonsMultipartFile multipartFile : files) {

				String originalFile = multipartFile.getOriginalFilename();
				String fname = multipartFile.getOriginalFilename();

				String path = request.getSession().getServletContext().getRealPath("resources/upload/");
				String fullpath = path + "\\" + fname;

				if (!originalFile.equals("") && dto.getH_name() != null) {

					try {

						FileOutputStream fs1 = new FileOutputStream(fullpath);
						fs1.write(multipartFile.getBytes());
						fs1.close();

						fileNames.add(fname);

						dto.setH_logo(fileNames.get(0));
						dao.insert(dto);
					} catch (IOException e) {
						e.printStackTrace();
					}
				} else {
					dao.insert_nofile(dto);
				}
			}
		}
		return "redirect:hospital_info";
	}

	@RequestMapping(value = "/user_admin", method = RequestMethod.GET)
	public String user_admin(Model model, Criteria cri) {

		cri.setPageSize(5);
		UserDao dao = sqlSession.getMapper(UserDao.class);
		Authentication user = SecurityContextHolder.getContext().getAuthentication();

		String u_id = user.getName();

		model.addAttribute("cri", cri);
		model.addAttribute("count", dao.userListCount());
		model.addAttribute("list", dao.list2(cri));
		model.addAttribute("list2", dao.list4(u_id));

		return "admin.user_admin";
	}

	@RequestMapping(value = "/user_insert", method = RequestMethod.GET)
	public String user_admin1(Model model) {

		UserDao dao = sqlSession.getMapper(UserDao.class);
		model.addAttribute("duty", dao.dutyCall());

		return "admin.user_insert";
	}

	@RequestMapping(value = "/user_insert2", method = RequestMethod.GET)
	public String user_admin11(Model model, HttpServletRequest request, UserDto dto) {

		UserDao dao = sqlSession.getMapper(UserDao.class);

		model.addAttribute("list", dao.list3(dto));
		model.addAttribute("duty", dao.dutyCall());

		return "admin.user_insert";
	}

	@RequestMapping(value = "/user_insert", method = RequestMethod.POST)
	public String user_admin2(HttpServletRequest request, UserDto userDto) {

		UserDao dao = sqlSession.getMapper(UserDao.class);

		userDto.setU_authority("ROLE_general");
		dao.roleInsert(userDto);

		dao.insert(userDto);

		String i = userDto.getU_id();
		return "redirect:user_authority_insert?c_id=" + i;
	}

	@RequestMapping(value = "/user_delete", method = RequestMethod.GET)
	public String user_admin3(HttpServletRequest request, UserDto userDto) {

		userDto.setU_id(request.getParameter("u_id"));

		UserDao dao = sqlSession.getMapper(UserDao.class);
		SecurityDao dao1 = sqlSession.getMapper(SecurityDao.class);

		dao.delete(userDto);
		dao.deleteRole(userDto);

		int i = dao1.selectCount(userDto);

		if (i != 0) {
			dao1.deleteRoleAuthority(userDto);
		}

		return "redirect:user_admin?pageNum=1";
	}

	@RequestMapping(value = "/user_update", method = RequestMethod.GET)
	public String user_admin4(Model model, HttpServletRequest request, UserDto userDto) {

		userDto.setU_id(request.getParameter("u_id"));

		UserDao dao = sqlSession.getMapper(UserDao.class);
		model.addAttribute("user", dao.update_list(userDto));
		model.addAttribute("duty", dao.dutyCall());

		return "admin.user_update";
	}

	@RequestMapping(value = "/user_update", method = RequestMethod.POST)
	public String user_admin5(HttpServletRequest request, UserDto userDto) {

		UserDao dao = sqlSession.getMapper(UserDao.class);
		

		dao.update(userDto);

		return "redirect:user_admin?pageNum=1";
	}

	@RequestMapping(value = "/user_search", method = RequestMethod.GET)
	public String home5(Locale locale, Model model, UserDto dto, Criteria cri) {

		UserDao dao = sqlSession.getMapper(UserDao.class);
		model.addAttribute("list", dao.user_search());
		return "user_search";
	}

	@RequestMapping(value = "/user_search", method = RequestMethod.POST)
	public String home6(Locale locale, Model model, UserDto dto, Criteria cri, @RequestParam("u_name") String u_name) {

		UserDao dao = sqlSession.getMapper(UserDao.class);
		model.addAttribute("list", dao.user_search_detail(u_name));
		return "user_search";
	}

	@RequestMapping(value = "/user_authority_insert", method = RequestMethod.GET)
	public String home66(Locale locale, Model model, HttpServletRequest request, @RequestParam("c_id") String c_id) {
		model.addAttribute("c_id", c_id);
		return "admin.user_authority_insert";
	}

	@RequestMapping(value = "/user_authority_insert", method = RequestMethod.POST)
	public String role(Locale locale, Model model, Role_InsertDto dto, HttpServletRequest request) {

		SecurityDao dao = sqlSession.getMapper(SecurityDao.class);
		UserDto userDto = new UserDto();
		userDto.setU_id(dto.getC_id());
		dao.deleteRoleAuthority(userDto);

		String[] insert = dto.getPatient_page0().split(",");
		dto.setC_reference(insert[0]);
		dto.setC_authority_name(insert[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert1 = dto.getPatient_page1().split(",");
		dto.setC_reference(insert1[0]);
		dto.setC_authority_name(insert1[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert2 = dto.getPatient_page2().split(",");
		dto.setC_reference(insert2[0]);
		dto.setC_authority_name(insert2[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert3 = dto.getHuman_resources_page0().split(",");
		dto.setC_reference(insert3[0]);
		dto.setC_authority_name(insert3[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert4 = dto.getHuman_resources_page1().split(",");
		dto.setC_reference(insert4[0]);
		dto.setC_authority_name(insert4[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert5 = dto.getHuman_resources_page2().split(",");
		dto.setC_reference(insert5[0]);
		dto.setC_authority_name(insert5[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert6 = dto.getHuman_resources_page3().split(",");
		dto.setC_reference(insert6[0]);
		dto.setC_authority_name(insert6[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert7 = dto.getInventory_page0().split(",");
		dto.setC_reference(insert7[0]);
		dto.setC_authority_name(insert7[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert8 = dto.getInventory_page1().split(",");
		dto.setC_reference(insert8[0]);
		dto.setC_authority_name(insert8[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert9 = dto.getInventory_page2().split(",");
		dto.setC_reference(insert9[0]);
		dto.setC_authority_name(insert9[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert21 = dto.getInventory_page3().split(",");
		dto.setC_reference(insert21[0]);
		dto.setC_authority_name(insert21[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert10 = dto.getAccounting_page0().split(",");
		dto.setC_reference(insert10[0]);
		dto.setC_authority_name(insert10[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert22 = dto.getAccounting_page1().split(",");
		dto.setC_reference(insert22[0]);
		dto.setC_authority_name(insert22[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert23 = dto.getAccounting_page2().split(",");
		dto.setC_reference(insert23[0]);
		dto.setC_authority_name(insert23[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);

		String[] insert11 = dto.getAdmin_page0().split(",");
		dto.setC_reference(insert11[0]);
		dto.setC_authority_name(insert11[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);

		String[] insert12 = dto.getAdmin_page1().split(",");
		dto.setC_reference(insert12[0]);
		dto.setC_authority_name(insert12[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert13 = dto.getAdmin_page2().split(",");
		dto.setC_reference(insert13[0]);
		dto.setC_authority_name(insert13[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert14 = dto.getReservation_page0().split(",");
		dto.setC_reference(insert14[0]);
		dto.setC_authority_name(insert14[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert15 = dto.getReservation_page1().split(",");
		dto.setC_reference(insert15[0]);
		dto.setC_authority_name(insert15[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert16 = dto.getReservation_page2().split(",");
		dto.setC_reference(insert16[0]);
		dto.setC_authority_name(insert16[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert17 = dto.getBoard_page0().split(",");
		dto.setC_reference(insert17[0]);
		dto.setC_authority_name(insert17[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert18 = dto.getBoard_page1().split(",");
		dto.setC_reference(insert18[0]);
		dto.setC_authority_name(insert18[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert19 = dto.getBoard_page2().split(",");
		dto.setC_reference(insert19[0]);
		dto.setC_authority_name(insert19[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert20 = dto.getBoard_page3().split(",");
		dto.setC_reference(insert20[0]);
		dto.setC_authority_name(insert20[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert24 = dto.getReservation_page3().split(",");
		dto.setC_reference(insert24[0]);
		dto.setC_authority_name(insert24[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert25 = dto.getPatient_page3().split(",");
		dto.setC_reference(insert25[0]);
		dto.setC_authority_name(insert25[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
/*		String[] insert26 = dto.getHuman_resources_page4().split(",");
		dto.setC_reference(insert26[0]);
		dto.setC_authority_name(insert26[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);*/

		return "redirect:user_admin?pageNum=1";
	}

	@RequestMapping(value = "/user_authority_modify", method = RequestMethod.GET)
	public String user_authority_modify(Locale locale, Model model, HttpServletRequest request,
			@RequestParam("c_id") String c_id, SecurityDto dto) {
		SecurityDao dao = sqlSession.getMapper(SecurityDao.class);
		model.addAttribute("c_id", c_id);
		model.addAttribute("authority", dao.authority()); 
		/*model.addAttribute("authority2", dao.authority2()); 
		model.addAttribute("authority3", dao.authority3()); */
		
		String a = "accounting_page";
		model.addAttribute(a, dao.authority_check(a, c_id));
		for (int i = 1; i < 3; i++) {
			model.addAttribute(a + "_" + i, dao.authority_check((a + i), c_id));
		}
		String b = "admin_page";
		model.addAttribute(b, dao.authority_check(b, c_id));
		for (int i = 1; i < 3; i++) {
			model.addAttribute(b + "_" + i, dao.authority_check((b + i), c_id));
		}
		String c = "board_page";
		model.addAttribute(c, dao.authority_check(c, c_id));
		for (int i = 1; i < 4; i++) {
			model.addAttribute(c + "_" + i, dao.authority_check((c + i), c_id));
		}
		String d = "human_resources_page";
		model.addAttribute(d, dao.authority_check(d, c_id));
		for (int i = 1; i < 4; i++) {
			model.addAttribute(d + "_" + i, dao.authority_check((d + i), c_id));
		}
		String e = "inventory_page";
		model.addAttribute(e, dao.authority_check(e, c_id));
		for (int i = 1; i < 4; i++) {
			model.addAttribute(e + "_" + i, dao.authority_check((e + i), c_id));
		}
		String f = "patient_page";
		model.addAttribute(f, dao.authority_check(f, c_id));
		for (int i = 1; i < 4; i++) {
			model.addAttribute(f + "_" + i, dao.authority_check((f + i), c_id));
		}
		String g = "reservation_page";
		model.addAttribute(g, dao.authority_check(g, c_id));
		for (int i = 1; i < 4; i++) {
			model.addAttribute(g + "_" + i, dao.authority_check((g + i), c_id));
		}
		System.out.println("end");
		
		
		return "admin.user_authority_modify";
	}

	@RequestMapping(value = "/user_authority_modify", method = RequestMethod.POST)
	public String user_authority_modify2(Locale locale, Model model, Role_InsertDto dto, HttpServletRequest request) {

		SecurityDao dao = sqlSession.getMapper(SecurityDao.class);
		UserDto userDto = new UserDto();
		userDto.setU_id(dto.getC_id());
		dao.deleteRoleAuthority(userDto);

		String[] insert = dto.getPatient_page0().split(",");
		dto.setC_reference(insert[0]);
		dto.setC_authority_name(insert[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert1 = dto.getPatient_page1().split(",");
		dto.setC_reference(insert1[0]);
		dto.setC_authority_name(insert1[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert2 = dto.getPatient_page2().split(",");
		dto.setC_reference(insert2[0]);
		dto.setC_authority_name(insert2[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert3 = dto.getHuman_resources_page0().split(",");
		dto.setC_reference(insert3[0]);
		dto.setC_authority_name(insert3[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert4 = dto.getHuman_resources_page1().split(",");
		dto.setC_reference(insert4[0]);
		dto.setC_authority_name(insert4[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert5 = dto.getHuman_resources_page2().split(",");
		dto.setC_reference(insert5[0]);
		dto.setC_authority_name(insert5[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert6 = dto.getHuman_resources_page3().split(",");
		dto.setC_reference(insert6[0]);
		dto.setC_authority_name(insert6[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert7 = dto.getInventory_page0().split(",");
		dto.setC_reference(insert7[0]);
		dto.setC_authority_name(insert7[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert8 = dto.getInventory_page1().split(",");
		dto.setC_reference(insert8[0]);
		dto.setC_authority_name(insert8[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert9 = dto.getInventory_page2().split(",");
		dto.setC_reference(insert9[0]);
		dto.setC_authority_name(insert9[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert21 = dto.getInventory_page3().split(",");
		dto.setC_reference(insert21[0]);
		dto.setC_authority_name(insert21[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert10 = dto.getAccounting_page0().split(",");
		dto.setC_reference(insert10[0]);
		dto.setC_authority_name(insert10[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert22 = dto.getAccounting_page1().split(",");
		dto.setC_reference(insert22[0]);
		dto.setC_authority_name(insert22[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert23 = dto.getAccounting_page2().split(",");
		dto.setC_reference(insert23[0]);
		dto.setC_authority_name(insert23[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);

		String[] insert11 = dto.getAdmin_page0().split(",");
		dto.setC_reference(insert11[0]);
		dto.setC_authority_name(insert11[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);

		String[] insert12 = dto.getAdmin_page1().split(",");
		dto.setC_reference(insert12[0]);
		dto.setC_authority_name(insert12[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert13 = dto.getAdmin_page2().split(",");
		dto.setC_reference(insert13[0]);
		dto.setC_authority_name(insert13[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert14 = dto.getReservation_page0().split(",");
		dto.setC_reference(insert14[0]);
		dto.setC_authority_name(insert14[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert15 = dto.getReservation_page1().split(",");
		dto.setC_reference(insert15[0]);
		dto.setC_authority_name(insert15[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert16 = dto.getReservation_page2().split(",");
		dto.setC_reference(insert16[0]);
		dto.setC_authority_name(insert16[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert17 = dto.getBoard_page0().split(",");
		dto.setC_reference(insert17[0]);
		dto.setC_authority_name(insert17[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert18 = dto.getBoard_page1().split(",");
		dto.setC_reference(insert18[0]);
		dto.setC_authority_name(insert18[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert19 = dto.getBoard_page2().split(",");
		dto.setC_reference(insert19[0]);
		dto.setC_authority_name(insert19[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert20 = dto.getBoard_page3().split(",");
		dto.setC_reference(insert20[0]);
		dto.setC_authority_name(insert20[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert24 = dto.getReservation_page3().split(",");
		dto.setC_reference(insert24[0]);
		dto.setC_authority_name(insert24[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		String[] insert25 = dto.getPatient_page3().split(",");
		dto.setC_reference(insert25[0]);
		dto.setC_authority_name(insert25[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);
		/*String[] insert26 = dto.getHuman_resources_page4().split(",");
		dto.setC_reference(insert26[0]);
		dto.setC_authority_name(insert26[1]);
		dto.setC_authority("ROLE_" + dto.getC_reference() + "_" + dto.getC_authority_name());
		dao.role_insert(dto);*/
		

		return "redirect:user_admin?pageNum=1";
	}
	@RequestMapping(value = "/pass_search", method = RequestMethod.GET)
	public String pass_search() {
		return "pass_search";
	}
	
	@RequestMapping(value = "/pass_search", method = RequestMethod.POST)
	public String pass_search_mail(Model model, HttpServletRequest request,PassSearchDTO ps_dto) {
		String u_id = ps_dto.getU_id();
		String u_name = ps_dto.getU_name();	
		String u_email = ps_dto.getU_email();
		
		UserDao dao = sqlSession.getMapper(UserDao.class);
		
		if(dao.pass_search(ps_dto) == 1){
			model.addAttribute("u_id", u_id);
			model.addAttribute("u_name", u_name);
			model.addAttribute("u_email", u_email);
			
			int[] temp = new int[8];
	         String num = "";
	   
	         for (int i = 0; i < temp.length; i++) {
	            temp[i] = (int) (Math.random() * 10);
	            num += temp[i];
	         }
			
			try {
			      SimpleMailMessage message = new SimpleMailMessage();
			      
			      
			      message.setTo(u_email);
			      message.setText("ESSENCE SOLUTION"
			      				+ "인증번호 : "+num);
			      message.setFrom("essence1093@gmail.com");
			      message.setSubject("ESSENCE 입니다.");   // 메일제목은 생략이 가능하다
			      
			      mailSender.send(message);
			   } catch(Exception e){
			      System.out.println(e);
			   }
			model.addAttribute("num", num);
			
			return "pass_searchmail";
		}
		return "pass_search";
	}
	
	
	
	@RequestMapping(value = "/pass_searchmail", method = RequestMethod.POST)
	public String pass_search_mail(HttpServletRequest request, Model model, PassSearchDTO ps_dto) {
		String u_id = request.getParameter("u_id");
		String u_name = request.getParameter("u_name");
		String u_email = request.getParameter("u_email");
		int num = Integer.parseInt(request.getParameter("num"));
		
		model.addAttribute("u_id", u_id);
		model.addAttribute("u_name", u_name);
		model.addAttribute("u_email", u_email);
		model.addAttribute("num", num);
		
		return "pass_searchmail";
	}
	
	@RequestMapping(value = "/pass_searchcheck", method = RequestMethod.POST)
	public String pass_search_check(HttpServletRequest request, Model model, PassSearchDTO ps_dto) {
		int num = Integer.parseInt(request.getParameter("num"));
		int innum = Integer.parseInt(request.getParameter("innum"));
		String u_name = request.getParameter("u_name");
		
		System.out.println(num+"////"+innum+"////"+u_name);
		
		model.addAttribute("u_name", u_name);
		
		return "pass_searchcheck";
	}
	
	@RequestMapping(value = "/pass_searchupdate", method = RequestMethod.POST)
	public String pass_search_update(HttpServletRequest request, Model model, PassSearchDTO ps_dto) {
		UserDao dao = sqlSession.getMapper(UserDao.class);
		String u_pwd = request.getParameter("u_pwd");
		String u_name = request.getParameter("u_name");
		System.out.println(u_pwd+"///"+u_name);
		dao.pass_update(u_pwd,u_name);
		
		return "redirect:login";
	}
	
	
	
	
}
