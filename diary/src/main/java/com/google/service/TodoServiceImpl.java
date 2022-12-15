package com.google.service;

import org.springframework.stereotype.Service;

import com.google.domain.TodoVO;
import com.google.mapper.TodoMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class TodoServiceImpl implements TodoService{
	
	private TodoMapper mapper;
	
	@Override
	public void register(TodoVO vo) {
		mapper.insert(vo);
		
	}

}
