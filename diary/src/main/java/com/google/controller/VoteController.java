package com.google.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.domain.Criteria;
import com.google.domain.PageDTO;
import com.google.domain.ReplyVO;
import com.google.domain.SelectVoteVO;
import com.google.service.SelectOneService;

@Controller
@RequestMapping("/select/*")
public class VoteController {
	
	SelectOneService service;
	
	@GetMapping("/vote")
	public String read() {
		
	
		return "/diary/select/vote";
		
	}
	
	@PostMapping(value = "/vote", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> Votecheck(@RequestBody SelectVoteVO vo) {

		System.out.println("로그"+vo);
		int insertCount = service.Votecheck(vo);

		return insertCount == 1 
				? new ResponseEntity<String>("Success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	} 

}
