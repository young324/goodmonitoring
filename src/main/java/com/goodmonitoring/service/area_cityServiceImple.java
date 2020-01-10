package com.goodmonitoring.service;

import java.util.List;

import javax.inject.Inject;

import com.goodmonitoring.dao.area_cityDAO;
import com.goodmonitoring.vo.area_cityVO;

public class area_cityServiceImple implements area_cityService {
	@Inject
	private area_cityDAO city;
	
	@Override
	public List<area_cityVO> getCity() {
		// TODO Auto-generated method stub
		return city.getCity();
	}

	@Override
	public int getCitycode(String CITY_NAME) {
		// TODO Auto-generated method stub
		return city.getCitycode(CITY_NAME);
	}

	@Override
	public String getCityname(int CITY_CODE) {
		// TODO Auto-generated method stub
		return city.getCityname(CITY_CODE);
	}

}
