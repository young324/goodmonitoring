
package com.goodmonitoring.dao;

import java.util.List;
import java.util.Map;

import com.goodmonitoring.vo.BoardFileVO;


public interface FileUploadDao {

	public Integer fileUploadAction(BoardFileVO boardFileVO) throws Exception;
	
	public List<BoardFileVO> fileList(Map<String, Object> map) throws Exception;

	public BoardFileVO boardGetByFileInfo(Map<String, Object> map) throws Exception;

	public int fileDelete(Map<String, Object> map) throws Exception;
	
	public String img_path(int BOARD_NO) throws Exception;
}

