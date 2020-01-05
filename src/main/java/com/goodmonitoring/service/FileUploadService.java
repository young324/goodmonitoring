package com.goodmonitoring.service;

import java.util.List;
import java.util.Map;

import com.goodmonitoring.vo.BoardFileVO;

public interface FileUploadService {

	public void fileUploadAction(BoardFileVO boardFileVO, String uploadPath, String fileUrlPath) throws Exception;

	public List<BoardFileVO> fileList(Map<String, Object> map) throws Exception;

	public BoardFileVO boardGetByFileInfo(Map<String, Object> map) throws Exception;

	public int fileDelete(Map<String, Object> map) throws Exception;
	
	public String img_path(int BOARD_NO) throws Exception;

}

