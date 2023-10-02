package ems.icemile.controller;

import java.lang.System.Logger;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ems.icemile.dto.MemberDTO;
import ems.icemile.dto.WareHouseDTO;
import ems.icemile.service.WareHouseServiceImpl;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/warehouse/*")
public class WareHouseController {

	@Inject // 웨어하우스 서비스 의존성 주입
	private WareHouseServiceImpl warehouseService;

	@GetMapping("/warehouse")
	public String warehous(Model model) {
        //창고 조회
		log.debug("warehouse");
        
		//창고리스트를 가져오기 위한 창고리스트 객체생성
		List<WareHouseDTO> houseList = new ArrayList<WareHouseDTO>();
		houseList = warehouseService.gethouseList();
		
		//모델에 하우스DTO값 저장
	    model.addAttribute("houseList",houseList);
		
		return "warehouse/warehouse";
	}// warehouse

	
	
	@GetMapping("/warehouseAdd")
	public String warehousAdd() {

		log.debug("warehouseAdd:창고추가 페이지");

		return "warehouse/warehouseAdd";
	}// warehouse
	
	
	@PostMapping("/warehouseAdd")
	public String warehousAdd(WareHouseDTO warehouseDTO) {
		
		log.debug("warehouseAdd:창고추가 메소드 실행");
		
		log.debug("warehouseDTO"+warehouseDTO);
		
		warehouseService.houseInsert(warehouseDTO);
		
		return "redirect:warehouse/warehouseAdd";
	}
	
	// 창고 추가 시 code값 가져가기
	//ResponseBody는 서버에서 클라이언트로 데이터를 전송 할떄 중간단계 없이 데이터를 바로 전송하는 방법을 제공한다
    //무슨말인가??
	@ResponseBody
	//getMapping
	@GetMapping("/whCode")
	public String getWhCode() {
			
			return warehouseService.getWhCode();
	}
	
	

}// WareHouseController
