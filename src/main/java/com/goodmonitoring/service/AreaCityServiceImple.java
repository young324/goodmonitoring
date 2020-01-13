package com.goodmonitoring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.goodmonitoring.dao.AreaCityDAO;
import com.goodmonitoring.vo.AreaCityVO;

import lombok.extern.log4j.Log4j;

@Log4j //기존에 선언되있는 log4j 1.2.15버전을 주석처리해줌
@Service("AreaCityService")
public class AreaCityServiceImple implements AreaCityService {
	
	@Inject
	private AreaCityDAO city;
	
	@Override
	public List<AreaCityVO> getCity() {
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
