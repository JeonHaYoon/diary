package com.google.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.google.domain.Criteria;
import com.google.domain.JournalVO;

public interface JournalMapper {

	public void insert(JournalVO vo);
	
	public JournalVO read(long journal_pk);

	public void update(JournalVO vo);

	public void delete(long journal_pk);

	public List<JournalVO> getMyListWithPaging(Criteria cri);
	
	public List<JournalVO> getListWithPaging(Criteria cri);
	
	public int getListTotal(Criteria cri);
	
	public List<JournalVO> getList();
}
