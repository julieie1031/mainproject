package org.mp.controller;

import java.util.List;

import org.mp.domain.BoardVO;
import org.mp.domain.Criteria;
import org.mp.domain.ReviewVO;
import org.mp.service.ReviewService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/reviews")
@RestController
@Log4j
//review service 타입의 객체를 필요로 하는 생성자 
@AllArgsConstructor
public class ReviewController {
	
	private ReviewService service;
	
	
	//등록
	//post 방식으로만 동작 , consumes와produce를 이용하여 json방식의 데이터만 처리
	@PostMapping(value="/new",
			consumes="application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReviewVO vo){ //requestbody를 이용하여 json 데이터를 reviewVO 타입으로 변환
		log.info("ReviewVO : " + vo);
		int insertCount = service.register(vo);
		
		if(insertCount ==1) {
			float starResult = service.starAvg(vo.getRestId());
			if(starResult == 1) return new ResponseEntity<>("success",HttpStatus.OK);
            else return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		log.info("Review INSERT COUNT : " + insertCount);
		
		return insertCount == 1? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//특정 호텔의 리뷰 확인
	@GetMapping(value="/pages/{restId}/{page}",
			produces= {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_VALUE
			})
	public ResponseEntity<List<ReviewVO>> getList(
			@PathVariable("page") int page,
			@PathVariable("restId") Long restId
			){
		log.info("getList");
		Criteria cri = new Criteria(page,10);
		log.info(cri);
		return new ResponseEntity<>(service.getList(cri, restId),HttpStatus.OK);
	}
	
	
	//리뷰조회
	@GetMapping(value="/{reno}",
			produces= {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_VALUE
			})
	public ResponseEntity<ReviewVO> get(@PathVariable("reno") Long reno){
		log.info("get: "+reno);
		return new ResponseEntity<>(service.get(reno),HttpStatus.OK);
	}
	
	//리뷰삭제
	@DeleteMapping(value = "/{reno}",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("reno")Long reno) {
		log.info("remove:" + reno);
		return service.remove(reno) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) 
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//리뷰수정
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH },
			value = "/{reno}", 
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modify(@RequestBody ReviewVO vo, @PathVariable("reno") Long reno) {
		vo.setReno(reno);
		log.info(vo.getStar());
		log.info("reno:" + reno);
		log.info("modify:" + vo);
		return service.modify(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}
	
	
	

}
