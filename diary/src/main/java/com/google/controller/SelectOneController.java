package com.google.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@Log4j
@RequestMapping("/select/*")
public class SelectOneController {

	@GetMapping("/selectOne")
	public String selectOne() {
		
		return "/diary/select/selectOne";
	}
}
