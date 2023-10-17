package ems.icemile.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ems.icemile.dao.SellDAOImpl;
import ems.icemile.dto.ProOrderDTO;
import ems.icemile.dto.RowOrderListDTO;
import ems.icemile.dto.SellDTO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class SellServiceImpl implements SellService{

	@Inject //DAO 의존성 주입
	private SellDAOImpl sellDAO;
	
	@Override
	public boolean branchReg(SellDTO sellDTO){
		
		log.debug("서비스 | 지점 인서트");
		String getNum = sellDAO.getNewBranchCode();
		
		int branch_code = 0;
		
		// DB에 데이터가없다면 초기값(1)이되고
		if(getNum == null) {
			branch_code = 1;
		// 아니라면 +1을 더한다
		} else {
			branch_code = Integer.parseInt(getNum.replaceAll("[^0-9]", ""))+1;
		}
		
		//고유 번호 부여
		sellDTO.setBranch_code(Integer.toString(branch_code));
		
		return sellDAO.branchReg(sellDTO);
	}
	

	@Override
	public List<SellDTO> getBranchList() {
		
		log.debug("서비스 | 지점 목록 가져오기");
		
		return sellDAO.getBranchList();
	}

	@Override
	public SellDTO getbranchInfo(String branch_code) {
		log.debug("서비스 | 지점 수정 페이지 지점 정보 가져오기");
		return sellDAO.getBranchInfo(branch_code);
	}

	@Override
	public boolean branchUpdate(SellDTO sellDTO) {
		log.debug("서비스 | 지점 수정 넘기기");
		
		return sellDAO.branchUpdate(sellDTO);
	}
	
	@Override
	public boolean branchDelete(String branch_code) {
		log.debug("서비스 | 지점삭제");
		
		return sellDAO.branchDelete(branch_code);
	}

	@Override
	public List<SellDTO> branchSearch(HashMap<String, Object> json) {
		log.debug("서비스 | 지점 검색 기능");
		
		return sellDAO.branchSearch(json);
	}


	@Override
	public boolean searchEmail(String branch_email) {
		log.debug("서비스 | 지점 이메일 중복 검사");
		return sellDAO.searchEmail(branch_email);
	}

	@Override
	public boolean searchPhone(String branch_phone) {
		log.debug("서비스 | 지점 번호 중복 검사");
		return sellDAO.searchPhone(branch_phone);
	}

	
	@Override
	public List<HashMap<String, Object>> proOrderList() {
		log.debug("서비스 | 수주 리스트");
		return sellDAO.proOrderList();
	}

	@Override
	public boolean proOrderInsert(ProOrderDTO proOrderDTO) {
		log.debug("서비스 | 수주 추가");
				
		// 고유 번호를 위한 지점 번호 얻기
		String getBranchCode = proOrderDTO.getBranch_code();
		
		int myCode = Integer.parseInt(getBranchCode.replaceAll("[^0-9]", ""));
				
		// 고유번호를 위한 날짜 재조정
		String myDate = proOrderDTO.getOrder_date().substring(2).replace("-", "");
		
		// 날짜를 넘겨주기 위해 DTO에 저장
		proOrderDTO.setMyDate(myDate);
		// 고유 번호를 위한 순서번호 얻기
		String getCode = sellDAO.getNewProOrderCode(proOrderDTO);
						
		int codeNum = 0;
						
		// DB에 데이터가없다면 초기값(1)이되고
		if(getCode == null) {
			codeNum = 1;
		// 아니라면 +1을 더한다
		} else {
			codeNum = Integer.parseInt(getCode.replaceAll(".+_", ""))+1;
		}
						
		// 고유번호를 설정
		proOrderDTO.setOrder_code("OS"+myDate+"BR"+myCode+"_"+codeNum);
		log.debug("코드값 확인 {}", proOrderDTO.getOrder_code());
				
		// 상태를 발주중으로 설정
		proOrderDTO.setOrder_status(1);
				
		return sellDAO.proOrderInsert(proOrderDTO);
	}

	@Override
	public boolean proOrderUpdate(ProOrderDTO proOrderDTO) {
		
		log.debug("수주 수정");
		log.debug("값 잘 넘어오나"+proOrderDTO);
		
		return sellDAO.proOrderUpdate(proOrderDTO);
	}

	
	@Override
	public boolean proOrderDelete(List<String> deleteProList) {
		
		log.debug("수주 삭제");
		
		return sellDAO.proOrderDelete(deleteProList);
	}

	@Override
	public List<HashMap<String, Object>> proOrderSearch(HashMap<String, Object> json) {
		
		log.debug("수주 검색");
		
		return sellDAO.proOrderSearch(json);
	}

    @Override
	public List<ProOrderDTO> orderList() {

		log.debug("서비스 | 수주 목록 가져오기");
		
		return sellDAO.getorderList();
	}
    
    //수주 완료 서차
    @Override
	public List<ProOrderDTO> orderListSearch(HashMap<String, Object> json) {
    	log.debug("수주 완료 서치 서비스");

		return sellDAO.orderListSearch(json);
	}



	
	
}
