package com.goodmonitoring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.goodmonitoring.dao.IndustryCategoryDAO;
import com.goodmonitoring.vo.IndustryCategoryVO;

import lombok.extern.log4j.Log4j;

@Log4j //기존에 선언되있는 log4j 1.2.15버전을 주석처리해줌
@Service("industrycategoryService")
public class IndustyCategoryServiceImple implements IndustryCategoryService{
	@Inject
	private IndustryCategoryDAO industrycategory;

	@Override
	public List<IndustryCategoryVO> getList() {
		return industrycategory.getList();
	}

	@Override
	public int getcatecode(String INTEREST_CATEGORY) {	
		return industrycategory.getcatecode(INTEREST_CATEGORY);
	}

	@Override
	public String getcate(int INTEREST_CATEGORY_CODE) {
		return industrycategory.getcate(INTEREST_CATEGORY_CODE);
	}

	@Override
	public int ICcount() {
		return industrycategory.ICcount();
	}
	
}
