package com.goodmonitoring.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.goodmonitoring.vo.AreaGuVO;


public class AreaGuDAOImple implements AreaGuDAO {
	
	@Inject
	private SqlSession ss;
	
	@Override
	public List<AreaGuVO> getGu(){
		return ss.selectList("getGu");
		
	}

}
