package ems.icemile.service;

import ems.icemile.dto.SellDTO;

public interface SellService {

	// 지점 등록
	public boolean branchInsert(SellDTO sellDTO);
}
