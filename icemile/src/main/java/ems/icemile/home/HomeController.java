package ems.icemile.home;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

/**
 * index 페이지 관리 컨트롤러
 */
@Controller
@Slf4j
public class HomeController {
	
	// 최초페이지 매핑
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session) {
		
		log.debug("start icemile");
		
		return "redirect:/member/login";
	}
	
}
