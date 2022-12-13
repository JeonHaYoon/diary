package com.google.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.domain.MemberVO;
import com.google.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ProfileController {

	private MemberService service;
	
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/profile")
	public String get() {
		
		//model.addAttribute("member", service.read(memberId));
		
		return "diary/profile";
		
	}
}
