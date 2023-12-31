package ems.icemile.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import ems.icemile.annotation.UnUseAOP;
import ems.icemile.dto.ChartDTO;
import ems.icemile.service.ChartService;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/chart_ajax/*")
public class ChartAjaxController {

	@Inject 
	private ChartService chartService;
	
	@UnUseAOP
	@GetMapping("/monthlySale")
	public List<ChartDTO> monthlySale(Model model) {
		log.debug("monthlySale");

        List<ChartDTO> fetchedData = chartService.getMonthlySale();

        return fetchedData;
	}
	
	
	@GetMapping("/monthlyProd")
	public List<ChartDTO> monthlyProd(Model model) {
		log.debug("monthlyProd");

        List<ChartDTO> fetchedData = chartService.getMonthlyProd();

        return fetchedData;
	}
	
}
