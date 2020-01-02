package com.goodmonitoring.dao;

import java.util.List;

import com.goodmonitoring.vo.BoardVO;
import com.goodmonitoring.vo.TargetVO;

public interface BoardDAO {

	//리스트 불러오기
	public List<BoardVO> getList();

	//게시글 작성
	public void insert(BoardVO boardvo);

	//체크박스 값넣기
	public void onlineinsert(List<String> valueArr);
	
	//게시글 상세보기getC_NAMElist
	public BoardVO read(int BOARD_NO);
	
	//이번달 전체 모집정보 리스트 
	public List<BoardVO> getmonthlyList();
	
	// 이번달 특정대상의 업종별 모집정보 수 리스트
	public List<BoardVO> countICbyTG(TargetVO targetVO);
	
	//게시물 대상별로 카운트
	public int countTarget(TargetVO targetVO);
	
	//게시물 업종별로 카운트
	public int countIC(String INTEREST_CATEGORY);
	
	//전체 모집정보 수
	public int countboard();
	
	//게시글 상세보기 조회수 + 1
	public void viewcount(int BOARD_NO);
	
	//추천수  + 1
	public void recommendcount(int BOARD_NO);
	
	//추천수  - 1
	public void recommendcountM(int BOARD_NO);
	
	//가입할때 선택한 관심업종과 일치하는 모집정보 불러오기
	public List<BoardVO> getjoinfitlist(int USR_NO);

	//업종과 일치하는 모집정보 불러오기
	public List<BoardVO> getfitcatelist(String INTEREST_CATEGORY);
	
	//이번달 가장많은 업종
	public String getmostcate();
	
	//이번달 가장많은 업종의 가장많은 대상
	public String getmosttarget();
	
	//회사명으로 모집정보 가져오기
	public List<BoardVO>getC_NAMElist(String C_NAME);
	
	//체크박스 검색
	public List<BoardVO>boardSearchList(BoardVO boardvo);
	
	//게시글 삭제
	public int delete(int BOARD_NO);

	//게시글 수정
	public int update(BoardVO boardvo);
}
