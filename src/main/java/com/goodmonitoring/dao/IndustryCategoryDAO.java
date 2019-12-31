package com.goodmonitoring.dao;

import java.util.List;

import com.goodmonitoring.vo.IndustryCategoryVO;

public interface IndustryCategoryDAO {

	//전체 목록 불러오기
	public List<IndustryCategoryVO> getList();
	
	//특정 업종의 코드값 얻기
	public int getcatecode(String INTEREST_CATEGORY);
	
	//코드로 업종명 얻기
	public String getcate(int INTEREST_CATEGORY_CODE);
	
	//전체 업종 개수
	public int ICcount();
}
