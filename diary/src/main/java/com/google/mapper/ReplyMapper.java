package com.google.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.google.domain.Criteria;
import com.google.domain.ReplyVO;

public interface ReplyMapper {

	public int insert(ReplyVO vo);

	public ReplyVO read(long rno);

	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri,@Param("select_pk") long select_pk);
	
	public int getCountByPk(Long select_pk);

	public int delete(long rno);

	public int update(ReplyVO vo);


}
