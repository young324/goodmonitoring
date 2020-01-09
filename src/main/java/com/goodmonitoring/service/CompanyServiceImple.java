package com.goodmonitoring.service;

//import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.goodmonitoring.dao.CompanyDAO;
import com.goodmonitoring.vo.CompanyVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service("companyService")
public class CompanyServiceImple implements CompanyService {

	//@Resource(name="companyDAO")
	//private CompanyDAO companyDAO;

	@Inject
	private CompanyDAO companyDAO;
	 
	@Override
	public void insert(CompanyVO companyVO) throws Exception{
		// TODO Auto-generated method stub
		companyDAO.insert(companyVO);
	}

	@Override
	public CompanyVO loginCompany(@Param("C_ID") String C_ID, @Param("C_PASS") String C_PASS, int GRADE) {
		return companyDAO.loginCompany(C_ID, C_PASS, GRADE);
	}


	public int id_check(@Param("C_ID") String C_ID) {
		
		return companyDAO.id_check(C_ID);
	}
	
	//
		/**	
	
	
	public int companyIdCheck(String c_ID) {

		companyDAO = CSqlSessin.getMapper(CompanyDAO.class);

		return userDAO.idCheck(C_ID);
	}

	

	@Override
	public int idCheck(String C_ID) {
		// TODO Auto-generated method stub
		return 0;
	} **/
}
