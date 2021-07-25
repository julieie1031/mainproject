package org.mp.controller;

import java.util.List;

import org.mp.domain.CriteriaNotice;
import org.mp.domain.NoticePageDTO;
import org.mp.domain.NoticeVO;
import org.mp.service.NoticeService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j 
@RequestMapping("/notice/*")
@AllArgsConstructor
public class NoticeController {
	private NoticeService service;
	
//	list 조회
	@GetMapping("/list")
	public void getList(CriteriaNotice cri,Model model) {
		log.info("list......");
		List<NoticeVO> list = service.getList(cri);
		model.addAttribute("list",list);
		log.info(list);
		int total = service.getTotal(cri);
		log.info("total : " + total);
		model.addAttribute("pageMaker", new NoticePageDTO(cri,123));
	}
	
//	리스트 nno번호 읽어오기
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("nno")Long nno, Model model, @ModelAttribute("cri") CriteriaNotice cri) {
		log.info("/get or modify");
		model.addAttribute("notice", service.get(nno));
	}
//	@GetMapping("/get")
//	public void get(@RequestParam("nno") Long nno, Model model) {
//		log.info("get...");
//		model.addAttribute("notice",service.get(nno));
//	}
	
//	공지글 추가
	@PostMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public String register(NoticeVO notice, RedirectAttributes rttr) {
		log.info("register : " + notice);
		log.info("===============================");
		service.register(notice);
		rttr.addFlashAttribute("result", notice.getNno());
		return "redirect:/notice/list";
	}
	
	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public void register() {

	}
//	공지글 수정
	@PreAuthorize("principal.username == #notice.userId")
	@PostMapping("/modify")
	public String modify(NoticeVO notice, @ModelAttribute("cri") CriteriaNotice cri, RedirectAttributes rttr) {
		log.info("modify" + notice);
		if(service.modify(notice)) {
			rttr.addFlashAttribute("result", "success");
		}

		rttr.addAttribute("pageNum", cri.getPageNum()); 
		rttr.addAttribute("amount", cri.getAmount()); 
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("type", cri.getType());

		return "redirect:/notice/list";
	}
	
	@PreAuthorize("principal.username == #userId")
	@PostMapping("/remove")
	public String remove(@RequestParam("nno")Long nno, CriteriaNotice cri,RedirectAttributes rttr, String userId) {
		log.info("remove" + nno);

		rttr.addAttribute("pageNum", cri.getPageNum()); 
		rttr.addAttribute("amount", cri.getAmount()); 
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("type", cri.getType());

		return "redirect:/notice/list" + cri.getListLink();
	}
	
	
//	@RequestMapping(value="/register", method = {RequestMethod.GET, RequestMethod.POST})
//	public String register(NoticeVO notice,RedirectAttributes rttr) {
//		log.info("register..."+notice);
//		service.register(notice);
//		rttr.addFlashAttribute("result", notice.getNno());
//		return "redircet:/notice/list"; 
//	}
	
	
//	@PostMapping("/modify")
//	public String modify(NoticeVO notice, RedirectAttributes rttr) {
//		log.info("modify"+notice);
//		if(service.modify(notice)) {
//			rttr.addFlashAttribute("result","success");
//		}
//		return "redirect:/notice/list";
//	}
	
	
//	@PostMapping("/remove")
//	public String remove(@RequestParam("nno") Long nno, RedirectAttributes rttr) {
//		log.info("remove...."+nno);
//		if(service.remove(nno)) {
//			rttr.addFlashAttribute("result","success");
//		}
//		return "redirect:/notice/list";
//	}
}
