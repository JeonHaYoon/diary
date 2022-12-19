package com.google.mapper;

import java.util.List;

import com.google.domain.SelectOneAttachVO;

public interface SelectOneAttachMapper {
	
	public void insert(SelectOneAttachVO vo);
	
	public void delete(String uuid);
	
	public List<SelectOneAttachVO> findBypk(Long select_pk);
	
	public void deleteAll(Long long1);
	
	public List<SelectOneAttachVO> getOldFiles();
	
}
