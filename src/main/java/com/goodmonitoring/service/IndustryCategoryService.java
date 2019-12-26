package com.goodmonitoring.service;

import java.util.List;

import com.goodmonitoring.vo.IndustryCategoryVO;

public interface IndustryCategoryService {
	//게시판 목록
		public List<IndustryCategoryVO> getList();
		
		//특정 업종의 코드값 얻기
		public int getcatecode(String INTEREST_CATEGORY);

		//코드로 업종명 얻기
		public String getcate(int INTEREST_CATEGORY_CODE);
}
