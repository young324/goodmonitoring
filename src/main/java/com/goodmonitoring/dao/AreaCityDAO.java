package com.goodmonitoring.dao;

import java.util.List;


import com.goodmonitoring.vo.AreaCityVO;


public interface AreaCityDAO {
	
	public List<AreaCityVO> getCity();
	
	public int getCitycode(String CITY_NAME);
	
	public String getCityname(int CITY_CODE);

}
