package com.google.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/journal")
public class JournalController {

	@GetMapping("/write")
	public String write() {
		
		return "/diary/journal/write";
	}
	
	@GetMapping("/read")
	public String read() {
		
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
