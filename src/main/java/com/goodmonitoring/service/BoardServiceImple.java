package com.goodmonitoring.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.goodmonitoring.dao.BoardDAO;
import com.goodmonitoring.vo.BoardVO;
import com.goodmonitoring.vo.Criteria;
import com.goodmonitoring.vo.FindCriteria;
import com.goodmonitoring.vo.PageCriteria;
import com.goodmonitoring.vo.TargetVO;

import lombok.extern.log4j.Log4j;

@Log4j //기존에 선언되있는 log4j 1.2.15버전을 주석처리해줌
@Service("boardService")
public class BoardServiceImple implements BoardService{

	//@Setter(onMethod_ = @Autowired)//@inject와 차이점?
	@Inject
	private BoardDAO board;
	

	@Override
	public void write(BoardVO boardvo) {
		board.insert(boardvo);
	}


	@Override
	public void onlineinsert(List<String> valueArr) {
		board.onlineinsert(valueArr);
	}


	@Override
	public BoardVO readShow(int BOARD_NO) {
		board.viewcount(BOARD_NO);		
		return board.read(BOARD_NO);
	}
	

	@Override
	public boolean modify(BoardVO boardvo) {
		return board.update(boardvo) == 1;
	}
	//정상적으로 수정과 삭제가 이루어지면 1반환
	@Override
	public boolean remove(int BOARD_NO) {
		return board.delete(BOARD_NO) == 1;
	}
	/*
	 * @Override public List<BoardVO> getList() { return board.getList(); }
	 */
	
	@Override
	public List<BoardVO> getList(Criteria cri) {
		return board.getListWithPaging(cri);
	}

	@Override
	public void recommendcount(int BOARD_NO) {
		board.recommendcount(BOARD_NO);	
	}

	
	@Override
	public void recommendcountM(int BOARD_NO) {
		board.recommendcountM(BOARD_NO);	
		
	}
	
	@Override
	public List<BoardVO> getjoinfitlist(int USR_NO) {
		return board.getjoinfitlist(USR_NO);
	}
	
	@Override
	public List<BoardVO> getfitcatelist(String INTEREST_CATEGORY) {
		return board.getfitcatelist(INTEREST_CATEGORY);
	}

	@Override
	public String getmostcate() {
		return board.getmostcate();
	}


	@Override
	public String getmosttarget() {
		return board.getmosttarget();
	}
	
	@Override
	public List<BoardVO> getC_NAMElist(String C_NAME) {
		return board.getC_NAMElist(C_NAME);
	}
	
	@Override
	public List<BoardVO> boardSearchList(BoardVO boardvo) {
		return board.boardSearchList(boardvo);
	}
	
	@Override
	public List<BoardVO> listCriteria(PageCriteria pCri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int listCountData(PageCriteria pCri) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BoardVO> listFind(FindCriteria fCri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int findCountData(FindCriteria fCri) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int countTarget(TargetVO targetVO) {
		return board.countTarget(targetVO);
	}


	@Override
	public int countIC(String INTEREST_CATEGORY) {
		return board.countIC(INTEREST_CATEGORY);
	}


	@Override
	public int countboard() {
		return board.countboard();
	}


	@Override
	public List<BoardVO> countICbyTG(TargetVO targetvo) {
		return board.countICbyTG(targetvo);
	}


	@Override
	public List<BoardVO> getmonthlyList() {
		return board.getmonthlyList();
	}


	@Override
	public List<BoardVO> RecommendList() {
		return board.RecommendList();
	}


	@Override
	public List<BoardVO> DeadlineList() {
		return board.DeadlineList();
	}


}
