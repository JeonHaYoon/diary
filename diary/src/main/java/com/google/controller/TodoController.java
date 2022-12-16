package com.google.controller;

import java.util.Arrays;
import java.util.Date;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.domain.Criteria;
import com.google.domain.TodoPageDTO;
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
	
	/**
	 * 작성된 할 일 조회 및 조회
	 * @param model
	 * @param vo
	 * @return
	 */
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/todolist")
	public String register(Model model, TodoVO vo) {
		//model.addAttribute("vo", vo);
		model.addAttribute("todoList", service.read());
		
		
		return"/diary/todo/todolist";

	}
	

	/**
	 * 할 일 등록
	 * @param vo
	 * @return
	 */
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/todolist")
	public String register(TodoVO vo) {
		//log.info(vo);
		service.register(vo);
		
		return "redirect:/todo/todolist";
	}
	
	
	
}
