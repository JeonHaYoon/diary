package com.google.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {

	private int memberPk;
	private String memberId;
	private String memberPw;
	private String nickname;
	private String region;
	private String birth;
	private Date regDate;
	private String memberName;
	private String email;
	private String gender;
	private boolean enabled;
	
	private List<AuthVO> authList;

	
}
