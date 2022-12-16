package com.google.service;

import org.springframework.stereotype.Service;

import com.google.domain.SelectOneVO;
import com.google.mapper.SelectOneMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class SelectOneServiceImpl implements SelectOneService{

	private SelectOneMapper mapper;
	
	@Override
	public void register(SelectOneVO vo) {
		mapper.insert(vo);
		
	}

}
