package ems.icemile.service;

import java.util.HashMap;
import java.util.List;

import ems.icemile.dto.BuyDTO;

public interface BuyService {

	// 구매처 리스트 가져오기
	public List<BuyDTO> getBuyList();

	// 구매처 추가
	public void buyInsert(BuyDTO buyDTO);
	
	// 구매처 정보 얻기
	public BuyDTO getBuyInfo(String buy_code);

	// 구매처 수정
	public void buyUpdate(BuyDTO buyDTO);

	// 구매처 삭제
	boolean buyDelete(String buy_code);

	// 구매처 검색
	public List<BuyDTO> buySearch(HashMap<String, Object> json); 
	

}
