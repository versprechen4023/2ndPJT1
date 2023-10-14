package ems.icemile.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import ems.icemile.annotation.UnUseAOP;
import ems.icemile.dto.ResultDTO;
import ems.icemile.service.HeadServiceImpl;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/head/*")
public class HeadController {
	
	@Inject
	private HeadServiceImpl headService;
	
	@GetMapping("/resultList")
	public String result(Model model) {
		log.debug("컨트롤러| 생산실적 페이지");

		// 생산 실적리스트 객체생성
		List<ResultDTO> resultList = new ArrayList<ResultDTO>();
		resultList = headService.getResultList();
		for(ResultDTO a : resultList) {
			log.debug("{} 값은  " ,a );
		}
		
		// 모델에 DTO값 저장
		model.addAttribute("resultList", resultList);
		
		return "head/resultList";
	}
	
	
}// class
