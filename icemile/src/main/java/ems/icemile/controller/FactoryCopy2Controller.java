package ems.icemile.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ems.icemile.dto.MemberDTO;
import ems.icemile.dto.WorkOrderDTO;
import ems.icemile.service.FactoryCopy2ServiceImpl;
import ems.icemile.service.MemberServiceImpl;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/factory/*")
public class FactoryCopy2Controller {
	
	// 워크오더 서비스 의존성 주입
	@Inject
	private FactoryCopy2ServiceImpl factoryCopy2Service;
	
	@Inject // 멤버 서비스 의존성 주입
	private MemberServiceImpl memberService;
	
	@GetMapping("/workOrderList")
	public String workOrderList(Model model) {
		
		//작업 지시 조회
		log.debug("작업 지시 조회");
		
		// 작업지시 리스트를 가져오기위한 리스트 객체생성
		List<WorkOrderDTO> workOrderList = new ArrayList<WorkOrderDTO>();
		workOrderList = factoryCopy2Service.workOrderList();
		
		// 모델에 멤버 DTO값 저장
		model.addAttribute("workOrderList", workOrderList);
		
		return "/factory/workOrderList";
	}
	
	@GetMapping("/workOrderAdd")
	public String workOrderAdd() {
		
		log.debug("작업 지시 추가 페이지");
		
		return "factory/workOrderAdd";
	}
	
	@PostMapping("/workOrderAddPro")
	public String workOrderAddPro(WorkOrderDTO workOrderDTO) {
		
		log.debug("작업 지시 추가 프로 페이지 ");
		
		factoryCopy2Service.workOrderAdd(workOrderDTO);
	
		return "redirect:/factory/workOrderList";
	}
	
	@GetMapping("/workOrderUpdate")
	public String workOrderUpdate(@RequestParam("work_code") String work_code, Model model) {
		log.debug("작업 지시 수정 페이지");
		
		// 거래처 정보를 얻기 위한 메소드 호출
		WorkOrderDTO workOrderDTO = factoryCopy2Service.getWorkOrderInfo(work_code);
		
		// 모델에 바이 DTO값 저장
		model.addAttribute("workOrderDTO", workOrderDTO);
		
		return "factory/workOrderUpdate";
				
	}
	
	@PostMapping("/workOrderUpdatePro")
	public String workOrderUpdatePro(WorkOrderDTO workOrderDTO) {
		log.debug("작업 지시 업데이트");
		
		factoryCopy2Service.workOrderUpdate(workOrderDTO);
		
		return "redirect:/factory/workOrderList";
		
	}
	
	@GetMapping("workOrderPopUp")
    public String workOrderPopUp(Model model) {
        // 작업지시조회
        log.debug("workOrderList");

        // 작업지시 리스트를 가져오기위한 리스트 객체생성
        List<WorkOrderDTO> workOrderList = new ArrayList<WorkOrderDTO>();
        workOrderList = factoryCopy2Service.workOrderList();

        // 모델에 멤버 DTO값 저장
        model.addAttribute("workOrderList", workOrderList);

        return "/factory/workOrderPopUp";

    }
	
	@GetMapping("/memberListPopUp")
	public String getMemberListPopUp(Model model) {
		
		//사원 조회
		log.debug("memberList");
		
		// 멤버리스트를 가져오기위한 멤버리스트 객체생성
		List<MemberDTO> memberList = new ArrayList<MemberDTO>();
		memberList = memberService.getMemberList();
		
		// 모델에 멤버 DTO값 저장
		model.addAttribute("memberList", memberList);
		
		return "/member/memberListPopUp";
	}

	
	@GetMapping("/managerInfo")
	public String managerInfo(@RequestParam("emp_num") String emp_num, Model model) {
		log.debug("컨트롤러| 지점 목록 페이지");
		
		// 디비에서 등록된 지점 정보 가져오기
		MemberDTO memberDTO  = memberService.getManagerInfo(emp_num);
		
		// model에 가져온 데이터 담아서 branch.jsp 이동
		model.addAttribute("memberDTO",memberDTO);
		
		// 페이지 이동
		return "member/managerInfo";
		
	}
	
	
	
	}// 
	

