package com.goodmonitoring.vo;

import java.sql.Date;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import lombok.Data;

@Data
public class UserVO {

	
	
	private int USR_NO;
	private String 	USR_ID;
	private String USR_PASS;
	private String USR_NAME;
	private Date USR_BIRTH;
	private String USR_SEX;
	private String USR_TEL;	
	private String USR_EMAIL;
	private String USR_ZIPCODE;
	private String USR_ADDR;
	private String TARGET;
	private String INTEREST_CATEGORY;
	private String USR_CAREER;
	private String USR_CAREER_DATE;
	private String ONLINE;
	private String ONLINE_URL;
	
	private int GRADE;

	
	

}

