package com.google.mapper;

import java.util.Date;
import java.util.List;

import com.google.domain.TodoVO;

public interface TodoMapper {

	public void insert(TodoVO vo);

	public List<TodoVO> read();
	
	
	

}
