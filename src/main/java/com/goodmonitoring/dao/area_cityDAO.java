package com.goodmonitoring.dao;

import java.util.List;

import com.goodmonitoring.vo.area_cityVO;

public interface area_cityDAO {
	
	public List<area_cityVO> getCity();
	
	public int getCitycode(String CITY_NAME);
	
	public String getCityname(int CITY_CODE);

}
