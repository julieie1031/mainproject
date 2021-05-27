package org.mp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class TestController {
	@GetMapping("/test")
	public void Test() {
		log.info("test");
	}
}