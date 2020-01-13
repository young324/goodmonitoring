package com.goodmonitoring.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.goodmonitoring.vo.AreaCityVO;

//@Repository("area_cityDAO")
public class AreaCityDAOImple implements AreaCityDAO {
	
	@Inject
	private SqlSession ss;
	
	@Override
	public List<AreaCityVO> getCity(){
		return ss.selectList("getCity");
		
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
