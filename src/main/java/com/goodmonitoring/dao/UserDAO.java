package com.goodmonitoring.dao;

import org.apache.ibatis.annotations.Param;

import com.goodmonitoring.vo.UserVO;

public interface UserDAO {
	//����
	public void insert(UserVO userVO);
	
	
	//ȸ�� ����
	public void deleteUsr(UserVO userVO);
	
	
	//�α���
	public UserVO usrlogin(UserVO uservo);
	
	
	//���̵� �ߺ�
	//public int idCheck(String USRID);
	
	//로그인
	public UserVO loginUser(@Param("USR_ID") String USR_ID, @Param("USR_PASS") String USR_PASS, int GRADE);
}
