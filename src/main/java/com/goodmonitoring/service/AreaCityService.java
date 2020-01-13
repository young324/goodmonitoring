package com.goodmonitoring.service;

import java.util.List;



import com.goodmonitoring.vo.AreaCityVO;


public interface AreaCityService {

	public List<AreaCityVO> getCity();
	
	public int getCitycode(String CITY_NAME);
	
	public String getCityname(int CITY_CODE);
}
