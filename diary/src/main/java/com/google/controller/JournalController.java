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

import com.google.domain.Criteria;
import com.google.domain.JournalVO;
import com.google.domain.PageDTO;
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
	public String write(JournalVO vo, RedirectAttributes rttr) {
		//log.info(vo);
		service.register(vo);
		
		// journal/list로 이동하면서 result값( 글번호)을 전달함
		rttr.addFlashAttribute("result", vo.getJournal_pk());
		return "redirect:/journal/write";
	}

	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/read")
	public String read(@RequestParam("journal_pk") long journal_pk, Model model) {
		
		model.addAttribute("journal", service.read(journal_pk));
		return "/diary/journal/read";
		
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/modify")
	public String modify(@RequestParam("journal_pk") long journal_pk, Model model) {
		
		model.addAttribute("journal", service.read(journal_pk));
		return "/diary/journal/modify";
		
	}

	@PreAuthorize("isAuthenticated()")
	 //@PreAuthorize("principal.username == #vo.journal_writer")
	 @PostMapping("/modify")
	 public String modify(JournalVO vo) {
	 
		 System.out.println(vo);
		 log.info(vo);
	 service.modify(vo);
	 
	 return "redirect:/journal/read?journal_pk=" + vo.getJournal_pk(); 
	 }
	 
	//@PreAuthorize("principal.username == #vo.journal_writer")
	@PostMapping("/remove")
	public String remove(@RequestParam("journal_pk") long journal_pk, Model model, JournalVO vo) {
		
	service.remove(journal_pk);
	
	return "redirect:/journal/readAll";
	}
		
	/**
	 * 목록을 나타내주는 메서드
	 */
	@GetMapping("/readAll")
	public String readAll(Model model, Criteria cri) {
		model.addAttribute("readAll", service.getList(cri));
		int total=service.getListTotal();
		model.addAttribute("pageMaker", new PageDTO(total, cri));
		
		return "/diary/journal/readAll";
	}
	
	
	
	@GetMapping("/calendar")
	public String list() {
		
		return "/diary/journal/calendar";
	}
	

	
	
	
}
