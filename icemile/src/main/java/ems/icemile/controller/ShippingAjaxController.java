package ems.icemile.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ems.icemile.dto.WareHouseDTO;
import ems.icemile.dto.WareHouseinsertDTO;
import ems.icemile.dto.outMaterialDTO;
import ems.icemile.dto.outMaterialInsertDTO;
import ems.icemile.service.ShippingServiceImpl;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/Shipping_ajax/*")
public class ShippingAjaxController {
	
	@Inject
	private ShippingServiceImpl shippingService;
	
	@GetMapping("searchOutCode")
	// 이 부분은 Spring Framework에서 사용되는 어노테이션입니다.
	// Ajax 요청에서 "wh_code"이라는 파라미터를 받아서 이 메서드의 wh_code 매개변수에 할당합니다.
	public boolean searchProName(@RequestParam("out_code") String out_code) {

		log.debug("서치 출고 코드 AJAX 호출");

		return shippingService.searchOutCode(out_code);
	}
	
	@PostMapping("mtUpdate")
	public String mtUpdate(outMaterialInsertDTO outmaterialInsertDTO) {

		log.debug("값 잘 넘어오나" + outmaterialInsertDTO);

		return Boolean.toString(shippingService.mtUpdate(outmaterialInsertDTO));
	}
	
	@PostMapping("/mtInsert")
	public String mtInsert(outMaterialInsertDTO outmaterialInsertDTO) {

		log.debug("값 잘 넘어오나" + outmaterialInsertDTO);

		return Boolean.toString(shippingService.mtInsert(outmaterialInsertDTO));
	}
	
	@PostMapping("/mtDelete")
	public String mtDelete(@RequestParam("selectedProId") String[] selectedProId) {

				List<Map<String, String>> codeAndBranchList = new ArrayList<>();

				for (String a : selectedProId) {

					// 맵 타입 배열 객체생성
					Map<String, String> codeAndBranch = new HashMap<>();

					// 품목번호를 삽입한다
					codeAndBranch.put("code", a);
					// 원자재와 완제품을 구분하기위한 코드를 삽입한다 = R0001 = R(원자재)
					codeAndBranch.put("branch", a.substring(10,11));
					// 리스트 배열에 맵 배열을 삽입한다
					codeAndBranchList.add(codeAndBranch);
				}
				
				// Boolean.toString
				// Boolean을 문자열로 변환하는것
				return Boolean.toString(shippingService.mtDelete(codeAndBranchList));
		
	}
	
	@PostMapping("search")
	public List<outMaterialDTO> mtSearch(@RequestBody HashMap<String, Object> json) {

		log.debug("메터리얼 서치 AJAX 호출");

		// 물품리스트를 가져오기위한 물품리스트 객체생성
		List<outMaterialDTO> outMaterialList = new ArrayList<outMaterialDTO>();
		// 결과값에 따라 물품 리스트를 가져온다
		outMaterialList = shippingService.mtSearch(json);

		// 콜백 함수에 결과값 리턴
		return outMaterialList;
	}	

}
