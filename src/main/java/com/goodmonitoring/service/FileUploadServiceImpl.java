package com.goodmonitoring.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.goodmonitoring.dao.FileUploadDao;
import com.goodmonitoring.util.FileUploader;
import com.goodmonitoring.util.Util;
import com.goodmonitoring.vo.BoardFileVO;

@Service
public class FileUploadServiceImpl implements FileUploadService {

	
	private static Logger logger =LoggerFactory.getLogger(FileUploadServiceImpl.class);
	
	
	@Autowired
	private FileUploadDao fileUploadDao;
	
	
	@Override
	public void fileUploadAction( BoardFileVO boardFileVO, String uploadPath, String fileUrlPath) throws Exception{

		MultipartFile[] attachFileList = boardFileVO.getFiles();

		if (attachFileList != null) {
			logger.info(" 파일 업로드 정보: attachFileList not null " +  attachFileList.length);
			for (MultipartFile attachFile : attachFileList) {
				
				if (attachFile.getOriginalFilename() == null || StringUtils.isEmpty(attachFile.getOriginalFilename())) 	break;

				String realName = FileUploader.uploadFile(uploadPath, attachFile);				
				
				if (realName == null || realName.equals("not")) {
					Util.deleteFolder(new File(uploadPath));
					throw new Exception();
				}
							
				boardFileVO.setFILE_NAME(attachFile.getOriginalFilename());
				boardFileVO.setFILE_PATH(fileUrlPath + "/" + realName);
				
				fileUploadDao.fileUploadAction(boardFileVO);					
			}

		}

	}


	@Override
	public List<BoardFileVO> fileList(Map<String, Object> map) throws Exception {
		return fileUploadDao.fileList(map);		
	}


	@Override
	public BoardFileVO boardGetByFileInfo(Map<String, Object> map) throws Exception {
		return fileUploadDao.boardGetByFileInfo(map);	
	}


	@Override
	public int fileDelete(Map<String, Object> map) throws Exception {
		return fileUploadDao.fileDelete(map);	
	}


	@Override
	public String img_path(int BOARD_NO) throws Exception {
		return fileUploadDao.img_path(BOARD_NO);
	}





}
