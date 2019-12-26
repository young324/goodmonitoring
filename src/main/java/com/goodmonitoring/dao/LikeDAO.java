package com.goodmonitoring.dao;



import java.util.List;

import com.goodmonitoring.vo.LikeVO;

public interface LikeDAO {
	public void insertlike(LikeVO likevo);

	public List<LikeVO> getboardno(int USR_NO); 
	
	public void deleteBoardLike(LikeVO likevo);
	
	//예제참고
	public int getBoardLike(LikeVO likevo);
	
	 public void updateBoardLike(int BOARD_NO);
	
}
