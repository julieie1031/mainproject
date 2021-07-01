package org.mp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class LocationController {	
	@GetMapping("/location")
	public void location() {
		log.info("location");
	}
}
