package org.mp.controller;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.mp.domain.ScheduleDTO;
import org.mp.service.*;


@Controller //view를 반환하기 위한 어노테이션
public class ScheduleController {

	@Inject
	private ScheduleService service;
	
	//일정 관리 페이지
	@RequestMapping(value = "/schedule")
	public String schedule(Model model)throws Exception {
		
		model.addAttribute("showSchedule" , service.showSchedule());
		
		return "/schedule";
	}
	
	//일정 추가 팝업
	@RequestMapping(value = "/schedulePopup")
	public String test2() throws Exception {
		return "/schedulePopup";
	}
	
	//일정 추가 버튼 클릭 Ajax
	@ResponseBody //데이터를 반환 하기 위해서는 @ReponsBody를 써야하며 controller는 Json 형태로 반환할 수 있다.
	@RequestMapping(value = "/addSchedule", method = RequestMethod.POST)
	public Map<Object,Object> addSchedule(@RequestBody ScheduleDTO dto) throws Exception{
		Map<Object,Object>map = new HashMap<Object,Object>();

		System.out.println(dto);
		dto.setId("TEST");
		service.addSchedule(dto);
	
		return map;
	}

	//일정 보이기 (임시)
	@ResponseBody
	@RequestMapping(value = "/showSchedule")
	public List<ScheduleDTO> showSchedule() throws Exception {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String id = auth.getName();
		
		List<ScheduleDTO> list = service.showSchedule();
		
		return list;
	}
}
