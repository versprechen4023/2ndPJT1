package ems.icemile.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ems.icemile.dto.MemberDTO;
import ems.icemile.enums.Department;
import ems.icemile.enums.Position;
import ems.icemile.service.MemberServiceImpl;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member/*")
public class MemberController {
	
	@Inject // 멤버 서비스 의존성 주입
	private MemberServiceImpl memberService;
	
	@GetMapping("/login")
	public String login() {
		
		log.debug("member/login.jsp");
		
		return "member/login";
	}// end_of_login
	
	@PostMapping("/login")
	public String loginPro(MemberDTO memberDTO, HttpSession session, RedirectAttributes msg) {
		
		log.debug("로그인 유저 인증 로직 실행");
		
		// 유저 체크 메서드 호출 및 결과값 반환
		MemberDTO result = memberService.userCheck(memberDTO);
		
		// 객체가 있는 경우 로그인 성공 null 인경우 실패
		if(result != null) {
			log.debug("로그인 성공 및 세션 저장");
			session.setAttribute("emp_num", result.getEmp_num());
			session.setAttribute("emp_role", result.getEmp_role());
			return "redirect:/main/index";
		} else {
			log.debug("로그인 실패");
			msg.addFlashAttribute("msg", "사원번호 또는 비밀번호가 일치하지 않습니다");
			return "redirect:/member/login";
		}
		
	}//end_of_loginPro
	
	@GetMapping("/memberInsert")
	public String memberInsert(HttpSession session) {
		
		// 세션 검증
		if(session.getAttribute("emp_num")==null){
			return "redirect:/member/login";
		};
		
		log.debug("사용자 추가 페이지");
		
		return "member/memberInsert";
	}
	
	@GetMapping("/memberUpdate")
	public String memberUpdate(@RequestParam("emp_num") String emp_num, Model model) {
		
		log.debug("사용자 수정 페이지");
		
		// 사원 정보를 얻기위한 메서드 호출
		MemberDTO memberDTO = memberService.getMemberInfo(emp_num);
		
		// 직급, 부서 번호값 저장
		memberDTO.setPosition(Integer.toString(Position.fromName(memberDTO.getPosition()).getNum()));
		memberDTO.setDept_name(Integer.toString(Department.fromName(memberDTO.getDept_name()).getNum()));
		
		// 모델에 멤버 DTO값 저장
		model.addAttribute("memberDTO", memberDTO);
				
		return "member/memberUpdate";
	}
	
	@GetMapping("/empUpdate")
	public String empUpdate(@RequestParam("emp_num") String emp_num, Model model) {
		
		log.debug("사용자 수정 페이지");
		
		// 사원 정보를 얻기위한 메서드 호출
		MemberDTO memberDTO = memberService.getMemberInfo(emp_num);
		
		// 직급, 부서 번호값 저장
		memberDTO.setPosition(Integer.toString(Position.fromName(memberDTO.getPosition()).getNum()));
		memberDTO.setDept_name(Integer.toString(Department.fromName(memberDTO.getDept_name()).getNum()));
		
		// 모델에 멤버 DTO값 저장
		model.addAttribute("memberDTO", memberDTO);
				
		return "member/empUpdate";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		
		log.debug("로그아웃 함");
		session.invalidate();
		return "redirect:/member/login";
	}
	
	@GetMapping("/ajax")
	public String ajax() {
		log.debug("멤버 AJAX 진입");
		
		return "member/ajax";
	}
	
	@GetMapping("/chat")
	public String chat() {
		log.debug("멤버 chat");
		
		return "member/chat";
	}
	
	// 마이페이지
	@GetMapping("/memberInfo")
	public String info(HttpSession session, Model model) {
		
		log.debug("마이페이지");
		
		// 세션에서 사원 번호 가져오기
		String emp_num = (String)session.getAttribute("emp_num");
		
		// 사원 정보를 얻기위한 메서드 호출
		MemberDTO memberDTO = memberService.getMemberInfo(emp_num);
		
		// 모델에 멤버 DTO값 저장
		model.addAttribute("memberDTO", memberDTO);
		
		return "/member/memberInfo";
	}
	
	@GetMapping("/passwordUpdate")
	public String passwordUpdate(HttpSession session, Model model) {
		
		log.debug("비밀번호 변경 페이지");
		
		return "/member/passwordUpdate";
	}
	
	@GetMapping("/memberList")
	public String getMemberList(Model model) {
		
		//사원 조회
		log.debug("memberList");
		
		// 멤버리스트를 가져오기위한 멤버리스트 객체생성
		List<MemberDTO> memberList = new ArrayList<MemberDTO>();
		memberList = memberService.getMemberList();
		
		// 모델에 멤버 DTO값 저장
		model.addAttribute("memberList", memberList);
		
		return "/member/memberList";
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
	
	// 브랜치리스트에서 매니저 누르면 정보 나오게
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
	
}
