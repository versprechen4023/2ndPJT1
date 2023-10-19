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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import ems.icemile.annotation.Business;
import ems.icemile.dto.ProOrderDTO;
import ems.icemile.dto.RowOrderListDTO;
import ems.icemile.dto.SellDTO;
import ems.icemile.dto.WareHouseDTO;
import ems.icemile.enums.ProOrderStatus;
import ems.icemile.service.SellServiceImpl;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/sell_ajax/*")
public class SellAjaxController {

	@Inject // 멤버 서비스 의존성 주입
	private SellServiceImpl sellService;

	// 영업 권한제어를 위한 어노테이션 선언
	@Business
	@PostMapping("delete")
	public String memberDelete(@RequestParam("branch_code") String branch_code) {

		log.debug("지점 딜리트 AJAX 호출");

		// 콜백 함수에 결과값 리턴
		return Boolean.toString(sellService.branchDelete(branch_code));
	}

	@PostMapping("search")
	public List<SellDTO> branchSearch(@RequestBody HashMap<String, Object> json) {

		log.debug("지점 서치 AJAX 호출");

		// 멤버리스트를 가져오기위한 멤버리스트 객체생성
		List<SellDTO> branchList = new ArrayList<SellDTO>();
		// 결과값에 따라 멤버리스트를 가져온다
		branchList = sellService.branchSearch(json);

		// 콜백 함수에 결과값 리턴
		return branchList;
	}

	// 영업 권한제어를 위한 어노테이션 선언
	@Business
	@PostMapping("/insert")
	public String insert(SellDTO sellDTO, HttpSession session) throws Exception {

		log.debug("값 잘 넘어오나 " + sellDTO.toString());

		return Boolean.toString(sellService.branchReg(sellDTO));
	}
	
	// 영업 권한제어를 위한 어노테이션 선언
	@Business
	@PostMapping("/update")
	public String branchUpdate(SellDTO sellDTO) throws Exception {

		log.debug("값 잘 넘어오나 " + sellDTO.toString());

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
	
	// 영업 권한제어를 위한 어노테이션 선언
	@Business
	@PostMapping("proOrderUpdate")
	public boolean proOrderUpdate(ProOrderDTO proOrderDTO) {

		log.debug("proOrderUpdate ajax 실행");

		return sellService.proOrderUpdate(proOrderDTO);
	}
	
	// 영업 권한제어를 위한 어노테이션 선언
	@Business
	@PostMapping("proOrderInsert")
	public boolean proOrderInsert(ProOrderDTO proOrderDTO) {

		log.debug("proOrderInsert ajax 실행");

		return sellService.proOrderInsert(proOrderDTO);
	}
	
	// 영업 권한제어를 위한 어노테이션 선언
	@Business
	@PostMapping("proOrderDelete")
	public boolean proOrderDelete(@RequestParam("selectedProOrderId") String[] selectedProOrderId) {

		log.debug("proOrderDelete ajax 실행");

		// 마이바티스에서 반복처리를 위해 배열을 리스트 타입으로 변경
		List<String> deleteProList = Arrays.asList(selectedProOrderId);

		return sellService.proOrderDelete(deleteProList);
	}

	@PostMapping("/proOrderSearch")
	public List<HashMap<String, Object>> proOrderSearch(@RequestBody HashMap<String, Object> json) {

		log.debug("수주 검색");

		// 값 확인
		for (Entry<String, Object> entry : json.entrySet()) {
			String key = entry.getKey();
			Object value = entry.getValue();
			boolean test = entry.getValue().toString().isEmpty();
			log.debug("키값 {} 밸류 값 {}", key, value);
			log.debug("빈값{}", test);
		}

		// 수주리스트를 가져오기위한 품목리스트 객체생성
		List<HashMap<String, Object>> proOrderList = new ArrayList<HashMap<String, Object>>();
		proOrderList = sellService.proOrderSearch(json);
//				
		// 가격 및 상태처리 및 날짜처리
		for (HashMap<String, Object> a : proOrderList) {
			// 배열에서 주문량을 가져온다
			int order_amount = (int) a.get("order_amount");
			// 배열에서 단가(완제품가격) 을 가져온다
			int prod_price = (int) a.get("prod_price");
			// 계산을 수행한다
			int result = (int) ((order_amount * prod_price) * 1.2);
			// 계산된 값을 수주금액에 넣는다
			a.put("order_price", result);

			// 상태처리 번호를 가져온다
			int order_status = (int) a.get("order_status");
			// 번호를 상태(문자)로 반환한다
			String text_order_status = ProOrderStatus.fromNumber(order_status).getName();
			// 반환한 문자를 상태로 갱신한다
			a.put("order_status", text_order_status);

			// Date타입의 데이터를 String으로 변환한다
			Object myDate = a.get("order_date");
			Object myPlanDate = a.get("out_plan_date");
			a.put("order_date", myDate.toString());
			a.put("out_plan_date", myPlanDate.toString());
		}

		return proOrderList;
	}

	@PostMapping("orderListSearch")
	public List<ProOrderDTO> orderListSearch(@RequestBody HashMap<String, Object> json) {
		log.debug("수주 완료 서치");
		
		// 물품리스트를 가져오기위한 물품리스트 객체생성
		List<ProOrderDTO> ordersList = new ArrayList<ProOrderDTO>();
		
		// 결과값에 따라 물품 리스트를 가져온다
		ordersList = sellService.orderListSearch(json);

		// 콜백 함수에 결과값 리턴
		return ordersList;
	}
	
	// 영업 권한제어를 위한 어노테이션 선언
	@Business
	@PostMapping("proOrderResult")
	public int proOrderResult(ProOrderDTO proOrderDTO) {
		
		log.debug("수주 재고 관련 결과 반환");

		// 콜백 함수에 결과값 리턴
		return sellService.proOrderResult(proOrderDTO);
	}

}
