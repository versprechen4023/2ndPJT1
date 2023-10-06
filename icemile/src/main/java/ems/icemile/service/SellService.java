package ems.icemile.service;

import java.util.HashMap;
import java.util.List;

import ems.icemile.dto.SellDTO;

public interface SellService {

	// 지점 등록
	public boolean branchReg(SellDTO sellDTO);
	
	// 지점 목록 보기
	public List<SellDTO> getBranchList();
	
	// 지점 정보 가져오기 
	public SellDTO getbranchInfo(String branch_code);
	
	// 지점 정보 수정
	public boolean branchUpdate(SellDTO sellDTO);
	
	// 지점 삭제
	public boolean branchDelete(String branch_code);
	
	// 지점 검색 기능
	public List<SellDTO> branchSearch(HashMap<String, Object> json);
}
