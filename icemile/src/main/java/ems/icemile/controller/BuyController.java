package ems.icemile.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ems.icemile.dto.BuyDTO;
import ems.icemile.dto.MemberDTO;
import ems.icemile.service.BuyServiceImpl;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/buy/*")
public class BuyController {
	
	// 바이 서비스 의존성 주입
	@Inject
	private BuyServiceImpl buyService;
	
	@GetMapping("/buyList")
	public String getBuyList(Model model) {
		
		//거래처 조회
		log.debug("buyList");
		
		// 거래처 리스트를 가져오기위한 거래처 리스트 객체생성
		List<BuyDTO> buyList = new ArrayList<BuyDTO>();
		buyList = buyService.getBuyList();
		
		// 모델에 멤버 DTO값 저장
		model.addAttribute("buyList", buyList);
		
		return "/buy/buyList";
	}
	
	@GetMapping("/buyInsert")
	public String buyInsert() {
		
		log.debug("거래처 추가 페이지");
		
		return "buy/buyInsert";
	}

	@PostMapping("/buyInsertPro")
	public String insertPro(BuyDTO buyDTO) {
		System.out.println("BuyController insertPro");
		// 구매처 등록 
		System.out.println(buyDTO);
		buyService.buyInsert(buyDTO);
		
		return "redirect:/buy/buyList";
	}
	
	@GetMapping("/buyUpdate")
	public String buyUpdate(@RequestParam("buy_code") String buy_code, Model model) {
		log.debug("거래처 수정 페이지");
		
		// 거래처 정보를 얻기 위한 메소드 호출
		BuyDTO buyDTO = buyService.getBuyInfo(buy_code);
		
		// 모델에 바이 DTO값 저장
		model.addAttribute("buyDTO", buyDTO);
		
		return "buy/buyUpdate";
			
		
	}
	
	@PostMapping("/buyUpdatePro")
	public String branchUpdatePro(BuyDTO buyDTO) {
		log.debug("거래처 업데이트");
		
		buyService.buyUpdate(buyDTO);
		
		return "redirect:/buy/buyList";
		
	}
	
	
}
