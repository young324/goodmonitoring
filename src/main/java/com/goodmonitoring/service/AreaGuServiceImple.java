package com.goodmonitoring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.goodmonitoring.dao.AreaGuDAO;
import com.goodmonitoring.vo.AreaGuVO;

import lombok.extern.log4j.Log4j;

@Log4j //기존에 선언되있는 log4j 1.2.15버전을 주석처리해줌
@Service("AreaGuService")
public class AreaGuServiceImple implements AreaGuService {
	
	@Inject
	private AreaGuDAO gu;
	
	@Override
	public List<AreaGuVO> getGu() {
		// TODO Auto-generated method stub
		return gu.getGu();
	}


}
