package com.google.service;

import java.util.List;

import com.google.domain.Criteria;
import com.google.domain.ReplyPageDTO;
import com.google.domain.ReplyVO;

public interface ReplyService {

	public int insert(ReplyVO vo);

	public ReplyVO read(long rno);

	public ReplyPageDTO getListWithPaging(Criteria cri, long select_pk);

	public int delete(long rno);
}
