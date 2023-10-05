package ems.icemile.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ems.icemile.dto.SellDTO;
import ems.icemile.service.SellServiceImpl;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/sell_ajax/*")
public class SellAjaxController {
	
	@Inject // 멤버 서비스 의존성 주입
	private SellServiceImpl sellService;
	
	@PostMapping("delete")
	public String memberDelete(@RequestParam("branch_code")String branch_code) {
		
		log.debug("지점 딜리트 AJAX 호출");
		
		// 콜백 함수에 결과값 리턴
		return Boolean.toString(sellService.branchDelete(branch_code));
	}
	
//	@PostMapping("search")
//	public List<MemberDTO> memberSearch(@RequestBody HashMap<String, Object> json) {
//		
//		log.debug("멤버 서치 AJAX 호출");
//		
//		// 멤버리스트를 가져오기위한 멤버리스트 객체생성
//		List<MemberDTO> memberList = new ArrayList<MemberDTO>();
//		//결과값에 따라 멤버리스트를 가져온다
//		memberList = memberService.memberSearch(json);
//		
//		// 콜백 함수에 결과값 리턴
//		return memberList;
//	}
	
	@PostMapping("/branchReg")
	public String branchInsert(SellDTO sellDTO, HttpSession session) throws Exception {
		
		log.debug("값 잘 넘어오나 "+sellDTO.toString());
		
		return Boolean.toString(sellService.branchReg(sellDTO));
	}
	
	@PostMapping("/update")
	public String branchUpdate(SellDTO sellDTO) throws Exception {
		
		log.debug("값 잘 넘어오나 "+sellDTO.toString());
		
		return Boolean.toString(sellService.branchUpdate(sellDTO));
	}
	

}
