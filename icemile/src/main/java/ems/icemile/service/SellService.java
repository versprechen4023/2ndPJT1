package ems.icemile.service;

import java.util.List;

import ems.icemile.dto.SellDTO;

public interface SellService {

	// 지점 등록
	public boolean branchInsert(SellDTO sellDTO);
	
	// 지점 목록 보기
	public List<SellDTO> getBranchList();
}
