package com.google.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.domain.TodoVO;
import com.google.service.TodoService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
@RequestMapping("/todo/*")
public class TodoController {
	
	private TodoService service;
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/todolist")
	public String register() {
		
		
		return"/diary/todo/todolist";

	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/todolist")
	public String register(TodoVO vo) {
		//log.info(vo);
		service.register(vo);
		
		return "redirect:/todo/todolist";
	}
}
