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

import ems.icemile.dto.MemberDTO;
import ems.icemile.dto.SellDTO;
import ems.icemile.enums.ProOrderStatus;
import ems.icemile.service.MemberServiceImpl;
import ems.icemile.service.SellServiceImpl;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/sell/*")
public class SellController {

	@Inject
	private SellServiceImpl sellService;

	@GetMapping("/branchReg")
	public String branchReg() {
		log.debug("컨트롤러| 지점 등록 페이지");

		return "sell/branchReg";
	}

	@GetMapping("/branchList")
	public String branch(Model model) {
		log.debug("컨트롤러| 지점 목록 페이지");

		// 디비에서 지점 목록 가져오기
		List<SellDTO> branchList = sellService.getBranchList();

		// model에 가져온 데이터 담아서 branch.jsp 이동
		model.addAttribute("branchList", branchList);

		// 페이지 이동
		return "sell/branchList";

	}

	@GetMapping("/branchUpdate")
	public String branchUpdate(@RequestParam("branch_code") String branch_code, Model model) {
		log.debug("컨트롤러| 지점 수정 페이지");

		// 디비에서 등록된 지점 정보 가져오기
		SellDTO sellDTO = sellService.getbranchInfo(branch_code);

		// model에 DTO값 저장
		model.addAttribute("sellDTO", sellDTO);

		return "sell/branchUpdate";
	}

	@PostMapping("/branchUpdatePro")
	public String branchUpdatePro(SellDTO sellDTO) {
		log.debug("컨트롤러| 지점 수정 넘기기 페이지");

		sellService.branchUpdate(sellDTO);

		return "redirect:/sell/branchList";
	}
	
	@GetMapping("/proOrderList")
	public String proOrderList(Model model) {
		
		log.debug("컨트롤러| 수주 페이지");
		
		// 수주리스트를 가져오기위한 수주리스트 객체생성
		List<HashMap<String,Object>> proOrderList = new ArrayList<HashMap<String,Object>>();
		proOrderList = sellService.proOrderList();
		
		// 가격 및 상태처리
		for(HashMap<String,Object> a : proOrderList) {
			// 배열에서 주문량을 가져온다
			int order_amount = (int)a.get("order_amount");
			// 배열에서 단가(완제품가격) 을 가져온다
			int prod_price = (int)a.get("prod_price");
			// 계산을 수행한다
			int result = (int)((order_amount * prod_price) * 1.2);
			// 계산된 값을 수주금액에 넣는다
			a.put("order_price", result);
			
			// 상태처리 번호를 가져온다
			int order_status = (int)a.get("order_status");
			// 번호를 상태(문자)로 반환한다
			String text_order_status = ProOrderStatus.fromNumber(order_status).getName();
			// 반환한 문자를 상태로 갱신한다
			a.put("order_status", text_order_status);
		}
		
		// 모델에 map값 저장
		model.addAttribute("proOrderList", proOrderList);
				
		return "sell/proOrderList";
	}

	////////////////////////////////////// branchListPopUp//////////////////////////////////////////////////
	@GetMapping("branchListPopUp")
	public String getbranchListPopUp(Model model) {
		// 지점 조회
		log.debug("branchList");

		// 브렌치 리스트를 가져오기위한 멤버리스트 객체생성
		List<SellDTO> branchList = new ArrayList<SellDTO>();
		branchList = sellService.getBranchList();

		// 모델에 sell DTO값 저장
		model.addAttribute("branchList", branchList);

		return "/sell/branchListPopUp";

	}
	
	////////////////////////////////////// orderListPopUp //////////////////////////////////////////////////
//	@GetMapping("ordersListPopUp")
//	public String getordersListPopUp(Model model) {
//		//수주 조회
//		log.debug("odersList");
//
//		// 수주 리스트를 가져오기위한 멤버리스트 객체생성
//		List<odersDTO> ordersList = new ArrayList<odersDTO>();
//		ordersList = sellService.getorderList();
//
//		// 모델에 sell DTO값 저장
//		model.addAttribute("ordersList", ordersList);
//
//		return "/sell/ordersListPopUp";
//
//	}

}
