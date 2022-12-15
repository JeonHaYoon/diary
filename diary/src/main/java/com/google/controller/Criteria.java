package com.google.controller;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


/**
 * 페이징
 * 
 * @author kb403
 *
 */
@Setter
@Getter
@ToString
public class Criteria {

	private int pageNum;
	private int amount;
	
	public Criteria() {
		super();
		this.pageNum = 1;
		this.amount =10;
	}
	public Criteria(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public int getSkip() {
		return (this.pageNum-1) * this.amount;
	}
	
}
