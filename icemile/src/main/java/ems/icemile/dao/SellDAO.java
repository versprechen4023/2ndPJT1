package ems.icemile.dao;

import ems.icemile.dto.SellDTO;

public interface SellDAO {

	// 지점등록 
	public boolean branchInsert(SellDTO sellDTO);
}
