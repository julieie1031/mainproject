package org.mp.controller;


import javax.servlet.http.HttpServletRequest;


import javax.servlet.http.HttpSession;

import org.mp.domain.Criteria;
import org.mp.domain.PageDTO;
import org.mp.service.RestDetailService;
import org.mp.service.RestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;

@Controller // view를 반환하기 위한 어노테이션
@RequestMapping("/hotel/*")
@AllArgsConstructor
public class RestController {

	    @Autowired
	    private RestService service;
		private RestDetailService service2;
	    

	    // 1. 상품 전체 목록
	    @GetMapping("/list")
	    public void list(Criteria cri ,Model model) {

	    	model.addAttribute("list", service.listRestPaging(cri));
	    	model.addAttribute("pageMaker", new PageDTO(cri,123));
	    
	    }
	    // 2. 상품 상세보기
	   
	    @GetMapping("/detail")
	    public void detail(@RequestParam("restId") Long restId, @ModelAttribute("cri") Criteria cri, Model model){
	
	    	model.addAttribute("vo", service.detailRest(restId));
	    	model.addAttribute("room", service2.listRestDetail(restId));
	
	    }
	
	
}
