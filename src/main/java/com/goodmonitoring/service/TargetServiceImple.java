package com.goodmonitoring.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.goodmonitoring.dao.TargetDAO;
import com.goodmonitoring.vo.TargetVO;

import lombok.extern.log4j.Log4j;

@Log4j //기존에 선언되있는 log4j 1.2.15버전을 주석처리해줌
@Service("targetService")
public class TargetServiceImple implements TargetService{
	@Inject
	private TargetDAO target;

	@Override
	public List<TargetVO> getList() {
		return target.getList();
	}

	@Override
	public List<String> getListString() {
		return target.getListString();
	}

	@Override
	public int TGcount() {
		return target.TGcount();
	}
	
	
	
	
}
