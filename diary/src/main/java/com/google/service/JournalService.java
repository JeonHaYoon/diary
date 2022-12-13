package com.google.service;

import java.util.Date;

import com.google.domain.JournalVO;

public interface JournalService {

	public void register(JournalVO vo);   //write
	
	public JournalVO read(long journal_pk); //read
}
