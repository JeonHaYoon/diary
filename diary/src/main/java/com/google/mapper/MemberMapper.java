package com.google.mapper;


import com.google.domain.MemberVO;

public interface MemberMapper {

	public MemberVO read(String memberId);
	
	public void insert(MemberVO vo);
	
	public void find(MemberVO vo);
}
