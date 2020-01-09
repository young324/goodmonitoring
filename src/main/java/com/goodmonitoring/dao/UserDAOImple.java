package com.goodmonitoring.dao;

import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.goodmonitoring.vo.UserVO;

@Qualifier("UserDAO")
public class UserDAOImple implements UserDAO {


	
	@Inject
    private SqlSession session;
 
    @Override
    public void insert(UserVO userVO){
        session.insert("insert",userVO);
    }

	@Override
	public void deleteUsr(UserVO userVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public UserVO usrlogin(UserVO uservo) {
		// 리턴값 지정필요
		return null;
	}
	
/**	@Override
	public int idCheck(String USRID) {
		// TODO Auto-generated method stub
		return 0;
	}**/

	
	@Override
	public UserVO loginUser(/**@Param("USR_ID") String USR_ID, @Param("USR_PASS") String USR_PASS, int GRADE**/ UserVO VO) {
		HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("USR_ID", VO.getUSR_ID());
        map.put("USR_PASS", VO.getUSR_PASS());
        map.put("GRADE", VO.getGRADE());
		
		return session.selectOne("loginUser", map);
	}
	
	@Override
	public int id_check(String USR_ID) {
		System.out.println("idCheck");
		//int result = session.selectOne("id_check",USR_ID); //UserDAO.id_check -> id_check
		return session.selectOne("id_check",USR_ID);
	}

	
}
