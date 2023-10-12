package ems.icemile.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ems.icemile.dto.ResultDTO;
import ems.icemile.dto.RowOrderListDTO;
import ems.icemile.service.HeadServiceImpl;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/head_ajax/*")
public class HeadAjaxController {
	
	@Inject // 팩토리 서비스 의존성 주입
	private HeadServiceImpl headService;
	
	@PostMapping("/resultSearch")
	public List<ResultDTO> resultSearch(@RequestBody HashMap<String, Object> json){
		log.debug("실적 서치 AJAX 호출");
		
		// 실적리스트를 가져오기위한 멤버리스트 객체생성
		List<ResultDTO> resultSearch = new ArrayList<ResultDTO>();
		// 결과값에 따라 실적 리스트를 가져온다
		resultSearch = headService.resultSearch(json);
		
		// 총가격 저장
		for(ResultDTO a : resultSearch) {
		a.setGood_prod(a.getOrder_amount()-a.getFaulty_prod());
		}
		
		// 콜백함수에 결과값 리턴
		return resultSearch;
	}
	
	@PostMapping("/resultInsert")
	public boolean resultInsert(ResultDTO resultDTO) {
		log.debug("실적 등록");
		log.debug("값 잘 넘어오나"+resultDTO);
		
		return headService.resultInsert(resultDTO);
	}
	
	@PostMapping("/resultUpdate")
	public boolean resultUpdate(ResultDTO resultDTO) {
		log.debug("실적 등록");
		log.debug("값 잘 넘어오나"+resultDTO);
		
		return headService.resultUpdate(resultDTO);
	}
	


}// class 
	
