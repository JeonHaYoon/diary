package com.google.service;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.google.domain.Criteria;
import com.google.domain.TodoPageDTO;
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


	@Override
	public List<TodoVO> read() {
		return mapper.read();
	}


	@Override
	public int update(TodoVO vo) {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	

}
