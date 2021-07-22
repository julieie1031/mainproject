package org.mp.controller;

import org.mp.domain.MainCriteria;
import org.mp.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class MainController {
	private BoardService service;
	
	@GetMapping("/main")
	
	public void main(MainCriteria cri, Model model) {
		log.info("main");
		model.addAttribute("hit", service.getHitList(cri));
	
	}

}
