package com.goodmonitoring.service;

import java.util.Collection;

import org.apache.ibatis.annotations.Param;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.goodmonitoring.vo.UserVO;

public interface UserService /**extends UserDetailsService**/ {
	//����
	public void insert(UserVO userVO) throws Exception;
	
	//ȸ�� ����
	public void deleteUsr(UserVO userVO);

	//�α���
	public UserVO usrlogin(UserVO userVo);
	
	//���̵� �ߺ�
	//public int idCheck(String USRID);
	
	//개인 로그인
	//public UserVO loginuser(@Param("USR_ID") String USR_ID, @Param("USR_PASS") String USR_PASS, int GRADE);
	public UserVO loginuser(UserVO VO);
	
	public int id_check(@Param("USR_ID") String USR_ID);

	
	
	//비밀번호 암호화
	//public PasswordEncoder passwordEncoder();
	 //Collection<GrantedAuthority> getAuthorities(String USR_ID);
}
