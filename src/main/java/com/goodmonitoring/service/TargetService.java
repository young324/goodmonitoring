package com.goodmonitoring.service;

import java.util.List;

import com.goodmonitoring.vo.TargetVO;

public interface TargetService {
	//게시판 목록
		public List<TargetVO> getList();
}
