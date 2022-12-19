package com.google.service;

import com.google.controller.Criteria;
import com.google.domain.SelectOneVO;


public interface SelectOneService {

	public void register(SelectOneVO vo);

	public SelectOneVO read(long select_pk);

	public Object getList(Criteria cri);

	public int getListTotal();

	public void modify(SelectOneVO vo);

	public void remove(long select_pk);

}
