package com.google.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.domain.Criteria;
import com.google.domain.JournalVO;
import com.google.domain.SelectOneVO;
import com.google.domain.PageDTO;
import com.google.domain.SelectOneAttachDTO;
import com.google.service.SelectOneService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@Log4j
@RequestMapping("/select/*")
public class SelectOneController {

	private SelectOneService service;
	
	@PreAuthorize("isAuthenticated()")
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
		return "redirect:/select/selectList";
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/selectRead")
	public String read(@RequestParam("select_pk") long select_pk, Model model, Criteria cri) {
		
		model.addAttribute("select", service.read(select_pk));
		model.addAttribute("pageMaker", new PageDTO(cri));
		return "/diary/select/selectRead";
		
	}
	
	@GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<SelectOneAttachDTO>> getAttachList(Long select_pk){
		
		
		return new ResponseEntity<List<SelectOneAttachDTO>>(service.getAttachList(select_pk), HttpStatus.OK);
		
	}
	
	/**
	 * 목록을 나타내주는 메서드
	 */
	@GetMapping("/selectList")
	public String list(Model model, Criteria cri) {
		model.addAttribute("list", service.getList(cri));
		int total=service.getListTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(total, cri));
		
		return "/diary/select/selectList";
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/selectModify")
	public String modify(@RequestParam("select_pk") long select_pk, Model model) {
		
		model.addAttribute("select", service.read(select_pk));
		return "/diary/select/selectModify";
		
	}

	@PreAuthorize("isAuthenticated()")
	 //@PreAuthorize("principal.username == #vo.journal_writer")
	 @PostMapping("/selectModify")
	 public String modify(SelectOneVO vo) {
	 
		 System.out.println(vo);
		 log.info(vo);
	 service.modify(vo);
	 
	 return "redirect:/select/selectRead?select_pk=" + vo.getSelect_pk(); 
	 }
	
	@PostMapping("/selectRemove")
	public String remove(@RequestParam("select_pk") long select_pk, Model model) {
		service.remove(select_pk);
	
	return "redirect:/select/selectList";
	}
}