package ems.icemile.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ems.icemile.dto.ProOrderDTO;
import ems.icemile.dto.SellDTO;
import ems.icemile.service.SellServiceImpl;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/sell_ajax/*")
public class SellAjaxController {
	
	@Inject // 멤버 서비스 의존성 주입
	private SellServiceImpl sellService;
	
	@PostMapping("delete")
	public String memberDelete(@RequestParam("branch_code")String branch_code) {
		
		log.debug("지점 딜리트 AJAX 호출");
		
		// 콜백 함수에 결과값 리턴
		return Boolean.toString(sellService.branchDelete(branch_code));
	}
	
	@PostMapping("search")
	public List<SellDTO> branchSearch(@RequestBody HashMap<String, Object> json) {
		
		log.debug("지점 서치 AJAX 호출");
		
		// 멤버리스트를 가져오기위한 멤버리스트 객체생성
		List<SellDTO> branchList = new ArrayList<SellDTO>();
		//결과값에 따라 멤버리스트를 가져온다
		branchList = sellService.branchSearch(json);
		
		// 콜백 함수에 결과값 리턴
		return branchList;
	}
	
	@PostMapping("/insert")
	public String insert(SellDTO sellDTO, HttpSession session) throws Exception {
		
		log.debug("값 잘 넘어오나 "+sellDTO.toString());
		
		return Boolean.toString(sellService.branchReg(sellDTO));
	}
	
	@PostMapping("/update")
	public String branchUpdate(SellDTO sellDTO) throws Exception {
		
		log.debug("값 잘 넘어오나 "+sellDTO.toString());
		
		return Boolean.toString(sellService.branchUpdate(sellDTO));
	}
	
	@GetMapping("searchEmail")
	public String searchEmail(@RequestParam("branch_email") String branch_email) {
		
		log.debug("{} 값 확인", branch_email);
		
		return Boolean.toString(sellService.searchEmail(branch_email));
	}
	
	@GetMapping("searchPhone")
	public String searchPhone(@RequestParam("branch_phone") String branch_phone) {
		
		log.debug("{} 값 확인", branch_phone);
		
		return Boolean.toString(sellService.searchPhone(branch_phone));
	}
	
	@PostMapping("proOrderUpdate")
	public boolean proOrderUpdate(ProOrderDTO proOrderDTO) {
		
		log.debug("proOrderUpdate ajax 실행");
		
		return sellService.proOrderUpdate(proOrderDTO);
	}
	
	@PostMapping("proOrderInsert")
	public boolean proOrderInsert(ProOrderDTO proOrderDTO) {
		
		log.debug("proOrderInsert ajax 실행");
				
		return sellService.proOrderInsert(proOrderDTO);
	}
	
	@PostMapping("proOrderDelete")
	public boolean proOrderDelete(@RequestParam("selectedProOrderId") String[] selectedProOrderId) {
		
		log.debug("proOrderDelete ajax 실행");
		
		// 마이바티스에서 반복처리를 위해 배열을 리스트 타입으로 변경
		List<String> deleteProList = Arrays.asList(selectedProOrderId);
				
		return sellService.proOrderDelete(deleteProList);
	}

}
