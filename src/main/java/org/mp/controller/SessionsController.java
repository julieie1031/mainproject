package org.mp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/users")
public class SessionsController {
	
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
	
	//버튼 클릭시 GET방식으로 보내기
	
/*	//濡쒓렇�븘�썐
	@GetMapping("/login")
	public void loginInput(String error, String logout, Model model) {
		log.info("error: " + error);
		log.info("logout: " + logout);
		
		if(error != null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}
		
		if(logout != null) {
			model.addAttribute("logout", "Logout!!");
		
	}}*/
}
