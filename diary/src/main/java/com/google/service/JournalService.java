package com.google.service;

import java.util.Date;
import java.util.List;

import com.google.domain.Criteria;
import com.google.domain.JournalVO;

public interface JournalService {

	public void register(JournalVO vo);   //write
	
	public JournalVO read(long journal_pk); //read

	public void modify(JournalVO vo);  //update

	public void remove(long journal_pk);

	public List<JournalVO> getList(Criteria cri);

	public List<JournalVO> getMyList(Criteria cri);

	public int getListTotal(Criteria cri);

	public List<JournalVO> getDate(String journal_regdate);

	
}
