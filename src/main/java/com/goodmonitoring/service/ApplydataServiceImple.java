package com.goodmonitoring.service;

//import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.goodmonitoring.dao.ApplydataDAO;
import com.goodmonitoring.vo.ApplydataVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service("applydataService")
public class ApplydataServiceImple implements ApplydataService {
	
	@Inject
	private ApplydataDAO apply;

	@Override
	public void insert(ApplydataVO applydatavo) {
		//insert정의
		apply.insert(applydatavo);
		
	}
	
	@Override
	public void insertuserjoin(ApplydataVO applydatavo) {
		apply.insertuserjoin(applydatavo);
		
	}


	@Override
	public int getBoardApply(ApplydataVO applydatavo) {
		return apply.getBoardApply(applydatavo);
	}

	@Override
	public int getfitcategory(int USR_NO) {
		return apply.getfitcategory(USR_NO);
	}

	@Override
	public int applyisext(int USR_NO) {
		return apply.applyisext(USR_NO);
	}

	@Override
	public String getlatelycname(int USR_NO) {
		return apply.getlatelycname(USR_NO);
	}

	

	

	
}
