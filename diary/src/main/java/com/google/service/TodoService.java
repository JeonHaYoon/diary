package com.google.service;

import java.util.Date;
import java.util.List;

import com.google.controller.Criteria;
import com.google.domain.TodoPageDTO;
import com.google.domain.TodoVO;

public interface TodoService {

	public void register(TodoVO vo);

	public List<TodoVO> read();

	


}
