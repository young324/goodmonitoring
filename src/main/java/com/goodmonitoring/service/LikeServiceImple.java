package com.goodmonitoring.service;

import java.util.List;

//import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.goodmonitoring.dao.LikeDAO;
import com.goodmonitoring.vo.BoardVO;
import com.goodmonitoring.vo.LikeVO;
import com.goodmonitoring.vo.UserVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service("likeService")
public class LikeServiceImple implements LikeService {
	
	@Inject
	private LikeDAO like;
	
	@Override
	public void insertlike(LikeVO likevo) {
		like.insertlike(likevo);
		
	}

	@Override
	public void deleteBoardLike(LikeVO likevo) {
		like.deleteBoardLike(likevo);
		//like.updateBoardLike(likevo.getBOARD_NO());
		
	}
	
//내가만든거
	@Override
	public List<LikeVO> getboardno(int USR_NO) {
		return like.getboardno(USR_NO);
	}

	@Override
	public int getBoardLike(LikeVO likevo) {
		return like.getBoardLike(likevo);
	}

	

	
}
