package com.google.service;

import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.domain.AuthVO;
import com.google.domain.MemberVO;
import com.google.mapper.AuthMapper;
import com.google.mapper.MemberMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class MemberServiceImpl implements MemberService{

	private MemberMapper mapper;
	private AuthMapper authmapper;
	
	
	//회원가입을 하고, 회원권한 부여  둘 중 하나라도 오류나면 실행x
	@Transactional
	@Override
	public void register(MemberVO vo) {
		mapper.insert(vo);
		AuthVO auth = new AuthVO();
		auth.setMemberId(vo.getMemberId());
		auth.setAuth("ROLE_USER");
		authmapper.insertAuth(auth);
				
	}

	@Override
	public void modify(MemberVO vo) {
		mapper.update(vo);
		
	}


	@Override
	public MemberVO getMemberById(String memberId) {
		
		return mapper.read(memberId);
	}

	@Override
	public int idcheck(String memberId) {
		// TODO Auto-generated method stub
		return mapper.idcheck(memberId);
	}

	@Override
	public int nickcheck(String nickname) {
		// TODO Auto-generated method stub
		return mapper.nickcheck(nickname);
	}

	@Override
	public int emailcheck(String email) {
		// TODO Auto-generated method stub
		return mapper.emailcheck(email);
	}

	

	
	
	
}
