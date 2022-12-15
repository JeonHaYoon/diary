package com.google.controller;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 10페이지 관련 
 * @author kb403
 *
 */

@Getter
@Setter
@ToString
public class PageDTO {

	private int startPage; //시작페이지
	private int endPage;	//끝페이지 
	private boolean next, prev ;	//이전, 다음 여부
	private int total;		//전체글수
	private Criteria cri; //페이징
	
	
	public PageDTO(int total, Criteria cri) {
		super();
		this.total = total;
		this.cri = cri;
		
	
		this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0)) * 10 ;
		this.startPage = this.endPage - 9;
		int realEnd = (int)(Math.ceil((total * 1.0)/cri.getAmount()));
				
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		

		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
	
	
	
}
