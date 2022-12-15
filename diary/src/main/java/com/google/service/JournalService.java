package com.google.service;

import java.util.Date;

import com.google.controller.Criteria;
import com.google.domain.JournalVO;

public interface JournalService {

	public void register(JournalVO vo);   //write
	
	public JournalVO read(long journal_pk); //read

	public void modify(JournalVO vo);  //update

	public void remove(long journal_pk);

	public Object getList(Criteria ncri);

	public int getListTotal();
}
