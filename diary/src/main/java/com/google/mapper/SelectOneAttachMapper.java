package com.google.mapper;

import java.util.List;

import com.google.domain.SelectOneAttachDTO;

public interface SelectOneAttachMapper {
	
	public void insert(SelectOneAttachDTO vo);
	
	public void delete(String uuid);
	
	public List<SelectOneAttachDTO> findByPk(Long select_pk);
	
	public void deleteAll(Long long1);
	
	public List<SelectOneAttachDTO> getOldFiles();

	
}
