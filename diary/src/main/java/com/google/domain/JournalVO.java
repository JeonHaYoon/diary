package com.google.domain;

import java.util.Date;

import lombok.Data;

@Data
public class JournalVO {

	private int journal_pk;
	private String journal_title;
	private String journal_content;
	private String journal_weather;
	private Date journal_regdate;
	private String journal_writer;
	private int journal_hit;
	private Date journal_update;
	
	
}


