package ems.icemile.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ems.icemile.annotation.Departments;
import ems.icemile.annotation.UnUseAOP;
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
	
	// AOP 제외대상 어노테이션 선언
	@UnUseAOP
	@GetMapping("/login")
	public String login(HttpServletRequest request, HttpSession session) {
		
		log.debug("member/login.jsp");
		
		// 기존페이지로 이동하기위해 헤더의 리퍼러(요청을 보낸 페이지)값을 변수에 저장한다
		String uri = request.getHeader("Referer");
		
		// 사용자가 직접 이동했거나 login페이지가 아니라면 세션에 레퍼값을 저장한다
		if(uri != null && !uri.contains("/login")) {
			request.getSession().setAttribute("prevPage", uri);
		}
		
		// 이미 로그인되어있다면 main/index로 강제이동시킨다
		if (session.getAttribute("emp_num") != null) {
			log.debug("이미 로그인 되어 있음");
			return "redirect:/main/index";
		}
		
		return "member/login";
	}// end_of_login
	
	// AOP 제외대상 어노테이션 선언
	@UnUseAOP
	@PostMapping("/login")
	public String loginPro(MemberDTO memberDTO, HttpSession session, HttpServletRequest request, RedirectAttributes msg) {
		
		log.debug("로그인 유저 인증 로직 실행");
		
		// 유저 체크 메서드 호출 및 결과값 반환
		MemberDTO result = memberService.userCheck(memberDTO);
		
		// 객체가 있는 경우 로그인 성공 null 인경우 실패
		if(result != null) {
			log.debug("로그인 성공 및 세션 저장");
			// 세션의 사원번호(유저아이디)와 권한(2진수의 형태)를 저장한다
			session.setAttribute("emp_num", result.getEmp_num());
			session.setAttribute("emp_role", result.getEmp_role());
			
			// 기존 페이지로 이동하기위해 세션에서 이전 페이지를 불러온다
			String prevPage = (String)request.getSession().getAttribute("prevPage");
			
			// 이전 페이지가 없다면 메인으로 이동하고
			if(prevPage == null) {
				return "redirect:/main/index";
			} else {
				// 이전 페이지가 있었다면 그 페이지로 이동한다
				String uri = prevPage.replaceFirst(".*" + Pattern.quote(request.getContextPath()), "");
				return "redirect:/"+uri;
			}
			
		} else {
			log.debug("로그인 실패");
			msg.addFlashAttribute("msg", "사원번호 또는 비밀번호가 일치하지 않습니다");
			return "redirect:/member/login";
		}
		
	}//end_of_loginPro
	
	// 관리자 권한제어를 위한 어노테이션 선언
	@Departments
	@GetMapping("/memberInsert")
	public String memberInsert(HttpSession session) {
		
		log.debug("관리자 사용자 추가 페이지 member/memberInsert.jsp");
		
		return "member/memberInsert";
	} // end memberInsert
	
	// 관리자 권한제어를 위한 어노테이션 선언
	@Departments
	@GetMapping("/memberUpdate")
	public String memberUpdate(@RequestParam("emp_num") String emp_num, Model model) {
		
		log.debug("관리자 사용자 수정 페이지 member/memberUpdate.jsp");
		
		// 사원 정보를 얻기위한 메서드 호출
		MemberDTO memberDTO = memberService.getMemberInfo(emp_num);
		
		// 직급, 부서 번호값 저장
		memberDTO.setPosition(Integer.toString(Position.fromName(memberDTO.getPosition()).getNum()));
		memberDTO.setDept_name(Integer.toString(Department.fromName(memberDTO.getDept_name()).getNum()));
		
		// 모델에 멤버 DTO값 저장
		model.addAttribute("memberDTO", memberDTO);
				
		return "member/memberUpdate";
	} // end memberUpdate
	
	@GetMapping("/empUpdate")
	public String empUpdate(HttpSession session, Model model) {
		
		log.debug("사용자 수정 페이지 member/empUpdate.jsp");
		
		// 사용자 정보를 얻기위한 세션 호출
		String emp_num = (String)session.getAttribute("emp_num");
		// 사원 정보를 얻기위한 메서드 호출
		MemberDTO memberDTO = memberService.getMemberInfo(emp_num);
		
		// 모델에 멤버 DTO값 저장
		model.addAttribute("memberDTO", memberDTO);
				
		return "member/empUpdate";
	} // end empUpdate
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		log.debug("로그아웃 완료");
		return "redirect:/member/login";
	} // end logout
	
	@GetMapping("/chat")
	public String chat() {
		log.debug("멤버 chat");
		
		return "member/chat";
	}
	
	// 마이페이지
	@GetMapping("/memberInfo")
	public String memberInfo(HttpSession session, Model model) {
		
		log.debug("마이페이지 member/memberInfo.jsp");
		
		// 세션에서 사원 번호 가져오기
		String emp_num = (String)session.getAttribute("emp_num");
		// 사원 정보를 얻기위한 메서드 호출
		MemberDTO memberDTO = memberService.getMemberInfo(emp_num);
		
		// 모델에 멤버 DTO값 저장
		model.addAttribute("memberDTO", memberDTO);
		
		return "/member/memberInfo";
	} // end memberInfo
	
	@GetMapping("/passwordUpdate")
	public String passwordUpdate() {
		
		log.debug("비밀번호 변경 페이지 member/passwordUpdate.jsp");
		
		return "/member/passwordUpdate";
	} // end passwordUpdate
	
	@GetMapping("/memberList")
	public String getMemberList(Model model) {
		
		//사원 조회
		log.debug("member/memberList.jsp");
		
		// 멤버리스트를 가져오기위한 멤버리스트 객체생성
		List<MemberDTO> memberList = new ArrayList<MemberDTO>();
		memberList = memberService.getMemberList();
		
		// 모델에 멤버 DTO값 저장
		model.addAttribute("memberList", memberList);
		
		return "/member/memberList";
	} // end getMemberList
	
	@GetMapping("/memberListPopUp")
	public String getMemberListPopUp(Model model) {
		
		//사원 조회
		log.debug("member/memberListPopUp.jsp");
		
		// 멤버리스트를 가져오기위한 멤버리스트 객체생성
		List<MemberDTO> memberList = new ArrayList<MemberDTO>();
		memberList = memberService.getMemberList();
		
		// 모델에 멤버 DTO값 저장
		model.addAttribute("memberList", memberList);
		
		return "/member/memberListPopUp";
	} // end getMemberListPopUp
	
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
		
	} // end managerInfo
	
} // end class
