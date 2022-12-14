package com.google.mapper;


import com.google.domain.MemberVO;

public interface MemberMapper {

	public MemberVO read(String memberId);  //회원정보 가져오는 것
	
	public void insert(MemberVO vo);  //회원가입
	
	public void update(MemberVO vo);  //회원정보 수정

}
