package ems.icemile.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ems.icemile.dto.ProOrderDTO;
import ems.icemile.dto.MemberDTO;
import ems.icemile.dto.SellDTO;
import ems.icemile.enums.ProOrderStatus;
import ems.icemile.service.MemberServiceImpl;
import ems.icemile.service.SellServiceImpl;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/sell/*")
public class SellCopyController {

	@Inject
	private SellServiceImpl sellService;

	@GetMapping("/proOrderPopUp")
	public String ProOrderPopup(Model model) {
		
		// 수주 관리
		log.debug("수주관리 팝업창");
		
		// 수주 관리 리스트 객체 생성
		List<HashMap<String,Object>> proOrderList = new ArrayList<HashMap<String,Object>>();
		proOrderList = sellService.proOrderList();
		// 모델에 proOrderList값 저장
		model.addAttribute("proOrderList", proOrderList);
		
		
		// 주소 변경 x
		return "sell/proOrderPopUp";
	}
	
	

}
