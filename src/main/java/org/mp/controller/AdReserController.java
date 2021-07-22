package org.mp.controller;

import java.util.List;

import org.mp.domain.ReservationVO;
import org.mp.service.AdReserService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/reser")
@RestController
@Log4j
@AllArgsConstructor
public class AdReserController {
	
	private AdReserService service;
	
	@GetMapping(value="/pages/{page}",
			produces= {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_VALUE
			})
	public ResponseEntity<List<ReservationVO>> adReserList(){
		log.info("adReserList");
		
		return new ResponseEntity<>(service.adReserList(),HttpStatus.OK);
	}
	
	

}
