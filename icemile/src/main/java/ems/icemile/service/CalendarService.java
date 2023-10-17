package ems.icemile.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ems.icemile.dao.CalendarDAO;
import ems.icemile.dto.CalendarDTO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CalendarService {

	@Inject 
	private CalendarDAO calendarDAO;

	public List<CalendarDTO> calendarList() {
		log.debug("서비스 | 캘린더 리스트");
		return calendarDAO.calendarList();
	}
	
}
