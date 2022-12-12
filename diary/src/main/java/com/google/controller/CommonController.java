package com.google.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {

	
	 
	/**
	 * 로그인에러
	 * @param auth
	 * @param model
	 */
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		model.addAttribute("msg", "AccessDenied");
		
	}

	/**
	 * 로그인
	 * @param error
	 * @param logout
	 * @param model
	 * @return
	 */
	@GetMapping("/login")
	public String loingInput(String error, String logout, Model model) {
		
		
		if (error != null) {
			model.addAttribute("error", "Login Error!");
		}
		if (logout != null) {
			model.addAttribute("logout", "LogOut!!");
		}
		
		return "diary/login";
	}

	@GetMapping("/logout")
	public String logoutGet() {
		return "diary/logout";
	}

	// 로그인을 하지않은 사용자도 접근가능
	@GetMapping("/all")
	public String doAll() {
		
		log.info("All..");
		return "diary/all";
	}

	// 로그인 한 사용자 중 멤버와 관리자만 접근가능
	@GetMapping("/member")
	public String doMember() {
		log.info("Member...");
		return "diary/member";
	}

	// 로그인 한 사용자 중 관리자만 접근가능

	@GetMapping("/admin")
	public String doAdmin() {
		log.info("Admin...");
		return "diary/admin";
	}

	
}
