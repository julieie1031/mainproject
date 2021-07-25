package org.mp.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.mp.domain.CriteriaTip;
import org.mp.domain.TipAttachVO;
import org.mp.domain.TipPageDTO;
import org.mp.domain.TipVO;
import org.mp.service.TipService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/tip/*")
@AllArgsConstructor
public class TipController {
	private TipService service;

	@GetMapping("/list")
	public void list(CriteriaTip cri, Model model) {
		log.info("list :" + cri);
		model.addAttribute("list", service.getList(cri));
		int total = service.getTotal(cri);
		log.info("total : " + total);
		model.addAttribute("pageMaker", new TipPageDTO(cri,123));

	}

	@PostMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public String register(TipVO tip, RedirectAttributes rttr) {
		log.info("register : " + tip);
		if(tip.getAttachList() != null) {
			tip.getAttachList().forEach(attach -> log.info(attach));
		}
		log.info("===============================");
		service.register(tip);
		rttr.addFlashAttribute("result", tip.getTno());
		return "redirect:/tip/list";
	}

	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("tno")Long tno, Model model, @ModelAttribute("cri") CriteriaTip cri) {
		log.info("/get or modify");
		model.addAttribute("tip", service.get(tno));
	}

	@PreAuthorize("principal.username == #board.userId")
	@PostMapping("/modify")
	public String modify(TipVO tip, @ModelAttribute("cri") CriteriaTip cri, RedirectAttributes rttr) {
		log.info("modify" + tip);
		if(service.modify(tip)) {
			rttr.addFlashAttribute("result", "success");
		}

		rttr.addAttribute("pageNum", cri.getPageNum()); 
		rttr.addAttribute("amount", cri.getAmount()); 
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("type", cri.getType());

		return "redirect:/tip/list";
	}

	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<TipAttachVO>> getAttachList(Long tno) {
		log.info("getAttachList" + tno);

		return new ResponseEntity<>(service.getAttachList(tno), HttpStatus.OK);
	}

	@PreAuthorize("principal.username == #userId")
	@PostMapping("/remove")
	public String remove(@RequestParam("tno")Long tno, CriteriaTip cri,RedirectAttributes rttr, String userId) {
		log.info("remove" + tno);
		List<TipAttachVO> attachList = service.getAttachList(tno);
		if(service.remove(tno)) {
			deleteFiles(attachList);
			rttr.addFlashAttribute("result", "success");
		}

		rttr.addAttribute("pageNum", cri.getPageNum()); 
		rttr.addAttribute("amount", cri.getAmount()); 
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("type", cri.getType());

		return "redirect:/tip/list" + cri.getListLink();
	}

	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public void register() {

	}

	private void deleteFiles(List<TipAttachVO> attachList) {
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		attachList.forEach(attach->{
			try {
				Path file = Paths.get("c:/upload/"+ attach.getUploadPath() +"/"
						+ attach.getUuid() + "_" + attach.getFileName());
				Files.deleteIfExists(file);
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbNail =  Paths.get("c:/upload/" + attach.getUploadPath() + "/s_"
							+ attach.getUuid() + "_" + attach.getFileName());
					Files.delete(thumbNail);
				}
			} catch(Exception e) {
				log.info("delete file error : " + e.getMessage());
			}
		});
	}

}
