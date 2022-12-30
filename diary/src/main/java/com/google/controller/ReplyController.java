package com.google.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.domain.Criteria;
import com.google.domain.PageDTO;
import com.google.domain.ReplyPageDTO;
import com.google.domain.ReplyVO;
import com.google.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/reply/*")
@Log4j
@AllArgsConstructor
public class ReplyController {

	private ReplyService service;

	/**
	 * 댓글등록
	 */

	@PostMapping(value = "/new", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> create(@RequestBody ReplyVO vo) {

		System.out.println("로그"+vo);
		int insertCount = service.insert(vo);

		return insertCount == 1 
				? new ResponseEntity<String>("Success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	/**
	 * 댓글한개조회
	 * @param rno
	 * @param model
	 * @return
	 */
	@GetMapping(value = "/{rno}")
	public ResponseEntity<ReplyVO> get(@PathVariable("rno") Long rno, Model model){
		
		
		return new ResponseEntity<ReplyVO>(service.read(rno), HttpStatus.OK);
	}
	
	/**
	 *  특정게시물 댓글 확인
	 * http://localhost/admin/replies/pages/3/1
	 * , produces = {MediaType.APPLICATION_XML_VALUE}
	 * @param page
	 * @param select_pk
	 * @return
	 */
	@GetMapping(value = "/pages/{select_pk}/{page}")
	public ResponseEntity<ReplyPageDTO> getList(@PathVariable("page") int page,
												@PathVariable("select_pk") long select_pk){
	
		Criteria cri = new Criteria(page, 10);
		log.info(cri);
		return new ResponseEntity<ReplyPageDTO>(service.getListWithPaging(cri, select_pk), HttpStatus.OK);
	}
	
	/**
	 * 댓글삭제
	 * @param vo
	 * @param rno
	 * @return
	 */
	//@PreAuthorize("principal.username == #vo.replyer")
	@DeleteMapping(value = "/{rno}")
	public ResponseEntity<String> remove(@PathVariable("rno") Long rno){
		int deleteCount = service.delete(rno);
		log.info(rno);
		
		return deleteCount == 1
				? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);	
	}
	
	/**
	 * 댓글 수정
	 * PUT메소드, rno값은 주소 뒤에 넣어준다
	 * http://localhost/admin/replies/10
	 * {"bno":3,  "reply":"수업중", "replyer":"user00"}
	 * @param vo
	 * @param rno
	 * @return
	 */
	@PutMapping(value = "/{rno}")
	public ResponseEntity<String> modify(@RequestBody ReplyVO vo,
										@PathVariable("rno") Long rno){
		vo.setRno(rno);
		int updateCount = service.update(vo);
		
		return updateCount == 1 
			?	new ResponseEntity<String>("success", HttpStatus.OK)
			:  	new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
