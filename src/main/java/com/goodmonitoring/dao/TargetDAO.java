package com.goodmonitoring.dao;

import java.util.List;

import com.goodmonitoring.vo.TargetVO;

public interface TargetDAO {
	
	//전체 목록 불러오기
	public List<TargetVO> getList();
	
}
