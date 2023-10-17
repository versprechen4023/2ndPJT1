package ems.icemile.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ems.icemile.annotation.UnUseAOP;
import ems.icemile.dto.CalendarDTO;
import ems.icemile.service.CalendarService;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/calendar_ajax/*")
public class CalendarAjaxController {

	@Inject 
	private CalendarService calendarService;
	
	@UnUseAOP
	@PostMapping("/calendarList")
	public List<CalendarDTO> calendarList(){
		log.debug("값 확인 ");
		return calendarService.calendarList();
	}
	
}
