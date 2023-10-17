package ems.icemile.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ems.icemile.dao.ChartDAO;
import ems.icemile.dto.ChartDTO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ChartServiceImpl  implements ChartService {
	
	@Inject
	private ChartDAO chartDAO;
	
	@Override
	public List<ChartDTO> getMonthlySale() {
		
		log.debug("월별 판매 실적");
		
		return chartDAO.getMonthlySale();
	}

	@Override
	public List<ChartDTO> getMonthlyProd() {
		
		log.debug("월별 생산 실적");
		
		return chartDAO.getMonthlyProd();
	}
	
	
	

}
