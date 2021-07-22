package org.mp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mp.domain.AuthVO;
import org.mp.domain.Criteria;
import org.mp.domain.MemberVO;
import org.mp.service.AdAuthService;
import org.mp.service.AdMemberService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/members")
@RestController
@Log4j
@AllArgsConstructor
public class AdMemberController {
	
	//회원 목록
	private AdMemberService service;
	private AdAuthService authService;
	
	@GetMapping(value="/pages/{page}",
			produces= {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_VALUE
			})
	public ResponseEntity<List<MemberVO>> adMemList(){
		log.info("adMemList");
		
		return new ResponseEntity<>(service.adMemList(),HttpStatus.OK);
	}
	
	
	//회원 삭제
		@RequestMapping(value = "/delete")
		public void adMemDelete(HttpServletRequest request) {
			String[] ajaxMsg = request.getParameterValues("valueArr");
			int size = ajaxMsg.length;
			for(int i = 0; i <size;i++) {
				service.memDelete(ajaxMsg[i]);
			}
			
		}
		
		
		
		//회원 수정
				@RequestMapping(value = "/update")
				public void adMemUpdate(HttpServletRequest request) {
					String[] ajaxMsg = request.getParameterValues("valueArr");
					String auth = request.getParameter("auth");
					int size = ajaxMsg.length;
					for(int i = 0; i <size;i++) {
						authService.memUpdate(ajaxMsg[i],auth);
					}
					
				}
}
