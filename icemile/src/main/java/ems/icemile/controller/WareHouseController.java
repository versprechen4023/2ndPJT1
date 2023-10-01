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
	//RedirectAttributes rttr:창고정보가 포함되어있는 DTO
	//HttpSession session:세션에서 현재 사용자의 정보를 가져오기 위해 사
	//WareHouseDTO warehouseDTO:리다이렉트 시에 데이터를 전달하기 위한 객체
	public String warehousAdd(WareHouseDTO warehouseDTO,HttpSession session,RedirectAttributes rttr)throws Exception{
		log.debug("warehouseAdd:창고추가 메소드 실행");
		
		//세션에서 아이디값 가져오기
//	    MemberDTO memberDTO= (MemberDTO) session.getAttribute("id");
	    //위에서 가져온 아이디 값으로 memberDTO에서 id값에 맞는emp_num을 찾아옴
//		String emp_num = memberDTO.getEmp_num();
		
		//잘찾아오는지 확인
//		log.debug("emp_num : "+emp_num );
		
		warehouseService.houseInsert(warehouseDTO);
		
		//리다이렉트시에 "result"라는 이름으로 "houseInsert"라는 값을 전달한다. 이정보는 리다이렉트괸 페이지에서 사용할수 있다 .
		rttr.addFlashAttribute("result", "houseInsert");
		
		//처리가 완료 되면 redirect:warehouse/warehouseAdd 페이지로 리다이렉트된다.
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
