package com.essence.erp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class FileDownload {

	@ResponseBody
	@RequestMapping("/downloadFile")
	public ResponseEntity<byte[]> displayFile(String fileName, HttpServletRequest request) throws Exception {

		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		try {

			HttpHeaders headers = new HttpHeaders();
			String path = request.getSession().getServletContext().getRealPath("resources/upload/");

			in = new FileInputStream(path + "\\" + fileName);

			fileName = fileName.substring(fileName.indexOf("_") + 1);
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			headers.add("Content-Disposition",
					"attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		return entity;
	}

	@ResponseBody
	@RequestMapping(value = "/deleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName, HttpServletRequest request) {

		String path = request.getSession().getServletContext().getRealPath("resources/upload/");

		String front = fileName.substring(0, 12);
		String end = fileName.substring(14);
		new File(path + "\\" + (front + end).replace('/', File.separatorChar)).delete();
		System.out.println("2");
		new File(path + "\\" + fileName.replace('/', File.separatorChar)).delete();
		System.out.println("3");
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}

	@ResponseBody
	@RequestMapping(value = "/deleteAllFiles", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(@RequestParam("files[]") String[] files, HttpServletRequest request) {

		if (files == null || files.length == 0) {
			return new ResponseEntity<String>("deleted", HttpStatus.OK);
		}

		String path = request.getSession().getServletContext().getRealPath("resources/upload/");

		for (String fileName : files) {

			String front = fileName.substring(0, 12);
			String end = fileName.substring(14);
			new File(path + "\\" + (front + end).replace('/', File.separatorChar)).delete();

			new File(path + "\\" + fileName.replace('/', File.separatorChar)).delete();

		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
}
