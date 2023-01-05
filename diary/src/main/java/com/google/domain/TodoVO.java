package com.google.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class TodoVO {
	private int todo_pk;
	
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date todo_regdate;
	private String todo_content;
	private int todo_importance;
	private String todo_deadline;
	private String todo_ok;
}
