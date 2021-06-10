package org.mp.controller;

import org.mp.service.RestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/hotel/*")
public class RestController {

	    @Autowired
	    RestService restService;

	    // 1. 상품 전체 목록
	    @RequestMapping("/list")
	    public ModelAndView list(ModelAndView mav) {
	        mav.setViewName("hotel");
	        mav.addObject("list", restService.listRest());
	        return mav;
	    }
	    // 2. 상품 상세보기
	    @RequestMapping("/detail/{restId}")
	    public ModelAndView detail(@PathVariable("restId") String restId, ModelAndView mav){
	        mav.setViewName("hotelDetail");
	        mav.addObject("vo", restService.detailRest(restId));
	        return mav;
	    }
	
	
}
