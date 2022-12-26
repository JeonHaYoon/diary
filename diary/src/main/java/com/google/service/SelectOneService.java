package com.google.service;

import java.util.List;

import com.google.domain.Criteria;
import com.google.domain.SelectOneAttachDTO;
import com.google.domain.SelectOneVO;


public interface SelectOneService {

	public void register(SelectOneVO vo);

	public SelectOneVO read(long select_pk);

	public Object getList(Criteria cri);

	public int getListTotal(Criteria cri);

	public void modify(SelectOneVO vo);

	public boolean remove(long select_pk);

	public List<SelectOneAttachDTO> getAttachList(Long select_pk);

}
