package ems.icemile.service;

import java.util.List;

import ems.icemile.dto.ChartDTO;


public interface ChartService {
	
	public List<ChartDTO> getMonthlySale();

	public List<ChartDTO> getMonthlyProd();
}
