package ems.icemile.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ems.icemile.dto.ProOrderDTO;
import ems.icemile.dto.SellDTO;

public interface SellDAO {
	
	// 지점 고유 번호 얻기
	public String getNewBranchCode();
	
	// 지점등록 
	public boolean branchReg(SellDTO sellDTO);
	
	// 지점 목록 보기 
	public List<SellDTO> getBranchList();
	
	// 지점 정보 가져오기
	public SellDTO getBranchInfo(String branch_code);
	
	// 지점 정보 수정
	public boolean branchUpdate(SellDTO sellDTO);
	
	// 지점 정보 삭제
	public boolean branchDelete(String branch_code);
	
	// 지점 검색 기능
	public List<SellDTO> branchSearch(HashMap<String, Object> json);

	// 지점 이메일 중복 검사
	boolean searchEmail(String branch_email);

	// 지점 번호 중복 검사
	boolean searchPhone(String branch_phone);
	
	// 수주 리스트 가져오기
	public List<HashMap<String, Object>> proOrderList();
	
	// 수주 추가
	public boolean proOrderInsert(ProOrderDTO proOrderDTO);
	
	// 수주 고유 번호 얻기
	public String getNewProOrderCode(ProOrderDTO proOrderDTO);

}
