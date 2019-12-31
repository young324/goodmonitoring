package com.goodmonitoring.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.goodmonitoring.vo.IndustryCategoryVO;

public class IndustryCategoryDAOImple implements IndustryCategoryDAO{

	@Inject
	private SqlSession ss;
	
	@Override
	public List<IndustryCategoryVO> getList() {
		return ss.selectList("getList");
	}

	@Override
	public int getcatecode(String INTEREST_CATEGORY) {
		return ss.selectOne(INTEREST_CATEGORY);
	}

	@Override
	public String getcate(int INTEREST_CATEGORY_CODE) {

		return ss.selectOne("getcate",INTEREST_CATEGORY_CODE);
	}

	@Override
	public int ICcount() {
		return ss.selectOne("ICcount");
	}
}
