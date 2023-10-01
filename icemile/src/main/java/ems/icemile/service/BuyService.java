package ems.icemile.service;

import java.util.List;

import ems.icemile.dto.BuyDTO;

public interface BuyService {

	// 구매처 리스트 가져오기
	public List<BuyDTO> getBuyList();

	// 구매처 추가
	public void buyInsert(BuyDTO buyDTO);
	

}
