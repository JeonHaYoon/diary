package com.google.service;

import java.util.Date;

import org.springframework.stereotype.Service;

import com.google.controller.Criteria;
import com.google.domain.JournalVO;
import com.google.mapper.JournalMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class JournalServiceImpl implements JournalService {
	
	private JournalMapper mapper;
	
	@Override	
	public void register(JournalVO vo) {
		mapper.insert(vo);
		
	}

	@Override
	public JournalVO read(long journal_pk) {
		//mapper.updateHit(journal_regdate);  //조회수증가
		return mapper.read(journal_pk);
	}

	@Override
	public void modify(JournalVO vo) {
		mapper.update(vo);
		
	}

	@Override
	public void remove(long journal_pk) {
		mapper.delete(journal_pk);
		
	}

	@Override
	public Object getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getListTotal() {
		// TODO Auto-generated method stub
		return mapper.getListTotal();
	}
	


}
