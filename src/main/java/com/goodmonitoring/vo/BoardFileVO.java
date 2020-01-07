package com.goodmonitoring.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardFileVO {

	private int BOARD_NO; 
	private int FILE_NO; 
	private String FILE_NAME; 
	private String FILE_PATH; 
	private Date FILE_DATE; 
	private MultipartFile[] files;
	
	private String URL;
}
