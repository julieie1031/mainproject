package org.mp.controller;

import java.util.List;

import org.mp.domain.NoticeVO;
import org.mp.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/notice/*")
 @AllArgsConstructor
public class NoticeController {
	@Setter(onMethod_ = {@Autowired})
	private NoticeService service;
	
	@GetMapping("/list")
	public void getList(Model model) {
		log.info("list......");
		List<NoticeVO> list = service.getList();
		model.addAttribute("list",list);
	}
	@GetMapping("/get")
	public void get() {
		log.info("get...");
	}
}
