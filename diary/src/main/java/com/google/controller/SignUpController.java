package com.google.controller;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.google.domain.MemberVO;
import com.google.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * 회원가입 컨트롤러
 * @author kb403
 *
 */
@Controller
@AllArgsConstructor
public class SignUpController {

	 private MemberService memberService;
	 private PasswordEncoder passwordEncoder;
	 

	//회원가입
	@GetMapping("/signup")
	public String signUpForm() {
		return "diary/signup";
	}
	
	//회원가입에 작성한 정보가 Member에 저장된다.
	  @PostMapping("/signup")
	  public String sign(@ModelAttribute MemberVO vo) {
		  vo.setMemberPw(passwordEncoder.encode(vo.getMemberPw()));
		  memberService.register(vo);
		  
		  return "redirect:/login";
	  
	  }
}
