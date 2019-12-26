package com.goodmonitoring.service;

import org.apache.ibatis.annotations.Param;

import com.goodmonitoring.vo.UserVO;

public interface UserService {
	//����
	public void insert(UserVO userVO) throws Exception;
	
	//ȸ�� ����
	public void deleteUsr(UserVO userVO);

	//�α���
	public UserVO usrlogin(UserVO userVo);
	
	//���̵� �ߺ�
	//public int idCheck(String USRID);
	
	//개인 로그인
	public UserVO loginuser(@Param("USR_ID") String USR_ID, @Param("USR_PASS") String USR_PASS, int GRADE);
}
