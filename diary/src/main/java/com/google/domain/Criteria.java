package com.google.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 페이징
 * @author kb403
 *
 */
@Setter
@Getter
@ToString
public class Criteria {
	
	private int pageNum; //현재페이지
	private int amount; //한 페이지에 보여줄 수
	
	
	private String type;	//검색조건
	private String keyword;	//검색어
	
	
	//기본생성자
	public Criteria() {
		this(1, 10);
		//this.pageNum = 1;
		//this.amount = 10;
		
	}


	public Criteria(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
	
	}
	
	public int getSkip() {
		return (this.pageNum-1) * this.amount;
	}
	
	public String[] getTypeArr() {
		return type == null?new String[] {}:type.split("");
	}
	
	/**
	 *삭제 시 페이지 및 검색어 유지 
	 *?pageNum=7&amount=10&type=&keyword=
	 */
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.getPageNum())
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());
		
		return builder.toUriString();
				
	}
	
}
