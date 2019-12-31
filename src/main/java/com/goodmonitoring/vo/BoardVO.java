package com.goodmonitoring.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {
	private int BOARD_NO;
	private String AD_TITLE;
	private String C_NAME;
	private String INTEREST_CATEGORY;
	
	//모집개요
	private String TARGET;
	private String AD_PERSONNEL;
	private Date AD_START_DATE;
	private Date AD_END_DATE;
	private Date AD_ANNOUNCEMENT_DATE;
	private String AD_APPLY_TEXT;
	private String C_EMAIL;
	private String FILESIZE;
	private String FILE_LOCATION;
	private String FILE_NAME;
	
	//모집조건
	private String AD_AGE;
	private String AD_CHILD;
	private String AD_AREA_NAME;
	private String ONLINE;
	private String AD_TEXT;
	
	//활동 내용
	private String WORK_KEYWORD;
	private Date WORK_START_DATE;
	private Date WORK_END_DATE;
	private String WORK_TIME;
	private String WORK_TEXT;
	private String WORK_BENEFIT_KEY;
	private String WORK_BENEFIT_TEXT;
	
	//활동보상
	private int VIEW_COUNT;
	private int RECOMMEND_COUNT;
	
	//태그
	private String WORK_TAG;
	private Date REPORTING_DATE;
	
	//지원하기 링크
	private String URL;
	
	//체크박스검색
	private String[] targetList;
	private String[] icList;
	
	//특정 대상의 업종별 개수
	private int tcount;
}
