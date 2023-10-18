package ems.icemile.dao;

import java.util.List;

import ems.icemile.dto.ChartDTO;

public interface ChartDAO {

	public List<ChartDTO> getMonthlySale();

	public List<ChartDTO> getMonthlyProd();

}
