package com.goodmonitoring.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Qualifier;

import com.goodmonitoring.vo.LikeVO;

@Qualifier("likeDAO")
public class LikeDAOImple implements LikeDAO{

	@Inject
	private SqlSession ss;
	
	@Override
	public void insertlike(LikeVO likevo) {
		ss.insert("insertlike", likevo);
		
	}

	@Override
	public void deleteBoardLike(LikeVO likevo) {
		ss.delete("deleteBoardLike",likevo);
		
	}

	@Override
	public List<LikeVO> getboardno(int USR_NO) {
		
		return ss.selectList("isLiked", USR_NO);
	}

	@Override
	public int getBoardLike(LikeVO likevo) {
		return ss.selectOne("getBoardLike", likevo);
	}

	@Override
	public void updateBoardLike(int BOARD_NO) {
		ss.update("updateBoardLike", BOARD_NO);
		
	}


}
