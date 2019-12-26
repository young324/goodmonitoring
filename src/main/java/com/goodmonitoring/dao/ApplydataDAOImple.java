package com.goodmonitoring.dao;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Qualifier;

import com.goodmonitoring.vo.ApplydataVO;

@Qualifier("applydataDAO")
public class ApplydataDAOImple implements ApplydataDAO{

	@Inject
	private SqlSession ss;

	@Override
	public void insert(ApplydataVO applydatavo) {
		// insert정의
		ss.insert("insert", applydatavo);
		
	}
	@Override
	public void insertuserjoin(ApplydataVO applydatavo) {
	
		ss.insert("insertuserjoin", applydatavo);
		
	}

	@Override
	public int getBoardApply(ApplydataVO applydatavo) {
		return ss.selectOne("getBoardApply", applydatavo);
	}

	@Override
	public int getfitcategory(int USR_NO) {
		return ss.selectOne("getfitcategory", USR_NO);
	}
	@Override
	public int applyisext(int USR_NO) {
		return ss.selectOne("applyisext", USR_NO);
	}
	@Override
	public String getlatelycname(int USR_NO) {
		return ss.selectOne("getlatelycname", USR_NO);
	}



}
