package com.google.domain;

import java.util.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Setter
@Getter
@ToString
public class ReplyVO {

	private long rno;
	private long select_pk;
	private String reply;
	private String replyer;
	private Date replydate;
	private Date updatedate;
	
	
}
