package com.google.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.domain.JournalVO;
import com.google.domain.SelectOneVO;
import com.google.service.SelectOneService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@Log4j
@RequestMapping("/select/*")
public class SelectOneController {

	private SelectOneService service;
	
	@GetMapping("/selectWrite")
	public String selectWrite() {
		
		return "/diary/select/selectWrite";
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/selectWrite")
	public String selectWrite(SelectOneVO vo, RedirectAttributes rttr) {
		//log.info(vo);
		service.register(vo);
		
		// journal/list로 이동하면서 result값( 글번호)을 전달함
		rttr.addFlashAttribute("result", vo.getSelect_pk());
		return "redirect:/select/selectWrite";
	}
}
