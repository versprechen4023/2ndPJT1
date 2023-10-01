package ems.icemile.dao;

import java.util.List;

import ems.icemile.dto.SellDTO;

public interface SellDAO {
	
	// 지점 고유 번호 얻기
	public int getNewBranchCode();
	
	// 지점등록 
	public boolean branchInsert(SellDTO sellDTO);
	
	// 지점 목록 보기 
	public List<SellDTO> getBranchList();
	
	// 지점 정보 가져오기
	public SellDTO getBranchInfo(String branch_code);
}
