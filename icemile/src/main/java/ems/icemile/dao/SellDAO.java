package ems.icemile.dao;

import java.util.List;

import ems.icemile.dto.SellDTO;

public interface SellDAO {

	// 지점등록 
	public boolean branchInsert(SellDTO sellDTO);
	
	// 지점 목록 보기 
	public List<SellDTO> getBranchList();
}
