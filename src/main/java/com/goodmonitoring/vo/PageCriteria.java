package com.goodmonitoring.vo;

public class PageCriteria {
	private int page;
	private int numPerPage;
	
	public PageCriteria() {
		this.page = 1;
		this.numPerPage = 10;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if(page <=0 ) {
			this.page = 1;
			return ;
		}
		this.page = page;
	}

	public int getNumPerPage() {
		return numPerPage;
	}

	public void setNumPerPage(int numPerPage) {
		if(numPerPage <= 0 || numPerPage > 50) {
			this.numPerPage = 10;
			return;
		}
		this.numPerPage = numPerPage;
	}
	
	// 페이지 구분 설정
	public int getStartPage() {
		return (this.page-1	)*numPerPage;
	}

	@Override
	public String toString() {
		return "PageCriteria [page = "+this.page+", numPerPage="+this.numPerPage+"]";
	}
}
