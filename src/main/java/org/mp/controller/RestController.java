package org.mp.controller;


import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.mp.domain.Criteria;
import org.mp.domain.PageDTO;
import org.mp.service.RestDetailService;
import org.mp.service.RestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	    public ModelAndView list(Criteria cri ,ModelAndView mav, HttpServletRequest request) {
	    	HttpSession session = request.getSession();
	    	session.setAttribute("id", "TEST");
	        mav.setViewName("hotel");
	        mav.addObject("list", service.listRestPaging(cri));
	        mav.addObject("pageMaker", new PageDTO(cri,123));
	        return mav;
	    }
	    // 2. 상품 상세보기
	   
	    @GetMapping("/detail")
	    public ModelAndView detail(@RequestParam("restId") Long restId, @ModelAttribute("cri") Criteria cri, ModelAndView mav,HttpServletRequest request){
	    	HttpSession session = request.getSession();
	    
	    	mav.setViewName("hotelDetail");
	        mav.addObject("vo", service.detailRest(restId));
	        mav.addObject("room", service2.listRestDetail(restId));
			/*
			 * rttr.addAttribute("pageNum",cri.getPageNum());
			 * rttr.addAttribute("amount",cri.getAmount());
			 */
	        return mav;
	    }
	
	
}
