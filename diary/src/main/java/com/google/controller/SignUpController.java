package com.google.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.domain.AuthVO;
import com.google.domain.MemberVO;
import com.google.domain.TodoVO;
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

	 private MemberService service;
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
		  service.register(vo);
		  
		  return "redirect:/login";
	  
	  }
	  
	  //아이디중복체크
	  @RequestMapping(value="/idcheck", method = RequestMethod.GET)	  
	  public @ResponseBody int idcheck(String memberId){
		  int check=service.idcheck(memberId);
		  //System.out.println("아이디"+memberId);
		  
		 return check;		  
		  
	    }
	  
	//닉네임중복체크
	  @RequestMapping(value="/nickcheck", method = RequestMethod.GET)	  
	  public @ResponseBody int nickcheck(String nickname){
		  int check=service.nickcheck(nickname);
		  System.out.println("닉네임"+nickname);
		  
		 return check;		  
		  
	    }
	  
	//이메일중복체크
	  @RequestMapping(value="/emailcheck", method = RequestMethod.GET)	  
	  public @ResponseBody int emailcheck(String email){
		  int check=service.emailcheck(email);
		  System.out.println("이메일"+email);
		  
		 return check;		  
		  
	    }
}
