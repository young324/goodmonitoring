package com.goodmonitoring.service;



import java.util.List;

import com.goodmonitoring.vo.BoardVO;
import com.goodmonitoring.vo.LikeVO;


public interface LikeService {
	
	public void insertlike(LikeVO liekvo);

	public void deleteBoardLike(LikeVO liekvo);
	
	public List<LikeVO> getboardno(int USR_NO);
	
	//예제참고
	public int getBoardLike(LikeVO likevo);

}
