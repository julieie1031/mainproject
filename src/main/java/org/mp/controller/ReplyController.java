package org.mp.controller;


import org.mp.domain.Criteria;
import org.mp.domain.ReplyPageDTO;
import org.mp.domain.ReplyVO;
import org.mp.service.ReplyService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@RequestMapping("/replies")
@RestController
@Log4j
@AllArgsConstructor
public class ReplyController {
	private ReplyService service;
	
	//댓글 등록 - /replies/new, POST 전송방식 사용
	//로그인 한 사용자가 맞으면 true
	//@PreAuthorize("isAuthenticated()")
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyVO vo) {
		log.info("ReplyVO : " + vo);
		int insertCount = service.register(vo);
		log.info("Reply INSERT COUNT : " + insertCount);
		return insertCount ==1 ? new ResponseEntity<>("success", HttpStatus.OK):new ResponseEntity<>
		(HttpStatus.INTERNAL_SERVER_ERROR); //삼항 연산자 처리
	}
	
	//특정 게시물의 댓글 목록 - /replies/pages/:bno/:page, GET 전송방식 사용
	@GetMapping(value = "/pages/{bno}/{page}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<ReplyPageDTO> getList(@PathVariable("page")int page, @PathVariable("bno")Long bno) {
		log.info("getList....");
		Criteria cri = new Criteria(page, 5);
		log.info("cri : " + cri);
		return new ResponseEntity<> (service.getListPage(cri, bno), HttpStatus.OK);
	}
	
	//댓글 조회 - /replies/:rno, GET 전송방식 사용
	@GetMapping(value = "/{rno}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<ReplyVO> get(@PathVariable("rno")Long rno) {
		log.info("get : " +rno);
		return new ResponseEntity<> (service.get(rno), HttpStatus.OK);
	}
	
	//댓글 삭제 - /replies/:rno, DELETE 전송방식 사용
	@PreAuthorize("principal.username == #vo.userId")
	@DeleteMapping(value = "/{rno}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@RequestBody ReplyVO vo, @PathVariable("rno")Long rno) {
		log.info("remove : " + rno);
		log.info("userId : " + vo.getUserId());
		return service.remove(rno) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>
		(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//댓글 수정 - /replies/:rno, PUT or PATCH 전송방식 사용
	@PreAuthorize("principal.username == #vo.userId")
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH }, value = "/{rno}", 
			consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modify(@RequestBody ReplyVO vo, @PathVariable("rno") Long rno) {
		vo.setRno(rno);
		log.info("rno: " + rno);
		log.info("modify: " + vo);
		return service.modify(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}
	
}
