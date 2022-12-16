package com.google.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class SelectOneVO {

	private Long select_pk;
	private String select_writer;
	private String select_title;
	private String select_category;
	private String select_content;
	private String select_itemA;
	private String select_itemB;
	private Date select_regdate;
	private Date select_update;
	private int select_hit;
	
	private int select_replyCnt; //댓글수
	
	//private List<BoardAttachVO> attachList;
	
}
