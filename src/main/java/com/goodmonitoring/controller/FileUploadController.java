
package com.goodmonitoring.controller;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.goodmonitoring.service.FileUploadService;
import com.goodmonitoring.vo.BoardFileVO;

@Controller
@RequestMapping(value = "/file/**")
public class FileUploadController {

	private static Logger log = LoggerFactory.getLogger(FileUploadController.class);

	private static final String JSP_URI = "file/";

	// 업로드된 파일이 저장될 위치 입니다.
	// private final String PATH = "C:/tomcat9/uploads/";

	@Autowired
	private FileUploadService fileUploadService;

	@GetMapping(value = "index.do")
	public void index(BoardFileVO boardFileVO, Model model) throws Exception {
		log.info("FileUploadController  :");
	}

	@RequestMapping(value = "upload.do", method = RequestMethod.POST)
	public String upload(BoardFileVO boardFileVO,HttpServletRequest request) throws Exception {
		String uploadPath = request.getSession().getServletContext().getRealPath("/") + "uploads" + File.separator;		
		String fileUrlPath = "uploads";	
		
		boardFileVO.setBOARD_NO(0);
		fileUploadService.fileUploadAction(boardFileVO, uploadPath, fileUrlPath);
		return "redirect:index.do";
	}

	

}
