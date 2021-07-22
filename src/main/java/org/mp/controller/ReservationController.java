package org.mp.controller;

import javax.inject.Inject;


import org.mp.domain.ReservationVO;
import org.mp.mapper.ReservationMapper;
import org.mp.service.KakaoPay;
import org.mp.service.MemberService;
import org.mp.service.ReservationService;
import org.mp.service.RestDetailService;
import org.mp.service.RestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/reserve/*")
@AllArgsConstructor
public class ReservationController {

	@Setter(onMethod_ = @Autowired)
	private KakaoPay kakaopay;
	@Autowired
	private MemberService memservice;
	@Setter(onMethod_ = {@Autowired})
	private ReservationMapper reservationMapper;

	@Inject
	private ReservationService service;
	private RestService service2;
	private RestDetailService service3;

	@GetMapping("/list")
	public void List(@RequestParam("restId") Long restId, @RequestParam("roomId") Long roomId,
			@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate, Model model) {
		model.addAttribute("vo", service2.detailRest(restId));
		model.addAttribute("room", service3.roomRestDetail(roomId));
		model.addAttribute("startDate",startDate);
		model.addAttribute("endDate",endDate);
	}

	@PostMapping("/list")
	public String kakaoPay(ReservationVO reser) {
		log.info("kakaoPay post............................................");
//		String roomPrice = Integer.toString(roomPriceL);
//		log.info(roomName);
		return "redirect:" + kakaopay.kakaoPayReady(reser);

	}
	
	

	@RequestMapping("/kakaoPaySuccess")
	public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token,@RequestParam(value="userId",required=false) String userId, Model model,ReservationVO reser) {
		log.info(reser.getDogNumber());
		log.info(reser.getDogType());
		
		log.info("kakaoPaySuccess get............................................");
		log.info("kakaoPaySuccess pg_token : " + pg_token);
		
		model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token));
		List<ReservationVO> list = memservice.reservationList(userId);
		model.addAttribute("list",list);
		return "redirect:/users/mypage"; 
	}
}
