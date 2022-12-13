package com.google.mapper;

import java.util.Date;

import com.google.domain.JournalVO;

public interface JournalMapper {

	public void insert(JournalVO vo);
	
	public JournalVO read(long journal_pk);
}
