package com.goodmonitoring.service;

//import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goodmonitoring.dao.UserDAO;
import com.goodmonitoring.vo.UserVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service("userService")
public class UserServiceImple implements UserService {

	//@Resource(name="userDAO")
	//private UserDAO userDAO;

	@Inject
	private UserDAO userDAO;
	 
	@Override
	public void insert(UserVO userVO) throws Exception{
		// TODO Auto-generated method stub
		userDAO.insert(userVO);
	}

	@Override
	public void deleteUsr(UserVO userVO) {
		// TODO Auto-generated method stub
		userDAO.deleteUsr(userVO);
	}
	
	@Override
	public UserVO usrlogin(UserVO uservo) {
		// TODO Auto-generated method stub
		return userDAO.usrlogin(uservo);
	}
	
	@Override
	public UserVO loginuser(@Param("USR_ID") String USR_ID, @Param("USR_PASS") String USR_PASS, int GRADE) {
		// TODO Auto-generated method stub
		return userDAO.loginUser(USR_ID, USR_PASS, GRADE);
	}
	
	//
		/**	@Autowired
	private UserDAO userDAO;
	private SqlSessionTemplate UsrSqlSessin;
	
	
	public int userIdCheck(String USRID) {

		userDAO = UsrSqlSessin.getMapper(UserDAO.class);

		return userDAO.idCheck(USRID);
	}

	

	@Override
	public int idCheck(String USRID) {
		// TODO Auto-generated method stub
		return 0;
	} **/
}
