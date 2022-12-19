package com.google.mapper;

import java.util.List;

import com.google.controller.Criteria;
import com.google.domain.SelectOneVO;

public interface SelectOneMapper {

	public void insert(SelectOneVO vo);

	public SelectOneVO read(long select_pk);

	public List<SelectOneVO> getListWithPaging(Criteria cri);
	
	public int getListTotal();

	public void updateHit(long select_pk);

	public void update(SelectOneVO vo);

	public void delete(long select_pk);

}
