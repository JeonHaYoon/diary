package com.google.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.google.domain.Criteria;
import com.google.domain.SelectOneVO;
import com.google.domain.SelectVoteVO;

public interface SelectOneMapper {

	public void insert(SelectOneVO vo);
	
	public List<SelectOneVO> getList();

	public SelectOneVO read(long select_pk);

	public List<SelectOneVO> getListWithPaging(Criteria cri);
	
	public int getListTotal(Criteria cri);

	public void updateHit(long select_pk);

	public void update(SelectOneVO vo);

	public int delete(long select_pk);

	//@Param값에 넣어주면 SelectOneMapper.xml에서 해당 값을 사용할 수 있다.
	public void updateReplyCnt(@Param("select_pk") long select_pk,@Param("amount") int amount);


}
