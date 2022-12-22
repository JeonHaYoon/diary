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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.domain.Criteria;
import com.google.domain.JournalVO;
import com.google.domain.ReplyVO;
import com.google.domain.TodoPageDTO;
import com.google.domain.TodoVO;
import com.google.service.TodoService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@AllArgsConstructor
@RequestMapping("/todo/*")
public class TodoRestController {
	
	private TodoService service;


	/**
	 * 댓글 수정
	 * PUT메소드, rno값은 주소 뒤에 넣어준다
	 * http://localhost/admin/replies/10
	 * {"bno":3,  "reply":"수업중", "replyer":"user00"}
	 * @param vo
	 * @param rno
	 * @return
	 */
		
	@RequestMapping(value = "/todolist/{todo_pk}", method = RequestMethod.POST)
    public ResponseEntity<String> modify(@RequestBody TodoVO vo, @PathVariable("todo_pk") int todo_pk){
        
		vo.setTodo_pk(todo_pk);
        
        return service.update(vo) == 1 
        ? new ResponseEntity<>("success", HttpStatus.OK) 
        : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
}
