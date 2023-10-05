package ems.icemile.dao;

import java.util.HashMap;
import java.util.List;

import ems.icemile.dto.BuyDTO;

public interface BuyDAO {
	
	// 구매처 리스트 정보 가져오기
	public List<BuyDTO> getBuyList();
	
	// 구매처 추가
	public void buyInsert(BuyDTO buyDTO);
	
	// 구매처 코드 얻기
	public String getBuyCode();
	
	// 구매처 정보 얻기
	public BuyDTO getBuyInfo(String buy_code);

	// 구매처 업데이트
	public void buyUpdate(BuyDTO buyDTO);
	
	// 구매처 삭제
	public boolean buyDelete(String buy_code);

	// 구매처 검색
	public List<BuyDTO> buySearch(HashMap<String, Object> json);
}
