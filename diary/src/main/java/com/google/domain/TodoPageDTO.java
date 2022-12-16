package com.google.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class TodoPageDTO {
	
	private int todoCnt; //총 갯수
	private List<TodoVO> list;
	
}
