package com.google.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.domain.MemberVO;
import com.google.mapper.AuthMapper;
import com.google.mapper.MemberMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class MemberServiceImpl implements MemberService{

	private MemberMapper member;
	private AuthMapper auth;
	
	@Transactional
	@Override
	public void register(MemberVO vo) {
		member.insert(vo);
		
		
		auth.insert(vo.getAuthList());
		
		
		
		/*
		 * Member selectedMember = memberDao.getMemberByEmail(member.getEmail()); Long
		 * memberId = selectedMember.getId(); if(admin) {
		 * memberRoleDao.addAdminRole(memberId); } memberRoleDao.addUserRole(memberId);
		 */
		
	}

}
