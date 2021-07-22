package org.mp.controller;

import org.mp.domain.Criteria;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Log4j
@Controller
@RequestMapping("/admin/*")
@AllArgsConstructor
public class AdminController {
	
	@GetMapping("/index")
	public void index() {
		log.info("index requested");
		
	}
	
	@GetMapping(value = "/adMember")
	public void adMember(Criteria cri ,Model model) {
		log.info("adMember requested");
	}
	
	@GetMapping(value = "/adRest")
	public void adRest() {
		log.info("adRest requested");
		
	}
	
	@GetMapping(value = "/adReser")
	public void adReser() {
		log.info("adReser requested");
		
	}

}
