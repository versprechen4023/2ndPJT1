package ems.icemile.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ems.icemile.dao.MemberDAOImpl;
import ems.icemile.dto.MemberDTO;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class AjaxController {
	
	@Inject //DAO 의존성 주입
	private MemberDAOImpl memberDAO;
	
	@PostMapping("/myNumber")
	public String myNumber(@RequestParam("myInt") int i) {
		log.debug("넘버는 : "+i);
		return Integer.toString(i);
	}
	
	@PostMapping("/myList")
	public List<MemberDTO> myList() {
		
		List<MemberDTO> memberInfo = new ArrayList<MemberDTO>();
		memberInfo = memberDAO.getMemberList();
		return memberInfo;
	}
	
	@PostMapping("/myJson")
	public String myJson(@RequestBody HashMap<String, Object> map) {
		log.debug("JSON데이터는 " + map);
		String id = (String)map.get("id");
		return id;
	}
	
	@PostMapping("/myMap")
	public HashMap<String, Object> myMap() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", "kim");
		map.put("num", 1);
		map.put("fun", "굿");
		
		return map;
	}
}
