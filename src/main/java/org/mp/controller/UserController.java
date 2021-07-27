package org.mp.controller;


import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mp.domain.AuthVO;
import org.mp.domain.MemberVO;
import org.mp.domain.ReservationVO;
import org.mp.mapper.MemberMapper;
import org.mp.mapper.ReservationMapper;
import org.mp.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCrypt;
/*import org.springframework.security.crypto.password.PasswordEncoder;*/
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
public class UserController {

	@Autowired
	private MemberService service;
	@Setter(onMethod_=@Autowired)
	private BCryptPasswordEncoder pwencoder;
	@Setter(onMethod_ = {@Autowired})
	private MemberMapper memberMapper;
	@Setter(onMethod_ = {@Autowired})
	private ReservationMapper reservationMapper;
	@Autowired
	private JavaMailSender mailSender;

	//	@ResponseBody - 데이터만 보낼 때
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String create(@ModelAttribute MemberVO member,RedirectAttributes rttr) throws Exception {
		member.setUserPwd(BCrypt.hashpw(member.getUserPwd(), BCrypt.gensalt()));
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
	public String memberUpdate(@ModelAttribute MemberVO vo) {
		vo.setUserPwd(BCrypt.hashpw(vo.getUserPwd(), BCrypt.gensalt()));
		service.memberUpdate(vo);

		return "redirect:/users/mypage";
	}
	@RequestMapping(value="/delete", method = RequestMethod.POST)
	public String delete(@RequestParam("userId") String userId, @RequestParam("userPwd") String userPwd, MemberVO vo, HttpSession session) {
		log.info("delete_OK");

		log.info("pwd :"+ vo.getUserPwd());

		vo = memberMapper.read(userId);

		log.info(pwencoder.matches(userPwd, vo.getUserPwd()));

		if(pwencoder.matches(userPwd, vo.getUserPwd())) {

			log.info("일치");	

			service.delete(userId);
			session.invalidate();

			log.info("delete_OK2");	

			return "redirect:/users/login";
		} else {
			log.info("불일치");	
			return "redirect:/users/userDelete";
		}
	}
	/* 이메일 인증 */
	@RequestMapping(value="/mailCheck", method=RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email) throws Exception{

		/* 뷰(View)로부터 넘어온 데이터 확인 */
		log.info("이메일 데이터 전송 확인");
		log.info("입력받은 이메일 : " + email);

		/* 인증번호(난수) 생성 */
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		log.info("인증번호 " + checkNum);

		/* 이메일 보내기 */
		String setFrom = "123mailtesting456@gmail.com";
		String toMail = email;
		String title = "회원가입 인증 이메일 입니다.";
		String content = 
				"어서오세요, 알래주개를 방문해주셔서 감사합니다." +
						"<br><br>" + 
						"인증 번호는 " + checkNum + "입니다." + 
						"<br>" + 
						"해당 인증번호를 인증번호 확인란에 기입하여 주세요.";


		try {

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true);
			mailSender.send(message);

		}catch(Exception e) {
			e.printStackTrace();
		}
		String num = Integer.toString(checkNum);
		return num;

	}





	/*
	 * @RequestMapping(value="/idCheck", method = RequestMethod.POST) public int
	 * idcheck(HttpServletRequest req) throws Exception { log.info("Id Check");
	 * 
	 * String userId = req.getParameter("userId"); MemberVO idCheck =
	 * service.idCheck(userId);
	 * 
	 * int result = 0;
	 * 
	 * if(idCheck != null) { result = 1; }
	 * 
	 * return result;
	 * 
	 * }
	 */

	/*
	 * String oldPass = user.getUserPwd(); String newPass = vo.getUserPwd();
	 * log.info("delete_OK3"); if(oldPass.equals(newPass)) {
	 */

	/*		} else {
			return "redirect:/users/userDelete";
		}*/

	/*
	 * //탈퇴
	 * 
	 * @RequestMapping("/memberDelete", method = RequestMethod.POST) public String
	 * deleteMember (@RequestParam("userPwd") String userPwd, RedirectAttributes
	 * redirectAttr, SessionStatus sessionStatus) {
	 * 
	 * int result = service.memberDelete(userPwd);
	 * 
	 * if(result>0) { redirectAttr.addFlashAttribute("msg", "성공적으로 회원정보를 삭제했습니다.");
	 * SecurityContextHolder.clearContext(); } else
	 * redirectAttr.addFlashAttribute("msg", "회원정보삭제에 실패했습니다.");
	 * 
	 * return "redirect:/"; }
	 */
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