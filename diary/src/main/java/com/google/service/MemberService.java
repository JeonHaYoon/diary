package com.google.service;

import com.google.domain.AuthVO;
import com.google.domain.MemberVO;

public interface MemberService {

	public void register(MemberVO vo);
	
	public void modify(MemberVO vo); 

	public MemberVO getMemberById(String memberId);

	public int idcheck(String memberId);

	public int nickcheck(String nickname);

	public int emailcheck(String email); 

	

	
	
	
}
