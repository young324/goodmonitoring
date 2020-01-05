
package com.goodmonitoring.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.goodmonitoring.vo.BoardFileVO;

@Qualifier("boardDAO")
public class FileUploadDaoImpl implements FileUploadDao{

	
	@Autowired
	private SqlSession sqlSession;
	
	public Integer fileUploadAction(BoardFileVO boardFileVO) throws Exception{		
		return sqlSession.insert("fileUploadAction", boardFileVO );
	}

	@Override
	public List<BoardFileVO> fileList(Map<String, Object> map) throws Exception {
		return sqlSession.selectList("fileList", map);
	}

	@Override
	public BoardFileVO boardGetByFileInfo(Map<String, Object> map) throws Exception {		
		return sqlSession.selectOne("boardGetByFileInfo", map);
	}

	@Override
	public int fileDelete(Map<String, Object> map) throws Exception {
		return sqlSession.delete("fileDelete", map);
	}

	@Override
	public String img_path(int BOARD_NO) throws Exception {
		return sqlSession.selectOne("img_path", BOARD_NO);
	}
	


	
}

