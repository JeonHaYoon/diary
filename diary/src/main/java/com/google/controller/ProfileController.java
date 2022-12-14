package com.google.controller;

import java.security.Principal;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.domain.MemberVO;
import com.google.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class ProfileController {

	private MemberService service;
	
	
	//로그인된 회원의 아이디를 받아서 정보를 가져온다.
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/profile")
	public String profile(Model model, Principal prin) {
		
		model.addAttribute("member", service.getMemberById(prin.getName()));
	
		return "diary/profile";
		
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/profileEdit")
	public String profileEdit(Model model, Principal prin) {
		model.addAttribute("member", service.getMemberById(prin.getName()));
		return "diary/profileEdit";
	}
	
	@PostMapping("/profileEdit")
	public String modify(MemberVO member) {
		
		service.modify(member);
		
		//rttr.addFlashAttribute("result", member.getMemberId());
		return "redirect:/profile";
	}
}
