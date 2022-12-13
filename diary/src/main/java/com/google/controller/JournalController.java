package com.google.controller;

import java.util.Date;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.google.domain.JournalVO;
import com.google.service.JournalService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * 일기 컨트롤러
 * @author kb403
 *
 */
@Controller
@Log4j
@RequestMapping("/journal/*")
@AllArgsConstructor
public class JournalController {

	private JournalService service; 
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/write")
	public String write() {
		
		return "/diary/journal/write";
	}
	

	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/write")
	public String write(JournalVO journal, RedirectAttributes rttr) {
		log.info(journal);
		service.register(journal);
		
		// journal/list로 이동하면서 result값( 글번호)을 전달함
		rttr.addFlashAttribute("result", journal.getJournal_pk());
		return "redirect:/journal/write";
	}

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/read")
	public String read(@RequestParam("journal_pk") long journal_pk, Model model) {
		
		model.addAttribute("journal", service.read(journal_pk));
		return "/diary/journal/read";
		
	}
	
	
	@GetMapping("/calendar")
	public String list() {
		
		return "/diary/journal/calendar";
	}
	

	@GetMapping("/todolist")
	public String toDoList() {
		
		return "/diary/journal/toDoList";
	}
	
	
}
