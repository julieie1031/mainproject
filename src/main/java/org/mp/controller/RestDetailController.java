package org.mp.controller;


import org.mp.service.RestDetailService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/room/*")
@AllArgsConstructor
public class RestDetailController {

	private RestDetailService service;
	
	@GetMapping("/list")
	public ModelAndView list(@RequestParam("restId") Long restId, ModelAndView mav) {
		
		mav.setViewName("roomDetail");
		mav.addObject("room", service.listRestDetail(restId));
		return mav;
	}
	
}
