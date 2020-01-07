package com.goodmonitoring.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Data
@Getter
@Setter
@ToString	
public class Criteria {
	private int pageNum;
	private int amount;
	
	private String type;
	private String keyword;
	
	public Criteria() {
		this(1,10); //1페이지, 10개의 게시물
	}
	
	public Criteria(int pageNum, int amount) {	
		  this.pageNum = pageNum;
		  this.amount = amount;	  
	}
}
