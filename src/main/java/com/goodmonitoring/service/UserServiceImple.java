package com.goodmonitoring.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

//import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
	//private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	 
	@Autowired
    private BCryptPasswordEncoder passwordEncoder;

	
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
	public UserVO loginuser(/**@Param("USR_ID") String USR_ID, @Param("USR_PASS") String USR_PASS, int GRADE**/ UserVO VO) {
		// TODO Auto-generated method stub
		//BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
		return userDAO.loginUser(VO);
	}
	
	public int id_check(@Param("USR_ID") String USR_ID) {
		
		//int result = userDAO.id_check(USR_ID);
		return userDAO.id_check(USR_ID);
	}
	
	/**public Collection<GrantedAuthority> getAuthorities(String USR_ID) {
        List<String> string_authorities = userDAO.readAuthority(USR_ID);
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        for (String authority : string_authorities) {
             authorities.add(new SimpleGrantedAuthority(authority));
        }
        return authorities;
   }**/

	/**
	@Override
    public PasswordEncoder passwordEncoder() {
         return this.passwordEncoder;
    }**/
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
