package org.mp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mp.domain.BoardVO;
import org.mp.domain.RestVO;
import org.mp.domain.ReviewVO;
import org.mp.service.AdRestService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/rest")
@RestController
@Log4j
@AllArgsConstructor
public class AdRestController {
	
	//숙소 목록
	private AdRestService service;
	
	@GetMapping(value="/pages/{page}",
			produces= {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_VALUE
			})
	public ResponseEntity<List<RestVO>> adRestList(){
		log.info("adRestList");
		
		return new ResponseEntity<>(service.adRestList(),HttpStatus.OK);
	}
	
	
	
	//숙소 삭제
	@RequestMapping(value = "/delete")
	public void adMemDelete(HttpServletRequest request) {
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i = 0; i <size;i++) {
			service.restDelete(ajaxMsg[i]);
		}
	}
	
	
}
