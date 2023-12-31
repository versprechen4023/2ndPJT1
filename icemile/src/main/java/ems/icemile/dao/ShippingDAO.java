package ems.icemile.dao;


import ems.icemile.dto.InMaterialDTO;
import ems.icemile.dto.MemberDTO;
import ems.icemile.dto.ProOrderDTO;
import ems.icemile.dto.StockDTO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ems.icemile.dto.outMaterialDTO;
import ems.icemile.dto.WareHouseDTO;
import ems.icemile.dto.outMaterialInsertDTO;


public interface ShippingDAO {
	
	// 입고 리스트
	public List<InMaterialDTO> getInMaterialList();
	
	// 입고 목록 삭제
	public void deleteInMaterial(InMaterialDTO inMaterialDTO);
	
	// 입고 등록
	public boolean inMaterialInsert(InMaterialDTO inMaterialDTO);
	
	// 입고코드 자동등록
	public String getNewIn_code(InMaterialDTO inMaterialDTO);
	
	// in_code 값 받아서
	public InMaterialDTO getInMaterial(String in_code);
	
	// 입고 수정
	public void updateInMaterial(InMaterialDTO inMaterialDTO);
	
	// 입고 검색
	public List<InMaterialDTO> inMateSearch(HashMap<String, Object> json);
    
	// 입고 getbuy_code
	String getBuy_code(InMaterialDTO inMaterialDTO);
	
	//출고 관리 리스트 가져오기 
	List<outMaterialDTO> getoutMaterialList();
    
    // 출고 코드 중복검사
	boolean searchOutCode(String out_code);
    
	//출고 수정 
	boolean mtUpdate(outMaterialInsertDTO outmaterialInsertDTO);
    
	//출고 코드 자동 부여 
	String getNewmtId(outMaterialInsertDTO outmaterialInsertDTO);
     
	//출고 추가
	boolean mtInsert(outMaterialInsertDTO outmaterialInsertDTO);
    
	//출고 삭제
	boolean mtDelete(List<Map<String, String>> codeAndBranchList);
    
	//출고 검색
	List<outMaterialDTO> mtSearch(HashMap<String, Object> json);
    
    //modal_wh
	WareHouseDTO searchModalwh(String wh_code);
    
	//OSmodal
	ProOrderDTO searchOSModal(String order_code);
    
	//EPmodal
	MemberDTO searchEPModal(String emp_num);
	
	// 보히작업
	public void deleteInMaterial(String raw_order_code);
    
	//SKmodal
	StockDTO searchSKModal(String stock_code);



}
