package ems.icemile.controller;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ems.icemile.dto.BuyDTO;
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
	
	/*
	 * @PostMapping("/update") public String buyUpdate(BuyDTO buyDTO) {
	 * log.debug("값 잘 넘어오나 "+buyDTO.toString());
	 * 
	 * return Boolean.toString(buyService.buyUpdate(buyDTO));
	 * 
	 * }
	 */
	
	@PostMapping("delete")
	public String buyDelete(@RequestParam("buy_code") String buy_code) {
		log.debug("바이 딜리트 AJAX 호출");
		
		return Boolean.toString(buyService.buyDelete(buy_code));
		
	}
	
}
