package com.goodmonitoring.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.goodmonitoring.vo.area_cityVO;

public class area_cityDAOImple implements area_cityDAO {
	
	@Inject
	private SqlSession ss;
	
	@Override
	public List<area_cityVO> getCity(){
		return ss.selectList("getList");
		
	}

	@Override
	public int getCitycode(String CITY_NAME) {
		// TODO Auto-generated method stub
		return ss.selectOne(CITY_NAME);
	}

	@Override
	public String getCityname(int CITY_CODE) {
		// TODO Auto-generated method stub
		return ss.selectOne("getCityname",CITY_CODE);
	}

}
