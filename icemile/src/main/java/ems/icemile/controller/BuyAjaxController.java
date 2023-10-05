package ems.icemile.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ems.icemile.dto.BuyDTO;
import ems.icemile.dto.MemberDTO;
import ems.icemile.service.BuyServiceImpl;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/buy_ajax/*")
public class BuyAjaxController {

	@Inject // 바이 서비스 의존성 주입
	private BuyServiceImpl buyService;
	
    @PostMapping("/insert")
    public ResponseEntity<String> buyInsert(BuyDTO buyDTO) {
        try {
            buyService.buyInsert(buyDTO);
            return new ResponseEntity<>("true", HttpStatus.OK); // 성공 시 "true" 반환
        } catch (Exception e) {
            log.error("Error during buy insertion: {}", e.getMessage());
            return new ResponseEntity<>("false", HttpStatus.INTERNAL_SERVER_ERROR); // 실패 시 "false" 반환
        }
    }
	
    @PostMapping("/update")
    public ResponseEntity<String> buyUpdate(BuyDTO buyDTO) {
        try {
            buyService.buyUpdate(buyDTO);
            return new ResponseEntity<>("true", HttpStatus.OK); // 성공 시 "true" 반환
        } catch (Exception e) {
            log.error("Error during buy insertion: {}", e.getMessage());
            return new ResponseEntity<>("false", HttpStatus.INTERNAL_SERVER_ERROR); // 실패 시 "false" 반환
        }
    }
	
	@PostMapping("delete")
	public String buyDelete(@RequestParam("buy_code") String buy_code) {
		log.debug("바이 딜리트 AJAX 호출");
		
		return Boolean.toString(buyService.buyDelete(buy_code));
		
	}
	
	@PostMapping("search")
	public List<BuyDTO> buySearch(@RequestBody HashMap<String, Object> json) {
		
		log.debug("바이 서치 AJAX 호출");
		
		// 멤버리스트를 가져오기위한 멤버리스트 객체생성
		List<BuyDTO> buyList = new ArrayList<BuyDTO>();
		//결과값에 따라 멤버리스트를 가져온다
		buyList = buyService.buySearch(json);
		
		// 콜백 함수에 결과값 리턴
		return buyList;
	}
	
}
