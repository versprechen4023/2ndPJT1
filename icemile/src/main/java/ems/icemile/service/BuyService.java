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
	public boolean buyUpdate(BuyDTO buyDTO);

	// 구매처 삭제
	public boolean buyDelete(String buy_code);

	// 검색 기능
	public List<BuyDTO> buySearch(HashMap<String, Object> json);

	// 이메일 중복 검사
	public boolean searchEmail(String buy_email);

	// 번호 중복 검사
	public boolean searchPhone(String buy_phone); 
	

}
