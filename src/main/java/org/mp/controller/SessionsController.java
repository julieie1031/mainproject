package org.mp.controller;

import java.util.List;

import org.mp.domain.ReservationVO;
import org.mp.mapper.ReservationMapper;
import org.mp.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/users")
public class SessionsController {
	@Autowired
	private MemberService service;
	@Setter(onMethod_ = {@Autowired})
	private ReservationMapper reservationMapper;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		log.info("login requested");
		return "/users/login";
	}
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage() {
		log.info("mypage requested");
		return "/users/mypage";
	}
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout() {
		log.info("logout requested");
		return "redirect:/main";
	}
	//view 페이지
	@RequestMapping(value = "/userModify", method= RequestMethod.GET)
	public String update() {
		log.info("Modify requested");
		return "/users/userModify"; 
	}
	@RequestMapping(value="/userDelete", method = RequestMethod.GET)
	public String delete() {
		log.info("delete requested");
		return "/users/userDelete"; 
	}
	@RequestMapping(value="/roomList", method= {RequestMethod.GET, RequestMethod.POST})
	public String roomList(@RequestParam(value = "userId",required=false) String userId,Model model) {
		log.info("roomList requested");
		List<ReservationVO> list = service.reservationList(userId);
		log.info("roomList_OK3");	
		model.addAttribute("list",list);
		return "/users/roomList"; 
	}
	
}
