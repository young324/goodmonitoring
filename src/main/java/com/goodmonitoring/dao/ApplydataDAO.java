package com.goodmonitoring.dao;



import com.goodmonitoring.vo.ApplydataVO;

public interface ApplydataDAO {
	
	public void insert(ApplydataVO applydatavo);
	
	//처음 회원가입할때 관심업종 선택한거
	public void insertuserjoin(ApplydataVO applydatavo);

	//지원한 내역있는지 확인
	public int getBoardApply(ApplydataVO applydatavo);
	
	//지원하기를 한적 있는지
	public int applyisext(int USR_NO);
	
	//가장 최근에 지원한 회사명
	public String getlatelycname(int USR_NO);
	
	//맞춤 업종코드 리턴
	public int getfitcategory(int USR_NO);
}
