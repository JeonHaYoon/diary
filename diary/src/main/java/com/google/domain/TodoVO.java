package com.google.domain;

import java.util.Date;

import lombok.Data;

@Data
public class TodoVO {
	private int todo_pk;
	private Date todo_regdate;
	private String todo_content;
	private int todo_importance;
	private Date todo_deadline;
	private String todo_ok;
}
