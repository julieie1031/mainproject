package org.mp.controller;

import java.util.List;

import org.mp.domain.CriteriaTip;
import org.mp.domain.TipVO;
import org.mp.service.BoardService;
import org.mp.service.NoticeService;
import org.mp.service.TipService;
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
	private NoticeService service2;
	private TipService service3;
	
	@GetMapping("/main")
	
	public void main(Model model,CriteriaTip cri) {
		log.info("main");
		model.addAttribute("hit", service.getHitList());
		model.addAttribute("notice",service2.mainNotice());
		List<TipVO> tip = service3.getList(cri);
		model.addAttribute("tip", tip);
	}
	

}
