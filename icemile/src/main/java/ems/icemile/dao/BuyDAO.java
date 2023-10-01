package ems.icemile.dao;

import java.util.List;

import ems.icemile.dto.BuyDTO;

public interface BuyDAO {
	
	// 구매처 리스트 정보 가져오기
	public List<BuyDTO> getBuyList();
	
	// 구매처 추가
	public void buyInsert(BuyDTO buyDTO);
	
	// 구매처 코드 얻기
	public int getBuyCode();
	

	
}
