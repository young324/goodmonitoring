package com.goodmonitoring.service;

import org.apache.ibatis.annotations.Param;

import com.goodmonitoring.vo.CompanyVO;

public interface CompanyService {
	//����
	public void insert(CompanyVO companyVO) throws Exception;
	
	// 로그인
	public CompanyVO loginCompany(@Param("C_ID") String C_ID, @Param("C_PASS") String C_PASS, int GRADE);

	public int id_check(@Param("C_ID") String C_ID);
}
