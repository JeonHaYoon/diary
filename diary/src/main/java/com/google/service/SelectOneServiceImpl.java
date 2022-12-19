package com.google.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.controller.Criteria;
import com.google.domain.SelectOneVO;
import com.google.mapper.SelectOneMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class SelectOneServiceImpl implements SelectOneService{

	private SelectOneMapper mapper;
	
	@Override
	public void register(SelectOneVO vo) {
		mapper.insert(vo);
		
	}

	@Transactional
	@Override
	public SelectOneVO read(long select_pk) {
		mapper.updateHit(select_pk);  //조회수증가
		return mapper.read(select_pk);
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

	@Override
	public void modify(SelectOneVO vo) {
		mapper.update(vo);
		
	}

	@Override
	public void remove(long select_pk) {
		mapper.delete(select_pk);
		
	}

}
