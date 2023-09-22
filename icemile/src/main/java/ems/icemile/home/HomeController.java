package ems.icemile.home;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

/**
 * index 페이지 관리 컨트롤러
 */
@Controller
@Slf4j
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		log.debug("홈페이지");
		
//		return "home";
		return "redirect:/member/login";
	}
	
}
