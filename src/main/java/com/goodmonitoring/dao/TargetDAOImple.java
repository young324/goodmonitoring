package com.goodmonitoring.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.goodmonitoring.vo.TargetVO;

public class TargetDAOImple implements TargetDAO{

	@Inject
	private SqlSession ss;
	
	@Override
	public List<TargetVO> getList() {
		return ss.selectList("getList");
	}
}
