package com.goodmonitoring.dao;

import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Qualifier;

import com.goodmonitoring.vo.CompanyVO;



@Qualifier("CompanyDAO")
//@MapperScan(basePackages = "com.goodmonitoring.dao")
public class CompanyDAOImple implements CompanyDAO {

	@Inject
    private SqlSession session;
 
    @Override
    public void insert(CompanyVO companyVO){
        session.insert("insert",companyVO);
    }

	@Override
	public CompanyVO loginCompany(@Param("C_ID") String C_ID, @Param("C_PASS") String C_PASS, int GRADE) {
		
			HashMap<String, Object> map = new HashMap<String, Object>();
	        map.put("C_ID", C_ID);
	        map.put("C_PASS", C_PASS);
	        map.put("GRADE", GRADE);
			
			return session.selectOne("loginCompany", map);
		
	}

	


	
/**	@Override
	public int idCheck(String C_ID) {
		// TODO Auto-generated method stub
		return 0;
	}**/

	
}
