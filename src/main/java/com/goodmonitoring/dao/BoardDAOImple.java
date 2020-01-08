package com.goodmonitoring.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Qualifier;

import com.goodmonitoring.vo.BoardVO;
import com.goodmonitoring.vo.Criteria;
import com.goodmonitoring.vo.TargetVO;

@Qualifier("boardDAO")
public class BoardDAOImple implements BoardDAO{

	@Inject
	private SqlSession ss;

	@Override
	public List<BoardVO> getList() {
		return ss.selectList("getList");
	}

	
	@Override
	public void insert(BoardVO boardvo) {
		ss.insert("insert", boardvo);

	}
	
	@Override
	public void onlineinsert(List<String> valueArr) {
		ss.insert("onlineinsert", valueArr);

	}

	@Override
	public BoardVO read(int BOARD_NO) {
		return ss.selectOne("read", BOARD_NO);
	}
	
	@Override
	public void viewcount(int BOARD_NO) {
		ss.update("viewcount", BOARD_NO);
	}

	@Override
	public int delete(int BOARD_NO) {
		ss.delete("delete", BOARD_NO);
		return 0;
	}

	@Override
	public int update(BoardVO boardvo) {
		ss.update("update", boardvo);
		return 0;
	}

	@Override
	public void recommendcount(int BOARD_NO) {
		ss.update("recommendcount", BOARD_NO);
		
	}

	@Override
	public void recommendcountM(int BOARD_NO) {
		ss.update("recommendcountM", BOARD_NO);
		
	}

	@Override
	public List<BoardVO> getjoinfitlist(int USR_NO) {
		return ss.selectList("getjoinfitlist",USR_NO);
	}

	@Override
	public List<BoardVO> getfitcatelist(String INTEREST_CATEGORY) {
		return ss.selectList("getfitcatelist",INTEREST_CATEGORY);
	}

	@Override
	public String getmostcate() {
		return ss.selectOne("getmostcate");
	}

	@Override
	public String getmosttarget() {
		return ss.selectOne("getmosttarget");
	}

	@Override
	public List<BoardVO> getC_NAMElist(String C_NAME) {
		return ss.selectList("getC_NAMElist",C_NAME);
	}

	/*
	 * @Override public List<BoardVO> boardSearchList(@Param("TARGETList") String[]
	 * TARGETList,
	 * 
	 * @Param("INTEREST_CATEGORYList") String[] INTEREST_CATEGORYList,
	 * 
	 * @Param("ONLINEList") String[] ONLINEList,
	 * 
	 * @Param("WORK_KEYWORDList") String[] WORK_KEYWORDList,
	 * 
	 * @Param("WORK_BENEFIT_KEYList") String[] WORK_BENEFIT_KEYList) {
	 * 
	 * HashMap<String, Object> map = new HashMap<String, Object>();
	 * map.put("TARGETList", TARGETList); map.put("INTEREST_CATEGORYList",
	 * INTEREST_CATEGORYList); map.put("ONLINEList", ONLINEList);
	 * map.put("WORK_KEYWORDList", WORK_KEYWORDList);
	 * map.put("WORK_BENEFIT_KEYList", WORK_BENEFIT_KEYList);
	 * 
	 * return ss.selectList("boardSearchList", map); }
	 */
	@Override public List<BoardVO> boardSearchList(BoardVO boardvo){
		return ss.selectList("boardSearchList", boardvo);
	}

	@Override
	public int countTarget(TargetVO targetVO) {
		return ss.selectOne("countTarget",targetVO);
	}

	@Override
	public int countIC(String INTEREST_CATEGORY) {
		return ss.selectOne("countIC",INTEREST_CATEGORY);
	}

	@Override
	public int countboard() {
		return ss.selectOne("countboard");
	}

	@Override
	public List<BoardVO> countICbyTG(TargetVO targetVO) {
		return ss.selectList("countICbyTG", targetVO);
	}

	@Override
	public List<BoardVO> getmonthlyList() {
		return ss.selectList("getmonthlyList");
	}


	@Override
	public List<BoardVO> getListWithPaging(Criteria cri) {
		return ss.selectList("getListWithPaging");
	}


	@Override
	public List<BoardVO> RecommendList() {
		return ss.selectList("RecommendList");
	}


	@Override
	public List<BoardVO> DeadlineList() {
		return ss.selectList("DeadlineList");
	}

	

}
