package com.goodmonitoring.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;

import com.goodmonitoring.util.DownloadView;
import com.goodmonitoring.util.ExceptionController;

@Controller
public class DownloadController extends ExceptionController {

	//@Value("#{config['config.resPath']}")
	private String RES_PATH;
	
	//@Value("#{config['config.rootPath']}")
	private String ROOT_PATH;
	
	
	
	@Autowired
	private WebApplicationContext context;
	
	
	private static final Logger logger = LoggerFactory.getLogger(DownloadController.class);
	
	/**
	 * file 폴더 하위 탬플릿 파일 다운로드
	 * @param fileName
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/downloadTmpl")
	public String downloadFile(@RequestParam("file_name") String fileName, Model model) throws Exception {
		File file = new File(context.getServletContext().getRealPath("resources/file/" + fileName));
		model.addAttribute("downloadFile", file);
		return "downloadView";
	}

	@RequestMapping(value = "/file/download", method = RequestMethod.GET)
	public String fileDownload(@RequestParam("file_name") String fileName
			, @RequestParam("file_path") String filePath , Model model) throws Exception {
		
		if (filePath != null && !filePath.equals("")) {
			String path = ROOT_PATH + filePath;
			if (fileName == null || fileName.equals("")) {
				path = ROOT_PATH + filePath;
			}
			
			File file = new File(path);
			model.addAttribute("downloadFile", file);
			model.addAttribute("orignalName", fileName);
		}
		
		return "downloadView";

	}
	
	
	@RequestMapping(value = "/displayFile", method = RequestMethod.GET)
	public DownloadView fileDownload(@RequestParam("fileName") String fileName, @RequestParam("orignalName") String orignalName
			,DownloadView downloadView, HttpServletRequest request, Model model) throws Exception {	   

		String path = request.getSession().getServletContext().getRealPath("/")+fileName.replace('/', File.separatorChar);
		File file = new File(path);
		
		if(!file.exists()) return null;
		model.addAttribute("downloadFile", file);
		model.addAttribute("orignalName", orignalName);		
		return downloadView;
	}
	
	
	
		
}