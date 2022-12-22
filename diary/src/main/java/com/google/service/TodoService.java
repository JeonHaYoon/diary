package com.google.service;

import java.util.Date;
import java.util.List;

import com.google.domain.Criteria;
import com.google.domain.TodoPageDTO;
import com.google.domain.TodoVO;

public interface TodoService {

	public void register(TodoVO vo);

	public List<TodoVO> read();

	public int update(TodoVO vo);

	


}
