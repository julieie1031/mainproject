package org.mp.controller;


import javax.servlet.http.HttpSession;

import org.mp.domain.AuthVO;
import org.mp.domain.MemberVO;
import org.mp.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;


@Controller
@Log4j
public class UserController {

	@Autowired
	private MemberService service;

//	@ResponseBody - 데이터만 보낼 때
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String create(@ModelAttribute MemberVO member,RedirectAttributes rttr) throws Exception {
		service.insertMember(member);
		service.insertAuth(new AuthVO(member.getUserId(), "ROLE_MEMBER"));
		log.info("just joined");
		return "redirect:/users/login";
	}
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join(Model model) {
		MemberVO member = new MemberVO();
		model.addAttribute("member", member);
		return "join";
	}
	@RequestMapping(value = "/memberUpdate", method = RequestMethod.POST)
	public String memberUpdate(Model model, RedirectAttributes rttr) throws Exception{
		MemberVO vo = new MemberVO();
		model.addAttribute("vo", vo);
		service.memberUpdate(vo);
		
		return "redirect:/users/mypage";
	}
	/*
	 * // �쉶�썝�깉�눜
	 * 
	 * @RequestMapping(value = "/withdrawal", method = RequestMethod.POST) public
	 * String withdrawal_form(@ModelAttribute Member member, HttpSession session,
	 * HttpServletResponse response) throws Exception{
	 * if(userMapper.withdrawal(member, response)) { session.invalidate(); } return
	 * "redirect:/login"; }
	 */
}