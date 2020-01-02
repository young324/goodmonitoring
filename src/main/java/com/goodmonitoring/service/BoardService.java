package com.goodmonitoring.service;

import java.util.List;

import com.goodmonitoring.vo.BoardVO;
import com.goodmonitoring.vo.FindCriteria;
import com.goodmonitoring.vo.PageCriteria;
import com.goodmonitoring.vo.TargetVO;

public interface BoardService {
	//글쓰기
	public void write(BoardVO boardvo);

	//online checkbox
	public void onlineinsert(List<String> valueArr);

	//서비스계층의 상세보기
	public BoardVO readShow(int BOARD_NO);	

	//추천수 + 1
	public void recommendcount(int BOARD_NO);

	//추천수 - 1
	public void recommendcountM(int BOARD_NO);

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
	
	//관심업종과 일치하는 모집정보 불러오기
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

	//글 수정
	public boolean modify(BoardVO boardvo);

	//글 삭제
	public boolean remove(int BOARD_NO);

	//게시판 목록
	public List<BoardVO> getList();


	//공부 더하고 ㄱ
	public List<BoardVO> listCriteria(PageCriteria pCri) throws Exception;
	public int listCountData(PageCriteria pCri) throws Exception;

	//검색
	public List<BoardVO> listFind(FindCriteria fCri) throws Exception;
	public int findCountData(FindCriteria fCri) throws Exception;

}
