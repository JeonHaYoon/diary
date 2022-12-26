package com.google.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class ReplyPageDTO {
	
	private int select_replyCnt; //댓글 총 갯수
	private List<ReplyVO> list;
	
}
