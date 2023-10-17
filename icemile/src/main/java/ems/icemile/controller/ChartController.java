package ems.icemile.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ems.icemile.dto.ChartDTO;
import ems.icemile.service.ChartService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/main/*")
public class ChartController {

	@Inject
	private ChartService chartService;
	
	@GetMapping("/index3")
	public String index() {
		
		log.debug("/index3");
		
		return "main/index3";
	}
	
	
	@GetMapping("/monthlySale")
	@ResponseBody
	public List<ChartDTO> monthlySale(Model model) {
		log.debug("monthlySale");

        List<ChartDTO> fetchedData = chartService.getMonthlySale();

        return fetchedData;
	}
	
	
	@GetMapping("/monthlyProd")
	@ResponseBody
	public List<ChartDTO> monthlyProd(Model model) {
		log.debug("monthlyProd");

        List<ChartDTO> fetchedData = chartService.getMonthlyProd();

        return fetchedData;
	}
	
}
