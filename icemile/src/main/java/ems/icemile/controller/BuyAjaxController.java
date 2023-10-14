package ems.icemile.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ems.icemile.dto.BuyDTO;
import ems.icemile.dto.MemberDTO;
import ems.icemile.dto.SellDTO;
import ems.icemile.service.BuyServiceImpl;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/buy_ajax/*")
public class BuyAjaxController {

	@Inject // 바이 서비스 의존성 주입
	private BuyServiceImpl buyService;
	

	@PostMapping("/insert")
	public String insert(BuyDTO buyDTO, HttpSession session) throws Exception {
		
		log.debug("값 잘 넘어오나 "+buyDTO.toString());
		
		return Boolean.toString(buyService.buyInsert(buyDTO));
	}
    
	@PostMapping("/update")
	public String buyUpdate(BuyDTO buyDTO) throws Exception {
		
		log.debug("값 잘 넘어오나 "+buyDTO.toString());
		
		return Boolean.toString(buyService.buyUpdate(buyDTO));
	}
	
	@PostMapping("delete")
	public String buyDelete(@RequestParam("buy_code") String buy_code) {
		log.debug("바이 딜리트 AJAX 호출");
		
		return Boolean.toString(buyService.buyDelete(buy_code));
		
	}
	
	@PostMapping("search")
	public List<BuyDTO> buySearch(@RequestBody HashMap<String, Object> json) {
		
		log.debug("바이 서치 AJAX 호출");
		
		// 멤버리스트를 가져오기위한 멤버리스트 객체생성
		List<BuyDTO> buyList = new ArrayList<BuyDTO>();
		//결과값에 따라 멤버리스트를 가져온다
		buyList = buyService.buySearch(json);
		
		// 콜백 함수에 결과값 리턴
		return buyList;
	}
	
	@GetMapping("searchEmail")
	public String searchEmail(@RequestParam("buy_email") String buy_email) {
		
		log.debug("{} 값 확인", buy_email);
		
		return Boolean.toString(buyService.searchEmail(buy_email));
	}
	
	@GetMapping("searchPhone")
	public String searchPhone(@RequestParam("buy_phone") String buy_phone) {
		
		log.debug("{} 값 확인", buy_phone);
		
		return Boolean.toString(buyService.searchPhone(buy_phone));
	}
	
}
