package com.goodmonitoring.dao;

import java.util.ArrayList;
import java.util.List;

import com.goodmonitoring.vo.TargetVO;

public interface TargetDAO {
	
	//전체 목록 불러오기
	public List<TargetVO> getList();
	
	public List<String> getListString();
	
	//전체 대상 개수
	public int TGcount();
	
}
